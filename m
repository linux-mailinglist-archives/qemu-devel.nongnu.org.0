Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD493722F7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:28:01 +0200 (CEST)
Received: from localhost ([::1]:48616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldh2m-0000OV-Hb
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqX-0005re-15
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:21 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqK-0000Lb-FR
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080108; x=1651616108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8y3Un5Hxd2E2PcjnIHIP4w4G78fYCc51KoJUltBBqoo=;
 b=kH/U3IekPzR+rzGLOkTDH+fwUjtsF8vxItk1OLC9INIuFdMLKurWfYGR
 bVRXPEO1S6JAeBpsDy7Vg5FST4otKTCmbILe0Bpm9DnIM+e35VXqKcclz
 pGj86Cqug5Exv3M+EjkWuRt5ZufMKvyXDS2TZTijIJzLI0fWF48Bj2/pD
 qWcQ+pKoyF2crXeS1ErOxe+tD8ZqmGCIFaum5UBab0meNU2haNeU1UO8l
 fX0liM4Zm3pg5NnmYJ8fxlufT0VNSzCF2BhbZgMVhIoORiMTNb0osBowc
 BmKBQM34P2BHZoXP2RS5pTNE79WRAzLmW5YrIOQk0PHVtwT8ZuGfQXq8D w==;
IronPort-SDR: xF4eJQjhJcETVvcNeBLOwM+gJ0wbII6nzs2Iq+3eORSV0GAmus5CC5rk5zoF2ycS7ezAdBtz7K
 HI0bHaTOA35hWemkPz4E08VtZv9fwfjhet+wRJHzrbHAx3v4q09ARTmhoA5VYb39FY/ye+meQP
 nYEnDJeB9KUBy/71HHz0IY24zGFJJBMkg7Qv+ty0j1i2ZvPEnlBVTb/EhGuQPVfNmFXkxmgyHn
 iKJcQr3p+g/wpybBJ0T2kf385jhZm6rlakWqFPQSvdA1pyONLTrGkEdQm0wHxQXns0bKQMNh0Q
 8Qs=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114670"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:14:49 +0800
IronPort-SDR: xCBlGIecFNx54I7VT4Du2JgiY2fky+LZYtgU3X1IIsBUGZt2IkkwGUSw3OcEHWB/EfQaneoxY5
 6CPKpY9cGrcVN6/ncNMVuhxGyJroMq0Y4TFhqpeLovTE1T7NitWKHzD/8oWWpu1SemPHEyaGrV
 U3WsjXnoeMhqds/1/d9BG88RBYUJrpIb5vmHv+jmNDYfoMGJzrmzCf6WJRa10pM59Cs386EQV7
 /HO1WxeIDrSClzlSPqp0ZQhpE/P7ozz7jlTfvGwl1fpmnsm0A08Srw+1AlniqtbyLmbFV6EvYz
 A1NiLANjwI2w0Fc4wX0jCFx/
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:00 -0700
IronPort-SDR: MRwISYcwAtNMzaU1b7cwqFi5fI1tjsp/yxlBfOD6kLpNC5yOP4CwQvHkWvp+73LYKa+Z4PDBKk
 ioD9xKdSUNpicoR9aNxf6Lj4QD06r4pK5/1wWRNjTbbyzfpv744orXfveQGOzbRt4d7RWUD0CK
 rLtZLEEZfFlp9kfnaIz3D6azocUbrCa1Bn7icihrQbQkyYO6T40RKcVpgRLjbwWKco+8oauVPn
 0/JM0NWWcV/n5DHMXE21EGkhY9WK9UvRrZQcPVtr1JWSYz8uw6O0LGfBXxXBlEh6j6UXTawsvX
 NPg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:14:46 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 21/42] target/riscv: Define ePMP mseccfg
Date: Tue,  4 May 2021 08:13:06 +1000
Message-Id: <20210503221327.3068768-22-alistair.francis@wdc.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Hou Weiying <weiying_hou@outlook.com>, qemu-devel@nongnu.org,
 Hongzheng-Li <Ethan.Lee.QNL@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Bin Meng <bmeng.cn@gmail.com>, Myriad-Dreamin <camiyoru@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hou Weiying <weiying_hou@outlook.com>

Use address 0x390 and 0x391 for the ePMP CSRs.

Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 63245b559f477a9ce6d4f930136d2d7fd7f99c78.1618812899.git.alistair.francis@wdc.com
[ Changes by AF:
 - Tidy up commit message
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu_bits.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8549d77b4f..24d89939a0 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -220,6 +220,9 @@
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
 
+/* Enhanced Physical Memory Protection (ePMP) */
+#define CSR_MSECCFG         0x390
+#define CSR_MSECCFGH        0x391
 /* Physical Memory Protection */
 #define CSR_PMPCFG0         0x3a0
 #define CSR_PMPCFG1         0x3a1
-- 
2.31.1


