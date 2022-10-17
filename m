Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD54600BA0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 11:55:08 +0200 (CEST)
Received: from localhost ([::1]:54656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okMpw-0004er-08
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 05:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1okMSU-0005h6-3u
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:30:56 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:36638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ake@igel.co.jp>) id 1okMSQ-0003hq-SM
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:30:52 -0400
Received: by mail-pf1-x42b.google.com with SMTP id y1so10563567pfr.3
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 02:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q+1RkO68FpvgSIPW/GxFIFzaJUEnJFMWTGSdbMe0YJo=;
 b=qLFXfnz7j+LndBZnNZTdzzuGXCciLpqS3QW0p7tygdc+BiTpphTosLDpWFYWt6F/6Q
 LNKRov+XptgZGXitC8v9qk2XgKpINqBwNGeTbfocs33otzfW1g5OKGvWDcS39Pv6Nd7Q
 JcOEDw/6I7nPWDTlOqKFwppaHz4U1AjJERpuC9120NmkI+xQEht8ku5x0P7rLbbLsac3
 204HDJ7Qs/6/9m2qYrEfnmEvPRRw/40jWLycbEbu4f5VIRtyvtrNBbD9Qok87WA8HXQ+
 dlOBwYhs3melP/pDQqmLcr/rkR5GkU3Guv9WsjVTgIV2xKRjb28UjCWRLVFo9duOKUTn
 jgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q+1RkO68FpvgSIPW/GxFIFzaJUEnJFMWTGSdbMe0YJo=;
 b=lqa2sxCl0Bw6UZUTAYsp+JizS1mJU0ayz9c7RawVbV8gXgDVnL51oR+nLxQhaLJz8E
 Y9FHcHj6LcmmPfBZmuJs5Aa1wg7q1cOXa9lSJbvtcEoezRGDl1MR5vlGHzDvTzmQj7cu
 AxEYF60Wx6EJko6ptt5QURfOuMND85Bn5xgrHKYK8RIgdpEwXqdRMqpHyGm9iPKqSCpI
 mlLTqwuw2O3pF5RPyz19w7qjDPe1aAZyMuT0P3PSCSFnLtmWWqEW0B6mPLi2DhmphMGT
 KRoRBidjv4Z8idKmA3k1El4yyBbu5C44jo6uFYQpMATsPv4WkpR9gcYxmcj9V33gBf1j
 Pfiw==
X-Gm-Message-State: ACrzQf0AfuoV7EX/9oJUoBGJ1fKt9PXqs+MFXJ/uN5wuZ7oQzdL7Yshk
 kn+lHS3kfXdDknOhb/KtcKxdvLDDef4alucP
X-Google-Smtp-Source: AMsMyM5sn84dWBF1FBRlp3uemIFdnbotEpkqiwvl2ORnIGTf59r1mAcnO0kgjoqMyFUPadBUEG2YAQ==
X-Received: by 2002:a05:6a00:ad0:b0:555:ac02:433b with SMTP id
 c16-20020a056a000ad000b00555ac02433bmr11708557pfl.18.1665999049143; 
 Mon, 17 Oct 2022 02:30:49 -0700 (PDT)
Received: from ake-x260.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 16-20020a17090a0d5000b0020a71ca2cb8sm9261774pju.56.2022.10.17.02.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 02:30:48 -0700 (PDT)
From: Ake Koomsin <ake@igel.co.jp>
To: qemu-devel@nongnu.org
Cc: Ake Koomsin <ake@igel.co.jp>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH] target/arm: honor HCR_E2H for AT S1E2R and AT S1E2W address
 translation
Date: Mon, 17 Oct 2022 18:30:03 +0900
Message-Id: <20221017093003.547009-1-ake@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=ake@igel.co.jp; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

When HCR_E2H is set, AT S1E2R and AT S1E2W should translate an address
based on both TTBR0_EL2 and TTBR1_EL2.

Signed-off-by: Ake Koomsin <ake@igel.co.jp>
---
 target/arm/helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dde64a487a..147f96e752 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3486,7 +3486,12 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
             }
             break;
         case 4: /* AT S1E2R, AT S1E2W */
-            mmu_idx = ARMMMUIdx_E2;
+            if (arm_hcr_el2_eff(env) & HCR_E2H) {
+                mmu_idx = env->pstate & PSTATE_PAN ?
+                    ARMMMUIdx_E20_2_PAN : ARMMMUIdx_E20_2;
+            } else {
+                mmu_idx = ARMMMUIdx_E2;
+            }
             break;
         case 6: /* AT S1E3R, AT S1E3W */
             mmu_idx = ARMMMUIdx_E3;
-- 
2.25.1


