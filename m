Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0AE2EF80E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:24:26 +0100 (CET)
Received: from localhost ([::1]:35662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxN3-0001yv-6N
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1kxx7w-0000le-SK
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:08:48 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:50846
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1kxx7s-0006fx-DW
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:08:48 -0500
HMM_SOURCE_IP: 172.18.0.48:17829.1062543948
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-203.57.249.251?logid-4904171397564a909bb6e26728d4a894
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 02260280072;
 Sat,  9 Jan 2021 03:08:34 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by App0024 with ESMTP id 4904171397564a909bb6e26728d4a894 for
 qemu-devel@nongnu.org; Sat Jan  9 03:08:36 2021
X-Transaction-ID: 4904171397564a909bb6e26728d4a894
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] kvm: mirror "-machine dirty_gfn_count" to the accelerator
 property
Date: Sat,  9 Jan 2021 03:08:31 +0800
Message-Id: <1610132911-33839-1-git-send-email-huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 08 Jan 2021 14:20:53 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 peterx <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU enable the dirty ring feature by specifing the "-accel" sub-parameter.
https://lore.kernel.org/qemu-devel/20210108165050.406906-10-peterx@redhat.com/
Libvirt use "-machine accel=kvm" option to specify the accelerator by default,
which is incompatible with above option.

This patch introduce the "dirty_gfn_count" sub-parameter of the "-machine"
in the way that the commit "23b089" has done. So that Libvirt can enable this
feature by adding "-machine dirty_gfn_count=xxx" to the QEMU command line.

Signed-off-by: Hyman <huangy81@chinatelecom.cn>
---
 softmmu/vl.c       | 3 ++-
 util/qemu-config.c | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 7ddf405..d8e3dec 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1666,7 +1666,8 @@ static int machine_set_property(void *opaque,
         object_register_sugar_prop(ACCEL_CLASS_NAME("xen"), qom_name, value);
         return 0;
     }
-    if (g_str_equal(qom_name, "kvm-shadow-mem")) {
+    if (g_str_equal(qom_name, "kvm-shadow-mem") ||
+        g_str_equal(qom_name, "dirty-gfn-count")) {
         object_register_sugar_prop(ACCEL_CLASS_NAME("kvm"), qom_name, value);
         return 0;
     }
diff --git a/util/qemu-config.c b/util/qemu-config.c
index e2a700b..70f1b50 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -234,6 +234,10 @@ static QemuOptsList machine_opts = {
             .help = "Up to 8 chars in set of [A-Za-z0-9. ](lower case chars"
                     " converted to upper case) to pass to machine"
                     " loader, boot manager, and guest kernel",
+        },{
+            .name = "dirty_gfn_count",
+            .type = QEMU_OPT_NUMBER,
+            .help = "KVM dirty ring GFN count",
         },
         { /* End of list */ }
     }
-- 
1.8.3.1


