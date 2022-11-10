Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5739A623C91
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 08:25:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot1up-0005RI-SA; Thu, 10 Nov 2022 02:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jianchunfu@cmss.chinamobile.com>)
 id 1ot1ue-0005QB-SB; Thu, 10 Nov 2022 02:23:50 -0500
Received: from cmccmta1.chinamobile.com ([221.176.66.79])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jianchunfu@cmss.chinamobile.com>)
 id 1ot1ub-00064z-5h; Thu, 10 Nov 2022 02:23:48 -0500
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.87])
 by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee3636ca6f4920-597a1;
 Thu, 10 Nov 2022 15:23:33 +0800 (CST)
X-RM-TRANSID: 2ee3636ca6f4920-597a1
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.103])
 by rmsmtp-syy-appsvrnew04-12029 (RichMail) with SMTP id 2efd636ca6e9fc8-94cc0; 
 Thu, 10 Nov 2022 15:23:32 +0800 (CST)
X-RM-TRANSID: 2efd636ca6e9fc8-94cc0
From: jianchunfu <jianchunfu@cmss.chinamobile.com>
To: mst@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 jianchunfu <jianchunfu@cmss.chinamobile.com>
Subject: [RFC] libvhost-user: Add report when allocation failures
Date: Thu, 10 Nov 2022 15:21:57 +0800
Message-Id: <20221110072157.4242-1-jianchunfu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20221108033133-mutt-send-email-mst@kernel.org>
References: <20221108033133-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=221.176.66.79;
 envelope-from=jianchunfu@cmss.chinamobile.com; helo=cmccmta1.chinamobile.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add error report when malloc fails of virtqueue element.
It's a little pointless to return NULL, wouldn't it be right
to report error and exit when malloc fails since it is in a
standalone project while not QEMU.

Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
---
 subprojects/libvhost-user/libvhost-user.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 47d2efc60f..c2bdf0fcc1 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -2551,6 +2551,10 @@ virtqueue_alloc_element(size_t sz,
 
     assert(sz >= sizeof(VuVirtqElement));
     elem = malloc(out_sg_end);
+    if (!elem) {
+        DPRINT("%s: failed to malloc virtqelement\n", __func__);
+        return NULL;
+    }
     elem->out_num = out_num;
     elem->in_num = in_num;
     elem->in_sg = (void *)elem + in_sg_ofs;
-- 
2.18.4




