Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C9F297385
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 18:23:48 +0200 (CEST)
Received: from localhost ([::1]:49780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVzr1-0004W6-P9
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 12:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=558518344=alistair.francis@wdc.com>)
 id 1kVzFA-00021a-KO; Fri, 23 Oct 2020 11:44:42 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:6152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=558518344=alistair.francis@wdc.com>)
 id 1kVzF8-0003gM-Sd; Fri, 23 Oct 2020 11:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603467879; x=1635003879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BUW2O3MQzdbWJXlqLo0/WE3+BwAoJgBRDfL3DEvuyg4=;
 b=i3Z7GomTiSermdqZNNGc7BoGFIs9KobiDyM08pY18dh4LrbgQ6SuSCNk
 WpzWrExUPo8v7Q9pvnv+urB9dBZIyQn+d3h1b7BDd0AqXcwNV+gM1NMO8
 qI62YnsLQ93JJtjL7NLjZaFnMmOmQ3ucHPcQGaceEHzI/NIw1IMGpISam
 5oGsmJfWc618xnqyqfpsMuO6Ye7eYJcSOtjTw+4E/y32TN9y6N3F+cTRm
 GO4Ek61fXkZGhT3NZw6jeSDbJOKehau3aghYyhdHNRi2Syj1gLRVO+fAY
 Cv1+XehEFEjZ6riOajd9vrUDZWttZOktLcAjMMsA4XW1MikdyIEL0LdKy A==;
IronPort-SDR: 4jtoasyk9ithrbxQ33pELpXo/6cPoupWf61WUhJX6Pghm1k377LvOtfsboekUV3iyjDzoV5Tpk
 qXd/gzY+ARgxS01NlUAGY6hIAkRQJ901n34UWpuYlIlxE/4fMEiiW5fn/HzqDWWPIMY8oBnFk5
 4ORYl4DWQCMfktMAkkYx3I1N27UmtxYDqqpJ3MPzBM9qEZd0pB1+79828e0+VpVnIzO3fANs0U
 rRSZfSvi9xVTtNZ3coo9mD5EsKzlWt70GRNSj822+Vkwh2avey22Vs5e3FZCrXuHQZUi4hyOHd
 NbQ=
X-IronPort-AV: E=Sophos;i="5.77,408,1596470400"; d="scan'208";a="151960147"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Oct 2020 23:44:37 +0800
IronPort-SDR: C9jmEFCbWytfRAtiWbMH2oYXsaYTpsKS2RGqM4IoARnpU5ULSHZYi9v6v/qENur2TVMwwRQyQm
 Mg3va/E5NHpgsIHG4BCstCNBQcQPZ9Q4OWN4vuOm9cEztyJD0pl3hGOINdvK3O5H+GL3uGs2TJ
 XfD2oEKoqWdmLboojqZI0MAEzsejDkzz1O11ayfuu4N596BGl0TxScVwB7uLt4st1abNtz7mU2
 nm9KOZhtgsY29DaKGY7AYFAMr5NX2Ppq+trcbK1tbD721caL3JRRMxc/8B240AeGCdsEotsAGh
 WbhRjyBuPD45NWzlXUUP201z
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 08:30:59 -0700
IronPort-SDR: rvdmG/UKbkExbWsfhTm88Wmvrasv4I/baScGhpc4uvcAk9clQYnfuA8pSU6SDXhVhx4M5hqLAM
 VpGo8GfmcAYw9aAm00EhMnpghFyg6oHMbPOSBrzOtx38GzjMqyynN1wyLTYhYkyMsWSv1nDmD7
 CsUm0dXUiYcnwhFUpu7hoYJK3cPUa7y3iVKOHfAH8mfdVEg5zHGnpiHidSjYgDaODLfPd21a7d
 9SYO+2nX6XYlZEzgOQ8wOrMzeq/N23HLBZzVjqah/EqZTCDUsBgJOCuXDn37p3vg4evfy7CDpu
 0PQ=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.60.46])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Oct 2020 08:44:37 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v1 01/16] target/riscv: Add a TYPE_RISCV_CPU_BASE CPU
Date: Fri, 23 Oct 2020 08:33:16 -0700
Message-Id: <67626d271ea0b75a3c5479f3aaf07c565b1d1d83.1603467169.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1603467169.git.alistair.francis@wdc.com>
References: <cover.1603467169.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=558518344=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 11:44:34
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
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
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de4705bb57..74a236d4bc 100644
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
2.28.0


