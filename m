Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F5D2DE104
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:30:05 +0100 (CET)
Received: from localhost ([::1]:35384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqD1Q-0002yJ-8F
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:30:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvu-000304-IK
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:22 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:38333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvq-00074H-5s
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:22 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mz9d7-1jvmWs0Vgh-00wIH1; Fri, 18 Dec 2020 11:24:13 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/14] linux-user/elfload: Update HWCAP bits from linux 5.7
Date: Fri, 18 Dec 2020 11:23:59 +0100
Message-Id: <20201218102407.597566-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218102407.597566-1-laurent@vivier.eu>
References: <20201218102407.597566-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ln7BD3Vva7z3+0n3K6ePZTRRHrwfDX39fNErvgC+/ZHhdULMGn2
 Aq7DasUcLh53oIxAxNZrgFXCfyXDZ0TkeaOrw8+1IPoAsnU4ivlzNTUWza1h0m+IIZgXTTD
 AjhtYXsTNaRp6elrsO/O8WAEtIPZX8Gldrv5ti4i0a7L6pqdlu98dKD/LPogUWiCZOqKhXB
 MZzIyoGxQaevQGR1PiFQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:P6X4E4EsIm0=:65KMPFVM+ANAhD3vFxalR0
 aDCQ8AUMXZer1we1f3OfUhLR+pQQYX6dxSYUCz2H6AFG81zjWD7S84oCYmKJ/aPDyTqj/lg1S
 rfygkn4Sarks3cYTz1ZkEXXBUjVz4v0ZSrGf/341WJFbwChxKPduBdM2unwlsNJ+/OPksfKeg
 NK3pq2RtChirkJMesDmiB3N3bqYS4dRvORG3bVNZAtq2oDRCmCIQVX2kB2y9ux8ZeMAZ8zYg2
 k9ceLxscLtDrIMjHq7qd688rSpnv3MO+JOHit87BRsjq3n+nppepn4+ymMo0pVG98rqoDCvDB
 dxIMkKB2depojpVLHuWWCjkuiwb+UalQWCj94ITGl9gh6TEp2NPRo0yzf2PZT2/97HrrxheiV
 4W2qr+0Eu1UftG0gOJwL/bQI6ASC+rmAwdWSrAjHtGd+oNvc3pUczBbp2ureGzZqirqJ8waa0
 /mRZreXEDw==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201214003215.344522-6-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 8f943f93ba75..0836e72b5ac3 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -986,6 +986,19 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUMIPSState *e
 enum {
     HWCAP_MIPS_R6           = (1 << 0),
     HWCAP_MIPS_MSA          = (1 << 1),
+    HWCAP_MIPS_CRC32        = (1 << 2),
+    HWCAP_MIPS_MIPS16       = (1 << 3),
+    HWCAP_MIPS_MDMX         = (1 << 4),
+    HWCAP_MIPS_MIPS3D       = (1 << 5),
+    HWCAP_MIPS_SMARTMIPS    = (1 << 6),
+    HWCAP_MIPS_DSP          = (1 << 7),
+    HWCAP_MIPS_DSP2         = (1 << 8),
+    HWCAP_MIPS_DSP3         = (1 << 9),
+    HWCAP_MIPS_MIPS16E2     = (1 << 10),
+    HWCAP_LOONGSON_MMI      = (1 << 11),
+    HWCAP_LOONGSON_EXT      = (1 << 12),
+    HWCAP_LOONGSON_EXT2     = (1 << 13),
+    HWCAP_LOONGSON_CPUCFG   = (1 << 14),
 };
 
 #define ELF_HWCAP get_elf_hwcap()
-- 
2.29.2


