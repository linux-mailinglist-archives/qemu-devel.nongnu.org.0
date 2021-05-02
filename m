Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA8E370DE0
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:21:27 +0200 (CEST)
Received: from localhost ([::1]:53578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldEqU-00008F-Aj
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEl9-00058K-D7
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:15:57 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:42920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEl8-0007GJ-2o
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:15:55 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so2120187wmv.1
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P4j2gbE04oS0h94Kjd7cj3338C2131+7etp/nt6YQrQ=;
 b=c6reylfW4gomBRCjmTwnA8+dxcYEh/M6L+TJ40aIa9SWwhdhRchsBqGARcfKfPGvP1
 kyFks3kUm4AKrnJxqJua8LcmeyNsEnnfQJH5xNIPgbNObx0iDZbmzr1lfwg+ly8Bnqar
 sGBoo9ts5fSv4KMzReRhQFDVesU9nnC+sYcUnqC0y9tnsz6Bs4SbXlSKHS1YXm0zMNcX
 2Q8gpJpcm0u12rUV2T15/dJaQIdTnuwO8mNI4vyT4hB8KJjX7y4FyQdXaiaeXnwjy0Ef
 m2h8Ig6mPohoTnzcX1WZHdKYD5uQlzzAVdaKqFFBBq7/pYsPXDw/n/rNU88md660LtSz
 r22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=P4j2gbE04oS0h94Kjd7cj3338C2131+7etp/nt6YQrQ=;
 b=tUwzwVLCaogQ+mHyEYan1ABE90zu+zL8UTzBkdcJbZh2WUnWJK8cefhDU0ZBqfhQTo
 /uV1N2xBX+eI3yaMhNktM2S5G6OALR8bRqm3WfSnkutnL4eRNlZI1TJh/64AJXnOYlLv
 2lKTl+HMhOwWnPP6eWbPct9R9YQJZY9GA0S2DZYovHSor24zkel0/wIGWqzthWnWyAs1
 IIUx8+W0m1uF2RxyKB8RsolBAHtISsxZLZ5wSeK62YiWDzz1RWtmbIhwoeGFQsF/h1Eh
 9SPvXEbCDT0Ln6+QIm+1iZLmdgPQDdkYGEpAzESZLpNohkklvc96pAn1+T+bfDmd0lot
 yalw==
X-Gm-Message-State: AOAM531aEvgXrQafRpfQiRO0ltdnoMfa7IHG7bKoCR+T1YMGh0FNcKK4
 JpIdNKm/NVNVo6040YkIR+v3nPk9+62B7D7W
X-Google-Smtp-Source: ABdhPJwiNs9jXlEaXqfMC4+nvvay3Oi/sGUmkTriPiraFqLBkq7Cg+UKielvdRa81zHVtL6JM0omYw==
X-Received: by 2002:a1c:7419:: with SMTP id p25mr8923380wmc.79.1619972151830; 
 Sun, 02 May 2021 09:15:51 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id l5sm8959057wmh.0.2021.05.02.09.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:15:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/36] target/mips: Fix CACHEE opcode (CACHE using EVA
 addressing)
Date: Sun,  2 May 2021 18:15:04 +0200
Message-Id: <20210502161538.534038-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210420175426.1875746-1-f4bug@amsat.org>
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


