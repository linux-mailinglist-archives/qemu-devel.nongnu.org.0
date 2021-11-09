Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED23944A6E2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:34:55 +0100 (CET)
Received: from localhost ([::1]:48814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKid-0008Hn-1D
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:34:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4F-00051S-Ar; Tue, 09 Nov 2021 00:53:11 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=54079
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4D-0006mf-Ji; Tue, 09 Nov 2021 00:53:11 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp2tvJz4xf3; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=bKMUubPSBNd269PsKHifnGmNZeq/bkH733cLGfVKXVA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P0J0F4zmEeYhn6aCv6ZUD9LxRWll9p+voNSlEBrgYQA0MLlBrRi77O207paT+u84q
 qdx3tZ4xF5MwE3+0t9eprNG4ssSZXbQv/ttUvqtdTHlws8oZM8hln+wTr1i6TJyyRt
 1tKHyWhoSTvA3WSsS2AxswDcNKxbiKgf3y7ImWDo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 26/54] ppc/pnv: Fix check on block device before updating drive
 contents
Date: Tue,  9 Nov 2021 16:51:36 +1100
Message-Id: <20211109055204.230765-27-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Test is wrong and the backend can never updated. It could have led to
a QEMU crash but since the firmware deactivates flash access if a valid
layout is not detected, it went unnoticed.

Reported-by: Coverity CID 1465223
Fixes: 35dde5766211 ("ppc/pnv: Add a PNOR model")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20211102162905.762078-1-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv_pnor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/pnv_pnor.c b/hw/ppc/pnv_pnor.c
index 5ef1cf2afb..83ecccca28 100644
--- a/hw/ppc/pnv_pnor.c
+++ b/hw/ppc/pnv_pnor.c
@@ -36,7 +36,7 @@ static void pnv_pnor_update(PnvPnor *s, int offset, int size)
     int offset_end;
     int ret;
 
-    if (s->blk) {
+    if (!s->blk || !blk_is_writable(s->blk)) {
         return;
     }
 
-- 
2.33.1


