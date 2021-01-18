Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E952F9E43
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:36:20 +0100 (CET)
Received: from localhost ([::1]:38460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1SpX-0002rY-AI
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:36:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1Slt-0007y7-Rb; Mon, 18 Jan 2021 06:32:36 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:55349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l1Slm-0000TW-Lg; Mon, 18 Jan 2021 06:32:33 -0500
Received: from localhost.localdomain ([82.252.149.54]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MStOy-1lTQId0hFW-00UMz1; Mon, 18 Jan 2021 12:32:13 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] pl031: Use timer_free() in the finalize function to avoid
 memleaks
Date: Mon, 18 Jan 2021 12:32:03 +0100
Message-Id: <20210118113205.1915888-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118113205.1915888-1-laurent@vivier.eu>
References: <20210118113205.1915888-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZiGxvzKsj0KAfmOmtibw21jlgd3fohYDzstTPc9Hatb1Di5QVvx
 B2+/MQnGJynWgmrl6brgUyAtYSXa6iQ/N6p9H9gfm0Mwh9QksWZDlDoFDd/xCx/48SBLp6w
 ZPKFzWUFM1pqy8W7jyBUlsbNPHdA+8fGJRdnyScD2CrUm9LdlTfiAom8hWSCwK/SOnOGoqC
 9Qn4Y8V53fYlp1BvGyIWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:061fqQGQQH0=:VdiZ+EudP3JydSwB2Ztj7N
 CSN0vC9vPlh+CsjU96bbWajpEVwbi6UCw4KNNmKtu1EHbkOpIdYtWD26T3UwVAeVlYEtPPtTJ
 MmNGILeqhNH7g+HTO2jXjrPGYoFffxqyx/xBYH+s210AMetBrTc2LqTpg4bCbPZR5bWJrrzqX
 72+1XBOtVAyO0fUfVOtLcC/gmBRjB8RN4Ly+1c7jCh604J6Ybll2VQfyQJREg50bn2eF8D4q8
 ImrVyGZqykwcOH5u90pE7EJtKUkV/uZdWrNiZRIlttbZ9bbJcqhjgeuB3Yswx9mBS83P2RMb6
 NsuzoPBhUEDQCAgvcvvXfPhFU9HUAO2ey+B2u1vE+cdIjy5yCGWO4FyQ0co0CoMH2aeITBjRX
 y/IyZdEp1JaohDVkJ5+7IWPyCnBfd7wr/WwAycCM8ZGJSkPOZ6EHQsCidnImD
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Gan Qixin <ganqixin@huawei.com>, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gan Qixin <ganqixin@huawei.com>

When running device-introspect-test, a memory leak occurred in the pl031_init
function, this patch use timer_free() in the finalize function to fix it.

ASAN shows memory leak stack:

Direct leak of 48 byte(s) in 1 object(s) allocated from:
    #0 0xffffab97e1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xffffab256800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaabf5621cfc in timer_new_full qemu/include/qemu/timer.h:523
    #3 0xaaabf5621cfc in timer_new qemu/include/qemu/timer.h:544
    #4 0xaaabf5621cfc in timer_new_ns qemu/include/qemu/timer.h:562
    #5 0xaaabf5621cfc in pl031_init qemu/hw/rtc/pl031.c:194
    #6 0xaaabf6339f6c in object_initialize_with_type qemu/qom/object.c:515
    #7 0xaaabf633a1e0 in object_new_with_type qemu/qom/object.c:729
    #8 0xaaabf6375e40 in qmp_device_list_properties qemu/qom/qom-qmp-cmds.c:153
    #9 0xaaabf5a95540 in qdev_device_help qemu/softmmu/qdev-monitor.c:283
    #10 0xaaabf5a96940 in qmp_device_add qemu/softmmu/qdev-monitor.c:801
    #11 0xaaabf5a96e70 in hmp_device_add qemu/softmmu/qdev-monitor.c:916
    #12 0xaaabf5ac0a2c in handle_hmp_command qemu/monitor/hmp.c:1100

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210112112705.380534-2-ganqixin@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/rtc/pl031.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
index ae47f09635da..2bbb2062ac85 100644
--- a/hw/rtc/pl031.c
+++ b/hw/rtc/pl031.c
@@ -194,6 +194,13 @@ static void pl031_init(Object *obj)
     s->timer = timer_new_ns(rtc_clock, pl031_interrupt, s);
 }
 
+static void pl031_finalize(Object *obj)
+{
+    PL031State *s = PL031(obj);
+
+    timer_free(s->timer);
+}
+
 static int pl031_pre_save(void *opaque)
 {
     PL031State *s = opaque;
@@ -329,6 +336,7 @@ static const TypeInfo pl031_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PL031State),
     .instance_init = pl031_init,
+    .instance_finalize = pl031_finalize,
     .class_init    = pl031_class_init,
 };
 
-- 
2.29.2


