Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467836A3C26
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:16:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWOJ-0000Bc-SR; Mon, 27 Feb 2023 00:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNH-0004FP-G3
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:39 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWNF-0007J6-Rl
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:48:35 -0500
Received: by mail-pj1-x102c.google.com with SMTP id oj5so928716pjb.5
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I0nuMJ82HVYxh2319z4AOHVFLixzgJR82pq22O8Q0Zc=;
 b=uE51e6SGXuXMjJMflHsSd5YBOdMR66VosqpLIe1cDZA2aXi3VGa4s8rUsKYyaAQUrl
 +fWCrOP3fVdtEFUfHs3nnwVnVXA3QWJxhlFIe+HCReQHlbNxgEQQUsVl5eG4/0Fyrde0
 bboOilhvKgdmlm/K/SPgkDiOtNlrGzKCGJHKThjtGGMhNHr809MHkqH4rEqFF8yQzkAR
 XwAOMu+bWgGFWBof58EmDypCgKQj4NLJ5Z2WFuNpwy2J9vPDx7ADobSR7Mpewc2YFP05
 Zn9xvTTP6013FenPZz78uBpG/SsmlUvMyoS3P3QzjS1joEk6Eckc4/t+lHcWpmhHAF2A
 iz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I0nuMJ82HVYxh2319z4AOHVFLixzgJR82pq22O8Q0Zc=;
 b=dqmfGLRW+ssd5p05z69ULhYEzSb+ZcFsfEJzhgh54wamjYE6XsBR2wBjC+gaciVrdE
 ITpCdFLgxMvGJMB3ltLfI8ysSdfZFtXaM+L4enHzkVsHV+Ws30dHrv3QHQ4bDma4+FKO
 R/+KwDUuxqnbf9fXcrkPsOlBagSE24PonKPcl5pdwMJBZ2vxhlL28e6kdoau8PsowiG0
 Q481RqHrBffDWIIPZ/E8pulrAay9NFdDjfn0RuGNRWXNBDdbXfFkIqHIbQVuduQPq0ox
 9oU7MN5AeNNNa/GHsn7uIGS0Z9oWFScn6PpmnyplF8Ivm/BIcfY8SjCvbrSR9UwzcAwq
 G4tA==
X-Gm-Message-State: AO0yUKVGjjc4sbjrabNBmgH/F6xybh0O9QtYaDyuTs49bRDWR/AKfaAV
 8uBdqAstxwBlyxmkjpY6DKuyUxYmHmXXr7dBE+4=
X-Google-Smtp-Source: AK7set/xf78pk9zxxQK8k2a2OyfxZx4LDcPtOkWEjb9/ZhLRK4dUBcl9iBDv+mfRKlsNxMjUtPbTPg==
X-Received: by 2002:a17:902:e80d:b0:19a:b4a9:9df7 with SMTP id
 u13-20020a170902e80d00b0019ab4a99df7mr29397733plg.53.1677476911916; 
 Sun, 26 Feb 2023 21:48:31 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 63/70] target/xtensa: Tidy translate_clamps
Date: Sun, 26 Feb 2023 19:42:26 -1000
Message-Id: <20230227054233.390271-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

All writes to arg[0].out; use tcg_constant_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index e3fcd50691..d727f9ffd8 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1514,11 +1514,11 @@ static void translate_callxw(DisasContext *dc, const OpcodeArg arg[],
 static void translate_clamps(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
-    TCGv_i32 tmp1 = tcg_const_i32(-1u << arg[2].imm);
-    TCGv_i32 tmp2 = tcg_const_i32((1 << arg[2].imm) - 1);
+    TCGv_i32 tmp1 = tcg_constant_i32(-1u << arg[2].imm);
+    TCGv_i32 tmp2 = tcg_constant_i32((1 << arg[2].imm) - 1);
 
-    tcg_gen_smax_i32(tmp1, tmp1, arg[1].in);
-    tcg_gen_smin_i32(arg[0].out, tmp1, tmp2);
+    tcg_gen_smax_i32(arg[0].out, tmp1, arg[1].in);
+    tcg_gen_smin_i32(arg[0].out, arg[0].out, tmp2);
 }
 
 static void translate_clrb_expstate(DisasContext *dc, const OpcodeArg arg[],
-- 
2.34.1


