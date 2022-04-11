Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2F24FBEE6
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 16:18:48 +0200 (CEST)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndusQ-0007dN-Rr
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 10:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jianchunfu@cmss.chinamobile.com>)
 id 1ndqe0-00035J-At
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 05:47:36 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:24214)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jianchunfu@cmss.chinamobile.com>) id 1ndqdw-0008UK-Dg
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 05:47:36 -0400
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.7])
 by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66253f92173e-6b966;
 Mon, 11 Apr 2022 17:47:15 +0800 (CST)
X-RM-TRANSID: 2ee66253f92173e-6b966
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.97])
 by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46253f91ce73-94a01;
 Mon, 11 Apr 2022 17:47:15 +0800 (CST)
X-RM-TRANSID: 2ee46253f91ce73-94a01
From: jianchunfu <jianchunfu@cmss.chinamobile.com>
To: richard.henderson@linaro.org
Subject: [PATCH] migration/dirtyrate: Replace malloc with g_new
Date: Mon, 11 Apr 2022 17:47:03 +0800
Message-Id: <20220411094703.7000-1-jianchunfu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.18.4
Received-SPF: pass client-ip=221.176.66.80;
 envelope-from=jianchunfu@cmss.chinamobile.com; helo=cmccmta2.chinamobile.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 11 Apr 2022 10:14:53 -0400
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
Cc: qemu-devel@nongnu.org, jianchunfu <jianchunfu@cmss.chinamobile.com>,
 dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using macro g_new() to handling potential memory allocation failures
in dirtyrate.

Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
---
 migration/dirtyrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index aace12a787..0e59aacbb0 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -522,10 +522,10 @@ static void calculate_dirtyrate_dirty_ring(struct DirtyRateConfig config)
         nvcpu++;
     }
 
-    dirty_pages = malloc(sizeof(*dirty_pages) * nvcpu);
+    dirty_pages = g_new(DirtyPageRecord, nvcpu);
 
     DirtyStat.dirty_ring.nvcpu = nvcpu;
-    DirtyStat.dirty_ring.rates = malloc(sizeof(DirtyRateVcpu) * nvcpu);
+    DirtyStat.dirty_ring.rates = g_new(DirtyRateVcpu, nvcpu);
 
     dirtyrate_global_dirty_log_start();
 
-- 
2.18.4




