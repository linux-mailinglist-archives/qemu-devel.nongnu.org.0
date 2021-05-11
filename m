Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B948437A587
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:14:36 +0200 (CEST)
Received: from localhost ([::1]:44254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQLT-000456-RW
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXw-00044w-RK
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:24 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXu-0006V6-KP
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728602; x=1652264602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k8AB1GhaTYWteYEraUA7OHerw//cTNnk2vKdIJFK9EI=;
 b=DT1BeY1le7FTQszRkfyOQ2Fgg9sixD3OD+XlY4igGiq0SPMk40RtkLiz
 SsrxTSPlYrdgZCO8T0GNLdHfpH/TsaNG+uoC084qWG2e+s59Z+HtGQC5O
 Wqm2qdOOh8l8IwakTUwTBiV7Wr7i3kTSvzsr5sinCw5sdZON3Z2afGcrd
 2LBOVd7VZCD1Q5IWWCDn4euNYC2rdr23lS8PEW4jr7852P1oxeqntHJbr
 x9ffkDby1uzfvhPoh5P3B2qBt1+KHPK2R59T68WWTRNbLb2HcbkeZyBul
 oeHENEBq9ZFGIrkY6biwrmpfjTrrKyk982rJGx6Qwwh4OMH+qZXnc+H00 g==;
IronPort-SDR: x+p5tjWMQVwBIaITL8oogR00oh6BfNw1vVpZhX154qoj6X2pweaPZc8+yMmRbEo5hJ+Q+MNP24
 8apnxxYM+Mboz/QVwOftSHhBEW3pA1GikMYU8i0CxgeJblfbYSgMZCOZKFac06blqAIc7fOMFb
 E18LZga4tHlHUBBA56TEc6u0pvYourTA8dNFdtDFha3R+jw37Tp4GNcXwbtn694ADzFCd9/BOo
 YIWRPMc0vo1qqzVnR9d73MwlSejxgypCVxoNYqcUFoKfXpURCnXhiJr4iRie61eoPfZV+JUlCO
 ga4=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735510"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:22:05 +0800
IronPort-SDR: 9gjyxXfZ1hrvV09bTrp8C0Yd+bbfYNYYp8RFSJyIHzxnrnDVyI+HfbyXepG3Vo/C7LYbWsCrq8
 QHRw7r44/zeEEdj6SdMX6kw2IKQjhCJbzAohOSIfOxV8AYnDHSojt7beZt3hRx7n3UiJj4Znwe
 9glLJ6W2tW/m0ge/1nJ+dspZ+uJVfHmENNkNDY70ZU2xBiJ3RYEJKug0mcSAbG/XPn1o0ZF5ED
 Y0PtGbfTvFybrx0oP5B8CxFQpLm8XvDE9DrbyeUdXU5DP5oFfXSfMdHF9LveqZIEj5HSdlGmYX
 N45JViaNCzYnNvCYjF4orA1N
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:02:05 -0700
IronPort-SDR: 8WPVtrn6suEBiLsN1Uz9ewX43QQz5xR/FdjtedJHz94nUGRiGk4hNCwyD83+qhY7CiAJwDHjeN
 jI2I/bBY+kiSDm5ajbeaoXnb1695ipaZCBXWSenyFx4vs68JUEbUwYw52X4pehpRfHkt9M4B6w
 RH8zadGdNV+Kl9yTAlt77aMnGbJbYib/HuUQyI8hHwcaWocP4gAufxDprH5rvsEB1wtLLrIq5Z
 3YBmnpAOx+bWEeRnntW4nqnGQhe88Yjohdak3n4GPSb43NLzTD08/yBhyDrM0exY6/3lfrPH9U
 oGE=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:22:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 38/42] target/riscv: Remove the unused HSTATUS_WPRI macro
Date: Tue, 11 May 2021 20:19:47 +1000
Message-Id: <20210511101951.165287-39-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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


