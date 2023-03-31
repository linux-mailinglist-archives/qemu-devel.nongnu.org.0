Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024766D2305
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 16:52:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piG5j-0000cN-SZ; Fri, 31 Mar 2023 10:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piG5c-0000a6-UL
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:50:53 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piG5Z-0000bd-2A
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:50:52 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j24so22740357wrd.0
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680274247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ob8zaLRhLK1pUzR/HANUMOjhD/K+he8dJVxHdozinP4=;
 b=KbmOtAnp8YkA81wg88UGSawrW/IEgo4NEx/o0ANveXBuH5zX+7VdrISCOSdrcictDL
 bClbIOPwajXZZv6JIo3JYGIkoOJNCb+02z1NZHiLokX0Ak1YPuk3IpXewww5i/OQJW5a
 xMO9dGYjFg2Ey7yKjOg1Rp39s3qO1B3lPRnQm4irGDOAiwcwkrIXBwTUr0UjsQpzXjLK
 FHpDsu39OJUrdxPXLy9x/ZORxxR3A/wKBCjP9qxxRPjDn1Upcr7aJ+Pj4xXLBzmwOi1t
 nc0gwQIy62Q7Ss5/gJkaPhJs9nIZIoT+hPlTedb9+apJstLGW0pptzQwXqhIVZ1g1Q0n
 DA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680274247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ob8zaLRhLK1pUzR/HANUMOjhD/K+he8dJVxHdozinP4=;
 b=kNC2whXqSWncZarPFHuVXq6tV3sNGhbkZkRWDX20a/uE5/6aR+8okRCfTfMXznUFPr
 FRmhX4b+ZMs1ZeefjnU5ch8pXScIX3p+rAomHOTzGjNPBFCmU006qThSkIK4eXNyTPcf
 Y9SNs7m0goWD6vtSZaGS1LZi0FFBRdTIiKnwnkRD/5WnXpjICziSPs8GVvWqSvxIdGjV
 RuhkeB4ggYlBARIbPcqh/XdTsBvASWQ+xkwtCuxSd4wKE8doRjk8KmFfXyWcHbWXaJ0G
 /oTWA6D2JVzyp4Vy+bLGom9A2SEttOpoNB1e9q9X0dE0SKUhddSUbVq8bK8zhyT3pUa4
 /xFQ==
X-Gm-Message-State: AAQBX9eBAaodt7Y7TacylVGkKD8Mwa5dzuljw/Rk7X9qqJGd+9fINaxg
 zQOh0hxIdNu9wXcYnXt+39nreQ==
X-Google-Smtp-Source: AKy350You3xNglYIyhUa70jdk+fRlOPLkdvuYFALPPl983MX0fRhW+cNzfFRqi+mLFAQ6tMujTxbkQ==
X-Received: by 2002:a5d:63c1:0:b0:2cf:e8d2:b550 with SMTP id
 c1-20020a5d63c1000000b002cfe8d2b550mr21365168wrw.14.1680274247651; 
 Fri, 31 Mar 2023 07:50:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d560c000000b002cfe685bfd6sm2339831wrv.108.2023.03.31.07.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 07:50:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/arm: Don't set ISV when reporting stage 1 faults
 in ESR_EL2
Date: Fri, 31 Mar 2023 15:50:44 +0100
Message-Id: <20230331145045.2584941-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331145045.2584941-1-peter.maydell@linaro.org>
References: <20230331145045.2584941-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The syndrome value reported to ESR_EL2 should only contain the
detailed instruction syndrome information when the fault has been
caused by a stage 2 abort, not when the fault was a stage 1 abort
(i.e.  caused by execution at EL2).  We were getting this wrong and
reporting the detailed ISV information all the time.

Fix the bug by checking fi->stage2.  Add a TODO comment noting the
cases where we'll have to come back and revisit this when we
implement FEAT_LS64 and friends.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/tlb_helper.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 1a61adb8a68..d5a89bc5141 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -32,8 +32,9 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
     uint32_t syn;
 
     /*
-     * ISV is only set for data aborts routed to EL2 and
-     * never for stage-1 page table walks faulting on stage 2.
+     * ISV is only set for stage-2 data aborts routed to EL2 and
+     * never for stage-1 page table walks faulting on stage 2
+     * or for stage-1 faults.
      *
      * Furthermore, ISV is only set for certain kinds of load/stores.
      * If the template syndrome does not have ISV set, we should leave
@@ -42,8 +43,14 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
      * See ARMv8 specs, D7-1974:
      * ISS encoding for an exception from a Data Abort, the
      * ISV field.
+     *
+     * TODO: FEAT_LS64/FEAT_LS64_V/FEAT_SL64_ACCDATA: Translation,
+     * Access Flag, and Permission faults caused by LD64B, ST64B,
+     * ST64BV, or ST64BV0 insns report syndrome info even for stage-1
+     * faults and regardless of the target EL.
      */
-    if (!(template_syn & ARM_EL_ISV) || target_el != 2 || fi->s1ptw) {
+    if (!(template_syn & ARM_EL_ISV) || target_el != 2
+        || fi->s1ptw || !fi->stage2) {
         syn = syn_data_abort_no_iss(same_el, 0,
                                     fi->ea, 0, fi->s1ptw, is_write, fsc);
     } else {
-- 
2.34.1


