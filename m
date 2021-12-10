Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4C546FCC4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:31:58 +0100 (CET)
Received: from localhost ([::1]:43056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbJt-00019t-Ov
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:31:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvano-0005yp-Kc
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:58:48 -0500
Received: from [2607:f8b0:4864:20::42b] (port=41679
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanm-0006s5-H2
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:58:48 -0500
Received: by mail-pf1-x42b.google.com with SMTP id g19so7770097pfb.8
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=psnTdQQJlLhjeyFOG5kFcY75ahQs7c0yD26P9q7b4PA=;
 b=A8rOgIzxGdEzIcWmmDnJKMUzRioYXY8pSsh2gnmvgmynk9opbnfTDykkSbjr2sb+3m
 J/6vWWLs5VENTFeSPLlVJi1jecH1j+m0enUN4JsH2kWMOVi9/dMEI4c5e3VLluPsdRTQ
 ZDp4WmAMT1PR9xqEqK9z1ouvwrjwWTCNvumd2+wpSSZUKoSiuXwoqp4STnDilXMlypaK
 UsTvYRhconn5BGJjN6Cnnv0b55+rVOxD+1Yh5aOgHkfH3him6YvWNH/kC2u1vcGn7IWj
 h/Ffd89km7ZSnRm21U+lWhdy3Ri0LpJzm31V7oHWI+czEjDX2sKmqKe2X/H1p4sLRe3C
 CELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=psnTdQQJlLhjeyFOG5kFcY75ahQs7c0yD26P9q7b4PA=;
 b=m6/VhEb/e4ZNmd4c57Ij+FeaOZSFeZmAdbTqm/Is0b7xA6HiSbDLcSVLMrJX5Fx2F9
 o18IwbcVmWlyKnSI9waMK68LCMjQcy5Jbbl9YHNmDqhII1mgj309iwlXR3JmflR10LDu
 obwBT/+WZAAWcWy0Y8dxh26kelJwJkCLmDRrK007hLJy54d4Zwpk6zbEPSne1IJKJwpd
 qsA++5+4du2IO2f2NJ/jSjlkF3gPlhcei/u6xQOqGH80kJild0+eZT5862Ng0gfJnzUk
 kb5QV8wGYsZ5Bis6xQIZwGRQoueBP3u8nTaneqCbCgnYvP09LA2ntd1o3WdwFqbS3EdX
 ORbA==
X-Gm-Message-State: AOAM531yTUr/t3ygByZudjSofoelTZzAOaKFn2XWgAWYOga55tpw0wtZ
 vV3Hc78BzduPxRxEzEJO/txYKDw0HmIMLiEo
X-Google-Smtp-Source: ABdhPJymR2v61FgufdDVLz4SGKI+O5wdCKIpAUogz8LobHJtkSeodNIabPr/URwjFmUl4lcHTH9/AQ==
X-Received: by 2002:aa7:8717:0:b0:4a2:967c:96b with SMTP id
 b23-20020aa78717000000b004a2967c096bmr16721013pfo.14.1639123125129; 
 Thu, 09 Dec 2021 23:58:45 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 28/77] target/riscv: rvv-1.0: floating-point classify
 instructions
Date: Fri, 10 Dec 2021 15:56:14 +0800
Message-Id: <20211210075704.23951-29-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42b.google.com
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
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 92a0e6fe51..f61eaf7c6b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -586,7 +586,7 @@ vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
 vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
-vfclass_v       100011 . ..... 10000 001 ..... 1010111 @r2_vm
+vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
 vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
-- 
2.31.1


