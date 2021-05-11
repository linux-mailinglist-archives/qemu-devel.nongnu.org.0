Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA61437A486
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:24:41 +0200 (CEST)
Received: from localhost ([::1]:38878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPZA-0006Bk-WB
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVB-0008MO-Dg
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:36 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPUz-0006V6-8D
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728419; x=1652264419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a4yEU+4TjBk6Oe2/N0wvc5JGnBHXRW0rnny396yYmb0=;
 b=NV/zKNhMS0peoJCjgo5ysSUEM8DE/+f/WiggbxMwvSDq3kSidlnGivRR
 wDG8CIvWNaw0BdzzStkcCjVDwsNqULahqFFG5VlBNNyF4UCOhJwSkDY58
 tA/YQu0/bfIqaQyyPymImK/hV42mzQgc9TgwUQN1pC2lIjJPiLFTygntC
 UIvd83hT+WBy7GthWwjmeAvNZ6GVeie8y/BxwV0yHrcNGCGhahUCRXxAw
 a7+sKMzSaZ7VWQWtUUG7Hw1glQnwqgA70Gx8E3NAyJLHoV7/wjabPmu58
 UvzsJLiwOvko9Bl0YL0/3kBTZpaTA9WjCm4BTS+NU4kQPAfQvWWT0vKJh Q==;
IronPort-SDR: KFM7E6+qOX//7v0AV3QK212Hm4wUbvyaCy72/cmWG6c9XV1KjJof1nXrJiRfhu0dJKZYza/86Q
 tY/w4Zn2oRzGpdWKtTuvOYJ5BDqCI01dzu82tQ+/TBT+lJWQnACNqtl7dwSbRyGREz+T4rVdkE
 XKtdheC4Nr7a/k2qEZpS2wOXKO6nsmXTGJWtirEqZNPwcVY3ABiCT2WLEnb1qm8UXwJvm4nNEm
 hTA2oCJx7OuyNJ9r+uN8czonlTQXTtsijBA6t9P3ijqqxB3m2lNzgBh0exmBDe2CtnWovajRwj
 v0w=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735349"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:20:11 +0800
IronPort-SDR: r7jlDX/sPDeD77lDx2HWQSs01vvnsJ5+gUTzK0SGqoqLV+ieLtyx/GMAXg/9AOTlyIYlUUZAsj
 Uk4jGiaKckipR4+/yHqOhdNuclSs8pjBtp4jka5G4WrCss13bMKyvlyEqmi1rurhHI67laYksL
 fVZJ2yyxZlwdSQ/aCdC9CXYRJ/Qd0nX3iz8fcV44+Lb1cq1pboXmkcxdhV2C3L5uXHGtDMmifU
 1YI9BBYNg1NP0En06sktv8p7b7WsHaOyXsA584XCUK4JD4spBaGU67Mx/ERmVGHHYQkxZKFS3o
 298clPrBEy+TOcCIl2mu6CWp
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:00:11 -0700
IronPort-SDR: RDBRjENb0YHgeu+gnKeLfPrcTuo/wJ1ZhDe7ddC+SJc9KUAe0zCefCEUDxo3kNcARlpmLki4Ap
 yGC2PYfgFbZB0/5i+9caCY2d9r04d2uMcqe6/OBRwuC5lAw+hXS3ramPuwWXfSd6kApLz114ln
 djimbuYJGdSVKH6i3lRc2BEKL1cy/6fegsSazlvbkWN5hCTqLZtOBAesuV3tPllnAqCKY770SM
 J1XzgoxJf+QDdMOCHDfmr1830gRiCQ4gR7/LkT6uUxQns/ciiPZvXOenm9SaXVbEnZcYsu1SAk
 dUw=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:20:09 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 03/42] target/riscv: Align the data type of reset vector
 address
Date: Tue, 11 May 2021 20:19:12 +1000
Message-Id: <20210511101951.165287-4-alistair.francis@wdc.com>
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
Cc: Dylan Jhong <dylan@andestech.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Ruinland ChuanTzu Tsai <ruinland@andestech.com>, alistair23@gmail.com,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dylan Jhong <dylan@andestech.com>

Use target_ulong to instead of uint64_t on reset vector address
to adapt on both 32/64 machine.

Signed-off-by: Dylan Jhong <dylan@andestech.com>
Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210329034801.22667-1-dylan@andestech.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 86e7dbeb20..047d6344fe 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -137,7 +137,7 @@ static void set_feature(CPURISCVState *env, int feature)
     env->features |= (1ULL << feature);
 }
 
-static void set_resetvec(CPURISCVState *env, int resetvec)
+static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
 {
 #ifndef CONFIG_USER_ONLY
     env->resetvec = resetvec;
-- 
2.31.1


