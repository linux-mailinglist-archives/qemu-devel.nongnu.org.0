Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3992D5F44E3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:56:25 +0200 (CEST)
Received: from localhost ([::1]:51590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiPI-0006nr-Aq
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgU-0007gn-Er
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:06 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgS-00008e-8x
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:06 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so703722wmr.1
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bZH8OiYeAig/0Y57xFpjpCyBQW7+CsoHCu1FGMGd9fQ=;
 b=sDALifZz16bpE5E47/RnASG0yZ4Y+wm7mXhSK5ptrOxiOgUVF70HCzSvIk8JK7cLOm
 7EhIHU+V5MfNPQy96c5rep1oGcROkbm8a3H7YgrWtsQOdAd9lfaTc9qWZahhJ7410ZiQ
 swhy2YXwdPAojmuhPe3CkkgXztvaKIzrTem27hOiPnMQL34+6DsHksfYAzQ/RJfjixwr
 NiYS0MKOBNOe/LqAyImbyQhy9p7oDizlfw+cePQtU5JBKr1uwxJ6TAqRg4pfXt2zV2tS
 0TNJKSHewZEuVPYGWj/DBUVBAClKgvyZLPHyU2xOM0eNybPWWFfM7fO9d89jG+FiJY1B
 DCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bZH8OiYeAig/0Y57xFpjpCyBQW7+CsoHCu1FGMGd9fQ=;
 b=QVB49pCP4nqT1nqQPubV6eV528r09/Df6peTbW7+6762FGSqaM2zWFwWVe/Y+OrsrW
 v/qwRYY/8ZGwW4NUsKqVQCig2MwuCT4Av+0CivHIM5itIn0PWe9CWtagI4AEYE4LfV+G
 AUE6OBzhU2OxWgiI8X6E2S5RSzp5d7Te2lMkhln3o/387rnpcYPUuiSX8KFbws49Ow4a
 PUKztz2hC9fpgfj+ILbqdYOANjcAmKy44Ti+PTqZ3BTsACaQ5MoS95Hjvs1ga945uXEj
 3oF++Fpt4LGBIptrPVXRykeGLHD8xJoWo90fTSEOMZts0vNpaGkJkk6epsCm90jC9+g/
 9kgA==
X-Gm-Message-State: ACrzQf3qOKvOri3kL5pOHKBHZ77SNc25muLiaxNNQrideLlpGtA4qMaZ
 xcfN8HTbeNZX1ea5njViFWTwaw==
X-Google-Smtp-Source: AMsMyM5ffEE6wr4rwgG5usDBquq3r79NBPLcIx4zrWTD2pXnmgiW4mXMalJWyVuhqqS82jdceni4PQ==
X-Received: by 2002:a05:600c:1d2a:b0:3b4:6e31:92da with SMTP id
 l42-20020a05600c1d2a00b003b46e3192damr9739173wms.103.1664889003436; 
 Tue, 04 Oct 2022 06:10:03 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c339400b003a5c999cd1asm17714365wmp.14.2022.10.04.06.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:10:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B89191FFD2;
 Tue,  4 Oct 2022 14:01:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390-ccw boot)
Subject: [PULL 30/54] pc-bios/s390-ccw: Adopt meson style Make output
Date: Tue,  4 Oct 2022 14:01:14 +0100
Message-Id: <20221004130138.2299307-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929114231.583801-31-alex.bennee@linaro.org>

diff --git a/pc-bios/s390-ccw/netboot.mak b/pc-bios/s390-ccw/netboot.mak
index ee59a5f4de..046aa35587 100644
--- a/pc-bios/s390-ccw/netboot.mak
+++ b/pc-bios/s390-ccw/netboot.mak
@@ -11,10 +11,10 @@ NETLDFLAGS := $(LDFLAGS) -Wl,-Ttext=0x7800000
 $(NETOBJS): EXTRA_CFLAGS += $(LIBC_INC) $(LIBNET_INC)
 
 s390-netboot.elf: $(NETOBJS) libnet.a libc.a
