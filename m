Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCE45F1DC8
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:41:21 +0200 (CEST)
Received: from localhost ([::1]:51872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefYG-0000EJ-7X
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHW-0006kV-9a
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:05 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:42614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHO-0006Gu-Dj
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:58 -0400
Received: by mail-qk1-x72a.google.com with SMTP id d15so4532656qka.9
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=XPPHU0lTWthT7ltYYV7t26jbrDU+bNcf6qqSn2mwNC8=;
 b=kCk/cnCPZGTyn4lbeziQXU9ruNq56Sfirxfs9RebssrvtiIctRHf21YcKDxwAg/wUf
 HrGwpIWT7JnVohn/lroWJTkalKK51tzI35hi2wryYUaebH/7bt41XYAI1pySm6zLbRpA
 WBFX+RybOzHPb6D24CJUMOI8YenlOe7vbIY0/7go3bkv1CUkae0D4ZdDM1xnj8HsDnMG
 9irFd3dHM8QGEYsMFxu53De9D5Pxpm/ifpJU9pq6IKRFe+Q5drQ5iFYUPU/lxCgG+Os0
 GkkLm2ChrVi2JGmOG7h705xgSMYUIGKNiiZOou0hIJQNPyyzERSMT1svy9gyOGeH8vkl
 +U8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XPPHU0lTWthT7ltYYV7t26jbrDU+bNcf6qqSn2mwNC8=;
 b=B2xyce8tP+XTz+Cxr3i/ZFMqg4OIUx6MlOL1G2QN8gmbBXe8SH5D1o+7EMDkZY2YYn
 T3M3tSET7kUTfxoKLsViRy3wK7Qh2KnoXohxV0jIs2oP5OSapFjUaUMYBeF243fS65VW
 Urjkwdiz/VuXKBFoLscVqEcAdKF0pS0uT8mr9T7k/Tw6WBK6nxljtdDAmHBEHK/TYNcc
 hLU9msSQm69eTNU7MH8q2OIHkz6BrMAAhAPXsTPj7YjCcbLEj0LFy3zFo5/jfN/LDR78
 A7hsgFcMQWqBLawFmxnYrJA5+nt3W+PYhEtyUzFSdXhSRqRNZZRW6BVao55owHsLG3zL
 SDZg==
X-Gm-Message-State: ACrzQf0qmj17q1tlKrZbB2VIbiyTrBLCqOJsauYX+W86NzBizDd2fWQv
 EaWXxxxlg/Uxhi0E6dKjvampTWol8IBDVw==
X-Google-Smtp-Source: AMsMyM4wZFwiTQccpROvuGNG7dN/eM2OkrnJ1QbHXBIcJQtb06U/1sHc4mOJ2AV+CbXd0/b8MTr6zA==
X-Received: by 2002:ae9:e206:0:b0:6cb:d54d:69ee with SMTP id
 c6-20020ae9e206000000b006cbd54d69eemr9816891qkc.466.1664641432065; 
 Sat, 01 Oct 2022 09:23:52 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 12/42] target/arm: Drop secure check for HCR.TGE vs
 SCTLR_EL1.M
Date: Sat,  1 Oct 2022 09:22:48 -0700
Message-Id: <20221001162318.153420-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The effect of TGE does not only apply to non-secure state,
now that Secure EL2 exists.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2875ea881c..1ea29bec58 100644
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


