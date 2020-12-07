Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663992D09F1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 06:16:28 +0100 (CET)
Received: from localhost ([::1]:55708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km8st-0003lP-75
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 00:16:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1km8qW-0002Mh-Ps
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 00:14:01 -0500
Received: from relay3.mymailcheap.com ([217.182.66.161]:58117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1km8qU-0004ja-5B
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 00:13:59 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id 117DF3F15F;
 Mon,  7 Dec 2020 06:13:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 5814A2A379;
 Mon,  7 Dec 2020 00:13:54 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1607318034;
 bh=BWTxsP5z1TJkKWcGgpqEXmN5Vzwa5UfJpw4obGS0fL0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LuAiqM1blrUXnpmQUwc77HYdSQDOp5qEyXZ+pT0vvWF2FgNNkS2HUU6ywtWTueE2r
 g9nDNv7cr3HJhCRIPdz08BF0LZJNLHec1HtpwdkFZG8iYwnbb7HTlizyXnCoePPaV+
 Jbjmb+L3tFtk1ePGCTWXr/s/nFmSWlbHlrjvshYE=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MHGKVR2VqhCR; Mon,  7 Dec 2020 00:13:52 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Mon,  7 Dec 2020 00:13:52 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id D25DD41F2F;
 Mon,  7 Dec 2020 05:13:50 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="tO/2DsKx"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id D193F41F2F;
 Mon,  7 Dec 2020 05:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1607318024;
 bh=BWTxsP5z1TJkKWcGgpqEXmN5Vzwa5UfJpw4obGS0fL0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tO/2DsKxoS0cmxPbBd+gZhdNO0FwXbnx2m3dn5Z2s2b+R8mxQPbaQm46TKoIKgMUA
 oJyfP0id85qj8KhtsN/wO7KVIB0y2SlqieQj6XAcf/Ad2K1DL81NSYhCmSHrGW9TAK
 sjuDsye11bWsatAY8DLyiKPUn4tjfKBTgV1n3fP0=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] hw/mips/addr: Add translation helpers for KSEG1
Date: Mon,  7 Dec 2020 13:13:35 +0800
Message-Id: <20201207051335.4758-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207050231.2712-1-jiaxun.yang@flygoat.com>
References: <20201207050231.2712-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D25DD41F2F
X-Spamd-Result: default: False [4.90 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 R_SPF_SOFTFAIL(0.00)[~all]; RCPT_COUNT_FIVE(0.00)[5];
 ML_SERVERS(-3.10)[148.251.23.173];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Received-SPF: pass client-ip=217.182.66.161;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay3.mymailcheap.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: chenhuacai@kernel.org, f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's useful for bootloader to do IO opreations.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/addr.c            | 11 +++++++++++
 include/hw/mips/cpudevs.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/hw/mips/addr.c b/hw/mips/addr.c
index 2f138fe1ea..9d21cc2eb0 100644
--- a/hw/mips/addr.c
+++ b/hw/mips/addr.c
@@ -35,6 +35,17 @@ uint64_t cpu_mips_phys_to_kseg0(void *opaque, uint64_t addr)
     return addr | ~0x7fffffffll;
 }
 
+uint64_t cpu_mips_kseg1_to_phys(void *opaque, uint64_t addr)
+{
+    return addr & 0x1fffffffll;
+}
+
+uint64_t cpu_mips_phys_to_kseg1(void *opaque, uint64_t addr)
+{
+    return (addr & 0x1fffffffll) | 0xffffffffa0000000ll;
+}
+
+
 uint64_t cpu_mips_kvm_um_phys_to_kseg0(void *opaque, uint64_t addr)
 {
     return addr | 0x40000000ll;
diff --git a/include/hw/mips/cpudevs.h b/include/hw/mips/cpudevs.h
index 0b3e060c95..048767db67 100644
--- a/include/hw/mips/cpudevs.h
+++ b/include/hw/mips/cpudevs.h
@@ -8,6 +8,8 @@
 /* addr.c */
 uint64_t cpu_mips_kseg0_to_phys(void *opaque, uint64_t addr);
 uint64_t cpu_mips_phys_to_kseg0(void *opaque, uint64_t addr);
+uint64_t cpu_mips_kseg1_to_phys(void *opaque, uint64_t addr);
+uint64_t cpu_mips_phys_to_kseg1(void *opaque, uint64_t addr);
 uint64_t cpu_mips_kvm_um_phys_to_kseg0(void *opaque, uint64_t addr);
 bool mips_um_ksegs_enabled(void);
 void mips_um_ksegs_enable(void);
-- 
2.29.2