-	$(call quiet-command,$(CC) $(NETLDFLAGS) -o $@ $^,"BUILD","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) $(NETLDFLAGS) -o $@ $^,Linking)
 
 s390-netboot.img: s390-netboot.elf
-	$(call quiet-command,$(STRIP) --strip-unneeded $< -o $@,"STRIP","$(TARGET_DIR)$@")
+	$(call quiet-command,$(STRIP) --strip-unneeded $< -o $@,Stripping $< into)
 
 # libc files:
 
@@ -23,30 +23,30 @@ LIBC_CFLAGS = $(EXTRA_CFLAGS) $(CFLAGS) $(LIBC_INC) $(LIBNET_INC) \
 
 CTYPE_OBJS = isdigit.o isxdigit.o toupper.o
 %.o : $(SLOF_DIR)/lib/libc/ctype/%.c
-	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,"CC","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,Compiling)
 
 STRING_OBJS = strcat.o strchr.o strrchr.o strcpy.o strlen.o strncpy.o \
 	      strcmp.o strncmp.o strcasecmp.o strncasecmp.o strstr.o \
 	      memset.o memcpy.o memmove.o memcmp.o
 %.o : $(SLOF_DIR)/lib/libc/string/%.c
-	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,"CC","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,Compiling)
 
 STDLIB_OBJS = atoi.o atol.o strtoul.o strtol.o rand.o malloc.o free.o
 %.o : $(SLOF_DIR)/lib/libc/stdlib/%.c
-	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,"CC","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,Compiling)
 
 STDIO_OBJS = sprintf.o snprintf.o vfprintf.o vsnprintf.o vsprintf.o fprintf.o \
 	     printf.o putc.o puts.o putchar.o stdchnls.o fileno.o
 %.o : $(SLOF_DIR)/lib/libc/stdio/%.c
-	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,"CC","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,Compiling)
 
 sbrk.o: $(SLOF_DIR)/slof/sbrk.c
-	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,"CC","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) $(LIBC_CFLAGS) -c -o $@ $<,Compiling)
 
 LIBCOBJS := $(STRING_OBJS) $(CTYPE_OBJS) $(STDLIB_OBJS) $(STDIO_OBJS) sbrk.o
 
 libc.a: $(LIBCOBJS)
-	$(call quiet-command,$(AR) -rc $@ $^,"AR","$(TARGET_DIR)$@")
+	$(call quiet-command,$(AR) -rc $@ $^,Creating static library)
 
 # libnet files:
 
@@ -56,7 +56,7 @@ LIBNETCFLAGS = $(EXTRA_CFLAGS) $(CFLAGS) $(LIBC_INC) $(LIBNET_INC) \
 	       -DDHCPARCH=0x1F -MMD -MP -MT $@ -MF $(@:%.o=%.d)
 
 %.o : $(SLOF_DIR)/lib/libnet/%.c
-	$(call quiet-command,$(CC) $(LIBNETCFLAGS) -c -o $@ $<,"CC","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) $(LIBNETCFLAGS) -c -o $@ $<,Compiling)
 
 libnet.a: $(LIBNETOBJS)
-	$(call quiet-command,$(AR) -rc $@ $^,"AR","$(TARGET_DIR)$@")
+	$(call quiet-command,$(AR) -rc $@ $^,Creating static library)
diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index 965e633f43..10e8f5cb63 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -10,8 +10,8 @@ NULL :=
 SPACE := $(NULL) #
 TARGET_PREFIX := $(patsubst %/,%:$(SPACE),$(TARGET_DIR))
 
-quiet-@ = $(if $(V),,@)
-quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
+quiet-@ = $(if $(V),,@$(if $1,printf "%s\n" "$(TARGET_PREFIX)$1" && ))
+quiet-command = $(call quiet-@,$2 $@)$1
 
 VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
 set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath $(PATTERN) $1)))
@@ -22,11 +22,11 @@ QEMU_DGFLAGS = -MMD -MP -MT $@ -MF $(@D)/$(*F).d
 
 %.o: %.c
 	$(call quiet-command,$(CC) $(EXTRA_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) \
-	       -c -o $@ $<,"CC","$(TARGET_DIR)$@")
+	       -c -o $@ $<,Compiling)
 
 %.o: %.S
 	$(call quiet-command,$(CCAS) $(EXTRA_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) \
-	       -c -o $@ $<,"CCAS","$(TARGET_DIR)$@")
+	       -c -o $@ $<,Assembling)
 
 .PHONY : all clean build-all distclean
 
@@ -58,10 +58,10 @@ LDFLAGS += -Wl,-pie -nostdlib
 build-all: s390-ccw.img s390-netboot.img
 
 s390-ccw.elf: $(OBJECTS)
-	$(call quiet-command,$(CC) $(LDFLAGS) -o $@ $(OBJECTS),"BUILD","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CC) $(LDFLAGS) -o $@ $(OBJECTS),Linking)
 
 s390-ccw.img: s390-ccw.elf
-	$(call quiet-command,$(STRIP) --strip-unneeded $< -o $@,"STRIP","$(TARGET_DIR)$@")
+	$(call quiet-command,$(STRIP) --strip-unneeded $< -o $@,Stripping $< into)
 
 $(OBJECTS): Makefile
 
-- 
2.34.1


