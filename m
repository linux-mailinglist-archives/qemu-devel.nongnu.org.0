Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003EC428341
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 21:12:33 +0200 (CEST)
Received: from localhost ([::1]:56256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZeFM-0000T0-HM
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 15:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adam@l4re.org>) id 1mZeD7-0007ir-Tu
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 15:10:13 -0400
Received: from os.inf.tu-dresden.de ([141.76.48.99]:58414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adam@l4re.org>) id 1mZeD5-0005jY-RX
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 15:10:13 -0400
Received: from erwin.inf.tu-dresden.de ([141.76.48.80]
 helo=os.inf.tu-dresden.de)
 by os.inf.tu-dresden.de with esmtps (TLS1.3:TLS_AES_256_GCM_SHA384:256) (Exim
 4.94.2) id 1mZeD1-0004EK-S9; Sun, 10 Oct 2021 21:10:07 +0200
Date: Sun, 10 Oct 2021 21:10:05 +0200
From: Adam Lackorzynski <adam@l4re.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] multiboot: Use DMA instead port-based transfer
Message-ID: <YWM6jboU9fUib6Iy@os.inf.tu-dresden.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
User-Agent: Mutt/2.0.5 (2021-01-21)
Received-SPF: none client-ip=141.76.48.99; envelope-from=adam@l4re.org;
 helo=os.inf.tu-dresden.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use DMA transfers in the multiboot loader to copy
data.

This significantly lowers QEMU's startup latency by
a factor of about 40, for example, going from 30sec
to 0.8sec when loading modules of 120MB in size.
This change has been used successfully for some time.

Signed-off-by: Marcus H=E4hnel <marcus.haehnel@kernkonzept.com>
Signed-off-by: Adam Lackorzynski <adam@l4re.org>
---
 pc-bios/multiboot.bin         | Bin 1024 -> 1536 bytes
 pc-bios/optionrom/multiboot.S |  10 ++---
 pc-bios/optionrom/optionrom.h |  77 ++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+), 5 deletions(-)

diff --git a/pc-bios/multiboot.bin b/pc-bios/multiboot.bin
index e772713c95749bee82c20002b50ec6d05b2d4987..94dc3fc9644ad2e1c87a3ac62a6=
0cce659ada04f 100644
GIT binary patch
literal 1536
zcmds1&ubG=3D5S~qT?GnMHKP*K`h!WyKk>(<ZA_&c~7}5R#%H}IVH4u|y53=3D;|NZ5lX
z@gRsdLGZZ7%WiV$qLfDP5b0%GFG*Uchf0G4*4a(gOZA{s1t09r_ukC=3DX6C(bckxB^
z9sO|3QaXP>FGWJ<31w0V@s$A79HaepfSLo_l~H>SdrOA+1nDF6ZVLMD9PF-abWu&V
zWk}5eM3U%@N(GUWshU(32FHlqF=3Dgad30cdqAhx0RreGfDM9iLm?nL-e5qFj#=3DF^{H
z%D!tf-G^v}cmUI{E(q&GxX?QZ_SI(;?7@`$T?fP9>MiCu-Kcz7LUlg93t@lH8}q~d
zTHZC76F*HToUk+QvLE8#=3D<?q*XLn@7U7x^X4bNrL@NA9`me(v~H<9)9H5sp`{N~M6
zhu`)5wS}AOCrgtVzQF4PNE@2CdY-VlS^1FlP$x=3D|c9~bo7kO(2`bt8oq%)}IWUN}1
zQ;ZZ`YLvz^h~`vA55^!GS#RepFRTo9nt0grIbio<8pJe<5pijnRTxMke#R=3DmyFg?n
zxF(}zv<=3DH}jgHu6Ihrc3u_#!JEXBCv>oAaE0QW^Ju!BH;?CT4cr5AU=3D(%TEz4>-aX
z9c!-dD^A!$-m#<RT{FiIQwnEPXa85~99HO`#-Hfi|IUt-w`oRRy*%e_%|wa(>k5bG
uF?zB=3DfqgWxPiZtKI!iA9P;TTF7U^DPxqSCdu~<$m7jJ8YQb_SX+SzZT$^;((

delta 357
zcmZqRY2aW9UBz^IvLUP3L@5E5X-u=3D3ChA$%CorWk9!^c`lw)An&B2h`DaXRlEjNJ)
z$Y5hg>z11YljdMZGd$3DU<Vh&E&<l}y98O^q#b;~flTn9Nb5YlgB!2>!5u;jX+Q%Q
z7(hn+`J5w**TBgMOvmffcCdr>q`glASqriihWSr)9#7i=3DbQ;h|?9vC*b_jx8#J~WN
w2U?l7Ljb=3D9E);1=3DRQnF^VA`-&`~O3R-HelOu^2FAFiqxR{XE%$wSw^v0Movl^Z)<=3D

diff --git a/pc-bios/optionrom/multiboot.S b/pc-bios/optionrom/multiboot.S
index b7efe4de34..5fe4da6486 100644
--- a/pc-bios/optionrom/multiboot.S
+++ b/pc-bios/optionrom/multiboot.S
@@ -68,10 +68,10 @@ run_multiboot:
 	mov		%eax, %es
