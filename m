Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8720E6E8F8D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:09:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAL-0000kj-BK; Thu, 20 Apr 2023 06:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRAA-0000Zy-QZ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:15 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA4-0003rm-Ko
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:14 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1763ee85bso5093915e9.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985106; x=1684577106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NO9cU/K25d1+EVnE2I5xYDNNqPgct0OWLItzEhlSFrQ=;
 b=W4vKKjIwoBFS5ar6EsfoYykE2AMeWw3jWx1ZcTu8S3EcCuyLjE/7Wc5cAqGVorEBH8
 MPuhYsmSUK6chzIL2QM5Ci06fXBw7p8o3MTAK+4Ee4qU7oKwUz0MpD2XT0Y/5amDzNEJ
 exgpL2DdctfwwOYOUWBHl1kmxmCVbudZ0Wz4kC+4eHQK10+3mirwaIbcGXq4ng8Ip99t
 sBisCHlbYiIjLOshkuKqUSvYtiy488Db+1Kl56YOsAk4mqoiLcrqCWWPST9uI9cawybd
 1tkccLEyPZaO7RSd8B6JvQPniuBRYH5EatbyDBCfCJ4XFBLg/VHzqK3oKolAGGtp55mq
 rjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985106; x=1684577106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NO9cU/K25d1+EVnE2I5xYDNNqPgct0OWLItzEhlSFrQ=;
 b=hLwwTusncmYE+fiHVI/1qIdkHh8Kthfv6K3YhtPXF5c0JyUaU5dczSVCH8ppOLmh6i
 wCg+qjMLNUi+uDt1Pge4SAvL96FuCq6k9fngswgv5j/yNxQzJstDQsSWldGHTwvXadlC
 iwjlqWSTkzOsONf4G8R5VMgX2ucF/AVYsTl1oc4jpzthjBuanRus2zPqs5KS2ZLcmgL4
 XP2IXlG18Yi0QJ/84K7EgHmLyuYkHsGrm5sJl2P86nZ2jkwM3Y/oSAKhHPpAHtm5ASKd
 rIrHqy8MJocII5OmkNj6cJr/vOil5LPj9nJLo/mvgF2EXKkOiJTwhUe1hDQ1zmmWegFR
 HAzQ==
X-Gm-Message-State: AAQBX9d+fTn/eGBLIi2kTsMEnSmOivrgLNKxP3whRJJrCk+XY02+8s+k
 MvkaEJ2wszAI47UZV1vKrmXMngp0FupQeQA9DQ0=
X-Google-Smtp-Source: AKy350bRtqAca6OBtPGBbwnCk6h4fU5b0KSEzT2tpum2sb7O+mkJ0BflETV6I+FJVgs7AsFPeVLyeA==
X-Received: by 2002:a05:6000:90:b0:2fb:c75f:8f22 with SMTP id
 m16-20020a056000009000b002fbc75f8f22mr903525wrx.56.1681985106568; 
 Thu, 20 Apr 2023 03:05:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/21] target/arm: Don't set ISV when reporting stage 1 faults
 in ESR_EL2
Date: Thu, 20 Apr 2023 11:04:48 +0100
Message-Id: <20230420100456.944969-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230331145045.2584941-3-peter.maydell@linaro.org
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


