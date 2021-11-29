Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945C6460D08
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:11:21 +0100 (CET)
Received: from localhost ([::1]:37232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrX4a-0005io-KC
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:11:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxm-0000bX-Hv
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:04:18 -0500
Received: from [2607:f8b0:4864:20::62e] (port=37885
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWxk-0008Oy-FP
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:04:18 -0500
Received: by mail-pl1-x62e.google.com with SMTP id n8so10994674plf.4
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VLQVCed6ybkZddngnPVpusUEwjUjBPVUL9+pI0YvcSI=;
 b=keVWVN5bYPaZuF9lec18WJ5SBIarBdxhQ1gwFrpCe+TXxKtDxyAgRZtXxQy6GPPDQi
 QOGfRTZKLARVwohj2kvDgby4TJg1aE7OHgu8Q3/hLSClez1SCL72k5Ib9jnnKTnJbaFr
 dP3oyaMbnA7tH2swzGoZK8hYBYbQu3PsRNwe8Zh+p5eBwJwZEXkxlQvyLjDs/oBYTotN
 y1OYwEc2y6i0T0MlRK6+Or2Va7M/Vggfu/BxIjteg5WL+qiR6VtZF3YpoHmWgwx15y56
 HRZfzTBDLQAuW9NNYI4cJLh/mmyvZkpbXlOt1wvAIrzd+FCBGQIq4Bd22qz3icQteVpT
 1Qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VLQVCed6ybkZddngnPVpusUEwjUjBPVUL9+pI0YvcSI=;
 b=z/AiNLjPbLjBwYy01u3IksFbl97rxuhjn/ReG9B2Ypcgfy0YE3ITCvtiVqB32mWdg6
 ZYVbl97HLMzHMbpSWrZr2i96CKMg1l6QplTQ6fo1FdFTeQ3wmIr0JHzMutxT1WPwSBu/
 pihBCNFVFaWDOtoYLDbE/p5OFbiq5Bg/YALxfQtqfZJkrrgwJI+ApWlB2iJ+D7lwfNJz
 yiSC0b/Z+oBTIbWLiOgEnw9DuNwszhSxQIMpbueziJTYPBqKGOOL+r4WN3L5I6/LcQIt
 a3J3Usn2r++Q0XjWhEWTOVFa33K74hiRPksCeFkr00dplOEQIqnmsVUiL/BLqa+SbzcM
 bIoQ==
X-Gm-Message-State: AOAM53123Vt9rBIwPLsqVmX4+4ng/FfS+g71v8S1ohBJUepnJnVdTZ7/
 Z293WMDgJULVe3sdoYgn0AYXq+v+NARCpGWo
X-Google-Smtp-Source: ABdhPJwsuZuyYFE/FYgjZIPHTVXTMwNejaiQ7t3ctciz0OQ8Dx+Pzi4+cj3nbwsZ85ISxtNMoW30Aw==
X-Received: by 2002:a17:90a:f2c2:: with SMTP id
 gt2mr27535367pjb.178.1638155055201; 
 Sun, 28 Nov 2021 19:04:15 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:04:15 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 06/77] target/riscv: rvv-1.0: introduce writable misa.v
 field
Date: Mon, 29 Nov 2021 11:02:26 +0800
Message-Id: <20211129030340.429689-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62e.google.com
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Implementations may have a writable misa.v field. Analogous to the way
in which the floating-point unit is handled, the mstatus.vs field may
exist even if misa.v is clear.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 83f4dbd8241..bc149add6ce 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -643,7 +643,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     val &= env->misa_ext_mask;
 
     /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
 
     /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
     if ((val & RVD) && !(val & RVF)) {
-- 
2.25.1


