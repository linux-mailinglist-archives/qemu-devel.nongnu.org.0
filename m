Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C96C201924
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 19:15:17 +0200 (CEST)
Received: from localhost ([::1]:32864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmKbk-0002gf-Gq
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 13:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4324eb4de=alistair.francis@wdc.com>)
 id 1jmKUH-0000mH-JT
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 13:07:34 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:19141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4324eb4de=alistair.francis@wdc.com>)
 id 1jmKUE-0004Pg-Pd
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 13:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1592586450; x=1624122450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pxVyDAhQ8bumskxZPWWUD2L/widqjE3TyqKlh9liO+U=;
 b=HSZA0iEBpZs640potEO5cWs8TBKs/HOCRWZQP7fBOPMQfxf4LdDiFUng
 ytBzdCQHI4dEFruQLGhr/ZoCLfsgxT0UTy8UTa1C13P9AHSlD33oFvKLQ
 f2VzwLTNATi5UX34aNkN0pb2CsEIk8Cf/5lPWzYUy5/UUDzp/UovW171k
 XM1Ya7XkqXMkkvMWcRIRBxnt81JteI56YOBOLlsONlCJ7pIaOxwfOcpIM
 DoMsr/jjNslowP8ZgHmZz7zJdHSIN8U7wqeixbgLhWbWTB45/faGBvgf/
 EbC+a3zZcNIj16GuO5C5DAO8r69yiSBeJfkyoNFF6l9sWKCv4WgYQ0uB0 g==;
IronPort-SDR: HNC/iQWwRGTQPYh11Eyi7g8ral4CD6GAs2nZigswBuFT9VziUNg7zDM9frzdryFVhmsMwAKy1O
 KYVWRbC21HUCsuUgyn3OAh+RbYc9QbKmdRNVA9wgu5SLQ3xIRp3n22WoV8S/ywX3MynTdJgIN+
 JlroG0bVJZoqv0C33sFh4wsvD7zEVZ2eF9IYVhDOyDeO54QAzjl3NJvqrRXIzbzLpN7tVPicK/
 3wowZamv1N+R8zz1HpbnU0A6iGYdFZ+/+g5EhUblRU4/+OENdUcRVDPmLR0934tizBIYdR5HJ/
 DNc=
X-IronPort-AV: E=Sophos;i="5.75,256,1589212800"; d="scan'208";a="144763315"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2020 01:07:22 +0800
IronPort-SDR: aJth/n0C5p7M16ossfwrWPVI2bokLW97MXr+x41TAGKllcwbMweBOvyFVXRKKCHGHq30wDrzR+
 lAdpX8RAf5xCC0X7QaZf0J+r2gmZLUoMc=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 09:56:00 -0700
IronPort-SDR: 4LThq1gMuUwK6x6GWk2VeDZF8defDPcGlKgDwClSY7lxxpFfIWZu89Z/EyXIuYHBG3K5r0E/dH
 urQG//ltD4kA==
WDCIronportException: Internal
Received: from unknown (HELO risc6-mainframe.hgst.com) ([10.86.58.142])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Jun 2020 10:07:23 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 07/32] target/riscv: Set access as data_load when validating
 stage-2 PTEs
Date: Fri, 19 Jun 2020 09:57:52 -0700
Message-Id: <20200619165817.4144200-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619165817.4144200-1-alistair.francis@wdc.com>
References: <20200619165817.4144200-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=4324eb4de=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 13:07:21
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 62fe1ecc8f..eda7057663 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -435,7 +435,7 @@ restart:
             hwaddr vbase;
 
             /* Do the second stage translation on the base PTE address. */
-            get_physical_address(env, &vbase, &vbase_prot, base, access_type,
+            get_physical_address(env, &vbase, &vbase_prot, base, MMU_DATA_LOAD,
                                  mmu_idx, false, true);
 
             pte_addr = vbase + idx * ptesize;
-- 
2.27.0


