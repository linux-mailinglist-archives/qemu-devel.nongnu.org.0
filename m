Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B8859CBB0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:44:03 +0200 (CEST)
Received: from localhost ([::1]:50486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQG9L-0003Kg-0B
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQG32-00034J-9O
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:37:32 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQG30-0006YO-GI
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 18:37:31 -0400
Received: by mail-pf1-x42c.google.com with SMTP id g129so8410110pfb.8
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 15:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=4u95VxfqvBGod4zfdlpuG3vmFuF0V5wI5kkybhZ/c/k=;
 b=e44agr79+ksY9xUEWeQcKZFPe/NEHxa/+yQc2tUUNBEHnVevKeDmnGYymZd01kjBR5
 EbOYZ27up46hYthFJWFsTGz86hWJzPvM59ntdwbtZ4eUWzq+o+hfBvJN1Pfa2963J7/2
 Jl7D2+CTBPjzDCdeXUpJlhdjJbq1s67h6dPw4MuHtWwS4uIgDK2+opCBQn8wZwEcrYgY
 YWoe71upGZCh8Z1PXtmt8OGgTXMWRzZvGR9BrsZY/ZkvgfZqc59KSNDAfS4SKC61l9Y/
 DsWKqCqk9OjJqFE6SSk44a3CJ0Hz/xbDidMSCul8+8NLBp+QytBysbsQnFdAyrJCFypw
 t1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=4u95VxfqvBGod4zfdlpuG3vmFuF0V5wI5kkybhZ/c/k=;
 b=7V8s+inB2NnCk2lxBBp9F0Ne5tE5GinrDRGJeSu4D9t/LxG0ED8AdsZcIYj14A7EJa
 KIcIJi8X1/rauG4nZ/5aCvACzM171Ls7Xyn3JkXhrGh8Whsl5RaUdmH2s86BprebD40/
 flkpJEIj0MNblol5YXwTe9MDlFJs3vHPF15vA5jhNgU55dH52IkF+Kf3YgXx0QWlyHGA
 M0WCn//Wu6J2NuQYVXjMOISrKMfIHZRFCLUqJ+XvGNhBNRznBKz9evyuwBqIRx766UE5
 iqgvVJVnhhmHIpbt0aCLPe0OPjc3Xlk/tMKU1Fh3uxkOb/2PJPW6tmBoB5xZvpUNQESh
 TYgQ==
X-Gm-Message-State: ACgBeo1Gtpy9sMOvSA6EEDWc/+zed26Emx37DaqfM4FNJX451cdajcfE
 mhbcZEkUVUWpSAE92GNYRfMqh2gTReAxXQ==
X-Google-Smtp-Source: AA6agR7tx685T9ZNS967PMQ50pv4V8A5TnsgdrlMNDCddz0qT53CRk6PUro13cy9RQYiwsnQS2WmIw==
X-Received: by 2002:a63:e242:0:b0:421:9053:8923 with SMTP id
 y2-20020a63e242000000b0042190538923mr18217579pgj.283.1661207848543; 
 Mon, 22 Aug 2022 15:37:28 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 z6-20020a63e106000000b0042a2777550dsm7017419pgh.47.2022.08.22.15.37.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:37:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] target/i386: Use tcg gvec for gen_op_movo
Date: Mon, 22 Aug 2022 15:37:18 -0700
Message-Id: <20220822223722.1697758-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822223722.1697758-1-richard.henderson@linaro.org>
References: <20220822223722.1697758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Low hanging fruit, using gvec to move 16 bytes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu.h           | 4 ++--
 target/i386/tcg/translate.c | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 81e5abed86..dbc9a99a3b 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1587,8 +1587,8 @@ typedef struct CPUArchState {
     float_status mmx_status; /* for 3DNow! float ops */
     float_status sse_status;
     uint32_t mxcsr;
-    ZMMReg xmm_regs[CPU_NB_REGS == 8 ? 8 : 32];
-    ZMMReg xmm_t0;
+    ZMMReg xmm_regs[CPU_NB_REGS == 8 ? 8 : 32] QEMU_ALIGNED(16);
+    ZMMReg xmm_t0 QEMU_ALIGNED(16);
     MMXReg mmx_t0;
 
     uint64_t opmask_regs[NB_OPMASK_REGS];
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b7972f0ff5..c1f1f6f66b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -23,6 +23,7 @@
 #include "disas/disas.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
 #include "exec/cpu_ldst.h"
 #include "exec/translator.h"
 
@@ -2753,10 +2754,8 @@ static inline void gen_sto_env_A0(DisasContext *s, int offset)
 
 static inline void gen_op_movo(DisasContext *s, int d_offset, int s_offset)
 {
-    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(0)));
-    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(0)));
-    tcg_gen_ld_i64(s->tmp1_i64, cpu_env, s_offset + offsetof(ZMMReg, ZMM_Q(1)));
-    tcg_gen_st_i64(s->tmp1_i64, cpu_env, d_offset + offsetof(ZMMReg, ZMM_Q(1)));
+    int xmm_ofs = offsetof(ZMMReg, ZMM_X(0));
+    tcg_gen_gvec_mov(MO_64, d_offset + xmm_ofs, s_offset + xmm_ofs, 16, 16);
 }
 
 static inline void gen_op_movq(DisasContext *s, int d_offset, int s_offset)
-- 
2.34.1


