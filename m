Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CD6552F59
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 12:02:56 +0200 (CEST)
Received: from localhost ([::1]:34880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ail-0001VV-12
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 06:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aR9-00080h-Or; Tue, 21 Jun 2022 05:44:43 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:37548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aR7-0007Po-3w; Tue, 21 Jun 2022 05:44:43 -0400
Received: by mail-oi1-x229.google.com with SMTP id j10so511110oih.4;
 Tue, 21 Jun 2022 02:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4men+xRdozA/VMBJA8BCK2Zs91riJ50H73TWq8v6YLM=;
 b=ICbuL4SLRPSHR6PEGEQdTALc7skXBF0wJrh+5ipb1WxqcVB0Mio4GoZrlYn678fDkA
 3aUqxN6YzX6KnTwRA0mFQTW+lu7f6eQ/oSdcUJq1hzFg7OxZzL3nqPFKYNSJvF6kFYu7
 Cei/ghyDwHaSo72zNgV49MDWLByqaY0KURvSH3GPw/ledKutk5VRPSOiPvGXvkwSZ1hT
 wJjkmtrtujAgswlIkUdva6Uq0i4CCfnDqCeH1CGKHEYUWWkNCaOvTeVmoeVLhmTLs+zI
 +BIRzOPotwK8VV+uwel8CH+0UMlbJkyM8YLSuwjK5nTp0OmJ5KzZ3RpV3168/+VwhLsx
 87Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4men+xRdozA/VMBJA8BCK2Zs91riJ50H73TWq8v6YLM=;
 b=PLnk3yGxSmCTw0UGW8iMfvXffNbZGEn6TLJhm822EGAYjNB2TneEEESQh2bl3yRYHn
 EDl6YeoxhRRYGWBjarkDh2HWhxlmAH14UPM5T4JuuosmG4rEradOdIyeoUiggYt6DfIh
 MCLvWK9xjDWWxo4EsGt9Ymuqx18sJ/dN/aqr2d3/jWWahEhEV3IGWh5D1FBGeRCVutUB
 WAOduXqoMt8D2tHVYXsMZiu9dAWoVw6bhZc0uTwvjCm0yVFwsDz1ZCI4qrXex5fZT9PO
 WY7imHt2oejwzWqzeFEsIKybhuNEncCXmVRtAefsZZ6pULoX/pbxzbUNa/XERUHJ1sNs
 IL1w==
X-Gm-Message-State: AJIora90OfrKhLsxvCE4c2qCHgoHK285AS+Y+9dNmbAjlESzecuFlRVR
 tOye39Sy+ohZoKJFBfrKjethwkimFnmbSQ==
X-Google-Smtp-Source: AGRyM1saUdJVoyyH9oxRVtROlFS8pieXd7WK+sqiA/ZtPhoaeDGd4oTJIZHxFRrSpMqgdcp29QGZug==
X-Received: by 2002:a05:6808:1b0c:b0:32e:f087:b9a7 with SMTP id
 bx12-20020a0568081b0c00b0032ef087b9a7mr13250526oib.273.1655804678538; 
 Tue, 21 Jun 2022 02:44:38 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a9d7a49000000b0061020865f1asm7555119otm.50.2022.06.21.02.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:44:38 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>
Subject: [PULL 14/15] target/ppc: fix unreachable code in fpu_helper.c
Date: Tue, 21 Jun 2022 06:43:59 -0300
Message-Id: <20220621094400.122800-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621094400.122800-1-danielhb413@gmail.com>
References: <20220621094400.122800-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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

Commit c29018cc7395 added an env->fpscr OR operation using a ternary
that checks if 'error' is not zero:

    env->fpscr |= error ? FP_FEX : 0;

However, in the current body of do_fpscr_check_status(), 'error' is
granted to be always non-zero at that point. The result is that Coverity
is less than pleased:

  Control flow issues  (DEADCODE)
Execution cannot reach the expression "0ULL" inside this statement:
"env->fpscr |= (error ? 1073...".

Remove the ternary and always make env->fpscr |= FP_FEX.

Cc: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Cc: Richard Henderson <richard.henderson@linaro.org>
Fixes: Coverity CID 1489442
Fixes: c29018cc7395 ("target/ppc: Implemented xvf*ger*")
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Message-Id: <20220602191048.137511-1-danielhb413@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/fpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index fed0ce420a..7ab6beadad 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -464,7 +464,7 @@ static void do_fpscr_check_status(CPUPPCState *env, uintptr_t raddr)
     }
     cs->exception_index = POWERPC_EXCP_PROGRAM;
     env->error_code = error | POWERPC_EXCP_FP;
-    env->fpscr |= error ? FP_FEX : 0;
+    env->fpscr |= FP_FEX;
     /* Deferred floating-point exception after target FPSCR update */
     if (fp_exceptions_enabled(env)) {
         raise_exception_err_ra(env, cs->exception_index,
-- 
2.36.1


