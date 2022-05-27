Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A695E53654E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:57:52 +0200 (CEST)
Received: from localhost ([::1]:57194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucLX-0000Vy-P0
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0r-000104-U3
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:29 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:45725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0p-0002PB-IC
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:29 -0400
Received: by mail-ej1-x62a.google.com with SMTP id jx22so9411759ejb.12
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t85avgb/nvmewBFKywhnkuvzPqaOlsTW4/UZSCyAZLE=;
 b=WkFGbR2B0xw0tzZY84BNpkf7jBfk4FRYYM0Ey8ueLBTAaWAm0WruxtiR2SFSHdAH0T
 rOEnNR1CIFoDx5yfcko1/GuHk4X46jQL49ry+0Bid04hwJ5g1BN+UISCkezvJqwqmPx+
 34aSWCADexwWndQrMBsurvZ9LlDJSPnQREzXURhZw2TtJX3PzsHbPl/q2PN4v1Bd3p3C
 yDlSak2qyA++0dKhTBsiD4jjRX6piaVBzLDE7PaeAtfJ5ylbY5HcPWCkszOfXEjqLYX6
 Uwai2/rahKrLRAFOK3oBHE/DNGRP2dj8f+vOeowjluhK6BhfSnhPKOmzQbWRXqzYHyZg
 meQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t85avgb/nvmewBFKywhnkuvzPqaOlsTW4/UZSCyAZLE=;
 b=HSADLQr0pCQ0hWH88JIKlA/oj+I3ZFYNOuQoaF3ulCGqVzDA06oLh5X+dqhBs4Q5Bc
 PTRoIIw2tXiszl/mzBlFPgxF20QI3sJHR4CWEKcdSB+BeRxIq6RlP98bHlwwc6865BjP
 7Qc/nOS/04GWazTwo8P6O5V4KjqKb+bk22ifrpM5RANgCYQAj0Sq2bz9EfZQZ1SGawhv
 12cEVvzxP442INXJBFEcrzFsdq1DhuQQnMa4qMp6COBjHw4JUvPkDjuF7CNwjofebnrE
 KpRoelXQth+ZRZAb2PqJpFy1ZPumSi5YXSqtsu7OMa6B6/j5xMdQE6hvleSjRCQrUWrR
 Y4VQ==
X-Gm-Message-State: AOAM5327MBJJaWXiqqz2CC6LGaVJXnqktumiP0lAHdkqTctqkw//0Sa1
 UwQ3/JWmyh6WINAq3zVf1LPGJA==
X-Google-Smtp-Source: ABdhPJzQ25WFVJgP+sHy77f9KP12Oe2dbI2iV/Yb2LhkGrl1sb0Wmni9kjoWBGt3qYTGsav7xz8Wmg==
X-Received: by 2002:a17:907:1c85:b0:6ff:4607:1bb with SMTP id
 nb5-20020a1709071c8500b006ff460701bbmr1634914ejc.675.1653665786796; 
 Fri, 27 May 2022 08:36:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a17090648c300b006f39ffe23fdsm1580596ejt.0.2022.05.27.08.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:36:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 26E441FFD2;
 Fri, 27 May 2022 16:36:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org (open list:Virtual Open Firm...)
Subject: [PATCH  v1 26/33] configure: enable cross compilation of vof
Date: Fri, 27 May 2022 16:35:56 +0100
Message-Id: <20220527153603.887929-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Paolo Bonzini <pbonzini@redhat.com>

While container-based cross compilers are not supported, this already
makes it possible to build vof on any machine that has an installation
of GCC and binutils for 32- or 64-bit PowerPC.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220517092616.1272238-16-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure            | 10 ++++++++++
 pc-bios/vof/Makefile | 17 +++++++++--------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index b974db3ebd..89a0470cc2 100755
--- a/configure
+++ b/configure
@@ -2209,6 +2209,7 @@ LINKS="Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
+LINKS="$LINKS pc-bios/vof/Makefile"
 LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
 LINKS="$LINKS tests/avocado tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
@@ -2246,6 +2247,15 @@ if test -n "$target_cc" &&
     fi
 fi
 
+probe_target_compilers ppc ppc64
+if test -n "$target_cc" && test "$softmmu" = yes; then
+    roms="$roms vof"
+    config_mak=pc-bios/vof/config.mak
+    echo "# Automatically generated by configure - do not modify" > $config_mak
+    echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
+    write_target_makefile >> $config_mak
+fi
+
 # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
 # (which is the lowest architecture level that Clang supports)
 probe_target_compiler s390x
diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
index aa1678c4d8..391ac0d600 100644
--- a/pc-bios/vof/Makefile
+++ b/pc-bios/vof/Makefile
@@ -1,11 +1,10 @@
-all: build-all
+include config.mak
+VPATH=$(SRC_DIR)
+all: vof.bin
 
-build-all: vof.bin
-
-CROSS ?=
-CC = $(CROSS)gcc
-LD = $(CROSS)ld
-OBJCOPY = $(CROSS)objcopy
+CC ?= $(CROSS)gcc
+LD ?= $(CROSS)ld
+OBJCOPY ?= $(CROSS)objcopy
 
 %.o: %.S
 	$(CC) -m32 -mbig-endian -mcpu=power4 -c -o $@ $<
@@ -14,10 +13,12 @@ OBJCOPY = $(CROSS)objcopy
 	$(CC) -m32 -mbig-endian -mcpu=power4 -c -fno-stack-protector -o $@ $<
 
 vof.elf: entry.o main.o ci.o bootmem.o libc.o
-	$(LD) -nostdlib -e_start -Tvof.lds -EB -o $@ $^
+	$(LD) -nostdlib -e_start -T$(SRC_DIR)/vof.lds -EB -o $@ $^
 
 %.bin: %.elf
 	$(OBJCOPY) -O binary -j .text -j .data -j .toc -j .got2 $^ $@
 
 clean:
 	rm -f *.o vof.bin vof.elf *~
+
+.PHONY: all clean
-- 
2.30.2


