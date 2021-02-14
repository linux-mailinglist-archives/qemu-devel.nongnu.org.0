Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB4131B1E8
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:21:11 +0100 (CET)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBM18-0004KT-RR
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:21:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhk-0008G1-Tf
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:08 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhi-0004Zg-Nt
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:08 -0500
Received: by mail-wm1-x32a.google.com with SMTP id a16so3371138wmm.0
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KD7zKDAIpqYvoyadZCB9BrYro5MBJJgbdXFdh49s7K8=;
 b=nDBax0z5FE+J5ZLC30dbZRhed3FoCQCMk9KsIXuVBKjChLwOC3OSMnZ3L2Sc6bAPvX
 KXzQblzF74HrfuhQI5HV1mVJAYRSuXiyr5lq7j3IKY6VDoi/zZ8ZZO0yqOL0f6ZrdwFh
 XyHHOl3gr7WS84hK4D653x3RID+AGbD9LWDPDOkWDVdQAHgmeu+P3NAGGD/Iqmxku81i
 uXtYbxXFKMPYfZzjEsbQDF+QnfMs/IOAvfpZo2SYeQkNv/uhj9E/IcYcYme22GsBpGMw
 qE0YpxvkzPZ/bUtb5FRy/NdRBzPYGsfuXNzWg+55z1xrwWoqCTV9rVmuTDMxNawW5Fpc
 eweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KD7zKDAIpqYvoyadZCB9BrYro5MBJJgbdXFdh49s7K8=;
 b=qGNvoTjiIohK4s7bt0ex9d/r/1Ybb8VyHLon9oKqIDs8kML9twmpwby+OycCntPts+
 k4/E//HLL4Sh3DPYgNja79RcAs9XY27acN4N4kgljgETF7Qa7bi4PZs1Vlc5aowLN6Lo
 5BKdn5ZPEI6+lCe3oagjDERcwGxvR0EiDFEcCDLTnKpTFcOHUVcaJgqu3Y8SSMi3kFAF
 DREheqkR/4wFSt/rM/Fsc9Vs4ylNtcnJ8NCrvg+Iq2pXIQSFhRq4wytgSvmOJehZ/d2O
 RyTr3/FLa5vkHDGcp3JupVvkbWF6TSPMI6h5tDef7Vg7buh8UMPF70DcnUcyc4ommmQy
 XhKA==
X-Gm-Message-State: AOAM532NoHkcj8GvGkDMTRWFkAUSp8mgfJvVJd+YTgNbbH9oMlD9RfpZ
 roKsDfVmTfmhA64//xe1isonA+E4jbc=
X-Google-Smtp-Source: ABdhPJziBj2/aCy0Amue9gd77ctdSUk+C6W+IPZk85GDiRmOKy7sKALjPdj6zyFirFJbTXa9hd+c2w==
X-Received: by 2002:a7b:c76e:: with SMTP id x14mr10654327wmk.17.1613325665258; 
 Sun, 14 Feb 2021 10:01:05 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h18sm5547186wmm.30.2021.02.14.10.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:01:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 22/42] target/mips/tx79: Introduce PINTEH (Parallel
 Interleave Even Halfword)
Date: Sun, 14 Feb 2021 18:58:52 +0100
Message-Id: <20210214175912.732946-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the PINTEH opcode (Parallel Interleave Even Halfword).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  1 +
 target/mips/tx79_translate.c | 45 ++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 653910371d2..fbd2be569ad 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -57,6 +57,7 @@ PXOR            011100 ..... ..... ..... 10011 001001   @rs_rt_rd
 
 # MMI3
 
+PINTEH          011100 ..... ..... ..... 01010 101001   @rs_rt_rd
 PCPYUD          011100 ..... ..... ..... 01110 101001   @rs_rt_rd
 POR             011100 ..... ..... ..... 10010 101001   @rs_rt_rd
 PNOR            011100 ..... ..... ..... 10011 101001   @rs_rt_rd
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index ac75d95b82b..47d84c465a2 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -638,3 +638,48 @@ static bool trans_PCPYUD(DisasContext *s, arg_rtype *a)
 
     return true;
 }
+
+/* Parallel Interleave Even Halfword */
+static bool trans_PINTEH(DisasContext *ctx, arg_rtype *a)
+{
+    TCGv_i64 ax, bx;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    if (unlikely(a->rs == 0 && a->rt == 0)) {
+        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
+        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
+        return true;
+    }
+
+    ax = tcg_temp_new_i64();
+    bx = tcg_temp_new_i64();
+
+    /* Lower halve */
+    gen_load_gpr(ax, a->rs);
+    gen_load_gpr(bx, a->rt);
+    if (a->rd != a->rt) {
+        tcg_gen_mov_i64(cpu_gpr[a->rd], bx);
+    }
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], ax, 16, 16);
+    tcg_gen_shri_i64(ax, ax, 32);
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], ax, 48, 16);
+
+    /* Upper halve */
+    gen_load_gpr_hi(ax, a->rs);
+    gen_load_gpr_hi(bx, a->rt);
+    if (a->rd != a->rt) {
+        tcg_gen_mov_i64(cpu_gpr_hi[a->rd], bx);
+    }
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], ax, 16, 16);
+    tcg_gen_shri_i64(ax, ax, 32);
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], ax, 48, 16);
+
+    tcg_temp_free(bx);
+    tcg_temp_free(ax);
+
+    return true;
+}
-- 
2.26.2


