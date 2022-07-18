Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EBF57889A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:39:36 +0200 (CEST)
Received: from localhost ([::1]:37736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUiV-0000s6-BN
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUS7-0007pa-Pw; Mon, 18 Jul 2022 13:22:43 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:43789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUS5-0001nG-3S; Mon, 18 Jul 2022 13:22:38 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-10d4691a687so10211685fac.10; 
 Mon, 18 Jul 2022 10:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ThB98apRfBs5yvy4V1cZpA2KNQJrOdvKbcBXWZJUT9U=;
 b=MGYEA/TXELANhJRzXP3FAolhgD9Z84SX6KO07Kt4bLgYiR6Sp/s/B+g3S2bbCdtv9p
 nOMSDZ/BQ4XDWJF6v54yYXmpgRK+815Wjx5T3jP0Lgf9hqLEyK8V+kPXfsU+npqvEK/r
 5haKAI3hbsBE1gmBHKwLmTEV2Hj2vVWM2y4YGuyqNxsvwkbcuQYXg6kMp9kKnXWyQoxk
 xSAsr9/8e/dY1CJXV7Jz98GkauLyORoqck5D9vqZ6PONKKc6shzMgvhAWONIYlsbLp3y
 4Q+Xd+gx+g5ipSrYNff+9T0M0zo30RmdLG26U61TzT+PHzEzotKw2LE0UPBB+GCUKo7e
 3f3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ThB98apRfBs5yvy4V1cZpA2KNQJrOdvKbcBXWZJUT9U=;
 b=xUPPlh+VhCNL4kEJVwf5msvZOEhiY7WjAJNY1zoowvsfE0J1XXzhyRSvD/xocOjp9L
 8AQr9q4QI4mC+1rfRDDo35XVUQ7vvoJb8MFSA2jOvrA0mFzLwIGjExjlijTBGR/W22wm
 gvrP5e+VRazorHsabWKiTjUwhKBDqy6x4g3WfW8edghI1IwpwcuE9vEKm7UE79D7L6IO
 Xk+HabGwd+cp2m/y3//ZQDlxYuTyT+Yk6k28BDFYDZbrQCfDp1NqW9IgKKAbVq/LM4AY
 2sbl/BDSTmOc9N5tXDFQslF/OCehncYNUj41la7hLOoyFmtvIVfK3KSFqJvTxANBd7YH
 Wleg==
X-Gm-Message-State: AJIora8UL5qmmnMWTH2O2J/zqyhaSug8LK+b67wDSfFcGhQJT18zBsoU
 juEQfuJVRxbOYqFK1FfNMVv3r3qR4ow=
X-Google-Smtp-Source: AGRyM1tqHM1blmikJTUp1FGSgA7iHUAJ9Jl6yzPHnapO2jR3L2qjeyeI3TdcaPM+48OnlfFkeNo93w==
X-Received: by 2002:a05:6870:c210:b0:10b:f1b9:94 with SMTP id
 z16-20020a056870c21000b0010bf1b90094mr17849853oae.238.1658164955536; 
 Mon, 18 Jul 2022 10:22:35 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:35 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 09/30] target/ppc: fix exception error value in slbfee
Date: Mon, 18 Jul 2022 14:21:47 -0300
Message-Id: <20220718172208.1247624-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Testing on a POWER9 DD2.3, we observed that the Linux kernel delivers a
signal with si_code ILL_PRVOPC (5) when a userspace application tries to
use slbfee. To obtain this behavior on linux-user, we should use
POWERPC_EXCP_PRIV with POWERPC_EXCP_PRIV_OPC.

No functional change is intended for softmmu targets as
gen_hvpriv_exception uses the same 'exception' argument
(POWERPC_EXCP_HV_EMU) for raise_exception_*, and the powerpc_excp_*
methods do not use lower bits of the exception error code when handling
POWERPC_EXCP_{INVAL,PRIV}.

Reported-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220627141104.669152-3-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 55f34eb490..d7e5670c20 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5386,12 +5386,12 @@ static void gen_slbmfev(DisasContext *ctx)
 static void gen_slbfee_(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
-    gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
+    gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
 #else
     TCGLabel *l1, *l2;
 
     if (unlikely(ctx->pr)) {
-        gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
         return;
     }
     gen_helper_find_slb_vsid(cpu_gpr[rS(ctx->opcode)], cpu_env,
-- 
2.36.1


