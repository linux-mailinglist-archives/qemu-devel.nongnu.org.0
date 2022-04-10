Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB7B4FABE7
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 06:44:08 +0200 (CEST)
Received: from localhost ([::1]:51558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndPQk-0004ZO-Ov
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 00:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jianchunfu@cmss.chinamobile.com>)
 id 1ndOjM-00005Z-Ox
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 23:59:16 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:20762)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jianchunfu@cmss.chinamobile.com>) id 1ndOjI-00046O-Hn
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 23:59:16 -0400
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11])
 by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee262525604740-587c4;
 Sun, 10 Apr 2022 11:59:00 +0800 (CST)
X-RM-TRANSID: 2ee262525604740-587c4
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from 192.168.125.128 (unknown[112.22.3.63])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee6625255ffa61-4fd47;
 Sun, 10 Apr 2022 11:59:00 +0800 (CST)
X-RM-TRANSID: 2ee6625255ffa61-4fd47
From: jianchunfu <jianchunfu@cmss.chinamobile.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Cc: qemu-devel@nongnu.org,
	jianchunfu <jianchunfu@cmss.chinamobile.com>
Subject: [RFC] migration/dirtyrate: check malloc() return
Date: Sun, 10 Apr 2022 11:58:54 +0800
Message-Id: <20220410035854.97056-1-jianchunfu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.18.4
Received-SPF: pass client-ip=221.176.66.79;
 envelope-from=jianchunfu@cmss.chinamobile.com; helo=cmccmta1.chinamobile.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 10 Apr 2022 00:41:51 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handling potential memory allocation failures in dirtyrate.

Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
---
 migration/dirtyrate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index aace12a787..5dd40f32c8 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -523,9 +523,17 @@ static void calculate_dirtyrate_dirty_ring(struct DirtyRateConfig config)
     }
 
     dirty_pages = malloc(sizeof(*dirty_pages) * nvcpu);
+    if (!dirty_pages) {
+        error_report("malloc dirty pages for vcpus failed.");
+        exit(1);
+    }
 
     DirtyStat.dirty_ring.nvcpu = nvcpu;
     DirtyStat.dirty_ring.rates = malloc(sizeof(DirtyRateVcpu) * nvcpu);
+    if (!DirtyStat.dirty_ring.rates) {
+        error_report("malloc dirty rates for vcpu ring failed.");
+        exit(1);
+    }
 
     dirtyrate_global_dirty_log_start();
 
-- 
2.18.4




