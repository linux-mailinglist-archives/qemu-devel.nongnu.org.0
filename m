Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164C321E4B8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 02:45:59 +0200 (CEST)
Received: from localhost ([::1]:48294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv954-0002SM-09
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 20:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=457b4eeb6=alistair.francis@wdc.com>)
 id 1jv924-0006R9-UV
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 20:42:52 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:30779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=457b4eeb6=alistair.francis@wdc.com>)
 id 1jv923-0008Or-4W
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 20:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594687371; x=1626223371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rdbMHS8cLmbeV245Oiuz0IvXSLNQhNgXrF8MRQYylVw=;
 b=b7GJIDhcs8YMw67GaiyLUz952eSSX+uhoriMk+chaNOnLKlWrSYwpFWd
 iED48KOJaAKrrGKdR2Hp0bb/pBKC2Vvz6sXpwqDRNq/WKa+ccwfapyyun
 gcy31YVZqIGtOTdzjo5tA/FONOEgxbpnyB1kd/Ap8pJvzQBTJ3jDWcpCl
 llmlzid8d10P2HBUsxqVfX+v9MSO2VtWCMXDfCNkZwyu/8rdbqI2pR+5v
 +/jGqu9srpxOMSLhvCPQ5OBHwE8aSELDy1zlzlZYdMSA1BKlZhOXoQ9XN
 4jXQ4HaMkWB6cB6Wpffo4iFMYfD5zniHL9dGGO0wZ+CVvF8X49dgfezk1 Q==;
IronPort-SDR: CtOLiZ4OAWEEGb8MVTHFRIYPpM88HUR2C6DAjDuuQgsqjRd6eC6mkn0Bj8FfsbjsAS5R5zsjZF
 M0VUrbLa8izd7pwgjZoeeP+PCNf/madytUuqKjvFqiMrcwr2FVFz4msgD+kSabamjsQtAuEifD
 6sfYLHicsrb/TWgIdLNvQ/oWssBdrm1Bf6D9RvIfW9qJRtWmJnLF1mo4dppKCQJXzEWws4Pf2p
 sNH1HXUmp8+LBSXp19IxYlAo4PTAYiWeiswAgRV3ufS1EibKaniMa/fWaGdFM7PBhVklA3aZxg
 8dI=
X-IronPort-AV: E=Sophos;i="5.75,349,1589212800"; d="scan'208";a="142511932"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Jul 2020 08:42:30 +0800
IronPort-SDR: ptFCQ5ia9oyuyNBIZrq5Ptz63+bblwHPsJMqoLNW3O5a5RVkwXzMln9KxAiumlntw18sHDkzZX
 pq0o0F+sCuDgybM42IXLEk8uHRyNTvPp8=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 17:30:58 -0700
IronPort-SDR: U3IecjPL5N9SdkrU4Ftc73ZsCSkmqOcJdP75dU6djwTE8yvoD8/O20UJ501qxuz1uO+nCx+GLc
 MXrJgwdjon5g==
WDCIronportException: Internal
Received: from usa002626.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.57.178])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Jul 2020 17:42:30 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/15] target/riscv: fix vill bit index in vtype register
Date: Mon, 13 Jul 2020 17:32:50 -0700
Message-Id: <20200714003254.4044149-12-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714003254.4044149-1-alistair.francis@wdc.com>
References: <20200714003254.4044149-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=457b4eeb6=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 20:42:28
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

vill bit is at vtype[XLEN-1].

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200710104920.13550-5-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index eef20ca6e5..a804a5d0ba 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -98,7 +98,7 @@ FIELD(VTYPE, VLMUL, 0, 2)
 FIELD(VTYPE, VSEW, 2, 3)
 FIELD(VTYPE, VEDIV, 5, 2)
 FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
-FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 2, 1)
+FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 
 struct CPURISCVState {
     target_ulong gpr[32];
-- 
2.27.0


