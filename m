Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553946F401A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:25:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmFf-0005Qj-Bh; Tue, 02 May 2023 05:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmFb-0005PV-8Z
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:47 -0400
Received: from mr85p00im-ztdg06021701.me.com ([17.58.23.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmFZ-000462-OG
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1683019484; bh=cL7THDsuZqmjFuNeLwSxxRPGd6LzrqdPHNp18DKJuT0=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=I4VW+Wc6uKDEBZCUFGDKfDhQ6u3tEJQDk4R6tGVOX/G/qMbu8whxlNxHNdWUGKWE2
 XXd7IZSQH3zEVcX05cVlqc8wEMMErIOk4qHYQkWn0EL8hNSPf9FUTLH/a710t7BE5h
 5ysRto+L5LiwH6jvj1WJ2YULrYy4Vg6F8/Q2KxIz3T9NjYkX20FK/m6ovJax0Bt7C8
 yAd95s7dPhrCQ/ipq1sSmt/697fuaVaXNJLnQDcFmFrsZcz6CNo1MHnzlCsmwcKu2x
 zi4qTMaYrQFrpvBZqChjgsSlT4GdmajBF5d11Bwc5SnVM07rh6hAt5Yc5OLtq2L/ig
 aJ0Se0b7cZrxg==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06021701.me.com (Postfix) with ESMTPSA id 2BB482633AA1;
 Tue,  2 May 2023 09:24:43 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH v2 12/12] scripts/analyse-locks-simpletrace.py: reflect
 changes to process in simpletrace.py
Date: Tue,  2 May 2023 11:23:39 +0200
Message-Id: <20230502092339.27341-13-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230502092339.27341-1-mads@ynddal.dk>
References: <20230502092339.27341-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=17.58.23.196; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-ztdg06021701.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Mads Ynddal <m.ynddal@samsung.com>

The signature of `process` in simpletrace.py has changed to not take
filepaths as the two first arguments, but rather a file-like object. We
change the code here to reflect that.

Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
---
 scripts/analyse-locks-simpletrace.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/analyse-locks-simpletrace.py b/scripts/analyse-locks-simpletrace.py
index d650dd7140..235fae2ba2 100755
--- a/scripts/analyse-locks-simpletrace.py
+++ b/scripts/analyse-locks-simpletrace.py
@@ -69,7 +69,8 @@ def get_args():
 
     # Gather data from the trace
     analyser = MutexAnalyser()
-    simpletrace.process(args.events, args.tracefile, analyser)
+    with open(args.events, 'r') as events, open(args.tracefile, 'rb') as tracefile:
+        simpletrace.process(events, tracefile, analyser)
 
     print ("Total locks: %d, locked: %d, unlocked: %d" %
            (analyser.locks, analyser.locked, analyser.unlocks))
-- 
2.38.1


