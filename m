Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887BA6A9305
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:49:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zm-0000Jz-8G; Fri, 03 Mar 2023 03:42:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0za-0008QA-6R
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:19 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zY-00084p-Ki
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:17 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so1559842pjg.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832935;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=41l2hXF3TddEpsVwVpvNZTk5y5JWJWpku/WJD6CdFb0=;
 b=47sI5aim0R38ON+SuY9s+l+D33vfqAVVnRR4PyVJwHbpMIR49qkvXADSJ4a1t7rXfG
 XN4894LqDjpYtEBIzhnW92PDcZ2x3kQmfbyvPqhSQXlm3eBxVeoB5vurbCaaCwf3uEVu
 AOmYL717MQ2ilx6uo0j6LegRlKt6AffviZhiEZXyQaub8CJSSgZ/S7tJj+TkzrYdvg8P
 c8ZLPFGTKihIOCVcyo6xK8d2oCl6dSYihKUZF5LrvI9Qq6EaRF+i5lz5dDHXgPCp7YmH
 PNyMIPVRLrkgY6iJPhXWPAGz4CioS0WicrvKSAl/jd4T3nE8x5UsXqggQbSBjfip5NKl
 zLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832935;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=41l2hXF3TddEpsVwVpvNZTk5y5JWJWpku/WJD6CdFb0=;
 b=DzFC5m09XMONwKsuiNqFM8ebmHtu3lu82R8W6iC2dB44pd5D8MzwfPQN1B+rqPVROg
 V0wY9dqYJ2nRjpTVAIi7XzdJO4zy0stgavReqKcoQJnhImEkPTus5Jm2cWDXil7LFvrE
 k3b7K4HWjYBbAww+8TPnBRZs8NoGGYWdS/1hSXsyTfWLCeaoD8IgLJ3SrlPBFnqQ/Lf1
 8MHorJi7QuTJ84JL2NNwe0Y39rEa6nyoI6sDGCoS1aQczWL3ts9aUyu7y4vtcAbdtK2n
 QTuuEQvroj2nQHT6pIuHocJyNdKnrtMUR3jEeOpU6o2JG0/Og8ZielE0ULgnfjxt0z3S
 V7oQ==
X-Gm-Message-State: AO0yUKXfto+1qglkZWbxy8V3bc8AAPlcmyEzlVE9vyBgZ0IokqfEX0Wi
 Gvf6JwBfyS62eJzD6ImWRlJDZQ==
X-Google-Smtp-Source: AK7set9ZF6U8GsdiEuqr+wsibR9KgEXcNrFKlcLLCH1ASlIYjzi5pXKwyTOHTbecsziT1xgHIAYT4A==
X-Received: by 2002:a17:902:f693:b0:19c:ff5d:1fd2 with SMTP id
 l19-20020a170902f69300b0019cff5d1fd2mr982686plg.8.1677832935247; 
 Fri, 03 Mar 2023 00:42:15 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 v3-20020a170902b7c300b0019682e27995sm959020plz.223.2023.03.03.00.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:14 -0800 (PST)
Subject: [PULL 43/59] target/riscv: Fix checking of whether instruciton at
 'pc_next' spans pages
Date: Fri,  3 Mar 2023 00:37:24 -0800
Message-Id: <20230303083740.12817-44-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Shaobo Song <songshaobo@eswincomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Shaobo Song <songshaobo@eswincomputing.com>

This bug has a noticeable behavior of falling back to the main loop and
respawning a redundant translation block including a single instruction
when the end address of the compressive instruction is exactly on a page
boundary, and slows down running system performance.

Signed-off-by: Shaobo Song <songshaobo@eswincomputing.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20230220072732.568-1-songshaobo@eswincomputing.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 772f9d7973..8ffa2116e0 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1261,7 +1261,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
                 uint16_t next_insn = cpu_lduw_code(env, ctx->base.pc_next);
                 int len = insn_len(next_insn);
 
-                if (!is_same_page(&ctx->base, ctx->base.pc_next + len)) {
+                if (!is_same_page(&ctx->base, ctx->base.pc_next + len - 1)) {
                     ctx->base.is_jmp = DISAS_TOO_MANY;
                 }
             }
-- 
2.39.2


