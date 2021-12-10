Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1BE46FC7D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:14:10 +0100 (CET)
Received: from localhost ([::1]:59042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvb2g-0007G1-0h
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:14:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamj-0003fz-R0
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:57:43 -0500
Received: from [2607:f8b0:4864:20::102d] (port=35628
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvami-0006Dq-Cz
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:57:41 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso8893698pji.0
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/9cuH2hqcPY9RgmVdSjdzNibNXVCU/AslBgUVqA0KiE=;
 b=KEKsuCF//Ff+lJtR83mn+SRTGLrEN6rubAvZ3V3EFk250DeqhgRaBnWLYMTZFUADmJ
 LNskWx5D+XH6E8nqleJmSLKaEMbUehyDqV5VFTRb/lG7nJb9cxokBJ73CW30ft6Q/sWH
 dtCUt8dvTrnDLPluSjzITlf7tIDEdFdl9dvfrwKM5h+rsCzINTP4MMYs2ET68cznvf7g
 CPF7CtfUzoEYXh1opdA8A1ubXp3JxotkU3l9TIDBKLdk+klbNIEBqMWCtyjnxbFqfOkb
 jrCuIIR2Xwa0RvjdN5ox3n2xlMjl5ZLc30zGX1OXoNqL3OvcqlqeNq2IFE/uISWyIuGJ
 Uv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/9cuH2hqcPY9RgmVdSjdzNibNXVCU/AslBgUVqA0KiE=;
 b=1BsYtTVnQHILjFbVsvsdU0taRoKfIg9OjLCKyrwu4QWWBavEckiu84f0GjHl00/JrP
 8V8U2RnSm1eXNuVB3RTvvsVQmQovmZ5RE4xq84a8YMth8cbf4s7OFGxlu48NTmDKdmsJ
 tTvo0SiI5vekZjr7Z481GnYdmcop1KINnVq0qUALYnLgBAiLnK+NiNrGJJ7bhRs3l5JD
 6SmKi18BVVeBg1Kw//Tv2so6EDhRR7M51gGcSh6oJBw7EJ30h2H+pQRjnke2IaYLaXjq
 5SVKMsigojKalM+D9Ih1wGVxoUZunudAVol2eng2DLita8xexgEVurNpWaI/V82KDCXz
 +lxg==
X-Gm-Message-State: AOAM531/DHoWIIg4aKRvAJln27t8Kbc9zFKFq2qCgY1PVOA3AYmI/Dc1
 wtjrpAyzIR6JfWoxunku0/T9pZoez6AfsIDt
X-Google-Smtp-Source: ABdhPJzYtuPA8oSgmGlwG9S5bVIclZc3BkrtC+bldziXWaWEYKpHrTLyPavchZTselI9AtrrpXqOwA==
X-Received: by 2002:a17:90b:2252:: with SMTP id
 hk18mr22025237pjb.36.1639123054828; 
 Thu, 09 Dec 2021 23:57:34 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:57:34 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 04/77] target/riscv: rvv-1.0: set mstatus.SD bit if
 mstatus.VS is dirty
Date: Fri, 10 Dec 2021 15:55:50 +0800
Message-Id: <20211210075704.23951-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
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
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9b5bd5d7b4..bb500afdeb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -502,6 +502,7 @@ static RISCVException read_mhartid(CPURISCVState *env, int csrno,
 static uint64_t add_status_sd(RISCVMXL xl, uint64_t status)
 {
     if ((status & MSTATUS_FS) == MSTATUS_FS ||
+        (status & MSTATUS_VS) == MSTATUS_VS ||
         (status & MSTATUS_XS) == MSTATUS_XS) {
         switch (xl) {
         case MXL_RV32:
-- 
2.31.1