=20
 	/* Read the bootinfo struct into RAM */
-	read_fw_blob(FW_CFG_INITRD)
+	read_fw_blob_dma(FW_CFG_INITRD)
=20
 	/* FS =3D bootinfo_struct */
-	read_fw		FW_CFG_INITRD_ADDR
+	read_fw_dma_var32	FW_CFG_INITRD_ADDR
 	shr		$4, %eax
 	mov		%ax, %fs
=20
@@ -188,14 +188,14 @@ prot_mode:
 	movl		%eax, %gs
=20
 	/* Read the kernel and modules into RAM */
-	read_fw_blob(FW_CFG_KERNEL)
+	read_fw_blob_dma(FW_CFG_KERNEL)
=20
 	/* Jump off to the kernel */
-	read_fw		FW_CFG_KERNEL_ENTRY
+	read_fw_dma_var32 FW_CFG_KERNEL_ENTRY
 	mov		%eax, %ecx
=20
 	/* EBX contains a pointer to the bootinfo struct */
-	read_fw		FW_CFG_INITRD_ADDR
+	read_fw_dma_var32	FW_CFG_INITRD_ADDR
 	movl		%eax, %ebx
=20
 	/* EAX has to contain the magic */
diff --git a/pc-bios/optionrom/optionrom.h b/pc-bios/optionrom/optionrom.h
index a2b612f1a7..5a88c7c5a3 100644
--- a/pc-bios/optionrom/optionrom.h
+++ b/pc-bios/optionrom/optionrom.h
@@ -37,6 +37,17 @@
 #define BIOS_CFG_IOPORT_CFG	0x510
 #define BIOS_CFG_IOPORT_DATA	0x511
=20
+#define FW_CFG_DMA_CTL_ERROR   0x01
+#define FW_CFG_DMA_CTL_READ    0x02
+#define FW_CFG_DMA_CTL_SKIP    0x04
+#define FW_CFG_DMA_CTL_SELECT  0x08
+#define FW_CFG_DMA_CTL_WRITE   0x10
+
+#define FW_CFG_DMA_SIGNATURE 0x51454d5520434647ULL /* "QEMU CFG" */
+
+#define BIOS_CFG_DMA_ADDR_HIGH  0x514
+#define BIOS_CFG_DMA_ADDR_LOW   0x518
+
 /* Break the translation block flow so -d cpu shows us values */
 #define DEBUG_HERE \
 	jmp		1f;				\
@@ -62,6 +73,72 @@
 	bswap		%eax
 .endm
=20
+
+/*
+ * Read data from the fw_cfg device using DMA.
+ * Clobbers:	%eax, %edx, memory[%esp-16] to memory[%esp]
+ */
+.macro read_fw_dma VAR, SIZE, ADDR
+	movl		$\VAR, %eax /* Control */
+	shl		$16, %eax
+	or		$FW_CFG_DMA_CTL_READ, %eax
+	or		$FW_CFG_DMA_CTL_SELECT, %eax
+	bswapl		%eax
+	movl		%eax, -16(%esp)
+
+	movl		\SIZE, %eax /* Length */
+	bswapl		%eax
+	mov		%eax, -12(%esp)
+
+	mov		\ADDR, %eax /* Address to write to */
+	bswapl		%eax
+	mov		%eax, -4(%esp)
+
+	movl		$0, %eax  /* We only support 32 bit target addresses */
+	mov		%eax, -8(%esp)
+
+	mov		%esp, %eax /* Address of the struct we generated */
+	subl		$16, %eax
+	bswapl		%eax
+
+	mov		$BIOS_CFG_DMA_ADDR_LOW, %dx
+	outl		%eax, (%dx) /* Initiate DMA */
+
+	movl		$FW_CFG_DMA_CTL_ERROR, %eax
+	not		%eax
+	bswapl		%eax
+
+1:  mov		-16(%esp), %edx /* Wait for completion */
+	and		%eax, %edx
+	jnz		1b
+.endm
+
+/*
+ * Read a single 32 bit value from the fw_cfg device using DMA
+ * Clobbers: %edx, memory[%esp-20] to memory[%esp]
+ * Out:		%eax
+ */
+.macro read_fw_dma_var32 VAR
+	mov		%esp, %edx
+	subl		$20, %edx
+	read_fw_dma	\VAR, $4, %edx
+	mov		-20(%esp), %eax
+.endm
+
+
+/*
+ * Read a blob from the fw_cfg device using DMA
+ * Requires _ADDR, _SIZE and _DATA values for the parameter.
+ *
+ * Clobbers:	%eax, %edx, %es, %ecx, %edi and adresses %esp-20 to %esp
+ */
+#define read_fw_blob_dma(var) \
+	read_fw_dma_var32	var ## _SIZE; \
+	mov		%eax, %ecx; \
+	read_fw_dma_var32	var ## _ADDR; \
+	mov		%eax, %edi ;\
+	read_fw_dma	var ## _DATA, %ecx, %edi
+
 #define read_fw_blob_pre(var)				\
 	read_fw		var ## _SIZE;			\
 	mov		%eax, %ecx;			\
--=20
2.33.0


