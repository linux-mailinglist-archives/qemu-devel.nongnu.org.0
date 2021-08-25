Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF963F75AC
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:12:56 +0200 (CEST)
Received: from localhost ([::1]:46052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsi7-0006Dg-2P
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsY2-0006F5-H7
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:02:30 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsXx-0002EQ-H7
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:02:29 -0400
Received: by mail-wm1-x32f.google.com with SMTP id u15so14935785wmj.1
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BmhPQGv1ekcOd/M3H/GaP2PeZvpn18CLhJOxiPQWNtA=;
 b=Gu7+DLUZgoZzZcWKUeabXTHZwxOkWk7iaDT+ZqdD7J1YPaGGpcR8LzXaNf4x9F16zn
 SyjuBDOidieebHChaLxXxgPxqvsIVlmDDblDyxj8/B9O8v/Ioy1tzxFnwlZcixezbx/N
 /ove41dB+Q47USOvOqHmMitwxsYe+NueOPoUGeepSF69baEhMcsdRfzr/3rd6Nt9Mpk6
 3Uvgtv3w1U7pHO66vl4WpHrwmM+tIgElys+2l4Iq6V1lQPngCNaurCbHpshG0g19ekzJ
 jume3pLJFuajgcUoZgBYBVG0zXymkPtX4jXoQbZcY/WQZ5NdDQI1LjNt/nlsdQ1T6yez
 hzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BmhPQGv1ekcOd/M3H/GaP2PeZvpn18CLhJOxiPQWNtA=;
 b=oPPo/6oEnfesSOTpXdebv6p8f8cadYJwuYts8Z++O2ba5qbaM2Q8FOJYVMi0a5Rvji
 RhRvhrYlcTctzI5skjIZD7wtLZZ2YuIdKqL5837d9Losoigt7x1S3kwaWB9lzh/Sf2Oq
 EW1HkYnttv4RkQ2Uqc5aW3ldn5LJSsSVDyWg02tggTZVImu4/mPkUqCWOXH7jcKDEc3x
 W84c10R2qZwOoIcQNnZXJ6fvljLjyAaZV8CgzCPjwW0KGBrBeQdYfx0cUBWNmSc39gzZ
 0L0DlD4IlYwXz98+5GUZ3C+S2JpiK5IG1wMjXXjx16uhG58oUm5D7cZO08NjUEF28raR
 IEzw==
X-Gm-Message-State: AOAM5320Z6eosHw6QXfwRvs70NWIdodguavDuDqEQSVmzXVTq5xw9zSF
 mqj8QrL/L6zfxWk26VqHGg/HUjrqS2k=
X-Google-Smtp-Source: ABdhPJyGA38Gpwt/OUzz3sP0+phejhBaz+YozKFxEF7FQ99KypPQt0r+Bb15PwQt/iKbMcJb56OPMg==
X-Received: by 2002:a1c:29c3:: with SMTP id p186mr9171567wmp.22.1629896543822; 
 Wed, 25 Aug 2021 06:02:23 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 z19sm6296561wma.0.2021.08.25.06.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:02:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/28] target/mips: Simplify PREF opcode
Date: Wed, 25 Aug 2021 15:01:45 +0200
Message-Id: <20210825130211.1542338-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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

check_insn() checks for any bit in the set, and INSN_R5900 is
just another bit added to the set. No need to special-case it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210801234202.3167676-2-f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index bf71724f3f0..6b95cca052a 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -15739,12 +15739,8 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         /* Treat as NOP. */
         break;
     case OPC_PREF:
-        if (ctx->insn_flags & INSN_R5900) {
-            /* Treat as NOP. */
-        } else {
-            check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R1);
-            /* Treat as NOP. */
-        }
+        check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R1 | INSN_R5900);
+        /* Treat as NOP. */
         break;
 
     /* Floating point (COP1). */
-- 
2.31.1


