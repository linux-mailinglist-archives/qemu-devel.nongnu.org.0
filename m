Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2096D3F75A1
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:10:00 +0200 (CEST)
Received: from localhost ([::1]:36008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsfH-0007sl-4g
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZA-0001Bi-NB
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:40 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZ9-0002fZ-5P
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:40 -0400
Received: by mail-wr1-x430.google.com with SMTP id n5so23980700wro.12
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sM4X25fIH0ckb661YnsKNto+DdiN+0iKs0Tawasm2qA=;
 b=gphkMpCiRfsX3NcVjG3zvUAruX4EC3iWRGDB2dxnTd6DnXeBpSjOhNVAED7XifptoB
 oYn2LzPnIcpFpT86B03KXmEjEvvDqLAvLXt9cNvgYIG/m5pZHEP20W4vf0LnDq4NHZPP
 u6ZccWjf6EstJwbqEmvNWdVmVLC9UDOeu6MTHgYHRQsGOK6SNJ499p2UD+9lahHBrqjx
 KGoFylyADWJgWZr6JSxhVH/NS31Un4ocUuKBvRYXE0CeCzW2ukBt8Z/gVsmvDTGUwikG
 IKdsJ0AbnchCgi9bse4pwdESsLnseSxvV3FwkNwP02E+y+vjdc9s6MM6zf456h4xG1lQ
 Vs9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sM4X25fIH0ckb661YnsKNto+DdiN+0iKs0Tawasm2qA=;
 b=OZJTM7EvZVmXSfYw0LJq1FGeRYskrveJppj7MKeA5y23FBmbb+mbFpealDzB+5uTIS
 BEHXbsVbjfV64dG906DlGTSRqGh0gjEn8BlLgy8nQrKEfaHrsj7N4gn175UpiXMLStkm
 kJraU+G/cJSP2EQ2zqxhKcrICt4yhHIsoYRoMI8CiqUM3rtVNQfxI68qZAh6y/g0Mk/H
 zZOjwuEKoWha89D34vWOs40n/GZnir4Ojs1B73+Q4Pw+fPuoEImm3n1XvptRL/iessYt
 y4LbqKEMsmgNIu7Q7+/89KJQHlPd4//OZkD23uzGhxnvZpeT27wNnzTLzxZTlwk6w9Gf
 gCWw==
X-Gm-Message-State: AOAM532vKYBkcGbp2Bfgs9WoMb4eH9QiRUSCj0k8QSP44aK9RZwON5i3
 kcX8as07LR4M7tJiurqRul7zMlhcrkY=
X-Google-Smtp-Source: ABdhPJwCaafDb1BNMtLuSgNmWMGIW0dMcRUOJbOJr+4P4Vq2BRb6P1c/GpB9bIvEABcrMyaItBn/tQ==
X-Received: by 2002:adf:e788:: with SMTP id n8mr25125824wrm.214.1629896617394; 
 Wed, 25 Aug 2021 06:03:37 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 c13sm17258692wru.73.2021.08.25.06.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:03:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/28] target/mips: Use tcg_constant_i32() in gen_helper_0e2i()
Date: Wed, 25 Aug 2021 15:02:01 +0200
Message-Id: <20210825130211.1542338-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

$rt register is used read-only, so we can replace tcg_const_i32()
temporary by tcg_constant_i32().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210816205107.2051495-4-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 4b689a54abb..a6df9beb670 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -9072,12 +9072,7 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
             break;
         case 3:
             /* XXX: For now we support only a single FPU context. */
-            {
-                TCGv_i32 fs_tmp = tcg_const_i32(rd);
-
-                gen_helper_0e2i(ctc1, t0, fs_tmp, rt);
-                tcg_temp_free_i32(fs_tmp);
-            }
+            gen_helper_0e2i(ctc1, t0, tcg_constant_i32(rd), rt);
             /* Stop translation as we may have changed hflags */
             ctx->base.is_jmp = DISAS_STOP;
             break;
@@ -9694,12 +9689,7 @@ static void gen_cp1(DisasContext *ctx, uint32_t opc, int rt, int fs)
     case OPC_CTC1:
         gen_load_gpr(t0, rt);
         save_cpu_state(ctx, 0);
-        {
-            TCGv_i32 fs_tmp = tcg_const_i32(fs);
-
-            gen_helper_0e2i(ctc1, t0, fs_tmp, rt);
-            tcg_temp_free_i32(fs_tmp);
-        }
+        gen_helper_0e2i(ctc1, t0, tcg_constant_i32(fs), rt);
         /* Stop translation as we may have changed hflags */
         ctx->base.is_jmp = DISAS_STOP;
         break;
-- 
2.31.1


