Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9640A4384BC
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 20:38:53 +0200 (CEST)
Received: from localhost ([::1]:56946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meLuu-0006pa-MJ
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 14:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLny-0005HG-GK; Sat, 23 Oct 2021 14:31:43 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:39041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLnv-0006dH-VM; Sat, 23 Oct 2021 14:31:42 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1McpaE-1nEEma27d4-00a07O; Sat, 23
 Oct 2021 20:31:26 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/11] disas/nios2: Simplify endianess conversion
Date: Sat, 23 Oct 2021 20:31:15 +0200
Message-Id: <20211023183123.813116-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023183123.813116-1-laurent@vivier.eu>
References: <20211023183123.813116-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:riQ16zf5RV25qJFl9Nk4jao47KG07vr3rF+mqJXDYXBWy47jscK
 +TV/TkwPQxd4F6LSddgDdGD+2ne8W4X1jUVk8cA8RS9aUJePc6QkBekP7zZkqPeBCvwBjpf
 L3Q5y3QVaEyvyCZBh45EM3l6m+7k/vgbcLKjkwWksncpqehdAncTa2mXuiTKfOSCTWwDhPw
 ei7qCsOSXDiaZpBv2WghQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1AqNrkvikGw=:7HkOkUKuebtSuUotmK2L6L
 Drhh8g6PN5Iumlk0UHfH/dz2Dz3l/cOh+pBfjycas+Cmuez4rZlGPPAKy0zMk2WoIjnb1M+5T
 pRCG3JK2jNnFajJ63Ho/DInsuyBPr5w3gZKIAf3+41AeRd7duo2iiE5MOhp64/0+n/jSqB+59
 Eg2CRfibFxlGbE9DDMwPgQfFA6U5fP150JORXYtr2X0ZyLRtaSIClPTrlOHrZVfs2ST0S8xTR
 mzDFozAV+9OWAsJF5xOmC2u1TI+E8wBzK7eCbl8p9Fo18qhYN3LiK7BUVXjDKzAxZL8juJsWH
 n3rMmDN66UWBmAgFClKY7nc013WjyW+m2YUzOLyeUY0DoGmfdGzJnXKlG0f4dx/W68ZilmlX7
 CLcss576onzqgLQUAljnDPJb49qMp2pVjQNMQpFaX1ykX46OkDJm3Lyy7iecvE2icX/Dyvdxp
 zfvlEHoOLdB6KlBasgvMYoyGUhKKj6bXqm4ew6z4oU2ppsBkE33K+flZ7WG2W6ekf/OjmOMjY
 zi/mkv1U6Vs7JOndjmZ4caOxL83cQZPPV9NE19fXNYyoeg5qG7PyZz7nw72zwfiu/6AlKmZfW
 h347jAPXADhwjZnqeyVnNNoJTuXib4lfHa2a0E0kgF5OId5IAy5yVPVKgdlmL45ciNFUq0c2V
 h9ptStbvAQQkIGiJkV4i5zozbhFO3Q2jMV9B+wFLJEzUz3hD/qASsGHnVGtlLXajkkBo=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Since commit 12b6e9b27d4 ("disas: Clean up CPUDebug initialization")
the disassemble_info->bfd_endian enum is set for all targets in
target_disas(). We can directly call print_insn_nios2() and simplify.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210807110939.95853-3-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 disas/nios2.c           | 22 +++-------------------
 include/disas/dis-asm.h |  3 +--
 target/nios2/cpu.c      |  6 +-----
 3 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/disas/nios2.c b/disas/nios2.c
index d124902ae3e1..98ac07d72e9d 100644
--- a/disas/nios2.c
+++ b/disas/nios2.c
@@ -3478,9 +3478,7 @@ nios2_disassemble (bfd_vma address, unsigned long opcode,
    instruction word at the address given, and prints the disassembled
    instruction on the stream info->stream using info->fprintf_func. */
 
-static int
-print_insn_nios2 (bfd_vma address, disassemble_info *info,
-		  enum bfd_endian endianness)
+int print_insn_nios2(bfd_vma address, disassemble_info *info)
 {
     bfd_byte buffer[INSNLEN];
     int status;
@@ -3488,7 +3486,7 @@ print_insn_nios2 (bfd_vma address, disassemble_info *info,
     status = (*info->read_memory_func)(address, buffer, INSNLEN, info);
     if (status == 0) {
         unsigned long insn;
-        if (endianness == BFD_ENDIAN_BIG) {
+        if (info->endian == BFD_ENDIAN_BIG) {
             insn = (unsigned long) bfd_getb32(buffer);
         } else {
             insn = (unsigned long) bfd_getl32(buffer);
@@ -3501,7 +3499,7 @@ print_insn_nios2 (bfd_vma address, disassemble_info *info,
         status = (*info->read_memory_func)(address, buffer, 2, info);
         if (status == 0) {
             unsigned long insn;
-            if (endianness == BFD_ENDIAN_BIG) {
+            if (info->endian == BFD_ENDIAN_BIG) {
                 insn = (unsigned long) bfd_getb16(buffer);
             } else {
                 insn = (unsigned long) bfd_getl16(buffer);
@@ -3514,17 +3512,3 @@ print_insn_nios2 (bfd_vma address, disassemble_info *info,
     (*info->memory_error_func)(status, address, info);
     return -1;
 }
-
-/* These two functions are the main entry points, accessed from
-   disassemble.c.  */
-int
-print_insn_big_nios2 (bfd_vma address, disassemble_info *info)
-{
-  return print_insn_nios2 (address, info, BFD_ENDIAN_BIG);
-}
-
-int
-print_insn_little_nios2 (bfd_vma address, disassemble_info *info)
-{
-  return print_insn_nios2 (address, info, BFD_ENDIAN_LITTLE);
-}
diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 524f29196d9d..08e1beec854f 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -455,8 +455,7 @@ int print_insn_crisv32          (bfd_vma, disassemble_info*);
 int print_insn_crisv10          (bfd_vma, disassemble_info*);
 int print_insn_microblaze       (bfd_vma, disassemble_info*);
 int print_insn_ia64             (bfd_vma, disassemble_info*);
-int print_insn_big_nios2        (bfd_vma, disassemble_info*);
-int print_insn_little_nios2     (bfd_vma, disassemble_info*);
+int print_insn_nios2(bfd_vma, disassemble_info*);
 int print_insn_xtensa           (bfd_vma, disassemble_info*);
 int print_insn_riscv32          (bfd_vma, disassemble_info*);
 int print_insn_riscv64          (bfd_vma, disassemble_info*);
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 947bb09bc1ed..58ecd27d757e 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -147,11 +147,7 @@ static void nios2_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     /* NOTE: NiosII R2 is not supported yet. */
     info->mach = bfd_arch_nios2;
-#ifdef TARGET_WORDS_BIGENDIAN
-    info->print_insn = print_insn_big_nios2;
-#else
-    info->print_insn = print_insn_little_nios2;
-#endif
+    info->print_insn = print_insn_nios2;
 }
 
 static int nios2_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
-- 
2.31.1


