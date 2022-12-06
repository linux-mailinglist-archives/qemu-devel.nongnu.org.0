Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6026643C79
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:42:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2PlT-0003DC-HF; Mon, 05 Dec 2022 23:41:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlS-0003Ce-0V
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:41:06 -0500
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2PlQ-000365-J6
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:41:05 -0500
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1447c7aa004so7976874fac.11
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6ULKeVCes+WuSNJ4/pJViKOQPocE7eOLpKgygf6uSqE=;
 b=pdShluGobBcpiKcHz1sJqXvuiPV24huQMteZeEVcHWxek0DgL2B6wIRXc683thhTqp
 wf9jbzWhybQq7k9NcUEcocZk9A6L1WTMDgZeFptjj3SlHX0VABfYc46WzO4z0L1WlOlf
 2ZZLjIpwVtm7AZYjN4UhA40CTI1kqb63xUonxR+Qg8RrQyeCMt6KGHblufS82948fwAU
 akqmAjv9jBDRlc+nLW5rSkYSlHGrGlDFS+mxhshFXg7C9tMdwlZcJWdM8c2lkcTcnbhj
 SWpq2/8OKtv50Qf4rXYAP2OpqYV6It3hybvzxeaqlPp/A+wWCB6tKX+iPj4mvjH4tbxJ
 /VDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ULKeVCes+WuSNJ4/pJViKOQPocE7eOLpKgygf6uSqE=;
 b=4EZEh7E6JYR+rISDw68InRsuut2eG6Wpd/zcAXR1OMXOdg6XITjszzt8Gf94JlEikq
 P/KW/EnloxPaufOAhHPJrjbKbewojVP8a+glZ7vqFrfrXGA0oHjAuqJKoXSecAwq/zV9
 r0jttHkItM95smWowCXsOYisv3nl9L8O1ZtkfSSGWeJKnMtGevr8UmqeE5f2lozU/fWf
 BXLHZdGgnhCLwk6lZVZJPJO3HLVOlqqh1bt/LoKruR235Po9X4OQvuj4JcIoDl3z/UZx
 L9vPwvlSgQmStqpANm0pIMq+JINbeCEoXLG9zxkwcs7U0M3xw9zHdq1lyVTKtCupFWS7
 inWA==
X-Gm-Message-State: ANoB5pl+e8bv/LOaBITJv/tMAyZc4saUs8mDXjlbwrVRRoMWwtWWDhhZ
 An/0ZFYwc+7093SFjec9tuQIgBSW6opy/tq61Sg=
X-Google-Smtp-Source: AA0mqf4c9lL1aL2R4wEnj22s28yTK9fK/bdjp6dwEirXfuH/9CtwytfcCyd/aUsKtqR4tgymbDFKKw==
X-Received: by 2002:a05:6870:ab17:b0:143:d6b3:558a with SMTP id
 gu23-20020a056870ab1700b00143d6b3558amr20008073oab.206.1670301662330; 
 Mon, 05 Dec 2022 20:41:02 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05687041c600b001442fada152sm7561864oac.46.2022.12.05.20.41.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:41:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] tcg/loongarch64: Use tcg_pcrel_diff in tcg_out_ldst
Date: Mon,  5 Dec 2022 22:40:50 -0600
Message-Id: <20221206044051.322543-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206044051.322543-1-richard.henderson@linaro.org>
References: <20221206044051.322543-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
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

Take the w^x split into account when computing the
pc-relative distance to an absolute pointer.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 2044897e36..47465b8c20 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -701,7 +701,7 @@ static void tcg_out_ldst(TCGContext *s, LoongArchInsn opc, TCGReg data,
     intptr_t imm12 = sextreg(offset, 0, 12);
 
     if (offset != imm12) {
-        intptr_t diff = offset - (uintptr_t)s->code_ptr;
+        intptr_t diff = tcg_pcrel_diff(s, (void *)offset);
 
         if (addr == TCG_REG_ZERO && diff == (int32_t)diff) {
             imm12 = sextreg(diff, 0, 12);
-- 
2.34.1


