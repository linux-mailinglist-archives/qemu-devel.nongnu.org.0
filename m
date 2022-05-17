Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB44E52AB3E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:53:38 +0200 (CEST)
Received: from localhost ([::1]:34284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr2Ju-00020g-HK
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nr25O-0003qS-7w; Tue, 17 May 2022 14:38:22 -0400
Received: from [187.72.171.209] (port=26849 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nr25M-00064z-R3; Tue, 17 May 2022 14:38:21 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 17 May 2022 15:37:38 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 203F7800603;
 Tue, 17 May 2022 15:37:38 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, Joel Stanley <joel@jms.id.au>,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v3 8/8] linux-user: Add PowerPC ISA 3.1 and MMA to hwcap
Date: Tue, 17 May 2022 15:37:35 -0300
Message-Id: <20220517183735.110342-9-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517183735.110342-1-lucas.araujo@eldorado.org.br>
References: <20220517183735.110342-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2022 18:37:38.0343 (UTC)
 FILETIME=[2F0D5B70:01D86A1D]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Joel Stanley <joel@jms.id.au>

These are new hwcap bits added for power10.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 linux-user/elfload.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 61063fd974..0908692e62 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -779,6 +779,8 @@ enum {
     QEMU_PPC_FEATURE2_DARN = 0x00200000, /* darn random number insn */
     QEMU_PPC_FEATURE2_SCV = 0x00100000, /* scv syscall */
     QEMU_PPC_FEATURE2_HTM_NO_SUSPEND = 0x00080000, /* TM w/o suspended state */
+    QEMU_PPC_FEATURE2_ARCH_3_1 = 0x00040000, /* ISA 3.1 */
+    QEMU_PPC_FEATURE2_MMA = 0x00020000, /* Matrix-Multiply Assist */
 };
 
 #define ELF_HWCAP get_elf_hwcap()
@@ -836,6 +838,8 @@ static uint32_t get_elf_hwcap2(void)
                   QEMU_PPC_FEATURE2_VEC_CRYPTO);
     GET_FEATURE2(PPC2_ISA300, QEMU_PPC_FEATURE2_ARCH_3_00 |
                  QEMU_PPC_FEATURE2_DARN | QEMU_PPC_FEATURE2_HAS_IEEE128);
+    GET_FEATURE2(PPC2_ISA310, QEMU_PPC_FEATURE2_ARCH_3_1 |
+                 QEMU_PPC_FEATURE2_MMA);
 
 #undef GET_FEATURE
 #undef GET_FEATURE2
-- 
2.31.1


