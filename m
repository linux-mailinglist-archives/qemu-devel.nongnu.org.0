Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0A3434D39
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:13:10 +0200 (CEST)
Received: from localhost ([::1]:44860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCL7-0007PI-OD
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mdCCh-0004cC-Lw
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:04:28 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mdCCe-0006Vp-DO
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:04:27 -0400
Received: by mail-ed1-x529.google.com with SMTP id d3so27354186edp.3
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 07:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0vUABkOdW3n1O+J/YlCSi4LCn6CSZ6NW/xi0cwG+LLU=;
 b=YwGxcfCRh9i+sBmBK3Ex4WWl4Fr53LQ/tafg0KmhORyumQUWN8tSZAxJnDzO2jtutF
 eAm+qAzEVZdd9WZ3iBTbnjPplSMLP4SMU2KW7hl1SdzunosZs4/oS+EbLKSOXxWIJR7G
 IyA+XMEjxFFRp9eAgKDK7fOiVWByMpW9NavxqxXFUVluJHoURm7ru7DEKYJhbLrixoIQ
 Tng1JqcUUp+I5IxxLWaLHRX4MdOjeV9gdvwLDMfb/k92CwMk4FX5Log3tlaQRi+Kxk0o
 gXLd/u2QMuPbbLtLQ1dzHi6P9aVztboafHAfWeVQ2801lnREMyavybeSTLQBPKK2GmHE
 5MUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0vUABkOdW3n1O+J/YlCSi4LCn6CSZ6NW/xi0cwG+LLU=;
 b=s+sLTeXwf/ayhxy48YFAsOixO35zm606e1i5jmnhV+7VlJpXi2Pu9p8KqBufr6MvYi
 lAqtsA+Y1eVUCIa3DgR48v3KrDfOQk4MHN6GqSRLcjxmbSYU7E8zzTXpXUrQ8a+3y+E1
 RYi/xquBqO5N+9FC38/y13VCSimPDrDZDdEe6Uv4Fm54doxWbiUkrtznw8/X+GWNUqk2
 Err59NInKBCTZDhUpYdwQ4g+CN7BXQz/sEZw/jvLfckQayCtG5tJ78aeyFxGjseCtnia
 1o7jQpmJjIZDTgsFuCsnMQgldQ7V9Hepxcsyszav8Bb+RASnlQLq7IUnuky8ouLdEk+C
 wGNA==
X-Gm-Message-State: AOAM530Cdjypn8xAtRNKA00gCSguSDl4w/H45KLp/tVCKc/znKbWoYW6
 SEDAExIlixtnLrk7uSCqZxHQ1uHklYY=
X-Google-Smtp-Source: ABdhPJxg1JIKWZz2JOOShqCDGB0IemY7/Wbl9lZAYRAfm17nUXMu8G2cmIe/2DzNfD3SYm5IUiNxLw==
X-Received: by 2002:a17:907:330e:: with SMTP id
 ym14mr48792751ejb.417.1634738571901; 
 Wed, 20 Oct 2021 07:02:51 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a4sm1287095edk.71.2021.10.20.07.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 07:02:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] optionrom: add a DMA-enabled multiboot ROM
Date: Wed, 20 Oct 2021 16:02:43 +0200
Message-Id: <20211020140244.485249-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211020140244.485249-1-pbonzini@redhat.com>
References: <20211020140244.485249-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: adam@l4re.org, marcus.haehnel@kernkonzept.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marcus Hähnel <marcus.haehnel@kernkonzept.com>

Add a new option rom for the multiboot loader, using DMA transfers to copy
data instead of "rep insb".

This significantly lowers QEMU's startup latency by a factor of about 40,
for example, going from 30sec to 0.8sec when loading modules of 120MB
in size.

