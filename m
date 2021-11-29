Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6F0460D9C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:45:21 +0100 (CET)
Received: from localhost ([::1]:45092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXbU-0004CL-Q9
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:45:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX2k-0003VK-FE
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:09:26 -0500
Received: from [2607:f8b0:4864:20::42b] (port=43556
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrX2i-0000rd-Vk
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:09:26 -0500
Received: by mail-pf1-x42b.google.com with SMTP id n85so15281293pfd.10
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E1ozsGpUYk5C8kuWugGPIckjkJ1AyXps0Wulk51YZ2k=;
 b=iSUEG0R8Bp8hbPAE63e/qlRmC3DElrpQUx0M1/sdhwNSITedP9jgOXsQ7ihsPogKv3
 ViNGylyOVIBEBTlYfmdpCwjz9TErIepGec4rlLu4FRMnPrwFR44n/2EpzLamxG1MiZ4m
 PGXplBLWnpzAiupiw5RpuO7gixkdmgH52nf35DSQ+y54LNpcFI2kbjVatfmPW64lglyu
 /Jm4hTX4DjBsb+Hq2iRZcppcXWrJrkY2Bd7PWtyONsuR2oxRYZyXVOS9SpX9GvVoe0jD
 Z+UPX00BBaY6IXszvALCLzI0RinU7l6RZ7x0LGOgBmQb6VgASazakReiQTRRPUfTa9h6
 EEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E1ozsGpUYk5C8kuWugGPIckjkJ1AyXps0Wulk51YZ2k=;
 b=5CCWr4LBfI++6+MtWjML/+s0GEN2fDv0vBr7G3AeT0F5w7tg2nO3Q7kSFmyyznjAcJ
 Imi6iBhlWsseM5njCdezml7dqaPRszzAKQS4N/oCY5zjqQ/l1qr8Xds4z0jxRrZQ2leD
 13dKZP6pKHfUE/xvNHMiTMRHmgMMlKVSc9MqtuU0qRW1bYNl35eonix7iavX5CDztdXt
 5dXVgYpBlZA364w8DNi+rPPext0vCGPuiH/vZ/absxRq6L+9bGP60roSFQL34/D1OyhI
 o/Y0xMTaU8eJK+5V3A8Dn2mS/YdBk/E1vISYpSuKeq4iApHgpbqTbvQWpOMMn1zLKM3q
 7f1Q==
X-Gm-Message-State: AOAM533K2y/00Nl+3u/Y2hhGxgL3+twDgwoy8wPLV63vqxqudmf4aVs5
 wsGiclUD+99rudnZtwIQ6zKD4gYTvlNZwfp2
X-Google-Smtp-Source: ABdhPJzVpD1ZObyLDHCbrhEdyzojRLoUmTz7xhfdSQ9sQRs62nckrLyMt08RNubFHmjVkE26afxFtA==
X-Received: by 2002:a05:6a00:7cc:b0:49f:9cf1:2969 with SMTP id
 n12-20020a056a0007cc00b0049f9cf12969mr36916670pfu.12.1638155363513; 
 Sun, 28 Nov 2021 19:09:23 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:09:23 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 59/77] target/riscv: rvv-1.0: floating-point min/max
 instructions
Date: Mon, 29 Nov 2021 11:03:19 +0800
Message-Id: <20211129030340.429689-60-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
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

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index aed230e1ad8..cc95b692558 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3387,28 +3387,28 @@ GEN_VEXT_V_ENV(vfsqrt_v_w, 4, 4)
 GEN_VEXT_V_ENV(vfsqrt_v_d, 8, 8)
 
 /* Vector Floating-Point MIN/MAX Instructions */
-RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minnum)
-RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minnum)
-RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minnum)
+RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minimum_number)
+RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minimum_number)
+RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minimum_number)
 GEN_VEXT_VV_ENV(vfmin_vv_h, 2, 2)
 GEN_VEXT_VV_ENV(vfmin_vv_w, 4, 4)
 GEN_VEXT_VV_ENV(vfmin_vv_d, 8, 8)
-RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minnum)
-RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minnum)
-RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minnum)
+RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minimum_number)
+RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minimum_number)
+RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minimum_number)
 GEN_VEXT_VF(vfmin_vf_h, 2, 2)
 GEN_VEXT_VF(vfmin_vf_w, 4, 4)
 GEN_VEXT_VF(vfmin_vf_d, 8, 8)
 
-RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maxnum)
-RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maxnum)
-RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maxnum)
+RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maximum_number)
+RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maximum_number)
+RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maximum_number)
 GEN_VEXT_VV_ENV(vfmax_vv_h, 2, 2)
 GEN_VEXT_VV_ENV(vfmax_vv_w, 4, 4)
 GEN_VEXT_VV_ENV(vfmax_vv_d, 8, 8)
-RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maxnum)
-RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maxnum)
-RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maxnum)
+RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maximum_number)
+RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maximum_number)
+RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maximum_number)
 GEN_VEXT_VF(vfmax_vf_h, 2, 2)
 GEN_VEXT_VF(vfmax_vf_w, 4, 4)
 GEN_VEXT_VF(vfmax_vf_d, 8, 8)
-- 
2.25.1


