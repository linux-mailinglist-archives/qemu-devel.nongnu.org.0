Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299073265D5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 17:48:05 +0100 (CET)
Received: from localhost ([::1]:36852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFgHc-0007kz-5r
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 11:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lFg3X-0004pq-94; Fri, 26 Feb 2021 11:33:31 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:42423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lFg3P-0007jA-Tw; Fri, 26 Feb 2021 11:33:31 -0500
Received: by mail-qt1-x82e.google.com with SMTP id d11so6314542qtx.9;
 Fri, 26 Feb 2021 08:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bP1h3rFMbb8T0NWNRHLG/mNCr4sUyYzgV3DW65L/Oyo=;
 b=Lyl8X3/mspzCcw5IPJ2YmxOcHePdt7uqjDdS2rklkXJ2E8UcIu97F37yl0aFctD+oE
 YEqYcYWcQorL1IyNNMROFuZuDr9Bqv8X9dCKZfp9/mc2oEHGSWpeXb3hU+copaM5om5R
 2xk+zlxBoNtSTiREM9TmAODFVclPRZegiSc+AdeNgC9AySWkOFYc0W4HaTDSWAv3EE7v
 S7D1rYE+PaOGRe8A15TuxLGP1/FwBKBEvLR+Tl7q8OsHCiZKtZRqrtZl28kiyi7uH9+q
 cgnNjblRD/3QFmDfHjMWC/ZI+eE/+xzoDr6o8cakPaO0qsEoTKoXCeq7E6H/NPJSeLqS
 4brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bP1h3rFMbb8T0NWNRHLG/mNCr4sUyYzgV3DW65L/Oyo=;
 b=Y/sppHKG2qfCXwMc/vNrdtUTw/mDxRV7mMIlsz3Jbwlc/soNYItcXYmHGZTXin7nVF
 6xqZq08VVAXd6Bum8oAs57F/WMYBZ5n+2DWVOZp4EmES2KwuzvuL874Yl5bvtvnZBIHG
 hroELdW1BulU0r+sXbn5x+KrsRTMpqcVdyoaxaleVNs4IKC6uHLGEnMpp/HV5NgQ8BBM
 Pw4ozY6HHt6I6T9kauCQwbQ18+ifkAc3zwxsImDQwvzXEfFdKAFIxraT9aVWo7EgKuc1
 MJuMy0nZM7SOI+NdW8DC+AXeSItTajDRW+oJUhf1b2sBo++9HZjsw87uecQAnyMUw9vB
 hsWA==
X-Gm-Message-State: AOAM533awVylWAtFYkvIVpDmJWUtIGSPO9modOugLXca6HRNc4y3dgeN
 CiuBtl6N0hdOmcaX2lQxDSwxGwq7H89Zdw==
X-Google-Smtp-Source: ABdhPJyOr+dWuXZKBSe0LWI6jDj4RN1Y2IlEzdr821dsGPa7VWQIoJ/DPJGsOb44O5ukoBmPPWg0HQ==
X-Received: by 2002:ac8:735a:: with SMTP id q26mr3317576qtp.5.1614357200758;
 Fri, 26 Feb 2021 08:33:20 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:cd1c:d722:e26f:4e76:c5c1])
 by smtp.gmail.com with ESMTPSA id t33sm731116qtd.13.2021.02.26.08.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:33:20 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] spapr.c: check unplug_request flag in
 spapr_memory_unplug_request()
Date: Fri, 26 Feb 2021 13:32:58 -0300
Message-Id: <20210226163301.419727-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226163301.419727-1-danielhb413@gmail.com>
References: <20210226163301.419727-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we're asserting the first DRC LMB earlier, use it to query if
the DRC is already pending unplug and, in this case, issue the same
error we already do.

The previous check was introduced in commit 2a129767ebb1 and it works,
but it's easier to check the unplug_requested  flag instead of looking
for the existence of the sPAPRDIMMState. It's also compliant with what
is already done in other unplug_request functions for other devices.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 74e046b522..149dc2113f 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3681,13 +3681,7 @@ static void spapr_memory_unplug_request(HotplugHandler *hotplug_dev,
                                 addr_start / SPAPR_MEMORY_BLOCK_SIZE);
     g_assert(drc_start);
 
-    /*
-     * An existing pending dimm state for this DIMM means that there is an
-     * unplug operation in progress, waiting for the spapr_lmb_release
-     * callback to complete the job (BQL can't cover that far). In this case,
-     * bail out to avoid detaching DRCs that were already released.
-     */
-    if (spapr_pending_dimm_unplugs_find(spapr, dimm)) {
+    if (spapr_drc_unplug_requested(drc_start)) {
         error_setg(errp, "Memory unplug already in progress for device %s",
                    dev->id);
         return;
-- 
2.29.2


