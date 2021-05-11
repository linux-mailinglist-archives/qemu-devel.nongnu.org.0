Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AA237A4A0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:30:56 +0200 (CEST)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPfD-0001vA-4M
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVU-00005Z-KH
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:52 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVO-0006X1-9Y
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728444; x=1652264444;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bxuh/HYpFG5/VX0DQF6fAKC2S1UYsYT0FobkIKhBegY=;
 b=o80IkdQ9MPyD8rl2rA0GUoAfhfqJ5lvpMcbeHmEgHc30vevTH5igFtd6
 7iFdSyu92mRfxM0vDqb6m0H4VZEm6b08YxJ93SWrAEFrF+Vw+d3iKV/vW
 8HtLjew+eWXGZimwpVo8N9hxNGEcGSqsEI5DLea9mVE/2k+WbkQW5TxFD
 sQ4okQh/KhqXrx2zk02BAIXxigKvFQDr1sq7f5UafEyIIP+/6/lj5IPEo
 GdEm8vvqKLBkgtm4S7XVLCCFL/HXwbcy/yAB/nT88Mg7uRcK4udA11Q2O
 J0XKdpQqDf0fUbFCa1OaEumfDU4YuNLgRgBVvOiXw4/8RCK4CwaLAO+cE w==;
IronPort-SDR: 16MHsPKVBgprYnAT1fA8gp2JMPPxhkIC2gcPyyCoCK7HB2Dms6Ep4AyEamLh5p5dTes//Nym2k
 HjOxIWbiLDsSVMpFxx/7MVL7jCFyWJi6W4LKFUbbdVgkA6y+QEJmAjHDqAggJlbskWM+CsDyw0
 X0OUMpgfrz6gL6w2cTmbCMwfJcncijQykUZ6sjBFEImORO7j2ad6lN5p+9DZa/L8xq++mQhIgn
 p9nVMBCdqAQTmx5+k7QLbNwkzd2iYjk91P6hGSmz7u5972X05ifAK837ZED5FbZ09R1r/TURDT
 YpY=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735377"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:20:37 +0800
IronPort-SDR: lFxkTi9LjqTJCLcPRJN4ysDPGU2sSfcPTs0JIYoASTWSvBcsfa25V03h/HoMOEqu0RvMz7tnBZ
 SgCNlkV8/ci6OWAoA+mf37ubW4KX1NHIVydc/8jGYZI2trgUXOs4CvX4picm0EFAqVERquh5ce
 jWmYwIQ7cnKNo+rdgyw3/9OXYtwncTR++14HYOif8aVNxFbWS9W0JibILE33NiwLKpi0TTdZyg
 0cfXOFdT28QaeC8kDL5pLwvOlEBtQXD0onRVcyznfkxeySk8cBtuX+qvKAxHvjuFur7BGmQKid
 +FfWMz2zq1s2ky9d4izkP0dg
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:00:36 -0700
IronPort-SDR: wogQaDCvVa6nanJCjlmZHuoEUGNuu6ce4UDjFBya6MxN/QkkmqO4ZLQmlw/D6NEttknbqb5jHM
 FOZhdxDW43cDxige6UmXuuq6nvQE0mmYi57jTf957y4z8qJV7gc4sWEpyJ6CanaHuh699XPCC/
 VdLfEyLm0nDS5QxtDAVOKbmFKvXYYjmhpSK2SSxYwUq2dGduRvRYHCFaHk4KLmyNyy6qm2nDNZ
 pL/e4LQnzq+V3km5QnKtaSEWXjW0AvogeqvRCNdZGk+8IHiQDsAT6RNUwDVAu9/K5ti5ZCU0Ii
 Pvs=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:20:35 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 11/42] target/riscv: Fix 32-bit HS mode access permissions
Date: Tue, 11 May 2021 20:19:20 +1000
Message-Id: <20210511101951.165287-12-alistair.francis@wdc.com>
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
Message-id: cb1ef2061547dc9028ce3cf4f6622588f9c09149.1617290165.git.alistair.francis@wdc.com
---
 target/riscv/csr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1938bdca7d..6a39c4aa96 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -181,7 +181,11 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        return RISCV_EXCP_NONE;
+        if (riscv_cpu_virt_enabled(env)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        } else {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
     }
 
     return hmode(env, csrno);
-- 
2.31.1


