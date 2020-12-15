Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8C42DB70D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:17:13 +0100 (CET)
Received: from localhost ([::1]:53972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJZA-0004LN-GP
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJI3-0005Fo-Op
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:59:31 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJHz-0003y6-O6
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:59:31 -0500
Received: by mail-ej1-x630.google.com with SMTP id ce23so30048887ejb.8
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6xZ+w3WMxxDlNGoSG1hn/yu43KVZtKsTpEsvr13gWkM=;
 b=ASUBwU2Bn49X4RoHswzb74viINae58oSJIMDr3KGzdP1w3YX8BxT7UYAC+LjZIy9ys
 kmvrR4b2eo2YeQnlFQRdZe9WwNtrLD1Pvx3/EXHth3SLWC3RhmygX94s2TPJ39UxPhEh
 J3CJAbWtwN05+aKDw8RcZVXYk0WmYdk6e8zOUjr7EmftuPvkCCLwvNuYEWE4TA4pp849
 6XyFP1rq+/VJLRAXSnO57PG67jIsQuP5tWJYEplRgaIb2SrQxOEoAxYRfcULJVcDPF+h
 1lryQJo2sRH63MP8HSz1lbRgy4VwfzHUPhvxsUJPGBU8kEJFwySOCS2glFsZswScCZvX
 Sy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6xZ+w3WMxxDlNGoSG1hn/yu43KVZtKsTpEsvr13gWkM=;
 b=I8kt98ad4wGzuZbT3nTDWLk/ZcHmUpeKU65UFByQQvlHGF7oYv+9YN3igEek3wwix7
 uoqtJnEaTps92uIcWwA/Q2O29WsG+AiUvzs60vsrO+b7cNgZZ9x+QahdJu2F0pBSMKkI
 E/vS4eAQjDjXOcxjU66XeptDALd1QBoGE7LC7JyARxsZ53owRI6tKGhybJ+23GBori9h
 7ChIaAWUDjrFkDaWJ/5m9iji1ZBp/KWzUQDK+eoJ+jemb0CjSqlcbxKd3i5hwgssnrVS
 ba+Gqkg7JiMw2HfB1g4v9UYE1ajALenTcwiw1+CjinM/WETjkIJwal92+lH7tNLKGO+U
 IHSA==
X-Gm-Message-State: AOAM531r1HtUAEYxvNVUi1sIjQEKp3U+jEU4BGQKajz5vb03p7p8Z6ae
 z3rvNpCbBkMXjso+kElRY5Q=
X-Google-Smtp-Source: ABdhPJwUZGleQ6C9snTUQ3nVpF+3yM+EuFdgHGRRTCwq1zSSEj/sX3365YXHpVFiX+iLMwvl9GiE+w==
X-Received: by 2002:a17:906:c254:: with SMTP id
 bl20mr7663666ejb.336.1608073164938; 
 Tue, 15 Dec 2020 14:59:24 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c14sm19521003edy.56.2020.12.15.14.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:59:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 15/24] target/mips: Extract MSA helpers from op_helper.c
Date: Tue, 15 Dec 2020 23:57:48 +0100
Message-Id: <20201215225757.764263-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have ~400 lines of MSA helpers in the generic op_helper.c,
move them with the other helpers in 'mod-msa_helper.c'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201123204448.3260804-5-f4bug@amsat.org>
---
 target/mips/mod-msa_helper.c | 393 ++++++++++++++++++++++++++++++++++
 target/mips/op_helper.c      | 394 -----------------------------------
 2 files changed, 393 insertions(+), 394 deletions(-)

diff --git a/target/mips/mod-msa_helper.c b/target/mips/mod-msa_helper.c
index f0d728c03f0..1298a1917ce 100644
--- a/target/mips/mod-msa_helper.c
+++ b/target/mips/mod-msa_helper.c
@@ -22,6 +22,7 @@
 #include "internal.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
+#include "exec/memop.h"
 #include "fpu/softfloat.h"
 #include "fpu_helper.h"
 
@@ -8202,6 +8203,398 @@ void helper_msa_ffint_u_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     msa_move_v(pwd, pwx);
 }
 
