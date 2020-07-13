Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9447F21B9F0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 17:50:10 +0200 (CEST)
Received: from localhost ([::1]:39912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtvHt-0000ia-Jj
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 11:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1jtvEJ-0005JX-2x; Fri, 10 Jul 2020 11:46:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:55311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wentong.wu@intel.com>)
 id 1jtvEH-0008Oy-Do; Fri, 10 Jul 2020 11:46:26 -0400
IronPort-SDR: O2H8wzf3tdAEF4V+sjE5Q+15jPO7ySgFtBqponAt7oqw4feFVqTfP79zKLioHKB4L+QNO6XMJk
 y/xKq5Yb1HyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9678"; a="136427527"
X-IronPort-AV: E=Sophos;i="5.75,336,1589266800"; d="scan'208";a="136427527"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2020 08:46:23 -0700
IronPort-SDR: WkqaQGkHMg9H4nFOgWe4857jRuV/IXV5PtdMbdx/2Tkcetj6bPlm9TBmlAivHQS2pLdsbo5ilw
 VZ8VGRHMcoow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,336,1589266800"; d="scan'208";a="484686361"
Received: from unknown (HELO localhost.localdomain.sh.intel.com)
 ([10.239.153.142])
 by fmsmga005.fm.intel.com with ESMTP; 10 Jul 2020 08:46:22 -0700
From: Wentong Wu <wentong.wu@intel.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 3/4] target/nios2: Use gen_io_start around wrctl instruction
Date: Fri, 10 Jul 2020 19:34:32 -0400
Message-Id: <20200710233433.19729-3-wentong.wu@intel.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200710233433.19729-1-wentong.wu@intel.com>
References: <20200710233433.19729-1-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=wentong.wu@intel.com;
 helo=mga02.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 11:46:16
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, marex@denx.de, crwulff@gmail.com,
 Wentong Wu <wentong.wu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

wrctl instruction on nios2 target will cause checking cpu
interrupt but tcg_handle_interrupt() will call cpu_abort()
if the CPU gets an interrupt while it's not in 'can do IO'
state, so add gen_io_start around wrctl instruction. Also
at the same time, end the onging TB with DISAS_UPDATE.

Signed-off-by: Wentong Wu <wentong.wu@intel.com>
---
 target/nios2/translate.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 83c10eb2..51347ada 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -32,6 +32,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/translator.h"
 #include "qemu/qemu-print.h"
+#include "exec/gen-icount.h"
 
 /* is_jmp field values */
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
@@ -518,7 +519,11 @@ static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
     /* If interrupts were enabled using WRCTL, trigger them. */
 #if !defined(CONFIG_USER_ONLY)
     if ((instr.imm5 + CR_BASE) == CR_STATUS) {
+        if (tb_cflags(dc->tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
         gen_helper_check_interrupts(dc->cpu_env);
+        dc->is_jmp = DISAS_UPDATE;
     }
 #endif
 }
-- 
2.21.3


