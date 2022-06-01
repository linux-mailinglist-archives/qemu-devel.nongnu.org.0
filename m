Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97B353ACD3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:31:57 +0200 (CEST)
Received: from localhost ([::1]:38790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwT8O-0004oq-O2
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrN-0002Zn-Ts
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:21 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrK-0006bU-60
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:21 -0400
Received: by mail-ed1-x529.google.com with SMTP id fd25so3310826edb.3
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NNlCCRkYehUnHF3YUoY5VU3xBO+CrXihXdIThtLGzC4=;
 b=sgrmBKKNXwwf1SWSY9JJni5LMaye7ab8bkR4L4NBLJ5UTUX5NGpopj309uu7CSXrc+
 t9YWbcezkWLtt066O7jv2dyoMIybLnbwSyFtgokEl8tvTQR5DOaoPTUTvn+V1aR6zMb7
 rnXlTw0z5EE8bEMxfFRTkBUIFWsh1EjFUPg9gAIYT4GKh5NewtzprUK/olsM/GhMvn01
 tkAfL5LKb7DfVQSmCFYrF8OCssLObGdwV4I6l8C2ULaMicxo2ZO1+UuOmRGAemUhQweM
 aQVs6kkw8Sb3hqt0wbJX5IK6RX4m1FlWk1ga5RGA9sXOf3kcisV3tEWqgdZOY6sTdA8V
 AbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NNlCCRkYehUnHF3YUoY5VU3xBO+CrXihXdIThtLGzC4=;
 b=ExJCPIBNOD3D4XTW5zUVn288SjIkaIoeS1/9JuNzNkD8g0OBJ5egIDOuiZk+VcoPB1
 3GY5qyU1K4eU5Hk1VHX6oR9DaBBWSzxRqujQhS8whRhOtsaHxvVdxqZ96HDMeAbQTAUC
 TovIqQ5TYOPLdygbl5869tkhEO9JiCOPLp4K+CwkeE+CmhWPbrFW8v36xLIzHeDrNMy0
 bILrNo/ybiyV8ZeAdEtZTCw7W1lIqbb0X5phC2StdWnc+QiG3fWJ86YNNT3cVhsyL/yH
 GGFO4lGdfA1CoBVsvkPEpZ966PHD/zAnQZKA2mpNSi37rPJxUlcXMKi/Th2y6wewRdlv
 JbYw==
X-Gm-Message-State: AOAM531SQg86slD4EbrFJqxaAsjwOPonC+jF6SSgMsGofYXYFnnWieb5
 bIc3O5NMJcPIPVIDj9iaMnnX/A==
X-Google-Smtp-Source: ABdhPJxktlA8sXodpENauYi8B1xmUyl80n6oWvS9LyxWr/oblVWC6qwWFgbBPuvNZZIG5bVIShequw==
X-Received: by 2002:a05:6402:2713:b0:42b:7127:8614 with SMTP id
 y19-20020a056402271300b0042b71278614mr1071562edd.317.1654107256857; 
 Wed, 01 Jun 2022 11:14:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 k24-20020aa7c398000000b0042dcac2afc6sm1299864edq.72.2022.06.01.11.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:14:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 298211FFD1;
 Wed,  1 Jun 2022 19:05:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org (open list:Virtual Open Firm...)
Subject: [PULL 26/33] configure: enable cross compilation of vof
Date: Wed,  1 Jun 2022 19:05:30 +0100
Message-Id: <20220601180537.2329566-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Message-Id: <20220527153603.887929-27-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 1ae5c950f0..11e7f30553 100755
--- a/configure
+++ b/configure
@@ -2213,6 +2213,7 @@ LINKS="Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
+LINKS="$LINKS pc-bios/vof/Makefile"
 LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
 LINKS="$LINKS tests/avocado tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
@@ -2250,6 +2251,15 @@ if test -n "$target_cc" &&
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


