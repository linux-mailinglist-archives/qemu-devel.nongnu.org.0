Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC46365ED7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 19:55:52 +0200 (CEST)
Received: from localhost ([::1]:55564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYubH-0004C8-A4
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 13:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYua1-0003le-5O
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 13:54:33 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYuZy-0003sR-O0
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 13:54:32 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a4so38579078wrr.2
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 10:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GeFKmJ5DAhV3TOqnA8khb+umRgraGANjeB8LmBMIdAA=;
 b=Am0iUTPCQlnWM6MA2i1IHY4C1c8gCl56/daUrXkEuZXjWVhsDFhPBq3SYW8qHbIwHx
 WYRiuQrB3poEBMd3rAaXOHeu+DnBk23rOXXDO6AjxO+w8p0Au0WAiJMZxmFRVhl9DjwC
 ao7aTyjj4aX/YjhnchgMeMZ52qU/0iekNgMPnbvs/ZiYyS92Rox5VYcBj5UTdbJQZ1oq
 BdL8CRo1+7movY5IUbJiZ5Euil6di+WkfPrvULzd/hmDGLu1utsgO1HL4xmZuJKxad0X
 fFBHCrKDtxA5ip8T/Cz0JYNNRxgCBF01vvDZhRpWbMWLDmLV2Zf1ZVopk4i6kFN+nVal
 xEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GeFKmJ5DAhV3TOqnA8khb+umRgraGANjeB8LmBMIdAA=;
 b=ZKICbo7/cBZ7z0e10H/DFrBYSsGj+P6KUA6iR08vjdlUcKTCNGhUJdGsMwSMbd0KuI
 2yGVaCtBbxRv2G1yQPGvmH9bYi81cXqqMWFA879Smx9WsJe4mspSufSuGqQT99vTZSzn
 wnwn7kA81GD7YII9S+OwtOXRbUjG9v7w9TcrbXD7IQE9vpEsESBy2LyWP+i24RGye5q0
 QIHgNcF1M11tZCvC5Ygp5H14AOURQNVeZAmiS80EfYVm3BD3ddgZqeixlA4xBoX0N7qO
 EcuCwpwStGQLuBBVm+m3TDDJNEnkhmhQnLC1yalb3veps/1h1OHPQr1itajQzRDWg9t6
 f1dw==
X-Gm-Message-State: AOAM530HbrC+biPWE6oBAjOjCvAhPfSOz1aHtnlDAEAo9ZPbvk/iW937
 Ft/pNqosKTI99UcrkbRjr04Izz8iw0jslg==
X-Google-Smtp-Source: ABdhPJwmH7k3MqpJrb5utcQcSWrZlNpYLXVG1Fi12JHAOOR1wT6UF0eC2fnh9i7YZWo8WbjupYeQGA==
X-Received: by 2002:a5d:6e06:: with SMTP id h6mr21915800wrz.201.1618941268893; 
 Tue, 20 Apr 2021 10:54:28 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n9sm27851618wrq.86.2021.04.20.10.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 10:54:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Fix CACHEE opcode (CACHE using EVA addressing)
Date: Tue, 20 Apr 2021 19:54:26 +0200
Message-Id: <20210420175426.1875746-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CACHEE opcode "requires CP0 privilege".

The pseudocode checks in the ISA manual is:

    if is_eva and not C0.Config5.EVA:
      raise exception('RI')

    if not IsCoprocessor0Enabled():
      raise coprocessor_exception(0)

Add the missing checks.

Inspired-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 71fa5ec1973..5dad75cdf37 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -20957,6 +20957,8 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     gen_ld(ctx, OPC_LHUE, rt, rs, s);
                     break;
                 case NM_CACHEE:
+                    check_eva(ctx);
+                    check_cp0_enabled(ctx);
                     check_nms_dl_il_sl_tl_l2c(ctx);
                     gen_cache_operation(ctx, rt, rs, s);
                     break;
@@ -24530,11 +24532,11 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
             gen_st_cond(ctx, rt, rs, imm, MO_TESL, true);
             return;
         case OPC_CACHEE:
+            check_eva(ctx);
             check_cp0_enabled(ctx);
             if (ctx->hflags & MIPS_HFLAG_ITC_CACHE) {
                 gen_cache_operation(ctx, rt, rs, imm);
             }
-            /* Treat as NOP. */
             return;
         case OPC_PREFE:
             check_cp0_enabled(ctx);
-- 
2.26.3


