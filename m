Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155196B2E8E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:22:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMeA-0001Hm-9x; Thu, 09 Mar 2023 15:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdl-0000Xa-GX
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:31 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdb-0002Iq-At
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:21 -0500
Received: by mail-pf1-x42c.google.com with SMTP id fa28so2255437pfb.12
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K2xLV2xfwp7i76hYEyFPtYKJPruD7udy/116L1MBmLQ=;
 b=uN/aJ+LP3hbnW0nlLU0AtdXrPnJwZuTqqZKVpYC7Vkfajiv6sbqItphYw4tqifi7jR
 hz1C/zFIB4i4o9FpuFZyKjBXNzmtWfkd6I/JhksiTtL46ZGjCD1CIYIiThO3JR8gmRWs
 oHqy3RdWfpH6EZsJpuRJMXXrIWjkc5qoV2OWuzLo95Tm+ZCtVHkj9L/aetOXvKqzlqJC
 fJGqmYZGch/+yUSczPu2YLh7a+lNs/Rw+HoKjbap0I/fgXHiRyDCzBTjzRU1jIlvYdtw
 /CQlh0+KNoLc2TXbagrLzFK06YHNvGWqvUArIm6MintLf9xJmO0Qfiqp8Y3X4DnTcine
 1izA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K2xLV2xfwp7i76hYEyFPtYKJPruD7udy/116L1MBmLQ=;
 b=uvIPHnlfyL2Vm2HZn6+lGs0O3Y9GBrFOh3EiOl5+tcGgYVBHHI2EYTlH7munJ2UBBg
 3cyehtpjLKEMlVPi9O9kvYHTUuKpnufR4lkRLsSTo9GRfDt33WJku6JuTG4RXKN7SBuU
 n//gDXNBBCOvc53nRAhRl0I/dAaIB6xe/M0Lf/k4SsQqoUOYTB89eP2exPXMLvDu4Kax
 8t6FL3iXrmhwnCiVD2TjJ4iaRKdzt0F1uTL+9eO/WUqVzSduGW6rCM8Y/zUl1NzHL42t
 HI+Ad6WraDfEDWwkE5fDK6CCDXz7VMbDcdrGbAVcj96QF16OugHBHza+J6ifEN4nYreu
 qpyQ==
X-Gm-Message-State: AO0yUKXbPDTcoj9US3IDilWoghGOcevffVAGosRg4MQQdRK3JJ17+y+w
 ql4YOXvuMFTqr3De1SIq6hMJY41wLSPBAOMmF68=
X-Google-Smtp-Source: AK7set+ySvb4+hWuzrgCUMETwaa9L9A87sitctwUptis70DLc5MwY0dE9918UTcp1JuZliWc7cQxJw==
X-Received: by 2002:a05:6a00:13a8:b0:5a8:ac15:534d with SMTP id
 t40-20020a056a0013a800b005a8ac15534dmr31968054pfg.13.1678392791499; 
 Thu, 09 Mar 2023 12:13:11 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a62a50f000000b005b02ddd852dsm11867744pfm.142.2023.03.09.12.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:13:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL v2 87/91] target/ppc: Fix gen_tlbsx_booke206
Date: Thu,  9 Mar 2023 12:05:46 -0800
Message-Id: <20230309200550.3878088-88-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Fix incorrect read from rD.
Avoid adding 0 when rA == 0.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index df324fc7ff..7ec940b7d8 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5875,12 +5875,10 @@ static void gen_tlbsx_booke206(DisasContext *ctx)
     CHK_SV(ctx);
     if (rA(ctx->opcode)) {
         t0 = tcg_temp_new();
-        tcg_gen_mov_tl(t0, cpu_gpr[rD(ctx->opcode)]);
+        tcg_gen_add_tl(t0, cpu_gpr[rA(ctx->opcode)], cpu_gpr[rB(ctx->opcode)]);
     } else {
-        t0 = tcg_const_tl(0);
+        t0 = cpu_gpr[rB(ctx->opcode)];
     }
-
-    tcg_gen_add_tl(t0, t0, cpu_gpr[rB(ctx->opcode)]);
     gen_helper_booke206_tlbsx(cpu_env, t0);
 #endif /* defined(CONFIG_USER_ONLY) */
 }
-- 
2.34.1