+/* Data format min and max values */
+#define DF_BITS(df) (1 << ((df) + 3))
+
+/* Element-by-element access macros */
+#define DF_ELEMENTS(df) (MSA_WRLEN / DF_BITS(df))
+
+#if !defined(CONFIG_USER_ONLY)
+#define MEMOP_IDX(DF)                                           \
+        TCGMemOpIdx oi = make_memop_idx(MO_TE | DF | MO_UNALN,  \
+                                        cpu_mmu_index(env, false));
+#else
+#define MEMOP_IDX(DF)
+#endif
+
+void helper_msa_ld_b(CPUMIPSState *env, uint32_t wd,
+                     target_ulong addr)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    MEMOP_IDX(DF_BYTE)
+#if !defined(CONFIG_USER_ONLY)
+#if !defined(HOST_WORDS_BIGENDIAN)
+    pwd->b[0]  = helper_ret_ldub_mmu(env, addr + (0  << DF_BYTE), oi, GETPC());
+    pwd->b[1]  = helper_ret_ldub_mmu(env, addr + (1  << DF_BYTE), oi, GETPC());
+    pwd->b[2]  = helper_ret_ldub_mmu(env, addr + (2  << DF_BYTE), oi, GETPC());
+    pwd->b[3]  = helper_ret_ldub_mmu(env, addr + (3  << DF_BYTE), oi, GETPC());
+    pwd->b[4]  = helper_ret_ldub_mmu(env, addr + (4  << DF_BYTE), oi, GETPC());
+    pwd->b[5]  = helper_ret_ldub_mmu(env, addr + (5  << DF_BYTE), oi, GETPC());
+    pwd->b[6]  = helper_ret_ldub_mmu(env, addr + (6  << DF_BYTE), oi, GETPC());
+    pwd->b[7]  = helper_ret_ldub_mmu(env, addr + (7  << DF_BYTE), oi, GETPC());
+    pwd->b[8]  = helper_ret_ldub_mmu(env, addr + (8  << DF_BYTE), oi, GETPC());
+    pwd->b[9]  = helper_ret_ldub_mmu(env, addr + (9  << DF_BYTE), oi, GETPC());
+    pwd->b[10] = helper_ret_ldub_mmu(env, addr + (10 << DF_BYTE), oi, GETPC());
+    pwd->b[11] = helper_ret_ldub_mmu(env, addr + (11 << DF_BYTE), oi, GETPC());
+    pwd->b[12] = helper_ret_ldub_mmu(env, addr + (12 << DF_BYTE), oi, GETPC());
+    pwd->b[13] = helper_ret_ldub_mmu(env, addr + (13 << DF_BYTE), oi, GETPC());
+    pwd->b[14] = helper_ret_ldub_mmu(env, addr + (14 << DF_BYTE), oi, GETPC());
+    pwd->b[15] = helper_ret_ldub_mmu(env, addr + (15 << DF_BYTE), oi, GETPC());
+#else
+    pwd->b[0]  = helper_ret_ldub_mmu(env, addr + (7  << DF_BYTE), oi, GETPC());
+    pwd->b[1]  = helper_ret_ldub_mmu(env, addr + (6  << DF_BYTE), oi, GETPC());
+    pwd->b[2]  = helper_ret_ldub_mmu(env, addr + (5  << DF_BYTE), oi, GETPC());
+    pwd->b[3]  = helper_ret_ldub_mmu(env, addr + (4  << DF_BYTE), oi, GETPC());
+    pwd->b[4]  = helper_ret_ldub_mmu(env, addr + (3  << DF_BYTE), oi, GETPC());
+    pwd->b[5]  = helper_ret_ldub_mmu(env, addr + (2  << DF_BYTE), oi, GETPC());
+    pwd->b[6]  = helper_ret_ldub_mmu(env, addr + (1  << DF_BYTE), oi, GETPC());
+    pwd->b[7]  = helper_ret_ldub_mmu(env, addr + (0  << DF_BYTE), oi, GETPC());
+    pwd->b[8]  = helper_ret_ldub_mmu(env, addr + (15 << DF_BYTE), oi, GETPC());
+    pwd->b[9]  = helper_ret_ldub_mmu(env, addr + (14 << DF_BYTE), oi, GETPC());
+    pwd->b[10] = helper_ret_ldub_mmu(env, addr + (13 << DF_BYTE), oi, GETPC());
+    pwd->b[11] = helper_ret_ldub_mmu(env, addr + (12 << DF_BYTE), oi, GETPC());
+    pwd->b[12] = helper_ret_ldub_mmu(env, addr + (11 << DF_BYTE), oi, GETPC());
+    pwd->b[13] = helper_ret_ldub_mmu(env, addr + (10 << DF_BYTE), oi, GETPC());
+    pwd->b[14] = helper_ret_ldub_mmu(env, addr + (9  << DF_BYTE), oi, GETPC());
+    pwd->b[15] = helper_ret_ldub_mmu(env, addr + (8  << DF_BYTE), oi, GETPC());
+#endif
+#else
+#if !defined(HOST_WORDS_BIGENDIAN)
+    pwd->b[0]  = cpu_ldub_data(env, addr + (0  << DF_BYTE));
+    pwd->b[1]  = cpu_ldub_data(env, addr + (1  << DF_BYTE));
+    pwd->b[2]  = cpu_ldub_data(env, addr + (2  << DF_BYTE));
+    pwd->b[3]  = cpu_ldub_data(env, addr + (3  << DF_BYTE));
+    pwd->b[4]  = cpu_ldub_data(env, addr + (4  << DF_BYTE));
+    pwd->b[5]  = cpu_ldub_data(env, addr + (5  << DF_BYTE));
+    pwd->b[6]  = cpu_ldub_data(env, addr + (6  << DF_BYTE));
+    pwd->b[7]  = cpu_ldub_data(env, addr + (7  << DF_BYTE));
+    pwd->b[8]  = cpu_ldub_data(env, addr + (8  << DF_BYTE));
+    pwd->b[9]  = cpu_ldub_data(env, addr + (9  << DF_BYTE));
+    pwd->b[10] = cpu_ldub_data(env, addr + (10 << DF_BYTE));
+    pwd->b[11] = cpu_ldub_data(env, addr + (11 << DF_BYTE));
+    pwd->b[12] = cpu_ldub_data(env, addr + (12 << DF_BYTE));
+    pwd->b[13] = cpu_ldub_data(env, addr + (13 << DF_BYTE));
+    pwd->b[14] = cpu_ldub_data(env, addr + (14 << DF_BYTE));
+    pwd->b[15] = cpu_ldub_data(env, addr + (15 << DF_BYTE));
+#else
+    pwd->b[0]  = cpu_ldub_data(env, addr + (7  << DF_BYTE));
+    pwd->b[1]  = cpu_ldub_data(env, addr + (6  << DF_BYTE));
+    pwd->b[2]  = cpu_ldub_data(env, addr + (5  << DF_BYTE));
+    pwd->b[3]  = cpu_ldub_data(env, addr + (4  << DF_BYTE));
+    pwd->b[4]  = cpu_ldub_data(env, addr + (3  << DF_BYTE));
+    pwd->b[5]  = cpu_ldub_data(env, addr + (2  << DF_BYTE));
+    pwd->b[6]  = cpu_ldub_data(env, addr + (1  << DF_BYTE));
+    pwd->b[7]  = cpu_ldub_data(env, addr + (0  << DF_BYTE));
+    pwd->b[8]  = cpu_ldub_data(env, addr + (15 << DF_BYTE));
+    pwd->b[9]  = cpu_ldub_data(env, addr + (14 << DF_BYTE));
+    pwd->b[10] = cpu_ldub_data(env, addr + (13 << DF_BYTE));
+    pwd->b[11] = cpu_ldub_data(env, addr + (12 << DF_BYTE));
+    pwd->b[12] = cpu_ldub_data(env, addr + (11 << DF_BYTE));
+    pwd->b[13] = cpu_ldub_data(env, addr + (10 << DF_BYTE));
+    pwd->b[14] = cpu_ldub_data(env, addr + (9 << DF_BYTE));
+    pwd->b[15] = cpu_ldub_data(env, addr + (8 << DF_BYTE));
+#endif
+#endif
+}
+
+void helper_msa_ld_h(CPUMIPSState *env, uint32_t wd,
+                     target_ulong addr)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    MEMOP_IDX(DF_HALF)
+#if !defined(CONFIG_USER_ONLY)
+#if !defined(HOST_WORDS_BIGENDIAN)
+    pwd->h[0] = helper_ret_lduw_mmu(env, addr + (0 << DF_HALF), oi, GETPC());
+    pwd->h[1] = helper_ret_lduw_mmu(env, addr + (1 << DF_HALF), oi, GETPC());
+    pwd->h[2] = helper_ret_lduw_mmu(env, addr + (2 << DF_HALF), oi, GETPC());
+    pwd->h[3] = helper_ret_lduw_mmu(env, addr + (3 << DF_HALF), oi, GETPC());
+    pwd->h[4] = helper_ret_lduw_mmu(env, addr + (4 << DF_HALF), oi, GETPC());
+    pwd->h[5] = helper_ret_lduw_mmu(env, addr + (5 << DF_HALF), oi, GETPC());
+    pwd->h[6] = helper_ret_lduw_mmu(env, addr + (6 << DF_HALF), oi, GETPC());
+    pwd->h[7] = helper_ret_lduw_mmu(env, addr + (7 << DF_HALF), oi, GETPC());
+#else
+    pwd->h[0] = helper_ret_lduw_mmu(env, addr + (3 << DF_HALF), oi, GETPC());
+    pwd->h[1] = helper_ret_lduw_mmu(env, addr + (2 << DF_HALF), oi, GETPC());
+    pwd->h[2] = helper_ret_lduw_mmu(env, addr + (1 << DF_HALF), oi, GETPC());
+    pwd->h[3] = helper_ret_lduw_mmu(env, addr + (0 << DF_HALF), oi, GETPC());
+    pwd->h[4] = helper_ret_lduw_mmu(env, addr + (7 << DF_HALF), oi, GETPC());
+    pwd->h[5] = helper_ret_lduw_mmu(env, addr + (6 << DF_HALF), oi, GETPC());
+    pwd->h[6] = helper_ret_lduw_mmu(env, addr + (5 << DF_HALF), oi, GETPC());
+    pwd->h[7] = helper_ret_lduw_mmu(env, addr + (4 << DF_HALF), oi, GETPC());
+#endif
+#else
+#if !defined(HOST_WORDS_BIGENDIAN)
+    pwd->h[0] = cpu_lduw_data(env, addr + (0 << DF_HALF));
+    pwd->h[1] = cpu_lduw_data(env, addr + (1 << DF_HALF));
+    pwd->h[2] = cpu_lduw_data(env, addr + (2 << DF_HALF));
+    pwd->h[3] = cpu_lduw_data(env, addr + (3 << DF_HALF));
+    pwd->h[4] = cpu_lduw_data(env, addr + (4 << DF_HALF));
+    pwd->h[5] = cpu_lduw_data(env, addr + (5 << DF_HALF));
+    pwd->h[6] = cpu_lduw_data(env, addr + (6 << DF_HALF));
+    pwd->h[7] = cpu_lduw_data(env, addr + (7 << DF_HALF));
+#else
+    pwd->h[0] = cpu_lduw_data(env, addr + (3 << DF_HALF));
+    pwd->h[1] = cpu_lduw_data(env, addr + (2 << DF_HALF));
+    pwd->h[2] = cpu_lduw_data(env, addr + (1 << DF_HALF));
+    pwd->h[3] = cpu_lduw_data(env, addr + (0 << DF_HALF));
+    pwd->h[4] = cpu_lduw_data(env, addr + (7 << DF_HALF));
+    pwd->h[5] = cpu_lduw_data(env, addr + (6 << DF_HALF));
+    pwd->h[6] = cpu_lduw_data(env, addr + (5 << DF_HALF));
+    pwd->h[7] = cpu_lduw_data(env, addr + (4 << DF_HALF));
+#endif
+#endif
+}
+
+void helper_msa_ld_w(CPUMIPSState *env, uint32_t wd,
+                     target_ulong addr)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    MEMOP_IDX(DF_WORD)
+#if !defined(CONFIG_USER_ONLY)
+#if !defined(HOST_WORDS_BIGENDIAN)
+    pwd->w[0] = helper_ret_ldul_mmu(env, addr + (0 << DF_WORD), oi, GETPC());
+    pwd->w[1] = helper_ret_ldul_mmu(env, addr + (1 << DF_WORD), oi, GETPC());
+    pwd->w[2] = helper_ret_ldul_mmu(env, addr + (2 << DF_WORD), oi, GETPC());
+    pwd->w[3] = helper_ret_ldul_mmu(env, addr + (3 << DF_WORD), oi, GETPC());
+#else
+    pwd->w[0] = helper_ret_ldul_mmu(env, addr + (1 << DF_WORD), oi, GETPC());
+    pwd->w[1] = helper_ret_ldul_mmu(env, addr + (0 << DF_WORD), oi, GETPC());
+    pwd->w[2] = helper_ret_ldul_mmu(env, addr + (3 << DF_WORD), oi, GETPC());
+    pwd->w[3] = helper_ret_ldul_mmu(env, addr + (2 << DF_WORD), oi, GETPC());
+#endif
+#else
+#if !defined(HOST_WORDS_BIGENDIAN)
+    pwd->w[0] = cpu_ldl_data(env, addr + (0 << DF_WORD));
+    pwd->w[1] = cpu_ldl_data(env, addr + (1 << DF_WORD));
+    pwd->w[2] = cpu_ldl_data(env, addr + (2 << DF_WORD));
+    pwd->w[3] = cpu_ldl_data(env, addr + (3 << DF_WORD));
+#else
+    pwd->w[0] = cpu_ldl_data(env, addr + (1 << DF_WORD));
+    pwd->w[1] = cpu_ldl_data(env, addr + (0 << DF_WORD));
+    pwd->w[2] = cpu_ldl_data(env, addr + (3 << DF_WORD));
+    pwd->w[3] = cpu_ldl_data(env, addr + (2 << DF_WORD));
+#endif
+#endif
+}
+
+void helper_msa_ld_d(CPUMIPSState *env, uint32_t wd,
+                     target_ulong addr)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    MEMOP_IDX(DF_DOUBLE)
+#if !defined(CONFIG_USER_ONLY)
+    pwd->d[0] = helper_ret_ldq_mmu(env, addr + (0 << DF_DOUBLE), oi, GETPC());
+    pwd->d[1] = helper_ret_ldq_mmu(env, addr + (1 << DF_DOUBLE), oi, GETPC());
+#else
+    pwd->d[0] = cpu_ldq_data(env, addr + (0 << DF_DOUBLE));
+    pwd->d[1] = cpu_ldq_data(env, addr + (1 << DF_DOUBLE));
+#endif
+}
+
+#define MSA_PAGESPAN(x) \
+        ((((x) & ~TARGET_PAGE_MASK) + MSA_WRLEN / 8 - 1) >= TARGET_PAGE_SIZE)
+
+static inline void ensure_writable_pages(CPUMIPSState *env,
+                                         target_ulong addr,
+                                         int mmu_idx,
+                                         uintptr_t retaddr)
+{
+    /* FIXME: Probe the actual accesses (pass and use a size) */
+    if (unlikely(MSA_PAGESPAN(addr))) {
+        /* first page */
+        probe_write(env, addr, 0, mmu_idx, retaddr);
+        /* second page */
+        addr = (addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
+        probe_write(env, addr, 0, mmu_idx, retaddr);
+    }
+}
+
+void helper_msa_st_b(CPUMIPSState *env, uint32_t wd,
+                     target_ulong addr)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    int mmu_idx = cpu_mmu_index(env, false);
+
+    MEMOP_IDX(DF_BYTE)
+    ensure_writable_pages(env, addr, mmu_idx, GETPC());
+#if !defined(CONFIG_USER_ONLY)
+#if !defined(HOST_WORDS_BIGENDIAN)
+    helper_ret_stb_mmu(env, addr + (0  << DF_BYTE), pwd->b[0],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (1  << DF_BYTE), pwd->b[1],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (2  << DF_BYTE), pwd->b[2],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (3  << DF_BYTE), pwd->b[3],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (4  << DF_BYTE), pwd->b[4],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (5  << DF_BYTE), pwd->b[5],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (6  << DF_BYTE), pwd->b[6],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (7  << DF_BYTE), pwd->b[7],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (8  << DF_BYTE), pwd->b[8],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (9  << DF_BYTE), pwd->b[9],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (10 << DF_BYTE), pwd->b[10], oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (11 << DF_BYTE), pwd->b[11], oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (12 << DF_BYTE), pwd->b[12], oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (13 << DF_BYTE), pwd->b[13], oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (14 << DF_BYTE), pwd->b[14], oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (15 << DF_BYTE), pwd->b[15], oi, GETPC());
+#else
+    helper_ret_stb_mmu(env, addr + (7  << DF_BYTE), pwd->b[0],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (6  << DF_BYTE), pwd->b[1],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (5  << DF_BYTE), pwd->b[2],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (4  << DF_BYTE), pwd->b[3],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (3  << DF_BYTE), pwd->b[4],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (2  << DF_BYTE), pwd->b[5],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (1  << DF_BYTE), pwd->b[6],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (0  << DF_BYTE), pwd->b[7],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (15 << DF_BYTE), pwd->b[8],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (14 << DF_BYTE), pwd->b[9],  oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (13 << DF_BYTE), pwd->b[10], oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (12 << DF_BYTE), pwd->b[11], oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (11 << DF_BYTE), pwd->b[12], oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (10 << DF_BYTE), pwd->b[13], oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (9  << DF_BYTE), pwd->b[14], oi, GETPC());
+    helper_ret_stb_mmu(env, addr + (8  << DF_BYTE), pwd->b[15], oi, GETPC());
+#endif
+#else
+#if !defined(HOST_WORDS_BIGENDIAN)
+    cpu_stb_data(env, addr + (0  << DF_BYTE), pwd->b[0]);
+    cpu_stb_data(env, addr + (1  << DF_BYTE), pwd->b[1]);
+    cpu_stb_data(env, addr + (2  << DF_BYTE), pwd->b[2]);
+    cpu_stb_data(env, addr + (3  << DF_BYTE), pwd->b[3]);
+    cpu_stb_data(env, addr + (4  << DF_BYTE), pwd->b[4]);
+    cpu_stb_data(env, addr + (5  << DF_BYTE), pwd->b[5]);
+    cpu_stb_data(env, addr + (6  << DF_BYTE), pwd->b[6]);
+    cpu_stb_data(env, addr + (7  << DF_BYTE), pwd->b[7]);
+    cpu_stb_data(env, addr + (8  << DF_BYTE), pwd->b[8]);
+    cpu_stb_data(env, addr + (9  << DF_BYTE), pwd->b[9]);
+    cpu_stb_data(env, addr + (10 << DF_BYTE), pwd->b[10]);
+    cpu_stb_data(env, addr + (11 << DF_BYTE), pwd->b[11]);
+    cpu_stb_data(env, addr + (12 << DF_BYTE), pwd->b[12]);
+    cpu_stb_data(env, addr + (13 << DF_BYTE), pwd->b[13]);
+    cpu_stb_data(env, addr + (14 << DF_BYTE), pwd->b[14]);
+    cpu_stb_data(env, addr + (15 << DF_BYTE), pwd->b[15]);
+#else
+    cpu_stb_data(env, addr + (7  << DF_BYTE), pwd->b[0]);
+    cpu_stb_data(env, addr + (6  << DF_BYTE), pwd->b[1]);
+    cpu_stb_data(env, addr + (5  << DF_BYTE), pwd->b[2]);
+    cpu_stb_data(env, addr + (4  << DF_BYTE), pwd->b[3]);
+    cpu_stb_data(env, addr + (3  << DF_BYTE), pwd->b[4]);
+    cpu_stb_data(env, addr + (2  << DF_BYTE), pwd->b[5]);
+    cpu_stb_data(env, addr + (1  << DF_BYTE), pwd->b[6]);
+    cpu_stb_data(env, addr + (0  << DF_BYTE), pwd->b[7]);
+    cpu_stb_data(env, addr + (15 << DF_BYTE), pwd->b[8]);
+    cpu_stb_data(env, addr + (14 << DF_BYTE), pwd->b[9]);
+    cpu_stb_data(env, addr + (13 << DF_BYTE), pwd->b[10]);
+    cpu_stb_data(env, addr + (12 << DF_BYTE), pwd->b[11]);
+    cpu_stb_data(env, addr + (11 << DF_BYTE), pwd->b[12]);
+    cpu_stb_data(env, addr + (10 << DF_BYTE), pwd->b[13]);
+    cpu_stb_data(env, addr + (9  << DF_BYTE), pwd->b[14]);
+    cpu_stb_data(env, addr + (8  << DF_BYTE), pwd->b[15]);
+#endif
+#endif
+}
+
+void helper_msa_st_h(CPUMIPSState *env, uint32_t wd,
+                     target_ulong addr)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    int mmu_idx = cpu_mmu_index(env, false);
+
+    MEMOP_IDX(DF_HALF)
+    ensure_writable_pages(env, addr, mmu_idx, GETPC());
+#if !defined(CONFIG_USER_ONLY)
+#if !defined(HOST_WORDS_BIGENDIAN)
+    helper_ret_stw_mmu(env, addr + (0 << DF_HALF), pwd->h[0], oi, GETPC());
+    helper_ret_stw_mmu(env, addr + (1 << DF_HALF), pwd->h[1], oi, GETPC());
+    helper_ret_stw_mmu(env, addr + (2 << DF_HALF), pwd->h[2], oi, GETPC());
+    helper_ret_stw_mmu(env, addr + (3 << DF_HALF), pwd->h[3], oi, GETPC());
+    helper_ret_stw_mmu(env, addr + (4 << DF_HALF), pwd->h[4], oi, GETPC());
+    helper_ret_stw_mmu(env, addr + (5 << DF_HALF), pwd->h[5], oi, GETPC());
+    helper_ret_stw_mmu(env, addr + (6 << DF_HALF), pwd->h[6], oi, GETPC());
+    helper_ret_stw_mmu(env, addr + (7 << DF_HALF), pwd->h[7], oi, GETPC());
+#else
+    helper_ret_stw_mmu(env, addr + (3 << DF_HALF), pwd->h[0], oi, GETPC());
+    helper_ret_stw_mmu(env, addr + (2 << DF_HALF), pwd->h[1], oi, GETPC());
+    helper_ret_stw_mmu(env, addr + (1 << DF_HALF), pwd->h[2], oi, GETPC());
+    helper_ret_stw_mmu(env, addr + (0 << DF_HALF), pwd->h[3], oi, GETPC());
+    helper_ret_stw_mmu(env, addr + (7 << DF_HALF), pwd->h[4], oi, GETPC());
+    helper_ret_stw_mmu(env, addr + (6 << DF_HALF), pwd->h[5], oi, GETPC());
+    helper_ret_stw_mmu(env, addr + (5 << DF_HALF), pwd->h[6], oi, GETPC());
+    helper_ret_stw_mmu(env, addr + (4 << DF_HALF), pwd->h[7], oi, GETPC());
+#endif
+#else
+#if !defined(HOST_WORDS_BIGENDIAN)
+    cpu_stw_data(env, addr + (0 << DF_HALF), pwd->h[0]);
+    cpu_stw_data(env, addr + (1 << DF_HALF), pwd->h[1]);
+    cpu_stw_data(env, addr + (2 << DF_HALF), pwd->h[2]);
+    cpu_stw_data(env, addr + (3 << DF_HALF), pwd->h[3]);
+    cpu_stw_data(env, addr + (4 << DF_HALF), pwd->h[4]);
+    cpu_stw_data(env, addr + (5 << DF_HALF), pwd->h[5]);
+    cpu_stw_data(env, addr + (6 << DF_HALF), pwd->h[6]);
+    cpu_stw_data(env, addr + (7 << DF_HALF), pwd->h[7]);
+#else
+    cpu_stw_data(env, addr + (3 << DF_HALF), pwd->h[0]);
+    cpu_stw_data(env, addr + (2 << DF_HALF), pwd->h[1]);
+    cpu_stw_data(env, addr + (1 << DF_HALF), pwd->h[2]);
+    cpu_stw_data(env, addr + (0 << DF_HALF), pwd->h[3]);
+    cpu_stw_data(env, addr + (7 << DF_HALF), pwd->h[4]);
+    cpu_stw_data(env, addr + (6 << DF_HALF), pwd->h[5]);
+    cpu_stw_data(env, addr + (5 << DF_HALF), pwd->h[6]);
+    cpu_stw_data(env, addr + (4 << DF_HALF), pwd->h[7]);
+#endif
+#endif
+}
+
+void helper_msa_st_w(CPUMIPSState *env, uint32_t wd,
+                     target_ulong addr)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    int mmu_idx = cpu_mmu_index(env, false);
+
+    MEMOP_IDX(DF_WORD)
+    ensure_writable_pages(env, addr, mmu_idx, GETPC());
+#if !defined(CONFIG_USER_ONLY)
+#if !defined(HOST_WORDS_BIGENDIAN)
+    helper_ret_stl_mmu(env, addr + (0 << DF_WORD), pwd->w[0], oi, GETPC());
+    helper_ret_stl_mmu(env, addr + (1 << DF_WORD), pwd->w[1], oi, GETPC());
+    helper_ret_stl_mmu(env, addr + (2 << DF_WORD), pwd->w[2], oi, GETPC());
+    helper_ret_stl_mmu(env, addr + (3 << DF_WORD), pwd->w[3], oi, GETPC());
+#else
+    helper_ret_stl_mmu(env, addr + (1 << DF_WORD), pwd->w[0], oi, GETPC());
+    helper_ret_stl_mmu(env, addr + (0 << DF_WORD), pwd->w[1], oi, GETPC());
+    helper_ret_stl_mmu(env, addr + (3 << DF_WORD), pwd->w[2], oi, GETPC());
+    helper_ret_stl_mmu(env, addr + (2 << DF_WORD), pwd->w[3], oi, GETPC());
+#endif
+#else
+#if !defined(HOST_WORDS_BIGENDIAN)
+    cpu_stl_data(env, addr + (0 << DF_WORD), pwd->w[0]);
+    cpu_stl_data(env, addr + (1 << DF_WORD), pwd->w[1]);
+    cpu_stl_data(env, addr + (2 << DF_WORD), pwd->w[2]);
+    cpu_stl_data(env, addr + (3 << DF_WORD), pwd->w[3]);
+#else
+    cpu_stl_data(env, addr + (1 << DF_WORD), pwd->w[0]);
+    cpu_stl_data(env, addr + (0 << DF_WORD), pwd->w[1]);
+    cpu_stl_data(env, addr + (3 << DF_WORD), pwd->w[2]);
+    cpu_stl_data(env, addr + (2 << DF_WORD), pwd->w[3]);
+#endif
+#endif
+}
+
+void helper_msa_st_d(CPUMIPSState *env, uint32_t wd,
+                     target_ulong addr)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    int mmu_idx = cpu_mmu_index(env, false);
+
+    MEMOP_IDX(DF_DOUBLE)
+    ensure_writable_pages(env, addr, mmu_idx, GETPC());
+#if !defined(CONFIG_USER_ONLY)
+    helper_ret_stq_mmu(env, addr + (0 << DF_DOUBLE), pwd->d[0], oi, GETPC());
+    helper_ret_stq_mmu(env, addr + (1 << DF_DOUBLE), pwd->d[1], oi, GETPC());
+#else
+    cpu_stq_data(env, addr + (0 << DF_DOUBLE), pwd->d[0]);
+    cpu_stq_data(env, addr + (1 << DF_DOUBLE), pwd->d[1]);
+#endif
+}
+
 void msa_reset(CPUMIPSState *env)
 {
     if (!ase_msa_available(env)) {
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 3386b8228e9..89c7d4556a0 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -1173,400 +1173,6 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
 }
 #endif /* !CONFIG_USER_ONLY */
 
-
-/* MSA */
-/* Data format min and max values */
-#define DF_BITS(df) (1 << ((df) + 3))
-
-/* Element-by-element access macros */
-#define DF_ELEMENTS(df) (MSA_WRLEN / DF_BITS(df))
-
-#if !defined(CONFIG_USER_ONLY)
-#define MEMOP_IDX(DF)                                           \
-        TCGMemOpIdx oi = make_memop_idx(MO_TE | DF | MO_UNALN,  \
-                                        cpu_mmu_index(env, false));
-#else
-#define MEMOP_IDX(DF)
-#endif
-
-void helper_msa_ld_b(CPUMIPSState *env, uint32_t wd,
-                     target_ulong addr)
-{
-    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    MEMOP_IDX(DF_BYTE)
-#if !defined(CONFIG_USER_ONLY)
-#if !defined(HOST_WORDS_BIGENDIAN)
-    pwd->b[0]  = helper_ret_ldub_mmu(env, addr + (0  << DF_BYTE), oi, GETPC());
-    pwd->b[1]  = helper_ret_ldub_mmu(env, addr + (1  << DF_BYTE), oi, GETPC());
-    pwd->b[2]  = helper_ret_ldub_mmu(env, addr + (2  << DF_BYTE), oi, GETPC());
-    pwd->b[3]  = helper_ret_ldub_mmu(env, addr + (3  << DF_BYTE), oi, GETPC());
-    pwd->b[4]  = helper_ret_ldub_mmu(env, addr + (4  << DF_BYTE), oi, GETPC());
-    pwd->b[5]  = helper_ret_ldub_mmu(env, addr + (5  << DF_BYTE), oi, GETPC());
-    pwd->b[6]  = helper_ret_ldub_mmu(env, addr + (6  << DF_BYTE), oi, GETPC());
-    pwd->b[7]  = helper_ret_ldub_mmu(env, addr + (7  << DF_BYTE), oi, GETPC());
-    pwd->b[8]  = helper_ret_ldub_mmu(env, addr + (8  << DF_BYTE), oi, GETPC());
-    pwd->b[9]  = helper_ret_ldub_mmu(env, addr + (9  << DF_BYTE), oi, GETPC());
-    pwd->b[10] = helper_ret_ldub_mmu(env, addr + (10 << DF_BYTE), oi, GETPC());
-    pwd->b[11] = helper_ret_ldub_mmu(env, addr + (11 << DF_BYTE), oi, GETPC());
-    pwd->b[12] = helper_ret_ldub_mmu(env, addr + (12 << DF_BYTE), oi, GETPC());
-    pwd->b[13] = helper_ret_ldub_mmu(env, addr + (13 << DF_BYTE), oi, GETPC());
-    pwd->b[14] = helper_ret_ldub_mmu(env, addr + (14 << DF_BYTE), oi, GETPC());
-    pwd->b[15] = helper_ret_ldub_mmu(env, addr + (15 << DF_BYTE), oi, GETPC());
-#else
-    pwd->b[0]  = helper_ret_ldub_mmu(env, addr + (7  << DF_BYTE), oi, GETPC());
-    pwd->b[1]  = helper_ret_ldub_mmu(env, addr + (6  << DF_BYTE), oi, GETPC());
-    pwd->b[2]  = helper_ret_ldub_mmu(env, addr + (5  << DF_BYTE), oi, GETPC());
-    pwd->b[3]  = helper_ret_ldub_mmu(env, addr + (4  << DF_BYTE), oi, GETPC());
-    pwd->b[4]  = helper_ret_ldub_mmu(env, addr + (3  << DF_BYTE), oi, GETPC());
-    pwd->b[5]  = helper_ret_ldub_mmu(env, addr + (2  << DF_BYTE), oi, GETPC());
-    pwd->b[6]  = helper_ret_ldub_mmu(env, addr + (1  << DF_BYTE), oi, GETPC());
-    pwd->b[7]  = helper_ret_ldub_mmu(env, addr + (0  << DF_BYTE), oi, GETPC());
-    pwd->b[8]  = helper_ret_ldub_mmu(env, addr + (15 << DF_BYTE), oi, GETPC());
-    pwd->b[9]  = helper_ret_ldub_mmu(env, addr + (14 << DF_BYTE), oi, GETPC());
-    pwd->b[10] = helper_ret_ldub_mmu(env, addr + (13 << DF_BYTE), oi, GETPC());
-    pwd->b[11] = helper_ret_ldub_mmu(env, addr + (12 << DF_BYTE), oi, GETPC());
-    pwd->b[12] = helper_ret_ldub_mmu(env, addr + (11 << DF_BYTE), oi, GETPC());
-    pwd->b[13] = helper_ret_ldub_mmu(env, addr + (10 << DF_BYTE), oi, GETPC());
-    pwd->b[14] = helper_ret_ldub_mmu(env, addr + (9  << DF_BYTE), oi, GETPC());
-    pwd->b[15] = helper_ret_ldub_mmu(env, addr + (8  << DF_BYTE), oi, GETPC());
-#endif
-#else
-#if !defined(HOST_WORDS_BIGENDIAN)
-    pwd->b[0]  = cpu_ldub_data(env, addr + (0  << DF_BYTE));
-    pwd->b[1]  = cpu_ldub_data(env, addr + (1  << DF_BYTE));
-    pwd->b[2]  = cpu_ldub_data(env, addr + (2  << DF_BYTE));
-    pwd->b[3]  = cpu_ldub_data(env, addr + (3  << DF_BYTE));
-    pwd->b[4]  = cpu_ldub_data(env, addr + (4  << DF_BYTE));
-    pwd->b[5]  = cpu_ldub_data(env, addr + (5  << DF_BYTE));
-    pwd->b[6]  = cpu_ldub_data(env, addr + (6  << DF_BYTE));
-    pwd->b[7]  = cpu_ldub_data(env, addr + (7  << DF_BYTE));
-    pwd->b[8]  = cpu_ldub_data(env, addr + (8  << DF_BYTE));
-    pwd->b[9]  = cpu_ldub_data(env, addr + (9  << DF_BYTE));
-    pwd->b[10] = cpu_ldub_data(env, addr + (10 << DF_BYTE));
-    pwd->b[11] = cpu_ldub_data(env, addr + (11 << DF_BYTE));
-    pwd->b[12] = cpu_ldub_data(env, addr + (12 << DF_BYTE));
-    pwd->b[13] = cpu_ldub_data(env, addr + (13 << DF_BYTE));
-    pwd->b[14] = cpu_ldub_data(env, addr + (14 << DF_BYTE));
-    pwd->b[15] = cpu_ldub_data(env, addr + (15 << DF_BYTE));
-#else
-    pwd->b[0]  = cpu_ldub_data(env, addr + (7  << DF_BYTE));
-    pwd->b[1]  = cpu_ldub_data(env, addr + (6  << DF_BYTE));
-    pwd->b[2]  = cpu_ldub_data(env, addr + (5  << DF_BYTE));
-    pwd->b[3]  = cpu_ldub_data(env, addr + (4  << DF_BYTE));
-    pwd->b[4]  = cpu_ldub_data(env, addr + (3  << DF_BYTE));
-    pwd->b[5]  = cpu_ldub_data(env, addr + (2  << DF_BYTE));
-    pwd->b[6]  = cpu_ldub_data(env, addr + (1  << DF_BYTE));
-    pwd->b[7]  = cpu_ldub_data(env, addr + (0  << DF_BYTE));
-    pwd->b[8]  = cpu_ldub_data(env, addr + (15 << DF_BYTE));
-    pwd->b[9]  = cpu_ldub_data(env, addr + (14 << DF_BYTE));
-    pwd->b[10] = cpu_ldub_data(env, addr + (13 << DF_BYTE));
-    pwd->b[11] = cpu_ldub_data(env, addr + (12 << DF_BYTE));
-    pwd->b[12] = cpu_ldub_data(env, addr + (11 << DF_BYTE));
-    pwd->b[13] = cpu_ldub_data(env, addr + (10 << DF_BYTE));
-    pwd->b[14] = cpu_ldub_data(env, addr + (9 << DF_BYTE));
-    pwd->b[15] = cpu_ldub_data(env, addr + (8 << DF_BYTE));
-#endif
-#endif
-}
-
-void helper_msa_ld_h(CPUMIPSState *env, uint32_t wd,
-                     target_ulong addr)
-{
-    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    MEMOP_IDX(DF_HALF)
-#if !defined(CONFIG_USER_ONLY)
-#if !defined(HOST_WORDS_BIGENDIAN)
-    pwd->h[0] = helper_ret_lduw_mmu(env, addr + (0 << DF_HALF), oi, GETPC());
-    pwd->h[1] = helper_ret_lduw_mmu(env, addr + (1 << DF_HALF), oi, GETPC());
-    pwd->h[2] = helper_ret_lduw_mmu(env, addr + (2 << DF_HALF), oi, GETPC());
-    pwd->h[3] = helper_ret_lduw_mmu(env, addr + (3 << DF_HALF), oi, GETPC());
-    pwd->h[4] = helper_ret_lduw_mmu(env, addr + (4 << DF_HALF), oi, GETPC());
-    pwd->h[5] = helper_ret_lduw_mmu(env, addr + (5 << DF_HALF), oi, GETPC());
-    pwd->h[6] = helper_ret_lduw_mmu(env, addr + (6 << DF_HALF), oi, GETPC());
-    pwd->h[7] = helper_ret_lduw_mmu(env, addr + (7 << DF_HALF), oi, GETPC());
-#else
-    pwd->h[0] = helper_ret_lduw_mmu(env, addr + (3 << DF_HALF), oi, GETPC());
-    pwd->h[1] = helper_ret_lduw_mmu(env, addr + (2 << DF_HALF), oi, GETPC());
-    pwd->h[2] = helper_ret_lduw_mmu(env, addr + (1 << DF_HALF), oi, GETPC());
-    pwd->h[3] = helper_ret_lduw_mmu(env, addr + (0 << DF_HALF), oi, GETPC());
-    pwd->h[4] = helper_ret_lduw_mmu(env, addr + (7 << DF_HALF), oi, GETPC());
-    pwd->h[5] = helper_ret_lduw_mmu(env, addr + (6 << DF_HALF), oi, GETPC());
-    pwd->h[6] = helper_ret_lduw_mmu(env, addr + (5 << DF_HALF), oi, GETPC());
-    pwd->h[7] = helper_ret_lduw_mmu(env, addr + (4 << DF_HALF), oi, GETPC());
-#endif
-#else
-#if !defined(HOST_WORDS_BIGENDIAN)
-    pwd->h[0] = cpu_lduw_data(env, addr + (0 << DF_HALF));
-    pwd->h[1] = cpu_lduw_data(env, addr + (1 << DF_HALF));
-    pwd->h[2] = cpu_lduw_data(env, addr + (2 << DF_HALF));
-    pwd->h[3] = cpu_lduw_data(env, addr + (3 << DF_HALF));
-    pwd->h[4] = cpu_lduw_data(env, addr + (4 << DF_HALF));
-    pwd->h[5] = cpu_lduw_data(env, addr + (5 << DF_HALF));
-    pwd->h[6] = cpu_lduw_data(env, addr + (6 << DF_HALF));
-    pwd->h[7] = cpu_lduw_data(env, addr + (7 << DF_HALF));
-#else
-    pwd->h[0] = cpu_lduw_data(env, addr + (3 << DF_HALF));
-    pwd->h[1] = cpu_lduw_data(env, addr + (2 << DF_HALF));
-    pwd->h[2] = cpu_lduw_data(env, addr + (1 << DF_HALF));
-    pwd->h[3] = cpu_lduw_data(env, addr + (0 << DF_HALF));
-    pwd->h[4] = cpu_lduw_data(env, addr + (7 << DF_HALF));
-    pwd->h[5] = cpu_lduw_data(env, addr + (6 << DF_HALF));
-    pwd->h[6] = cpu_lduw_data(env, addr + (5 << DF_HALF));
-    pwd->h[7] = cpu_lduw_data(env, addr + (4 << DF_HALF));
-#endif
-#endif
-}
-
-void helper_msa_ld_w(CPUMIPSState *env, uint32_t wd,
-                     target_ulong addr)
-{
-    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    MEMOP_IDX(DF_WORD)
-#if !defined(CONFIG_USER_ONLY)
-#if !defined(HOST_WORDS_BIGENDIAN)
-    pwd->w[0] = helper_ret_ldul_mmu(env, addr + (0 << DF_WORD), oi, GETPC());
-    pwd->w[1] = helper_ret_ldul_mmu(env, addr + (1 << DF_WORD), oi, GETPC());
-    pwd->w[2] = helper_ret_ldul_mmu(env, addr + (2 << DF_WORD), oi, GETPC());
-    pwd->w[3] = helper_ret_ldul_mmu(env, addr + (3 << DF_WORD), oi, GETPC());
-#else
-    pwd->w[0] = helper_ret_ldul_mmu(env, addr + (1 << DF_WORD), oi, GETPC());
-    pwd->w[1] = helper_ret_ldul_mmu(env, addr + (0 << DF_WORD), oi, GETPC());
-    pwd->w[2] = helper_ret_ldul_mmu(env, addr + (3 << DF_WORD), oi, GETPC());
-    pwd->w[3] = helper_ret_ldul_mmu(env, addr + (2 << DF_WORD), oi, GETPC());
-#endif
-#else
-#if !defined(HOST_WORDS_BIGENDIAN)
-    pwd->w[0] = cpu_ldl_data(env, addr + (0 << DF_WORD));
-    pwd->w[1] = cpu_ldl_data(env, addr + (1 << DF_WORD));
-    pwd->w[2] = cpu_ldl_data(env, addr + (2 << DF_WORD));
-    pwd->w[3] = cpu_ldl_data(env, addr + (3 << DF_WORD));
-#else
-    pwd->w[0] = cpu_ldl_data(env, addr + (1 << DF_WORD));
-    pwd->w[1] = cpu_ldl_data(env, addr + (0 << DF_WORD));
-    pwd->w[2] = cpu_ldl_data(env, addr + (3 << DF_WORD));
-    pwd->w[3] = cpu_ldl_data(env, addr + (2 << DF_WORD));
-#endif
-#endif
-}
-
-void helper_msa_ld_d(CPUMIPSState *env, uint32_t wd,
-                     target_ulong addr)
-{
-    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    MEMOP_IDX(DF_DOUBLE)
-#if !defined(CONFIG_USER_ONLY)
-    pwd->d[0] = helper_ret_ldq_mmu(env, addr + (0 << DF_DOUBLE), oi, GETPC());
-    pwd->d[1] = helper_ret_ldq_mmu(env, addr + (1 << DF_DOUBLE), oi, GETPC());
-#else
-    pwd->d[0] = cpu_ldq_data(env, addr + (0 << DF_DOUBLE));
-    pwd->d[1] = cpu_ldq_data(env, addr + (1 << DF_DOUBLE));
-#endif
-}
-
-#define MSA_PAGESPAN(x) \
-        ((((x) & ~TARGET_PAGE_MASK) + MSA_WRLEN / 8 - 1) >= TARGET_PAGE_SIZE)
-
-static inline void ensure_writable_pages(CPUMIPSState *env,
-                                         target_ulong addr,
-                                         int mmu_idx,
-                                         uintptr_t retaddr)
-{
-    /* FIXME: Probe the actual accesses (pass and use a size) */
-    if (unlikely(MSA_PAGESPAN(addr))) {
-        /* first page */
-        probe_write(env, addr, 0, mmu_idx, retaddr);
-        /* second page */
-        addr = (addr & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
-        probe_write(env, addr, 0, mmu_idx, retaddr);
-    }
-}
-
-void helper_msa_st_b(CPUMIPSState *env, uint32_t wd,
-                     target_ulong addr)
-{
-    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    int mmu_idx = cpu_mmu_index(env, false);
-
-    MEMOP_IDX(DF_BYTE)
-    ensure_writable_pages(env, addr, mmu_idx, GETPC());
-#if !defined(CONFIG_USER_ONLY)
-#if !defined(HOST_WORDS_BIGENDIAN)
-    helper_ret_stb_mmu(env, addr + (0  << DF_BYTE), pwd->b[0],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (1  << DF_BYTE), pwd->b[1],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (2  << DF_BYTE), pwd->b[2],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (3  << DF_BYTE), pwd->b[3],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (4  << DF_BYTE), pwd->b[4],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (5  << DF_BYTE), pwd->b[5],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (6  << DF_BYTE), pwd->b[6],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (7  << DF_BYTE), pwd->b[7],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (8  << DF_BYTE), pwd->b[8],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (9  << DF_BYTE), pwd->b[9],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (10 << DF_BYTE), pwd->b[10], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (11 << DF_BYTE), pwd->b[11], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (12 << DF_BYTE), pwd->b[12], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (13 << DF_BYTE), pwd->b[13], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (14 << DF_BYTE), pwd->b[14], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (15 << DF_BYTE), pwd->b[15], oi, GETPC());
-#else
-    helper_ret_stb_mmu(env, addr + (7  << DF_BYTE), pwd->b[0],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (6  << DF_BYTE), pwd->b[1],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (5  << DF_BYTE), pwd->b[2],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (4  << DF_BYTE), pwd->b[3],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (3  << DF_BYTE), pwd->b[4],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (2  << DF_BYTE), pwd->b[5],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (1  << DF_BYTE), pwd->b[6],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (0  << DF_BYTE), pwd->b[7],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (15 << DF_BYTE), pwd->b[8],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (14 << DF_BYTE), pwd->b[9],  oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (13 << DF_BYTE), pwd->b[10], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (12 << DF_BYTE), pwd->b[11], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (11 << DF_BYTE), pwd->b[12], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (10 << DF_BYTE), pwd->b[13], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (9  << DF_BYTE), pwd->b[14], oi, GETPC());
-    helper_ret_stb_mmu(env, addr + (8  << DF_BYTE), pwd->b[15], oi, GETPC());
-#endif
-#else
-#if !defined(HOST_WORDS_BIGENDIAN)
-    cpu_stb_data(env, addr + (0  << DF_BYTE), pwd->b[0]);
-    cpu_stb_data(env, addr + (1  << DF_BYTE), pwd->b[1]);
-    cpu_stb_data(env, addr + (2  << DF_BYTE), pwd->b[2]);
-    cpu_stb_data(env, addr + (3  << DF_BYTE), pwd->b[3]);
-    cpu_stb_data(env, addr + (4  << DF_BYTE), pwd->b[4]);
-    cpu_stb_data(env, addr + (5  << DF_BYTE), pwd->b[5]);
-    cpu_stb_data(env, addr + (6  << DF_BYTE), pwd->b[6]);
-    cpu_stb_data(env, addr + (7  << DF_BYTE), pwd->b[7]);
-    cpu_stb_data(env, addr + (8  << DF_BYTE), pwd->b[8]);
-    cpu_stb_data(env, addr + (9  << DF_BYTE), pwd->b[9]);
-    cpu_stb_data(env, addr + (10 << DF_BYTE), pwd->b[10]);
-    cpu_stb_data(env, addr + (11 << DF_BYTE), pwd->b[11]);
-    cpu_stb_data(env, addr + (12 << DF_BYTE), pwd->b[12]);
-    cpu_stb_data(env, addr + (13 << DF_BYTE), pwd->b[13]);
-    cpu_stb_data(env, addr + (14 << DF_BYTE), pwd->b[14]);
-    cpu_stb_data(env, addr + (15 << DF_BYTE), pwd->b[15]);
-#else
-    cpu_stb_data(env, addr + (7  << DF_BYTE), pwd->b[0]);
-    cpu_stb_data(env, addr + (6  << DF_BYTE), pwd->b[1]);
-    cpu_stb_data(env, addr + (5  << DF_BYTE), pwd->b[2]);
-    cpu_stb_data(env, addr + (4  << DF_BYTE), pwd->b[3]);
-    cpu_stb_data(env, addr + (3  << DF_BYTE), pwd->b[4]);
-    cpu_stb_data(env, addr + (2  << DF_BYTE), pwd->b[5]);
-    cpu_stb_data(env, addr + (1  << DF_BYTE), pwd->b[6]);
-    cpu_stb_data(env, addr + (0  << DF_BYTE), pwd->b[7]);
-    cpu_stb_data(env, addr + (15 << DF_BYTE), pwd->b[8]);
-    cpu_stb_data(env, addr + (14 << DF_BYTE), pwd->b[9]);
-    cpu_stb_data(env, addr + (13 << DF_BYTE), pwd->b[10]);
-    cpu_stb_data(env, addr + (12 << DF_BYTE), pwd->b[11]);
-    cpu_stb_data(env, addr + (11 << DF_BYTE), pwd->b[12]);
-    cpu_stb_data(env, addr + (10 << DF_BYTE), pwd->b[13]);
-    cpu_stb_data(env, addr + (9  << DF_BYTE), pwd->b[14]);
-    cpu_stb_data(env, addr + (8  << DF_BYTE), pwd->b[15]);
-#endif
-#endif
-}
-
-void helper_msa_st_h(CPUMIPSState *env, uint32_t wd,
-                     target_ulong addr)
-{
-    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    int mmu_idx = cpu_mmu_index(env, false);
-
-    MEMOP_IDX(DF_HALF)
-    ensure_writable_pages(env, addr, mmu_idx, GETPC());
-#if !defined(CONFIG_USER_ONLY)
-#if !defined(HOST_WORDS_BIGENDIAN)
-    helper_ret_stw_mmu(env, addr + (0 << DF_HALF), pwd->h[0], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (1 << DF_HALF), pwd->h[1], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (2 << DF_HALF), pwd->h[2], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (3 << DF_HALF), pwd->h[3], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (4 << DF_HALF), pwd->h[4], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (5 << DF_HALF), pwd->h[5], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (6 << DF_HALF), pwd->h[6], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (7 << DF_HALF), pwd->h[7], oi, GETPC());
-#else
-    helper_ret_stw_mmu(env, addr + (3 << DF_HALF), pwd->h[0], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (2 << DF_HALF), pwd->h[1], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (1 << DF_HALF), pwd->h[2], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (0 << DF_HALF), pwd->h[3], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (7 << DF_HALF), pwd->h[4], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (6 << DF_HALF), pwd->h[5], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (5 << DF_HALF), pwd->h[6], oi, GETPC());
-    helper_ret_stw_mmu(env, addr + (4 << DF_HALF), pwd->h[7], oi, GETPC());
-#endif
-#else
-#if !defined(HOST_WORDS_BIGENDIAN)
-    cpu_stw_data(env, addr + (0 << DF_HALF), pwd->h[0]);
-    cpu_stw_data(env, addr + (1 << DF_HALF), pwd->h[1]);
-    cpu_stw_data(env, addr + (2 << DF_HALF), pwd->h[2]);
-    cpu_stw_data(env, addr + (3 << DF_HALF), pwd->h[3]);
-    cpu_stw_data(env, addr + (4 << DF_HALF), pwd->h[4]);
-    cpu_stw_data(env, addr + (5 << DF_HALF), pwd->h[5]);
-    cpu_stw_data(env, addr + (6 << DF_HALF), pwd->h[6]);
-    cpu_stw_data(env, addr + (7 << DF_HALF), pwd->h[7]);
-#else
-    cpu_stw_data(env, addr + (3 << DF_HALF), pwd->h[0]);
-    cpu_stw_data(env, addr + (2 << DF_HALF), pwd->h[1]);
-    cpu_stw_data(env, addr + (1 << DF_HALF), pwd->h[2]);
-    cpu_stw_data(env, addr + (0 << DF_HALF), pwd->h[3]);
-    cpu_stw_data(env, addr + (7 << DF_HALF), pwd->h[4]);
-    cpu_stw_data(env, addr + (6 << DF_HALF), pwd->h[5]);
-    cpu_stw_data(env, addr + (5 << DF_HALF), pwd->h[6]);
-    cpu_stw_data(env, addr + (4 << DF_HALF), pwd->h[7]);
-#endif
-#endif
-}
-
-void helper_msa_st_w(CPUMIPSState *env, uint32_t wd,
-                     target_ulong addr)
-{
-    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    int mmu_idx = cpu_mmu_index(env, false);
-
-    MEMOP_IDX(DF_WORD)
-    ensure_writable_pages(env, addr, mmu_idx, GETPC());
-#if !defined(CONFIG_USER_ONLY)
-#if !defined(HOST_WORDS_BIGENDIAN)
-    helper_ret_stl_mmu(env, addr + (0 << DF_WORD), pwd->w[0], oi, GETPC());
-    helper_ret_stl_mmu(env, addr + (1 << DF_WORD), pwd->w[1], oi, GETPC());
-    helper_ret_stl_mmu(env, addr + (2 << DF_WORD), pwd->w[2], oi, GETPC());
-    helper_ret_stl_mmu(env, addr + (3 << DF_WORD), pwd->w[3], oi, GETPC());
-#else
-    helper_ret_stl_mmu(env, addr + (1 << DF_WORD), pwd->w[0], oi, GETPC());
-    helper_ret_stl_mmu(env, addr + (0 << DF_WORD), pwd->w[1], oi, GETPC());
-    helper_ret_stl_mmu(env, addr + (3 << DF_WORD), pwd->w[2], oi, GETPC());
-    helper_ret_stl_mmu(env, addr + (2 << DF_WORD), pwd->w[3], oi, GETPC());
-#endif
-#else
-#if !defined(HOST_WORDS_BIGENDIAN)
-    cpu_stl_data(env, addr + (0 << DF_WORD), pwd->w[0]);
-    cpu_stl_data(env, addr + (1 << DF_WORD), pwd->w[1]);
-    cpu_stl_data(env, addr + (2 << DF_WORD), pwd->w[2]);
-    cpu_stl_data(env, addr + (3 << DF_WORD), pwd->w[3]);
-#else
-    cpu_stl_data(env, addr + (1 << DF_WORD), pwd->w[0]);
-    cpu_stl_data(env, addr + (0 << DF_WORD), pwd->w[1]);
-    cpu_stl_data(env, addr + (3 << DF_WORD), pwd->w[2]);
-    cpu_stl_data(env, addr + (2 << DF_WORD), pwd->w[3]);
-#endif
-#endif
-}
-
-void helper_msa_st_d(CPUMIPSState *env, uint32_t wd,
-                     target_ulong addr)
-{
-    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    int mmu_idx = cpu_mmu_index(env, false);
-
-    MEMOP_IDX(DF_DOUBLE)
-    ensure_writable_pages(env, addr, mmu_idx, GETPC());
-#if !defined(CONFIG_USER_ONLY)
-    helper_ret_stq_mmu(env, addr + (0 << DF_DOUBLE), pwd->d[0], oi, GETPC());
-    helper_ret_stq_mmu(env, addr + (1 << DF_DOUBLE), pwd->d[1], oi, GETPC());
-#else
-    cpu_stq_data(env, addr + (0 << DF_DOUBLE), pwd->d[0]);
-    cpu_stq_data(env, addr + (1 << DF_DOUBLE), pwd->d[1]);
-#endif
-}
-
 void helper_cache(CPUMIPSState *env, target_ulong addr, uint32_t op)
 {
 #ifndef CONFIG_USER_ONLY
-- 
2.26.2


