Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 157552DC66F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 19:26:47 +0100 (CET)
Received: from localhost ([::1]:40318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpbVe-0001iZ-5P
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 13:26:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRZ-0005DQ-Ki; Wed, 16 Dec 2020 13:22:33 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:41986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=612374860=alistair.francis@wdc.com>)
 id 1kpbRX-0000Jv-7F; Wed, 16 Dec 2020 13:22:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608143416; x=1639679416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1FsVWvXDkzpGo7WOfcTOiZ9qIBSHe4jFzMmEKpGYgg0=;
 b=Tk+V3d/hiEPp/5pkDwnaKoH6zTXMZ9A4sRIWo6LN3RZsMjVfyvdIYt9z
 n2b5qJtEG+3jFR9Y+2sfYF9YAmspOpdku1T7h+TAB8CPLb+/D3u7bvWYL
 AZFaSCzlbrxu961/a9irJKVg/TI2wu067x5UGzxHa3Y959LRbzvTax0Bl
 diFeJVEwimYhdy0cpQ2x4S0SMUYfO4yI8GVck4fHICom444lPz0wkSimk
 U4SV3cufif9JIma7maKKP/rTxfb1BIZhsxoseH8r4OqbypiTVpPWudmxT
 Tto1qPHs7V4PfuTMhu7fAOht3AqPbGyWJ+pecwKYhZGiYFUpT/Ey/5yLB Q==;
IronPort-SDR: izNZcq/MggtTNymqyJFiXXNEU8zEdFbMSHDz64byBDSZpLYQq3AqMQmdm4GzXnAOCstJZEdH7X
 K2+CVu8Ae4TO1bGtLnqch1b6sq0JferyKA10XEo9H7vsuExm4RQA8krlqzPvuC5IO+obBhlney
 4pE8jm8KyszQlt8X47C1IYUd4wPJmOIUFiOKn+Ydppldcj6MB0DQnnurKEJp+ZZTOFTD/98UZN
 94rvWzuQtGkdgZu/q+p+aW9lsLoFG6fMCrgM0K4kzXK14LkPIESz2CQClikyByX/3GQ0FfKopT
 Gp4=
X-IronPort-AV: E=Sophos;i="5.78,425,1599494400"; d="scan'208";a="259080339"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 02:30:13 +0800
IronPort-SDR: NupsxXf8+hNHxLDPXAlakMt5sRXapV1aBReTcccceqcsvOD5hITXJNFEyeUA+iOBidf0el5sUg
 IEB+cTiI//Xka4OHb25iZRhNXUvPPBRDVNG8HlGVYzSDDKsl3S9dNUIzI9WY13KiP2x3G9Rk45
 /1H0vdK/ciIdoxB/3mQ87EDhO5e2kCgkHASlQ49KP8skZBGY7TekRYbK0CtzV6C5c4uvQljd89
 3cmRnC+7PdgCL5sih9LtyGJnbaow6AsKlgEFBcGTZLTwkUX+4ifcbQcKBNx27i1WqY0qk4/mwe
 HM6vfgiWUcjiOdNsvWZCWciv
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2020 10:06:04 -0800
IronPort-SDR: u3dl17np6lsRRmywRQuW4RFLRIKSOGCyRgXu6FCzmlS0doz1OpXqXsnVsVpSM+8mQRoa4jKQ+V
 hO5kHFRxMj4YCEKAwLqXq+VLBZYUXhMGEjxqtE6F2rCoezX9WWTogc5faRgyj8DVyPyDGdJOBp
 ENL+sL5M2DDwUctyGc+y3Bx8bGMonTVEuwA3lJITMBMLE2+j5h3Oq2IdZL+iaPpGLIElIkcQs6
 y87JXZzhpsTCnmhZEEUS1GxMVyUBw2FqvTsu45Zzt9JhBaHzrJT0E6QiUSBVcEdOR82eKUfIMJ
 FaQ=
WDCIronportException: Internal
Received: from 1996l72.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.67])
 by uls-op-cesaip01.wdc.com with ESMTP; 16 Dec 2020 10:22:30 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v4 02/16] target/riscv: Add a TYPE_RISCV_CPU_BASE CPU
Date: Wed, 16 Dec 2020 10:22:29 -0800
Message-Id: <86e5ccd9eae2f5d8c2257679c6ccf6078a5d51af.1608142916.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608142916.git.alistair.francis@wdc.com>
References: <cover.1608142916.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=612374860=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/cpu.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c0a326c843..9c064f3094 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -44,6 +44,12 @@
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
 #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
 
+#if defined(TARGET_RISCV32)
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
+#elif defined(TARGET_RISCV64)
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
+#endif
+
 #define RV32 ((target_ulong)1 << (TARGET_LONG_BITS - 2))
 #define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
 
-- 
2.29.2


