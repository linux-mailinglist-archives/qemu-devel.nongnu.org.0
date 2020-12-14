Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61402DA1E7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 21:46:51 +0100 (CET)
Received: from localhost ([::1]:59366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kouk6-0000ev-VU
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 15:46:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouYG-0001qI-GU; Mon, 14 Dec 2020 15:34:36 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:20005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=61015ee87=alistair.francis@wdc.com>)
 id 1kouYE-0007wB-Ib; Mon, 14 Dec 2020 15:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607978074; x=1639514074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UXfR7yx7NJcqhSL5KrvP2pJM0clSZ78wWV9a/1rBfMc=;
 b=PEvUwz5Z8E3fH1zt2h7unew6ZCuqQvl2FYcJgcxlVLAutSmFgj0QDx+N
 cwAKIOWwhDtYB72LvCNpJgDXc2SDI5fBMyprAmtLhhi11Lb0GHVlJm3Su
 oYoNFZJIYA58n5XZLfNY1saUAajSnK5nOOVouDx8TlPavGHJKcD2aojcU
 wV8dEXrWByze4USto0LFTMeW1W135hFbKKBaszcu7gXTmlaVWaSrpTu0f
 Ts3gYI8dHRG6DWdlnPdUP+XCUu/wx8tEoLvnwTTOr1T56SbEj2YIC1Cln
 wEFcMODVg9dy/1Cjt4EKYsUiITy7OmV+iN15NMC2m5TRz6Iswrl/ceYY1 w==;
IronPort-SDR: jhuMSP5tTEvzWAHa30GIEldgTjbrKYVz8kz6VTzavgnKLqhLGBJGSvq6ZuAtxvFOVYQK5NO6S9
 LBBoenoJZuA320RsZD8efZ1Be9W+rnSHZ8t7O1naePjKL7LKPj6YUgThVYVfFbzcoMPtlXKNJ3
 fSuLFd4whNjKHw/XY0zLW9u1EfoMVjZNSvOQrYbjb/6a1GKxJ7+bBE5vp8fKcTav+n/8XRThLA
 SXUlmX8JWc6R3qhKDtsKiJfu7RWDxgz+wOLDBGDl+kEQOF2RGZCbWQW0T2ocqCIKkifPw1LVd4
 Xjo=
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; d="scan'208";a="265318152"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Dec 2020 04:34:32 +0800
IronPort-SDR: 4Qs3sOZOVV/8yJVMrMnKwwYGTQY40ZnKX2tuHj9teoSFNKn3HUw0ICFFZ0yVD6VH23vrcUCMGz
 Wa0w7hp5/wfVMtScwFgZIC10eWSFf174nwEbZ/SkU/2GUxsM82tdl4i2tABadf/cvg/vINO7Wu
 tQjefA8cthVi5Lm7TuGp0EsdkE9Eaqu7OfIOCtpS36vzfUhoLca38IV+vyfcKXBTJpdcKvAA3I
 Eq/Qj2FpGiRJDdY8dg9sD6RwsbttvVTldkwKXqg1GL6B18clVRs127AnR9KncqdtD9j3mRcErh
 v+cBNoKwOkfAOGBaxDtIRpHI
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 12:19:51 -0800
IronPort-SDR: 96jXjm50mlPZ46kp5xFo+bdhbnYgnpzIp85WrkKflnH89YIbOXJFLYqH+C2PFhGdKv/VrV/7Ub
 bbxFPz8X4uzAXdG5WTkB+yRXSAq3nKuhUXLbkL4w4aVyxz3d9JnSW9Gukcj9341ZhVw7Ha7yK1
 +sfrusglpMqWbUmf5tVDcOHCWyIttUu9nIO8cj28kN4Wl+PmojKBgUxhgnxwBlK+78G4GtAsaB
 S3KY37aKh8rfe6vVKowAq31YVJK9T2JD3frLUCOIBBz8L7TyL32dOgmhUfRCAKCEcu+P3ZnWT/
 /YE=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.52])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Dec 2020 12:34:33 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 13/15] target/riscv: cpu_helper: Remove compile time XLEN
 checks
Date: Mon, 14 Dec 2020 12:34:31 -0800
Message-Id: <1d0407a7fd46da8eb17315fa9450021f13722fed.1607967113.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607967113.git.alistair.francis@wdc.com>
References: <cover.1607967113.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=61015ee87=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index a2787b1d48..1fc9273cea 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -446,11 +446,13 @@ restart:
             return TRANSLATE_PMP_FAIL;
         }
 
-#if defined(TARGET_RISCV32)
-        target_ulong pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
-#elif defined(TARGET_RISCV64)
-        target_ulong pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
-#endif
+        target_ulong pte;
+        if (riscv_cpu_is_32bit(env)) {
+            pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
+        } else {
+            pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
+        }
+
         if (res != MEMTX_OK) {
             return TRANSLATE_FAIL;
         }
-- 
2.29.2