Signed-off-by: Marcus Hähnel <marcus.haehnel@kernkonzept.com>
Signed-off-by: Adam Lackorzynski <adam@l4re.org>
[Modified to keep the non-DMA code depending on #ifdef USE_FW_CFG_DMA;
 do not write below stack. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/meson.build               |   1 +
 pc-bios/multiboot_dma.bin         | Bin 0 -> 1024 bytes
 pc-bios/optionrom/Makefile        |   4 +-
 pc-bios/optionrom/multiboot.S     |   4 +-
 pc-bios/optionrom/multiboot_dma.S |   2 +
 pc-bios/optionrom/optionrom.h     |  66 ++++++++++++++++++++++++++++++
 6 files changed, 72 insertions(+), 5 deletions(-)
 create mode 100644 pc-bios/multiboot_dma.bin
 create mode 100644 pc-bios/optionrom/multiboot_dma.S

diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index a44c9bc127..b40ff3f2bd 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -63,6 +63,7 @@ blobs = files(
   'petalogix-s3adsp1800.dtb',
   'petalogix-ml605.dtb',
   'multiboot.bin',
+  'multiboot_dma.bin',
   'linuxboot.bin',
   'linuxboot_dma.bin',
   'kvmvapic.bin',
diff --git a/pc-bios/multiboot_dma.bin b/pc-bios/multiboot_dma.bin
new file mode 100644
index 0000000000000000000000000000000000000000..c0e2c3102a3358207c61d3ae113524fb6007abc3
GIT binary patch
literal 1024
zcmd^-v1=1i9LIlmUTlcNU1}{N5`u&{DAHSmq6iKdix;GHRxaNnR0A<Lc978Fk#IvN
zaS+5wQE+fL&*iQWa#czc94ZyL>R{3q;@~8~^LMo;4s!p158nI!-tWur_ul*P<{!&%
z=%3>xm5f`4Bq!!)`Rkwf;(oFd*qcAb=mhXX1)X>Bw-tylkUpR_ETXkH1AnO4L$nJ|
zWJui_M1kmKmTID)P`mI^=HM`~{VB1t1l_Ye=Lor4X5{8Gd)zzw_o4<6zLQJ!dr<pW
z;7%~ysSHL?*HHx*O%k}?fCyRL<7_RWt(4;Aqn}X}S>MolrKNZG2Z|kTOyaJIhYFc^
zFhhuQ9`r5fQLCrm#T4^_QylQ>8kgs;ZX9bIEiXb`8AIxu;?h~d%9izBkKht%WM1G*
z^E{W9(OT9dt5in2qF}|dPH>dL>{=sV#-U1<quUb@YkIW%niI?8-7fCz#695e<V=WZ
zrVCY?W~`3Hw@^=cHALr#9F2GOTYJ;??9d*-Vbsi+;lz|<$jMX#;lr6ov3qKNLH7(W
z+>yFoWnOtw14D$&k*SUtsT%wS`ki@#&rUrnmtuDv`PtJm(Kg?H$Pdc0CL@YCy4R<D
pT|LnIbg(BnP0#tqRx5M!bkkaD-nd?`H;YU4Yi6yHwD{k({tHC8FAx9#

literal 0
HcmV?d00001

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 3482508a86..5d55d25acc 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -2,7 +2,7 @@ include config.mak
 SRC_DIR := $(TOPSRC_DIR)/pc-bios/optionrom
 VPATH = $(SRC_DIR)
 
-all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
+all: multiboot.bin multiboot_dma.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
 # Dummy command so that make thinks it has done something
 	@true
 
@@ -41,8 +41,6 @@ override CFLAGS += $(call cc-option, $(Wa)-32)
 LD_I386_EMULATION ?= elf_i386
 override LDFLAGS = -m $(LD_I386_EMULATION) -T $(SRC_DIR)/flat.lds
 
-all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
-
 pvh.img: pvh.o pvh_main.o
 
 %.o: %.S
diff --git a/pc-bios/optionrom/multiboot.S b/pc-bios/optionrom/multiboot.S
index b7efe4de34..181a4b03a3 100644
--- a/pc-bios/optionrom/multiboot.S
+++ b/pc-bios/optionrom/multiboot.S
@@ -68,7 +68,7 @@ run_multiboot:
 	mov		%eax, %es
 
 	/* Read the bootinfo struct into RAM */
-	read_fw_blob(FW_CFG_INITRD)
+	read_fw_blob_dma(FW_CFG_INITRD)
 
 	/* FS = bootinfo_struct */
 	read_fw		FW_CFG_INITRD_ADDR
@@ -188,7 +188,7 @@ prot_mode:
 	movl		%eax, %gs
 
 	/* Read the kernel and modules into RAM */
-	read_fw_blob(FW_CFG_KERNEL)
+	read_fw_blob_dma(FW_CFG_KERNEL)
 
 	/* Jump off to the kernel */
 	read_fw		FW_CFG_KERNEL_ENTRY
diff --git a/pc-bios/optionrom/multiboot_dma.S b/pc-bios/optionrom/multiboot_dma.S
new file mode 100644
index 0000000000..d809af3e23
--- /dev/null
+++ b/pc-bios/optionrom/multiboot_dma.S
@@ -0,0 +1,2 @@
+#define USE_FW_CFG_DMA 1
+#include "multiboot.S"
diff --git a/pc-bios/optionrom/optionrom.h b/pc-bios/optionrom/optionrom.h
index a2b612f1a7..8d74c0ddf3 100644
--- a/pc-bios/optionrom/optionrom.h
+++ b/pc-bios/optionrom/optionrom.h
@@ -37,6 +37,17 @@
 #define BIOS_CFG_IOPORT_CFG	0x510
 #define BIOS_CFG_IOPORT_DATA	0x511
 
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
@@ -62,6 +73,61 @@
 	bswap		%eax
 .endm
 
+
+/*
+ * Read data from the fw_cfg device using DMA.
+ * Clobbers:	%edx, %eax, ADDR, SIZE, memory[%esp-16] to memory[%esp]
+ */
+.macro read_fw_dma VAR, SIZE, ADDR
+        /* Address */
+	bswapl		\ADDR
+	pushl		\ADDR
+
+	/* We only support 32 bit target addresses */
+	xorl		%eax, %eax
+	pushl		%eax
+	mov		$BIOS_CFG_DMA_ADDR_HIGH, %dx
+	outl		%eax, (%dx)
+
+	/* Size */
+	bswapl		\SIZE
+	pushl		\SIZE
+
+        /* Control */
+	movl		$(\VAR << 16) | (FW_CFG_DMA_CTL_READ | FW_CFG_DMA_CTL_SELECT), %eax
+	bswapl		%eax
+	pushl		%eax
+
+	movl		%esp, %eax /* Address of the struct we generated */
+	bswapl		%eax
+	mov		$BIOS_CFG_DMA_ADDR_LOW, %dx
+	outl		%eax, (%dx) /* Initiate DMA */
+
+1:  mov		(%esp), %eax /* Wait for completion */
+	bswapl		%eax
+	testl		$~FW_CFG_DMA_CTL_ERROR, %eax
+	jnz		1b
+       addl            $16, %esp
+.endm
+
+
+/*
+ * Read a blob from the fw_cfg device using DMA
+ * Requires _ADDR, _SIZE and _DATA values for the parameter.
+ *
+ * Clobbers:	%eax, %edx, %es, %ecx, %edi and adresses %esp-20 to %esp
+ */
+#ifdef USE_FW_CFG_DMA
+#define read_fw_blob_dma(var) \
+	read_fw		var ## _SIZE; \
+	mov		%eax, %ecx; \
+	read_fw		var ## _ADDR; \
+	mov		%eax, %edi ;\
+	read_fw_dma	var ## _DATA, %ecx, %edi
+#else
+#define read_fw_blob_dma(var) read_fw_blob(var)
+#endif
+
 #define read_fw_blob_pre(var)				\
 	read_fw		var ## _SIZE;			\
 	mov		%eax, %ecx;			\
-- 
2.31.1



