Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D6D53C083
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 23:55:56 +0200 (CEST)
Received: from localhost ([::1]:51876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwsnL-0001aB-S0
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 17:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgi-0004VB-E3
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:04 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgf-0008Ve-UW
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:03 -0400
Received: by mail-pf1-x435.google.com with SMTP id c196so5815378pfb.1
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Ev7rY3/e5SYquDaVsOHvuROOoufvb4/pczCNQeIm0s=;
 b=Jc0ALYc59bQuLEB4BfzZhnPtgcOVwL+Ykm8IF3ZLApPx7eSQE10WZuS2Gp0K/E52xL
 A0tRxCRjo7LjlZPymmB4p8PpC9OJtN2N4O3FbbgP4PfpVB0drjjJ8MBbFz+PwFyY/EfB
 Er+ff44LpOgYOEeOjyoRsQZ0IwM4E1AkudqXtHWnzBUsrpA4DggyEBNMLlHB14uTGp4v
 ZcNkBh+fIEsdS4ulblMZgMaEM+i5+JXaAOnPmXdZ3WuDkzJvZQrwMIX+NuVQO1LPL/qI
 6+JF1w0MSd+1r+0mhsu8/N45nm0Li5ejqcRdOjmObMLFl/Z3pgfsmwfmMUrbYPeIYP9Z
 yJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Ev7rY3/e5SYquDaVsOHvuROOoufvb4/pczCNQeIm0s=;
 b=Dr5TP/nf/K1venNG8P38X4ZlNwlMxJNnC4+gAsC1Ov9wtneOnPY1rlCr0Yu8Xte7RL
 tclOrnIQB2QCyqoPCxKg9nqvftfRTMTFwSmVyj29UEnvFFSL3Ygv+j1BFnFuw3iKhR25
 ztIbu5LTsGIMootBMJMbwKHUd0+hlMbWwVo/MM7JIA9Jq39ELn6UfIP/qzjoAqa0YIKC
 rRpdCnIOKvUGOJPr5dYgw9FJ/g7RKmILEB3KiCdKOsaA2kMuOybi+btHjIt7fBQ/2lq7
 qOP/hSjSqs2r8wiP1MtECjA3POvJ1ybo5RwBniAmPm7YJwFuYSzqIckmIMHGm3C1VxBu
 nUjw==
X-Gm-Message-State: AOAM533FMkeZQUIFVjLz8EBytFOjrCv01z94mcmVOmCR2FMbbzFBGTMd
 3/eZysAXXMcR90NKFM//85d1gD3lXz/OzQ==
X-Google-Smtp-Source: ABdhPJwXivQGBK5K21g1Zud8AgX7CIFRgtGKvyO506ylsyoWSC7WphV1cE9P2k2dA2AXaSV83wzRsg==
X-Received: by 2002:a05:6a00:2488:b0:518:afb4:bb60 with SMTP id
 c8-20020a056a00248800b00518afb4bb60mr7073816pfv.51.1654206540593; 
 Thu, 02 Jun 2022 14:49:00 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/71] target/arm: Use el_is_in_host for sve_exception_el
Date: Thu,  2 Jun 2022 14:47:49 -0700
Message-Id: <20220602214853.496211-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ARM pseudocode function CheckNormalSVEEnabled uses this
predicate now, and I think it's a bit clearer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 135c3e790c..7319c91fc2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6180,9 +6180,7 @@ static const ARMCPRegInfo minimal_ras_reginfo[] = {
 int sve_exception_el(CPUARMState *env, int el)
 {
 #ifndef CONFIG_USER_ONLY
-    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
-
-    if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+    if (el <= 1 && !el_is_in_host(env, el)) {
         switch (FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, ZEN)) {
         case 1:
             if (el != 0) {
@@ -6199,6 +6197,7 @@ int sve_exception_el(CPUARMState *env, int el)
      * CPTR_EL2 changes format with HCR_EL2.E2H (regardless of TGE).
      */
     if (el <= 2) {
+        uint64_t hcr_el2 = arm_hcr_el2_eff(env);
         if (hcr_el2 & HCR_E2H) {
             switch (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, ZEN)) {
             case 1:
-- 
2.34.1


