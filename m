Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D892336F45
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:52:23 +0100 (CET)
Received: from localhost ([::1]:54018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHzS-00056V-0D
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1lKHwT-000406-BM; Thu, 11 Mar 2021 04:49:17 -0500
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:54101
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <georg.kotheimer@kernkonzept.com>)
 id 1lKHwS-0002XM-0k; Thu, 11 Mar 2021 04:49:17 -0500
Received: from [86.56.46.35] (helo=broc.lan)
 by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) id 1lKHwQ-0005Uj-Ce; Thu, 11 Mar 2021 10:49:14 +0100
From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: Make VSTIP and VSEIP read-only in hip
Date: Thu, 11 Mar 2021 10:49:02 +0100
Message-Id: <20210311094902.1377593-1-georg.kotheimer@kernkonzept.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2a01:4f8:1c1c:b490::2;
 envelope-from=georg.kotheimer@kernkonzept.com; helo=mx.kernkonzept.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.02,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
---
 target/riscv/csr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fd2e6363f3..00a3ab72af 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -420,7 +420,8 @@ static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
     SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
-static const target_ulong hip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
+static const target_ulong hip_writable_mask = MIP_VSSIP;
+static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
 
 static const char valid_vm_1_10_32[16] = {
@@ -962,9 +963,9 @@ static int rmw_hvip(CPURISCVState *env, int csrno, target_ulong *ret_value,
                    target_ulong new_value, target_ulong write_mask)
 {
     int ret = rmw_mip(env, 0, ret_value, new_value,
-                      write_mask & hip_writable_mask);
+                      write_mask & hvip_writable_mask);
 
-    *ret_value &= hip_writable_mask;
+    *ret_value &= hvip_writable_mask;
 
     return ret;
 }
-- 
2.30.1


