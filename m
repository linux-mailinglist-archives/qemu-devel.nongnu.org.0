Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F52B201922
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 19:14:24 +0200 (CEST)
Received: from localhost ([::1]:56010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmKat-000057-Ko
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 13:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4324eb4de=alistair.francis@wdc.com>)
 id 1jmKUd-0001Nl-7f
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 13:07:55 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:24435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4324eb4de=alistair.francis@wdc.com>)
 id 1jmKUb-0004Ps-7c
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 13:07:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1592586489; x=1624122489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3BNyEnS/wqJC6Kgxw6ca4gmdTiZrgKGEhDv3YvYD+r0=;
 b=QAgu3rlzcu+5BjNjBp4wVvqVJDyDDNnMwe5xMmBU5c2fSncI9XbV8Qq9
 HnslRy35W8/dffqxXW/unHBTMJVLhOYzJgJYQLOLW1/yNTIxXwSLyZudJ
 MEa1fwx6j9Yq7RM6oHQP/0o+ft3unCU2IXkQUq7d8Xr9uSITIJ3Yl/2j6
 eSYpqx89Za0C9EQC2qhqE8+LC7uURMibhK0PIqv4HmKENu0vwdqXJNtzt
 eKcZ2pQc8LZL8cGL/uk/5wY2wuDhSFzuSdUEPJYMehibfHWqPycIGv2eH
 1SCr2yk79evru8fCwo7a5CxO/+ru/q1xOIOVHxu1UBOBPLF+ZkR22ynZB A==;
IronPort-SDR: 27pWBI0J4FXazzkZzEoA4h/q35kuQqTE/fwX3gVqBgruTnrkOFhjbABSCMLbPaq4H41rxHehSG
 00L07rMl50cUYqZGFE0x7j5xna3GgkwjsR/xMmHJie4AZOGEe+P3gO5s3xnLDBHDPPIA9vpSW8
 E9M9Ynuqoispfa6yz+QkjCi3k3dU5cMnAhXD2jYqU9eJiN1yBNm/aNkmGpOrioxsG/JkpypFSL
 KGx1Z/xaztaXbAYV1gHN2E6P53dStfntgFrfJDFwA18T9DRDJ1ZAzkunSrtdS3e0mHWoHPvZqj
 US8=
X-IronPort-AV: E=Sophos;i="5.75,256,1589212800"; d="scan'208";a="243417017"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2020 01:07:30 +0800
IronPort-SDR: VYkmsg4snV6szQ/K9Zcc398bCjNFX7viu1Wk1YpTo1/f82364xPkHwing2G9WDRDc1jVAYcQFr
 M70VTL9LhkXbf/JhaEqicaOgSIAtYBfzM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 09:56:05 -0700
IronPort-SDR: OpeClm3pfqXOOErKkYP22v42QvPEWXCLuM6q/08jhyccUAsEK85kOPKZCagmwCLpWFHKnUesXC
 nCTx8LcZXibg==
WDCIronportException: Internal
Received: from unknown (HELO risc6-mainframe.hgst.com) ([10.86.58.142])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Jun 2020 10:07:28 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 27/32] hw/riscv: sifive_u: Add a new property msel for MSEL
 pin state
Date: Fri, 19 Jun 2020 09:58:12 -0700
Message-Id: <20200619165817.4144200-28-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619165817.4144200-1-alistair.francis@wdc.com>
References: <20200619165817.4144200-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=4324eb4de=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 13:07:24
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

On SiFive FU540 SoC, the value stored at physical address 0x1000
stores the MSEL pin state that is used to control the next boot
location that ROM codes jump to.

Add a new property msel to sifive_u machine for this.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 1591625864-31494-12-git-send-email-bmeng.cn@gmail.com
Message-Id: <1591625864-31494-12-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/sifive_u.h | 1 +
 hw/riscv/sifive_u.c         | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index b1399a90a6..f6d10ebfb6 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -63,6 +63,7 @@ typedef struct SiFiveUState {
     int fdt_size;
 
     bool start_in_flash;
+    uint32_t msel;
     uint32_t serial;
 } SiFiveUState;
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 6dac662910..b04be42167 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -504,6 +504,13 @@ static void sifive_u_machine_instance_init(Object *obj)
                                     "Set on to tell QEMU's ROM to jump to "
                                     "flash. Otherwise QEMU will jump to DRAM");
 
+    s->msel = 0;
+    object_property_add(obj, "msel", "uint32",
+                        sifive_u_machine_get_uint32_prop,
+                        sifive_u_machine_set_uint32_prop, NULL, &s->msel);
+    object_property_set_description(obj, "msel",
+                                    "Mode Select (MSEL[3:0]) pin state");
+
     s->serial = OTP_SERIAL;
     object_property_add(obj, "serial", "uint32",
                         sifive_u_machine_get_uint32_prop,
-- 
2.27.0


