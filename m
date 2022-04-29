Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DAC514CF0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:30:45 +0200 (CEST)
Received: from localhost ([::1]:55228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkRdq-0003Hh-74
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRS1-0005lB-97
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:30 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:38509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkRRz-0004aP-OP
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:18:29 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z99so9252060ede.5
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EjTvkAW7QyXc5iAFTituHf5ht0mFR+ObaQDlumtGE10=;
 b=CoIfWVFSp2rv/IF6gG8pZbHLunWNWAzcNVs4/TWwPrdrMa+Z/tVSgRSs7gO1a/qtuY
 TSJxSEcnLNudhEg0zz2DZ0rUyKK8mTdmVstKq4Febw4mJ+5VcRqn0odU44q5Wnk1dTda
 i1Epv1nKOjCSp0FYlKCrw06qy/vsZrmRHaY+DH2i36O86AYU0DBXRYUd3JWFGP5yDIHK
 uKXGXPVzALnOfTgVEKUutoe6JGro8UtNptzEvs8DzwDcjxg3RUsbOY39gkzcsMxywu11
 gf0AQkyFHSwHZpTS/AALRrnKFr6B4xLur+XH/stZdjhKNuCUP3dAAycULrBBv/HT8fAn
 eeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EjTvkAW7QyXc5iAFTituHf5ht0mFR+ObaQDlumtGE10=;
 b=uFqrR8EWPAGK7PfNiHbCG7cwDM+/gsrlhWn9zsbEeWtIneM26clhA+RrMwkiLmneWh
 tSc5Wc/w5XxnWikgddmRy8fK+srRx/N12jCMyonMmtpNtvWUnqaNGy+mifULEaKjnUG9
 TNmnYFb+qP6fxoCjuAX3Cq3jiGO8iB1u+bYn1IIUXhJPlTy1fELjyVkKxgKpqE7r+vL5
 dKJWajuGt3ERSBdSn/Oz2LWMRvIVFv6Vyk4WFqXNVyMyxSAIb+FliQRc7pF5Gcy4TZJi
 IhrK2YK420bUr5MCx0RW/9ge17IhTadJXaGNvchoYQD+bUS+Uei7QX41QKM1nQm5lqBE
 CxOw==
X-Gm-Message-State: AOAM531ZfZ2RgNeYfXMO7bVE0h8qhgSXXhevvpvqFtrd/0PrJ5khAAQx
 3aCgi0kwP2l0E7yQ1A08g29U2ysJjKsEXg==
X-Google-Smtp-Source: ABdhPJw+2T5nGttpccR5HpA5OcAzE42aSx1KCu2TjqTzuNRKp/i/Vg6RtL1AsdNf0hMdkxt9ipxhcw==
X-Received: by 2002:a05:6402:d05:b0:425:b7ab:776e with SMTP id
 eb5-20020a0564020d0500b00425b7ab776emr40805499edb.142.1651241905735; 
 Fri, 29 Apr 2022 07:18:25 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b006f3ef214e27sm692298ejc.141.2022.04.29.07.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 07:18:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 12/12] configure: enable cross compilation of vof
Date: Fri, 29 Apr 2022 16:18:13 +0200
Message-Id: <20220429141813.328975-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429141813.328975-1-pbonzini@redhat.com>
References: <20220429141813.328975-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While container-based cross compilers are not supported, this already
makes it possible to build vof on any machine that has an installation
of GCC and binutils for 32- or 64-bit PowerPC.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure            | 10 ++++++++++
 pc-bios/vof/Makefile | 17 +++++++++--------
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index 6b8e2e2fdb..1db1eef7b1 100755
--- a/configure
+++ b/configure
@@ -2232,6 +2232,7 @@ LINKS="Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
+LINKS="$LINKS pc-bios/vof/Makefile"
 LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
 LINKS="$LINKS tests/avocado tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
@@ -2269,6 +2270,15 @@ if test -n "$target_cc" &&
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
 # Only build s390-ccw bios the compiler has -march=z900 or -march=z10 (which is
 # the lowest architecture level that Clang supports)
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
2.35.1


