Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFCE20F38C
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 13:29:08 +0200 (CEST)
Received: from localhost ([::1]:53324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqERn-0003ml-Bv
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 07:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jqEQp-0002vq-KT
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 07:28:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41024
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jqEQo-0001qY-5D
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 07:28:07 -0400
Received: from host86-182-221-235.range86-182.btcentralplus.com
 ([86.182.221.235] helo=kentang.int.eigen-ltd.com)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1jqEQm-0008WD-KV; Tue, 30 Jun 2020 12:28:09 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Tue, 30 Jun 2020 12:27:51 +0100
Message-Id: <20200630112752.31134-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200630112752.31134-1-mark.cave-ayland@ilande.co.uk>
References: <20200630112752.31134-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.182.221.235
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 1/2] target/m68k: fix physical address translation in
 m68k_cpu_get_phys_page_debug()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The result of the get_physical_address() function should be combined with the
offset of the original page access before being returned. Otherwise the
m68k_cpu_get_phys_page_debug() function can round to the wrong page causing
incorrect lookups in gdbstub and various "Disassembler disagrees with
translator over instruction decoding" warnings to appear at translation time.

Fixes: 88b2fef6c3 ("target/m68k: add MC68040 MMU")
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 79b0b10ea9..631eab7774 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -820,10 +820,14 @@ hwaddr m68k_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     if (env->sr & SR_S) {
         access_type |= ACCESS_SUPER;
     }
+
     if (get_physical_address(env, &phys_addr, &prot,
                              addr, access_type, &page_size) != 0) {
         return -1;
     }
+
+    addr &= TARGET_PAGE_MASK;
+    phys_addr += addr & (page_size - 1);
     return phys_addr;
 }
 
-- 
2.20.1


