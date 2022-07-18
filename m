Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2214757887F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:32:28 +0200 (CEST)
Received: from localhost ([::1]:48608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUbb-0004wp-8u
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUS3-0007ko-VO; Mon, 18 Jul 2022 13:22:36 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:37789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUS2-0001iF-48; Mon, 18 Jul 2022 13:22:35 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so9714707otu.4; 
 Mon, 18 Jul 2022 10:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fvMJGexYC/ksWQD6tsUlIN56DwNKHAX6EOUQY7Vofe4=;
 b=GQN7mRlnAcUJ1F3G9Tf/tx4rX2dA4PSKWivlH5GbYnX/xqtc1VhlJOLh1zuE36tXwH
 HR7LmcJyL3uUH+hOxufQCuUudU/HHmhkAzriGsc7v8taALzUgkcijURdgQwjvcMxSGz4
 FCOqFkpp9wAV8bsbTBeyTre0si7fpVDeS6Eu1vcR812KvXJeKCFn0lHkUZkBz4tu3K1i
 exau3SPY3UUut4txSVnzL9q7ZIIWW/A8whP1jB1EyxFbVA7PZUAiIGeqHpcmhEm0dE9p
 Y3i2VVHgvOxjly0G4f++TzFqwTmD/Km8tqlsDmLQh7mQT/nbiuQ/oGC1IDHaiM7hGOAG
 DkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fvMJGexYC/ksWQD6tsUlIN56DwNKHAX6EOUQY7Vofe4=;
 b=M8RenVwZeHrYDY2oM04Y++dQPGoTvC9ZMw0Ru4OQHOSdGTekZCN+h6H83ak02mmqXY
 e286vCYqLPSVqT0o4COjS8xoREUjPLIUMIArVWjyeRNAs90tTNI11rBSgUUfIfJAgyWj
 vKhX0euogw5TCgOGjqGnkXMMWEEYzI5EbGdTvj3okKOAs8cV4qZsn5ELqK1+S52lPg2B
 Eaxu0yjiKcKtmi3c4uMh3IJgqmimoh+lSRtK5AopzDiaiNjXN44hcKW1+tjF37gErkuv
 zb3duoST4hcFnFAiNTjaPIJi5Q2iR3B5kaPVCXC7BBGKjdMJnUpWMG1l5ra470I+lJ4m
 uxAA==
X-Gm-Message-State: AJIora9aXS2dIqWGpAGYhpNhav/B6jW9AoyMXWmyJgEBD+9BslcUFxFP
 zvTCTXrpRWxmDLNRUiP+WVTbW6A8SSw=
X-Google-Smtp-Source: AGRyM1tZT0Zv+NIIqqpgjobsr6IQE0e92Pv2y1DCT1SHvwQTfTLr21+GzIuN/svT1/8c2+ftDgArXA==
X-Received: by 2002:a05:6830:61cd:b0:618:d560:b787 with SMTP id
 cc13-20020a05683061cd00b00618d560b787mr11945137otb.154.1658164952982; 
 Mon, 18 Jul 2022 10:22:32 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:32 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>
Subject: [PULL 08/30] target/ppc: Fix gen_priv_exception error value in
 mfspr/mtspr
Date: Mon, 18 Jul 2022 14:21:46 -0300
Message-Id: <20220718172208.1247624-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x331.google.com
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

The code in linux-user/ppc/cpu_loop.c expects POWERPC_EXCP_PRIV
exception with error POWERPC_EXCP_PRIV_OPC or POWERPC_EXCP_PRIV_REG,
while POWERPC_EXCP_INVAL_SPR is expected in POWERPC_EXCP_INVAL
exceptions. This mismatch caused an EXCP_DUMP with the message "Unknown
privilege violation (03)", as seen in [1].

[1] https://gitlab.com/qemu-project/qemu/-/issues/588

Fixes: 9b2fadda3e01 ("ppc: Rework generation of priv and inval interrupts")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/588
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220627141104.669152-2-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 1d6daa4608..55f34eb490 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -4789,11 +4789,11 @@ static inline void gen_op_mfspr(DisasContext *ctx)
          */
         if (sprn & 0x10) {
             if (ctx->pr) {
-                gen_priv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+                gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
             }
         } else {
             if (ctx->pr || sprn == 0 || sprn == 4 || sprn == 5 || sprn == 6) {
-                gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+                gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_REG);
             }
         }
     }
@@ -4976,11 +4976,11 @@ static void gen_mtspr(DisasContext *ctx)
          */
         if (sprn & 0x10) {
             if (ctx->pr) {
-                gen_priv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+                gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
             }
         } else {
             if (ctx->pr || sprn == 0) {
-                gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+                gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_REG);
             }
         }
     }
-- 
2.36.1


