Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0E52D36E5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 00:27:19 +0100 (CET)
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmmO6-0000l8-7X
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 18:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmlub-0008MP-7Q; Tue, 08 Dec 2020 17:56:50 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:31149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6040d5def=alistair.francis@wdc.com>)
 id 1kmluY-0004Ed-7K; Tue, 08 Dec 2020 17:56:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607468206; x=1639004206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IyTnRwck8rL1J3yNa3Pf2nP2bRQjwvd24InXKlV1gtI=;
 b=UVm39JxuTU53/RqaGb9cFTrkeGvw04NZbedcF0stRX19cRzu5rfW9J1Y
 uBy3WOUrZDvJ0T/jIS/hagh/V0CSJXzAQN9oMqgxuJ81MsE/28Apo8nTT
 JX4hQbpU5UH3cAAp3N4rZvMc8Z9dVJ0l1GJOunrxo2SjrggKV7y2U9CfH
 wH4tNQ5WhQ2FCbY6cxWZvRV48SqUtQjLZvwl/AGZHn1wN7yJk8QyWVjNl
 Sh/dqFzIXx+UvZwHLRNINhWEP8ilSFPJ0TN/FbhW5j8fM0lKlAKzGavvC
 iuGlx/1oT00ny24znDgzRyYWN9yPEhhWqfGy0Mg/DDvorelo/lLkEacrs A==;
IronPort-SDR: YmCAdGvC/l2pzfYvES7BxoD89snxdztzvmZ5BoLRnTrFyTowQGROgj/mHxuXHROO/yPcnUkdRx
 Hqq+g554i7vKnDJgZdhjKgCELtRp0B2sJPaBC9LtTcywlxesYRyIKear/Cw2rxsNkrZ7l37hky
 kt3zWp0m5tGHYxKrher+uxSg/yYNRWCWu/IvcwIJqLkjyhgfIXwfV5vnu0eyRwc6f/1/0HDaRW
 QmlfvCMUrlQhoG9ehVELXaLyevzJsPkqB1I7KShQ15UIynNjqWvDQC6KjMKgBI5RYnQpUF4kO0
 oaA=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; d="scan'208";a="154713838"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 06:56:45 +0800
IronPort-SDR: jxK43gu1XHtT+uIreiSuiwuTZE4qtxFBYCDN5rYQN5kDeBPwCO/uhk+Ulj8K2m1+k7AoyxLln/
 QJOU21fh36Sqfg4zoh+WbxMAvT1Yhn/RE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 14:42:12 -0800
IronPort-SDR: e2KkBc6pdI2NzV9FgGvjQ5k4IkLdVehMPm7Noxi3SmoVEed5M0PqjjSlvjPl/8a60TNsLymbqS
 m12EdLv/suvQ==
WDCIronportException: Internal
Received: from usa001386.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.61.239])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Dec 2020 14:56:45 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 13/15] target/riscv: cpu_helper: Remove compile time XLEN
 checks
Date: Tue,  8 Dec 2020 14:56:44 -0800
Message-Id: <bfd448b85f5858e24281e14cf6ae69d512efa685.1607467819.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607467819.git.alistair.francis@wdc.com>
References: <cover.1607467819.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=6040d5def=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
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


