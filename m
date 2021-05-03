Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF17372356
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:59:08 +0200 (CEST)
Received: from localhost ([::1]:47494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhWt-0001Tv-M5
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgrx-00078W-Jz
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:49 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgrp-0000Lb-DK
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080201; x=1651616201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PH9mV72E9bXrh9R0MkptPiiHh1DAnrn6j54hAeX+lmw=;
 b=MuxcdntBv7nmz+zjdf9yaCYyl/2n0a12FmtFUQvpGkb14w1nja4VyR8b
 YHjxOkLmlVPVvv60JmVFwO9ildghfxe9cWop87I2ta3UUcrjXB3ww3X9a
 P4KjesHCAOL4OoKp9ea27/YvRJJVZ33PmX9O7jgqUZMJazpX7McEe/85W
 G6otcaXWAEvfG7iHCaubRMLLupUfZ9zK013Iuo3DTxiVHZMWPtJ0DiTom
 FK7kAkSgljgV2fFNklXzpmXR19Eo3WpOm/o1IQ1+wrBrF5Woz9djgWC2W
 Hli+2teK66rjbKkLpfVyWJC1abnR5mgzzT/ETxZYJwBXKc4x4LEPMcbbd g==;
IronPort-SDR: AKGI2rBNvqy16hMFDEA1BctmxliqMA8/w1O/6sf24WOfPyhhcVK7ypapYNM3kN4uuSZbq0PwEc
 4yCilQGsVO5TEKPm6sbYG7uDCuMBzk233KQffThhYXdMatoZchC4K/dlG7DxVhOk2W4pOttN7A
 pbOWsnYt+izwKUPpGOhYhkilanudThTSX7djBjv6LBesRzqadA599HjaTK4XtXpbx+Pua1pgnb
 Kz8NOxqu2yERFlWd2JcbR47Nvh2rkusZg4xby1iVasXYHIH0OMlse8bUXJijK1S4OYEi92NXfD
 bzw=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114713"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:48 +0800
IronPort-SDR: Z17uqleBi9TRgV3RBokLruqTAs/o3hrksmY/maXJfglUADACw+2LUCWVzwOhgzUcdygkGqB8W4
 kUVp6FZ2bSilpT8Jav1yfrCkxtVc6aP8JMTV4LzvpRuloe7Xr8hedYbQBHSx+QBVY2rdX3uSbp
 xuZthjcuczryDRhjewwU0qbi3akL3BAlKYVagJq2ZmAwJISZh5yizskyIsZRCr4QyKZlSSAgve
 Peq2cKWaDVP1IymPNf0qNU33Xz4j3R1koOKwKPewpOMkrMtZQ5P3Tqfdz8t2fdrhKl8/QYj4XL
 xfjiM6JOAYhdHNyehpjO24j/
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:59 -0700
IronPort-SDR: P7WVLgGgKLi2qRSErX0SzLNbZks/Ed+tVcVZDoaA7+jW/+arYKN6HDBYOlD+MhqPsGfsHoQpbN
 cq7fW5Ls+jZ41JO7L5NjqGclrlM8g0O4vcSRb8y1RpcMaE3O+beWVX+Q0V2p2vT9MbZ+e5jzUI
 5q9OY+hir6WgWWeaqFMucwJlhfg8DUeVs0iYYyaBfPm/fAMsghMNuo7tRqUIDah1LfAxIbMWVm
 5qX1V3M4P5r5tPQy4zDjsY6sxWb+RVeEorfJ+gtoMBttUtOiJIovBvftsfDIPeC4WAPAlAKmSV
 iwg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:46 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 39/42] target/riscv: Remove an unused CASE_OP_32_64 macro
Date: Tue,  4 May 2021 08:13:24 +1000
Message-Id: <20210503221327.3068768-40-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 4853459564af35a6690120c74ad892f60cec35ff.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a596f80f20..a1f794ffda 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -67,12 +67,6 @@ typedef struct DisasContext {
     CPUState *cs;
 } DisasContext;
 
-#ifdef TARGET_RISCV64
-#define CASE_OP_32_64(X) case X: case glue(X, W)
-#else
-#define CASE_OP_32_64(X) case X
-#endif
-
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
 {
     return ctx->misa & ext;
-- 
2.31.1


