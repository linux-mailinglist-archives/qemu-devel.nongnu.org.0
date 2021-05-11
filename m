Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC9037A4C6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:42:14 +0200 (CEST)
Received: from localhost ([::1]:56852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPq8-0004Mu-TL
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXO-0002v1-OZ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:50 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXC-0006V6-2t
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728557; x=1652264557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BXqWpLcc7+g4pGC4+WkIHTkL2rsoYwibHzP3HV8BwNI=;
 b=I97vRjWNxF7DRgmuKBsNt9WeDd5XpENdraCkHePkmPl/84wzqr2DMDUK
 51NK/L+BlFai+rAGc/Ew3iB6KrKHXNmrmdPosfzViD6bblMWHlADA0cnH
 dR9tK7gjjihCT1lhlC3YTeQxls5IbybKrfDvFAXuxbtGREQu1cfqt79TX
 QHXFzTsEL2QtZ6PWf8WKtLWQpwILOz2tOMzgyzuOsxF8mkNqcBRo9Ys24
 8HPXbSoGd6fjIL1WbraE7Cjzkwct7D4po+/vFK2oUFoWxJf1mV40JvYPa
 0gg2EvPE0A36LBPdy+DJcFZ8H6/vhfn55kudLNY4mza4Jf6Jn7cL0CxVD A==;
IronPort-SDR: rHOeiRA1r4DngoasLF1NfbQrWzEeDME9qUcmQ7efsCfDAx2KHilfgm/trITpzlOBAMGTdcFFw+
 zmsvG1Nvi2uEFNDMQXlYfZAoefggI0F4mKNra2kgLqBG3LX+86x1sMkKIwBvJWMrabU0TqPqmS
 waY7q2edaL5cMjQzLSAWmvfnjbW6ejQcGT/6FLgoRn/RW/ZBp6WXFw2eKWjbs5j38jKY1gqr+y
 BEOEk3rKfPKugnWIpzaQExiW3ol8Lrvg/GN0QbyRMhRP3zYmgTl5CpiBZMQxLKQpBOLB6hamAs
 cXc=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735488"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:46 +0800
IronPort-SDR: 6KeNZG5oAkD2FEdUcbpyJaxOFE/lTkkRxvj6sfM4nOEGltey6hgl/+AsAO2uBS5yGzYKoHEj5W
 i2fJWjBNPOzwSsZQfH2PaY9jt+OVCaFRzQ/t8tr5B9EzzPVLrazJ9OFYEF5NENiBeKVhmuGQXu
 9o3ITJ0gmDSTthkhxsgCFWceGDYUSum+BySqGgfoutGfNuTf4YzE9A0N8kHf93ofsTXdNXYB4I
 K12ajWMiedSpH1bHGdhs0YMy3+awTWl9W7Vs7xKbO4IGwz+Vg/oLiD11PmS01KTg5bUnxR86Ru
 9FhQP0m0ijC9g+YilShKqDJy
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:46 -0700
IronPort-SDR: hCdulifEmpLkYiWlYasedUcLJX4NZu37oaIw9ORlTbJxhku5N0EGBJ5Ubef9b8TuD62LtbyqD/
 CwNL/36UufPN4STnTByCQNyb42xyquRcGkSXZPg8Z0j6Ipm4wR58ZpH6Hl10IN5OliKeW16UvB
 1g/7670TST7rX0XcPV66iBBdwMwX/FjSUP94xsubrcrMfimJinSVoUCG3MmLPVAzb9k2a+trQC
 XIJTcRX/cAYh/OmICUd8D4m0j0a/4xFtXEkNg2y0z9/DrM3ncktBmSmJtZNVazxAWWE86f87Tp
 eiI=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:45 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 32/42] target/riscv: fix a typo with interrupt names
Date: Tue, 11 May 2021 20:19:41 +1000
Message-Id: <20210511101951.165287-33-alistair.francis@wdc.com>
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org, Emmanuel Blot <emmanuel.blot@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emmanuel Blot <emmanuel.blot@sifive.com>

Interrupt names have been swapped in 205377f8 and do not follow
IRQ_*_EXT definition order.

Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210421133236.11323-1-emmanuel.blot@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4bf6a00636..04ac03f8c9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -88,8 +88,8 @@ const char * const riscv_intr_names[] = {
     "vs_timer",
     "m_timer",
     "u_external",
+    "s_external",
     "vs_external",
-    "h_external",
     "m_external",
     "reserved",
     "reserved",
-- 
2.31.1


