Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3FB372314
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:40:59 +0200 (CEST)
Received: from localhost ([::1]:55072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhFK-0006E5-Bh
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgrr-000766-A1
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:44 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgre-0000ID-6i
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080190; x=1651616190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k8AB1GhaTYWteYEraUA7OHerw//cTNnk2vKdIJFK9EI=;
 b=K2OVuXzC0dt2VWxgDbbH8MJcm35VYzDr7a3kmeL8u2sfL+Vcd9dpfX9O
 qU5hEagyMhTlSjXIpmimW9odOcr9M+hgKhkbzPOM6UTXgHxoO7hOARK1n
 vpnuVCR6n8pktItY9B/G1O3bO+0aYcgWyznHbr6qOHeiFs3uVNyJCO48I
 sUbpNQebAKinMh4WCQhmmQsjTwuo5+co4hoafM9EyBGjK64xuuwsrGDMo
 d4y/fvKcXsp5bNphzFl6R4l/GG7gLBORFCtv0Vi/63sdCiLN4E9YnRUvp
 sGyjLoxj5IPk4ACp0m9/e73gO5wQErBjIKMcPDQwpbZtAjfhXzhyMZVc3 Q==;
IronPort-SDR: XoLrALefcUbb4hHjPr4xUBg3pvanDjNSTde3pdiLFH7MRbHE7EEdiRz6IFcGi8A4jb+eMUfyOV
 3II8LIfzTmkeniyMDuaIKiG5EDMmC46jsz8ppeI5TW7JA/GFy+YLCJUjtHWipPDnq3lJXr7i26
 hT5Da/tCPrL7BHxUcg+UqvayhZKGkAEmgReIhn/4JxFIWXfdIQwffAbmzTbA91SrynSOjgw0Du
 d8sV/9WxYzs40bE9uRMkA0NVnikpbRyidmkRO+rlOvflUwrJUP+hm7yfcJUiWjfOt8Ddt1fNo7
 3D4=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114712"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:44 +0800
IronPort-SDR: SBeLuzx0yF8liXh4BXyh67rOiQZDQ8qzJQDiv5kse1qSprvx+2hX0nQ0rPh+/sOirFnfJgiCd0
 9pKpSI/yzaYilB4JZ4cwzpKSYbXo59aQ8aGXhtR5HmkZVz7HF0SW4MsNhSAQIueJa/rVuFWgI6
 +wygyTVr/cJqIPNPteNLDhe0NhrNskY0LQU2tAsc1KdyfvgyRnSz0xuCOzWHkkup7HaUxdt59e
 NXVZiJmJHHKxqdOxWX7n2y0WocyGlfdziOscLhHtiUbebMwdlw4NkOmmEKZspquEEyw6X16yAk
 9WTpNKiiP9tn6bk2ryopMDhg
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:56 -0700
IronPort-SDR: hAAcGt5y5gmIKbIE2YjJk03LT1cyfxKc6mFJ5+42r3rLw1vxkHVqZoYSvyaKah/7pHwNTDu9tM
 LvlRxqo4Wc9S8l8hhx1VLgQaIqqNvLZTvOiRqrHjh2ZIIlyGFEAqpAUMYZSq1czYaqpGZEdqhw
 JeX35OtqwHAo+MtF9DQC76LsmfahFBIherm+ADLvLFueHlxwu+DvwF17LJ/YmFYgV2QR99L6SO
 Gas9IhMIFvCgJNB9IS8i4YeJ/P83HJTAJXMRBVLtVNMoxsALxtW+m/07+4ZBA0aVlHrNDCJnhC
 Iag=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:42 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 38/42] target/riscv: Remove the unused HSTATUS_WPRI macro
Date: Tue,  4 May 2021 08:13:23 +1000
Message-Id: <20210503221327.3068768-39-alistair.francis@wdc.com>
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
Message-id: e095b57af0d419c8ed822958f04dfc732d7beb7e.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/cpu_bits.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index d98f3bc8bc..52640e6856 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -396,12 +396,6 @@
 #define HSTATUS32_WPRI       0xFF8FF87E
 #define HSTATUS64_WPRI       0xFFFFFFFFFF8FF87EULL
 
-#if defined(TARGET_RISCV32)
-#define HSTATUS_WPRI HSTATUS32_WPRI
-#elif defined(TARGET_RISCV64)
-#define HSTATUS_WPRI HSTATUS64_WPRI
-#endif
-
 #define HCOUNTEREN_CY        (1 << 0)
 #define HCOUNTEREN_TM        (1 << 1)
 #define HCOUNTEREN_IR        (1 << 2)
-- 
2.31.1


