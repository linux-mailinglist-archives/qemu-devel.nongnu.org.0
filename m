Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9A25EF801
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:50:20 +0200 (CEST)
Received: from localhost ([::1]:38666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odurj-0001P9-D0
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsD0-0007TG-6f
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:06 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsCs-0004N5-Q4
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:05 -0400
Received: by mail-wr1-x429.google.com with SMTP id u10so1708344wrq.2
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PobWf7yOB0RYiCJawLepi7wEAh6rZnGVT96VCMWAonk=;
 b=Z0dzGm/3p1BCHcuVFOYOr23R/jEJgWXbDM49ANT9i0kWzPJ9TQVBPNcwS0Nm+fIP5Y
 XCQE3LYqOuIhb0k/dEqMfnfBAfaBU2eWIsbCDPOwaxhIXJHLZuSTaAV6kiy5H/C3j3vF
 JL/L18AZRCVJXmea/iOdiZyXJjGP4LrtE4DpovM9NhamckfvQa4kZXIxZykDJ1me2yJi
 p9q/yyaXQ9jwCQ1k9Y5+lwNLspOaA7/kXZhFWtUVtuRiBDEwkwp7BFXfKhAXGn+iFbF5
 YARJCYwzMB4s1ZPUuu8u4Fn5odbmOgP6zYYNZWXsogYh+uVX9WFkzCadTPZIap5JCMYI
 d5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PobWf7yOB0RYiCJawLepi7wEAh6rZnGVT96VCMWAonk=;
 b=tfoJybAWc3u7SiL6PEMIDhv9WOTS8hp07MAA9yPUzMvKnDt01ywHedOvkTZ8IyJPUP
 pHNy0Jk06dXMYJ/EAhjGg4yYWKrDCHuitv3MSAC07/SOHjTgenuqGmkKzk3D4hKx07Wy
 XWk2DyvEPSsU6V3OTDHx8727h+L9EUQpJJAgJlLZSOaQwbt6f0QJWgzzgzrr76bGWBoU
 rDFtWxrEIa6kLr8XC99DnwCaIg+5OTGXG1GSIfeAwtucZ/CDlvi0sKBiJzCIyW/R7bD0
 pH9KH8tiM6TS4u3lYq1oxEbDVO8SGmBPa4zRTnUs2XxVNH1iXOTLucGwNiEdNiZEPF3u
 sQeA==
X-Gm-Message-State: ACrzQf3C7ocLjrqAzKWnJrFRsrYAmnmeK48zBJJd52FMWLct6VZCuiaF
 eDlaEaap1+a6ZFa5lIsPf0URiQ==
X-Google-Smtp-Source: AMsMyM4wOOP055lwNGPyrTsyaGfsOywsxEHZCODWiZ15b7HehMjZvv70Cl9JpVJo4AvnGBTqjs0x7w==
X-Received: by 2002:a05:6000:144d:b0:22a:f4ef:c900 with SMTP id
 v13-20020a056000144d00b0022af4efc900mr2037632wrx.678.1664452797382; 
 Thu, 29 Sep 2022 04:59:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a5d4d43000000b0022762b0e2a2sm6536441wru.6.2022.09.29.04.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:59:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B255C1FFBC;
 Thu, 29 Sep 2022 12:42:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-s390x@nongnu.org (open list:S390 general arch...)
Subject: [PATCH  v1 30/51] pc-bios/s390-ccw: Adopt meson style Make output
Date: Thu, 29 Sep 2022 12:42:10 +0100
Message-Id: <20220929114231.583801-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 pc-bios/s390-ccw/netboot.mak | 20 ++++++++++----------
 pc-bios/s390-ccw/Makefile    | 12 ++++++------
 2 files changed, 16 insertions(+), 16 deletions(-)

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


