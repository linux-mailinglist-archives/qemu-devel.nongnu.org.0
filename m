Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D8D59C361
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:50:52 +0200 (CEST)
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9hS-0005qP-Lu
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Lf-0008LP-Ct
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:19 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:47063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LS-0000ob-En
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:19 -0400
Received: by mail-pg1-x535.google.com with SMTP id d71so9663424pgc.13
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=svQnwizGhYqj2KNlPoUGzrRVUcGJh31LTdC8nQ9RVe4=;
 b=XKvCZgKPcgXsJqp/w45cTSa1IbW2yo0eSliLIDiIa6A8Wk1SXDcAKJNmdsJaZwlmc4
 AODVVhjd9eD1rp5TuE7utuygIneemHvsdAWsIgmuTKbwUXf0cSg5GMo6Dc61ZO/i8Hs1
 59OzDSFSt+q1gdrwYPgphrqUaN/ehTfOwCYSnxHMx+wcYKCsoUy91A1RBvWBo7swEAeP
 BHlGvPWeiPVXHhoqvyXcrHy+DA5Lmvctk29RQoNDFtYLtn7Mq9BwvErbRLlpoEx6vnTU
 kH2Wnvnr1F7lcyW6rM6v92AEy6DY6rgy9yGboo5fFoyMO+nEKnoNRewZTRk7sJHaGIw5
 Qn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=svQnwizGhYqj2KNlPoUGzrRVUcGJh31LTdC8nQ9RVe4=;
 b=Sauij/hlezKhrB2HeoN0bGhpJe8h+6BFMrcuvOcCilvrTMeS9kIno093nNnYyDKjnF
 8DIb56XPpWBkRaiPv8qiOwfN7SOnLti8nCGNCS+4y0oElL+qVRQcanhan8bgBorSfU1t
 BEqxWtcO+T5Fo/4P2uV4A1S9Sj8CnQ/MuQqz2UwaLtPY46AWtDOQzspDxSFcowaVOm1j
 Qlg/Id9nDidd7725obqpycwafyfRc+zVYi9cs3wGDgWTngXsPJKCQ9J3BHSRY3q4gWgk
 Vp5/rBBSPv4V4fI+dShZNQ/NKtg1Zk4cKcchsGPV1gtDLEpkZzPwZWLfLkxv/hPlVDce
 TPbQ==
X-Gm-Message-State: ACgBeo19+OdJIjG0Kon/LoQqbbNlgoe62ecL6RyNIamm4sxmukXjPePd
 Af829oeitpT0taWwbhGtBDFQPlBgHceWxA==
X-Google-Smtp-Source: AA6agR6Br77nt+4evDWgJdG6lhEiF2w43lplyIhj1lR9bdcWVB7oFmSz0ZiluJvbCmjMsAc48VmZeQ==
X-Received: by 2002:a65:64c6:0:b0:42a:a392:5340 with SMTP id
 t6-20020a6564c6000000b0042aa3925340mr5501022pgv.588.1661182085109; 
 Mon, 22 Aug 2022 08:28:05 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 28/66] target/arm: Drop secure check for HCR.TGE vs
 SCTLR_EL1.M
Date: Mon, 22 Aug 2022 08:27:03 -0700
Message-Id: <20220822152741.1617527-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The effect of TGE does not only apply to non-secure state,
now that Secure EL2 exists.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ae9552f46f..7c0a4316a3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -157,8 +157,8 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E10_1:
     case ARMMMUIdx_E10_1_PAN:
-        /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
-        if (!is_secure && (hcr_el2 & HCR_TGE)) {
+        /* TGE means that EL0/1 act as if SCTLR_EL1.M is zero */
+        if (hcr_el2 & HCR_TGE) {
             return true;
         }
         break;
-- 
2.34.1


