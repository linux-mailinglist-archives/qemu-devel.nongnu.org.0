Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D6B374BF8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:35:21 +0200 (CEST)
Received: from localhost ([::1]:53216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leR32-0007Vz-ID
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQto-0001xN-Bo
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:48 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtm-00010n-0H
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257146; x=1651793146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k8AB1GhaTYWteYEraUA7OHerw//cTNnk2vKdIJFK9EI=;
 b=mc5/0aev3Hg77Hgj27hxY3mEMirc6rKOWdjNyq0REg8J7HJ0KX2rhX4B
 VI1ZZaqivObB+cnkos23B+dars8O/c3O7zdZVnr5m+YA9A8RzrGMo3r8F
 fTKgkOdqBQB0aQ9CSbCpOJNebLTpQz+8TAwCtatsgBvOnr/gd8AZ6lBld
 e6WOC/jGHiJx00sXcBR8vXNYxBS8wrmwXE3S3qvmsJcgGSzVZ9kgOH2cv
 UTYVLyJd4Jf9kpFShP9ChDUUiuR0Jche/hY1cLLvE2O60hrX7e9i5H/KC
 mGQ+qouwt1/6/XKE4VkMjDt8OJuMeIVC6OwUltilvVhwzF8fM9yMCBW1T A==;
IronPort-SDR: jp7gqGyNo/NyiM0jHi0sr35Q4BMk8se83ZiwIapWYPaWqczLL6vEl0309c6rbSMnxlRvYv12Hu
 ucolCcOAh8ETCNUXIWw4Gidjq+mvXBGG3LJJn9IuxGdpJs85eo52DLTycbm2R0Cz750kPg1wkz
 nKMU5ZKtd//7G27jce9Y0JSKmEC9IBcWhWpvLa3Rj+wxIObz1t31ozpsIvHR8yd5kMBS7FnkeT
 QgBJCy/7FCv1e281xBjRaCDRz1ConAhDVsMTh9vTEdM4HYA0VY9ca0YOtgetRpbBWrRufYUC43
 c6Q=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166586029"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:25:26 +0800
IronPort-SDR: zlvGoCPhNJNAVweqIR5JO05MvvVKFya1k1IfT1jHjJMuXNO4zmCs+4hpBXZ0va2BhteLI6UW4e
 mgi8Q4tr47HUQRyVADsyWiCsZgL5FaZ2j6Fd1Al1djaW70ElARGKuoHWP80/A35uPsT6AO+uGY
 7JXHTjtJTsLcuZx35JZHUERLRqJWqQRrsTp6q6HLI0UkgugOJ4gNemGB2mX0r3hD10EvV+aP9S
 6hAeiDFkH3tu/WGpUc0fdAdkpWi3L8VtV9o3nFVesJav9kYTaWfnCbqiFZHf/ou2LuTw4sKkRD
 GTj13B9CIVSTGxvCQ0T2WlxH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:04:07 -0700
IronPort-SDR: 5qqj5U3QybXrMeeKIrXXLwzmkULr0eJA5g1+Fe1PPF4ReqTNm+m7K38kFdJfUHmGimDuGKSHGz
 6+4an3JDMjTZi2lwUQDnNr+MW+ZLkGRS87A9NIaT4cfJipzgTZ0CsQ9aeLtpChv5LdaH7mJwJ1
 I/3JM5f8MWjA3c0J8o+ZDHvQ1FS0NJG8d7LI40EkvZn51KJ3PUHagbFHmtpV0jKLI/4P99fE5G
 Lz0Oyd7YV6K1n+MHa0a+48zE/14cedfvFaLf1olYQLMBuoq3X4UnM3085YMr+8i+IOQho8tVPp
 yFs=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:25:24 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 38/42] target/riscv: Remove the unused HSTATUS_WPRI macro
Date: Thu,  6 May 2021 09:23:08 +1000
Message-Id: <20210505232312.4175486-39-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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


