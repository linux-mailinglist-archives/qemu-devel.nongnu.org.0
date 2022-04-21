Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BAC50A52A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:24:30 +0200 (CEST)
Received: from localhost ([::1]:43484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZba-00079h-1R
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYd4-0005SZ-9y
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:58 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:35749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYd2-00078O-5v
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:57 -0400
Received: by mail-io1-xd36.google.com with SMTP id q22so5653903iod.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t9IEVbh+LG4UtEoPelCGUQEeBJbf2ROrFJjpftW24vw=;
 b=HlyCI1Kr51cpi9jChzCUJ2eGltWoHFUzfeGCrdqzjR2ycu5NTFgrNowfHvAY5vOXW3
 GDImtUbvZNNo+/nLsPhwmVWPSoT89lGaMx59+4Au/dP7NLpyBJqYAujIvkYa1GljYXYD
 SYnpY0ih7cgeUE/rPXylHtZ8V1obTGB4PvWA1n7nEmCWknfrcPDRXkLEBlYQy/yGp3gR
 Yia6mi82z6+u0XQ5oApR5tajSVHNX4dgwNQRlFj9tzp2Oqss4R0E86ji6OoPuUhYlS10
 AcjMk8SeTns1ArYYcthFtemkPdeb1DB+gN1kJ/oT5KjRp/TbAY4tzXatII/SKUfg6Ofk
 4FQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t9IEVbh+LG4UtEoPelCGUQEeBJbf2ROrFJjpftW24vw=;
 b=16wN6yYMciqa6PoCe1R03qb5Vdjm6mUEvfcqBOQuF6LcY0H5uHC2TreSi15s0wZK8p
 JvmOGhURzT4/e5yGfRtPrWgmlYqPnNUiANwVrZq8Wthvzr7nXcHFGzu2vz2RHDZarO++
 lBz5/G1s4jmlMXocFxEhERxa0+9KOyG+DnwnBA2T1oRk9PTNr8LwaHJHgmFbYv5mPUfK
 /qGhqz2F62raLlbQiOJFUpdqY+Gub1L+FkUrmXf9iaLSEFCaDUUVawUDVITxPwhDPciz
 rUXINvzUzoFCY2lCwHT+05MeZQx1PPccdGicKrpJ1DMxuGo1R/muuOfcFknFkaoAs7zL
 zKYA==
X-Gm-Message-State: AOAM5327w0Rq5xFXQ93UHWwfqEWRI0Tj6FhFeFkRlEBnQvxbPvI08qER
 qvNYTZwpeGKncQhfzN5E/UchSZFYNko9ow==
X-Google-Smtp-Source: ABdhPJz2IJq8Tg9/hVMi/wLqRyEy9E64PhSKLATXSOTGiYmP2neGQCoZfWSGmHo0FTzgC3waCGFyhg==
X-Received: by 2002:a05:6638:22d2:b0:32a:934e:8a62 with SMTP id
 j18-20020a05663822d200b0032a934e8a62mr68485jat.138.1650554515179; 
 Thu, 21 Apr 2022 08:21:55 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:21:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 51/64] target/nios2: Use tcg_gen_lookup_and_goto_ptr
Date: Thu, 21 Apr 2022 08:17:22 -0700
Message-Id: <20220421151735.31996-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use lookup_and_goto_ptr for indirect chaining between TBs.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index c9b5de2981..f0f5c6843a 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -184,7 +184,7 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
         tcg_gen_exit_tb(tb, n);
     } else {
         tcg_gen_movi_tl(cpu_pc, dest);
-        tcg_gen_exit_tb(NULL, 0);
+        tcg_gen_lookup_and_goto_ptr();
     }
     dc->base.is_jmp = DISAS_NORETURN;
 }
@@ -195,7 +195,7 @@ static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
     if (is_call) {
         tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
     }
-    tcg_gen_exit_tb(NULL, 0);
+    tcg_gen_lookup_and_goto_ptr();
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.34.1


