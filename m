Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A523C3510B4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:16:25 +0200 (CEST)
Received: from localhost ([::1]:44980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsV6-0001hy-OK
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lRsPp-0002GR-Lh
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:10:57 -0400
Received: from mga17.intel.com ([192.55.52.151]:36382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lRsPn-0005yK-St
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:10:57 -0400
IronPort-SDR: pMh1NRTs1CVouyqdEvxzM+d9h5m55Q7uXJHl7kZ1a5FDEYJP3jKVvyzOIW76gfoIINCQIMGIVY
 UVTlD153j1pQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="172211413"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="172211413"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 01:10:54 -0700
IronPort-SDR: aZypngzSSZsygSoFPH/YDw9rd7Sj3otLQuxhw0CtXjmFZISnBFHigD4UsT81S4qbv0/QrxkvpX
 7MW+phmo5DQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="439119181"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga004.fm.intel.com with ESMTP; 01 Apr 2021 01:10:51 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v5 06/10] Add the function of colo_compare_cleanup
Date: Thu,  1 Apr 2021 15:47:25 +0800
Message-Id: <1617263249-54501-7-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
References: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei.rao@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

This patch fixes the following:
    #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
    #1  0x00007f6ae4559859 in __GI_abort () at abort.c:79
    #2  0x0000559aaa386720 in error_exit (err=16, msg=0x559aaa5973d0 <__func__.16227> "qemu_mutex_destroy") at util/qemu-thread-posix.c:36
    #3  0x0000559aaa3868c5 in qemu_mutex_destroy (mutex=0x559aabffe828) at util/qemu-thread-posix.c:69
    #4  0x0000559aaa2f93a8 in char_finalize (obj=0x559aabffe800) at chardev/char.c:285
    #5  0x0000559aaa23318a in object_deinit (obj=0x559aabffe800, type=0x559aabfd7d20) at qom/object.c:606
    #6  0x0000559aaa2331b8 in object_deinit (obj=0x559aabffe800, type=0x559aabfd9060) at qom/object.c:610
    #7  0x0000559aaa233200 in object_finalize (data=0x559aabffe800) at qom/object.c:620
    #8  0x0000559aaa234202 in object_unref (obj=0x559aabffe800) at qom/object.c:1074
    #9  0x0000559aaa2356b6 in object_finalize_child_property (obj=0x559aac0dac10, name=0x559aac778760 "compare0-0", opaque=0x559aabffe800) at qom/object.c:1584
    #10 0x0000559aaa232f70 in object_property_del_all (obj=0x559aac0dac10) at qom/object.c:557
    #11 0x0000559aaa2331ed in object_finalize (data=0x559aac0dac10) at qom/object.c:619
    #12 0x0000559aaa234202 in object_unref (obj=0x559aac0dac10) at qom/object.c:1074
    #13 0x0000559aaa2356b6 in object_finalize_child_property (obj=0x559aac0c75c0, name=0x559aac0dadc0 "chardevs", opaque=0x559aac0dac10) at qom/object.c:1584
    #14 0x0000559aaa233071 in object_property_del_child (obj=0x559aac0c75c0, child=0x559aac0dac10, errp=0x0) at qom/object.c:580
    #15 0x0000559aaa233155 in object_unparent (obj=0x559aac0dac10) at qom/object.c:599
    #16 0x0000559aaa2fb721 in qemu_chr_cleanup () at chardev/char.c:1159
    #17 0x0000559aa9f9b110 in main (argc=54, argv=0x7ffeb62fa998, envp=0x7ffeb62fab50) at vl.c:4539

When chardev is cleaned up, chr_write_lock needs to be destroyed. But
the colo-compare module is not cleaned up normally before it when the
guest poweroff. It is holding chr_write_lock at this time. This will
cause qemu crash.So we add the function of colo_compare_cleanup() before
qemu_chr_cleanup() to fix the bug.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 net/colo-compare.c | 10 ++++++++++
 net/colo-compare.h |  1 +
 net/net.c          |  4 ++++
 3 files changed, 15 insertions(+)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index c142c08..5b538f4 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -1402,6 +1402,16 @@ static void colo_compare_init(Object *obj)
                              compare_set_vnet_hdr);
 }
 
+void colo_compare_cleanup(void)
+{
+    CompareState *tmp = NULL;
+    CompareState *n = NULL;
+
+    QTAILQ_FOREACH_SAFE(tmp, &net_compares, next, n) {
+        object_unparent(OBJECT(tmp));
+    }
+}
+
 static void colo_compare_finalize(Object *obj)
 {
     CompareState *s = COLO_COMPARE(obj);
diff --git a/net/colo-compare.h b/net/colo-compare.h
index 22ddd51..b055270 100644
--- a/net/colo-compare.h
+++ b/net/colo-compare.h
@@ -20,5 +20,6 @@
 void colo_notify_compares_event(void *opaque, int event, Error **errp);
 void colo_compare_register_notifier(Notifier *notify);
 void colo_compare_unregister_notifier(Notifier *notify);
+void colo_compare_cleanup(void);
 
 #endif /* QEMU_COLO_COMPARE_H */
diff --git a/net/net.c b/net/net.c
index 725a4e1..8fcb2e7 100644
--- a/net/net.c
+++ b/net/net.c
@@ -53,6 +53,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
+#include "net/colo-compare.h"
 #include "net/filter.h"
 #include "qapi/string-output-visitor.h"
 #include "qapi/hmp-output-visitor.h"
@@ -1463,6 +1464,9 @@ void net_cleanup(void)
 {
     NetClientState *nc;
 
+    /*cleanup colo compare module for COLO*/
+    colo_compare_cleanup();
+
     /* We may del multiple entries during qemu_del_net_client(),
      * so QTAILQ_FOREACH_SAFE() is also not safe here.
      */
-- 
1.8.3.1


