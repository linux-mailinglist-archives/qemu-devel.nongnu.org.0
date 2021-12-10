Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A4546FD42
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 10:02:36 +0100 (CET)
Received: from localhost ([::1]:52930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbnW-0004Kp-Jx
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 04:02:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvao3-0006Em-3e
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:59:04 -0500
Received: from [2607:f8b0:4864:20::52a] (port=33375
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanz-0006uK-2l
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:59:01 -0500
Received: by mail-pg1-x52a.google.com with SMTP id f125so7446317pgc.0
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RqB0+hsmREKJeAX+2oNDCkYIZsY0MzyqxWMwIQVHOVg=;
 b=RIHLK30efJXn6724TT/yd/7QGbMGaKpT7nJMaUUaQ1a2W/E80g+dGCWPqAvHgfY/SP
 4Y/ZWpYfJ3wJi70NPwHj7C9NkRsNKwU2p2D/Ibb+qUEdM9sv2/al4muOLKvrf/HY+HSj
 0uxt+z8Cl3O6el8JaHF+w2uusFbC0cAEfH05x2GMNHLorNYMlFAGW/1rGgXR+VdBsKYV
 +aF1qOT1E5O5DqNUbVSfINNM7Hbvh/gWX+bMyW9Qq1zQU4R5hV0og/KCf/SkGpN6tgFG
 T6oHte1D/O5uValo/3RBbazD+ZUnct/XiZG/RJU9ONteGJxyV/aSRrmGsR0LApaAJTnx
 tw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RqB0+hsmREKJeAX+2oNDCkYIZsY0MzyqxWMwIQVHOVg=;
 b=dYQ9p9C2M0uxYHngoFtkRVTn/v0PXdOBdP8PeMVWWJnfjlrMwyE1sF9G9DOm0CIpaR
 nI8eNubILpYCJOshm+snSDskZr9KpsaaBE5OZ7+cNOerCxmYjqTBrKjUZ9ScRHaB+hBI
 OCRK2bchhXBZQXKEc7T5kzBZHLVIjwvgD17vDWGu/TfnvZ66gbyaTd31gk697fV+n3ub
 yzlPjy/9JxBOxQu0Lm4y3e4bqTVT35HtGOsGJw1gaRqXfT3Zet/I8l7mmB4QjBzc88CU
 sjo17qVYhyEX/w5nOixF7Eyb75gnwp18+j8iRXCXHYQc3MZ4J1Y2CdULix15StvORgLy
 zdkA==
X-Gm-Message-State: AOAM532rPpPauOgNKKSdkFp3q8oWFxtytu90rByraqb+lD4x5o9ZM008
 5fV9kRVLUBEO6PNKBTNgflKKiUJ7vNSO4CxF
X-Google-Smtp-Source: ABdhPJzixmPGgZ7Apg+HxOCjTEQEiWKzu6ZecPvB5ZosumXq++QB/mVqsRRbz+oJFVkwQJ80sMAVuw==
X-Received: by 2002:a63:1413:: with SMTP id u19mr38383513pgl.109.1639123135432; 
 Thu, 09 Dec 2021 23:58:55 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:55 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 32/77] target/riscv: rvv-1.0: iota instruction
Date: Fri, 10 Dec 2021 15:56:18 +0800
Message-Id: <20211210075704.23951-33-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d139c0aade..3ac5162aeb 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -632,7 +632,7 @@ vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
-viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
+viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 9206e6f06c..80cbf0cadb 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2757,12 +2757,18 @@ GEN_M_TRANS(vmsbf_m)
 GEN_M_TRANS(vmsif_m)
 GEN_M_TRANS(vmsof_m)
 
-/* Vector Iota Instruction */
+/*
+ * Vector Iota Instruction
+ *
+ * 1. The destination register cannot overlap the source register.
+ * 2. If masked, cannot overlap the mask register ('v0').
+ * 3. An illegal instruction exception is raised if vstart is non-zero.
+ */
 static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s) &&
-        require_noover(a->rd, s->lmul, a->rs2, 0) &&
+        !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
         require_vm(a->vm, a->rd) &&
         require_align(a->rd, s->lmul)) {
         uint32_t data = 0;
-- 
2.31.1


