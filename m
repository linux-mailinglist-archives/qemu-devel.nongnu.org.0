Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2768463144
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 11:41:01 +0100 (CET)
Received: from localhost ([::1]:53254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms0ZI-0000x8-T8
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 05:41:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ms0WM-0006lI-7V
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:37:58 -0500
Received: from [2a00:1450:4864:20::332] (port=42802
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ms0WK-0000P2-SJ
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 05:37:57 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so14422879wmd.1
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 02:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T7M2wmWcneioAfDJGxuBBR28RTxKODOxRCKMrpc/wvg=;
 b=rfqNfmU4gU3znD8zLdlLJVP1KXB66OJMSzHZ2b67xyUA5sgxkwDmaxBu7WVMPeQA8/
 xkDnTC1T/PFGsnSe4vNXwa6JRt0+Vn+seJ00yIQhOgJVVM5NbaScIfkwngcig38IniSj
 taoxPTmHcNOV1GWZFGbRZXT+MW5SiMTnswly2wFndTWixNzHAa+XkYFvHiNsEJBn+G17
 H4al4BM0eUlF61eshz4xJL0eAC2UTG50+njw2QIQ4FqIpA4s6MUia7iuPk7iDqOm+kz8
 A9yg44obyQIfZufBTxGYNUTVICvHsaQl1HclDpzmgVJLO5vTTdDEdYRBh5UqTmPJZwjO
 5TZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T7M2wmWcneioAfDJGxuBBR28RTxKODOxRCKMrpc/wvg=;
 b=OY6afA9470BToIR2Nq6r3ojndyJLw/PSEBWTaXfk53Ule5dWF+IUzx5y66dPcfkaUA
 WGNJODldsayA6l2T1rb5dCkfT3nVZaQ8TbWUd9QSo06KTGPKhgYA2z+UISvhiq2RSjO8
 0Twhb4vuEnc6QefTO3ma7zpK6QZhmmQB2a4Pj8em0/iCKhqieEZ3RhO2t2/5moVW54WT
 gwqcnzKhnqmtAA8nRtTmQ+qyipGYrQKWaZT707o8uFmpW4Ht4mNUhSqJHgE21nSkh87f
 isrf8uGkHT7ey2QdEEZYcejnqTskNMR+8RB+OgS8O7WdRfY7jFNDnpfpolT9D26+LfGH
 aFcw==
X-Gm-Message-State: AOAM533wQ/v1q0RdVqJ2ixsQZMW+JvxeE7yiZrJc4ju3jl1j3xr+TTrB
 b/xcMhOOjB5mdLsTOxzMn5UgFTz1Sn55C4zizRY=
X-Google-Smtp-Source: ABdhPJxW3v0n3RQv2jxNWz60U65X3H5ZHhcPEIqWyirL4G2u+kvXO9UCU9eNH7eYnsFNTzgQEj1AGQ==
X-Received: by 2002:a05:600c:210a:: with SMTP id
 u10mr3925001wml.33.1638268675508; 
 Tue, 30 Nov 2021 02:37:55 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id m21sm16311280wrb.2.2021.11.30.02.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 02:37:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/m68k: Implement TRAPV
Date: Tue, 30 Nov 2021 11:37:50 +0100
Message-Id: <20211130103752.72099-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130103752.72099-1-richard.henderson@linaro.org>
References: <20211130103752.72099-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index af43c8eab8..858ba761fc 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4863,6 +4863,22 @@ DISAS_INSN(trap)
     gen_exception(s, s->base.pc_next, EXCP_TRAP0 + (insn & 0xf));
 }
 
+static void do_trapcc(DisasContext *s, int cond)
+{
+    TCGLabel *over = gen_new_label();
+
+    /* Jump over if !cond. */
+    gen_jmpcc(s, cond ^ 1, over);
+
+    gen_exception(s, s->base.pc_next, EXCP_TRAPCC);
+    gen_set_label(over);
+}
+
+DISAS_INSN(trapv)
+{
+    do_trapcc(s, 9); /* VS */
+}
+
 static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
 {
     switch (reg) {
@@ -6026,6 +6042,7 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(nop,       4e71, ffff);
     INSN(rtd,       4e74, ffff, RTD);
     BASE(rts,       4e75, ffff);
+    INSN(trapv,     4e76, ffff, M68000);
     INSN(rtr,       4e77, ffff, M68000);
     BASE(jump,      4e80, ffc0);
     BASE(jump,      4ec0, ffc0);
-- 
2.25.1


