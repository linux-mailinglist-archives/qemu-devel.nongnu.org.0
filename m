Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4970F5EF5E2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:59:54 +0200 (CEST)
Received: from localhost ([::1]:51002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odt8q-0000Sb-Qs
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrwC-0004YD-TB
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:44 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:42604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrwB-0001F1-3w
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:44 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so597213wmq.1
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uQdXxIltIBqxlqRXaWUabtXFolq1I3oIKJXyfpV9mzg=;
 b=DMXbG7L3W4U8nB50T0H7Sthy9mrno10SnPPbj3vL7qJfCkLlMk3ss/pB+JBw7oDS6w
 x75wGLmFSfUO35woQvlPTbB06ydKh8DK+3e8qYUHepl29tJdY6v/s7rO+PioeTBw1Xos
 60L7aAA6F20pBLLUXQVYvF5VfPRD5TcPIMzteLgtd9Yas05UkxvLUGzRfo9Li+5dPmGH
 3TR4h0CCS0Oxa0ROGQfjVb9jslaUfp53NKpcBHgfZno1Pj8AeSTler+j5tj+D4afa5sU
 Yd2GGwsL7j4lV0640qG1xGos93qU+qmPSyRLbF3gv1PUxjI0dexebFvN+Vi52Cdn7kSz
 HnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uQdXxIltIBqxlqRXaWUabtXFolq1I3oIKJXyfpV9mzg=;
 b=7SL27EdHfg/vREeKbDYsM3m8/9utv+8zF5IOjJBF4tYRcC3FrJhmbhMYaxmZmh7ZSu
 ynLpHXHpCJsihSSxljzOhn1v+5d9h6EDI36c58suvPzbGBgS3QWkramb+TN9doVgsnXt
 h3R++4tdAC8FvRWbv6ubcRQMkvJiQp4KqZolrKQ0ITf0P16+GimpGeZbsNBXmAMDxydz
 LfdZeGd/K6xhgfgXonJpXBao9DtfcUgjB/q3VYeJHaosV2W/Cg7DBHq3WUof6hzmNDSr
 duHmRckjVIP9o9NBOBs3L5IL2FV2tFNmzqavG4wBCFK1DPAYan1waEDD2JpEKNqFyvQc
 PjzQ==
X-Gm-Message-State: ACrzQf1k6v+BaNU3NvGYmWLiuXP2oewSck7vopbkpBH/7TzTWaRCyh47
 KaDdNkkLlS6Asy9gAyAlsUr8kA==
X-Google-Smtp-Source: AMsMyM5c7NnaeHOIX0cg+fpt+5DPH7Ghv9R7j/0hDnL8ZW4kLUOzR0zKTej9Tv0fG0LwnYpxuPmfsA==
X-Received: by 2002:a7b:c8d6:0:b0:3b4:868b:afc3 with SMTP id
 f22-20020a7bc8d6000000b003b4868bafc3mr10077214wml.66.1664451761349; 
 Thu, 29 Sep 2022 04:42:41 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a05600c214d00b003b505d26776sm4060860wml.5.2022.09.29.04.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DE16D1FFC5;
 Thu, 29 Sep 2022 12:42:32 +0100 (BST)
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
Subject: [PATCH  v1 14/51] pc-bios/s390-ccw: detect CC options just once
Date: Thu, 29 Sep 2022 12:41:54 +0100
Message-Id: <20220929114231.583801-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

In preparation for adding Docker container support, detect compiler options
just once rather than once per Make run; container startup overhead is
substantial and doing the detection just once makes things faster.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 pc-bios/s390-ccw/netboot.mak |  7 ++-----
 pc-bios/s390-ccw/Makefile    | 33 +++++++++++++++++++++++++--------
 2 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/pc-bios/s390-ccw/netboot.mak b/pc-bios/s390-ccw/netboot.mak
index 7639da194c..ee59a5f4de 100644
--- a/pc-bios/s390-ccw/netboot.mak
+++ b/pc-bios/s390-ccw/netboot.mak
@@ -16,12 +16,9 @@ s390-netboot.elf: $(NETOBJS) libnet.a libc.a
 s390-netboot.img: s390-netboot.elf
 	$(call quiet-command,$(STRIP) --strip-unneeded $< -o $@,"STRIP","$(TARGET_DIR)$@")
 
-# SLOF is GCC-only, so ignore warnings about GNU extensions with Clang here
-NO_GNU_WARN := $(call cc-option,-Werror $(QEMU_CFLAGS),-Wno-gnu)
-
 # libc files:
 
-LIBC_CFLAGS = $(EXTRA_CFLAGS) $(CFLAGS) $(NO_GNU_WARN) $(LIBC_INC) $(LIBNET_INC) \
+LIBC_CFLAGS = $(EXTRA_CFLAGS) $(CFLAGS) $(LIBC_INC) $(LIBNET_INC) \
 	      -MMD -MP -MT $@ -MF $(@:%.o=%.d)
 
 CTYPE_OBJS = isdigit.o isxdigit.o toupper.o
@@ -55,7 +52,7 @@ libc.a: $(LIBCOBJS)
 
 LIBNETOBJS := args.o dhcp.o dns.o icmpv6.o ipv6.o tcp.o udp.o bootp.o \
 	      dhcpv6.o ethernet.o ipv4.o ndp.o tftp.o pxelinux.o
-LIBNETCFLAGS = $(EXTRA_CFLAGS) $(CFLAGS) $(NO_GNU_WARN) $(LIBC_INC) $(LIBNET_INC) \
+LIBNETCFLAGS = $(EXTRA_CFLAGS) $(CFLAGS) $(LIBC_INC) $(LIBNET_INC) \
 	       -DDHCPARCH=0x1F -MMD -MP -MT $@ -MF $(@:%.o=%.d)
 
 %.o : $(SLOF_DIR)/lib/libnet/%.c
diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index c8784c2a08..965e633f43 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -6,9 +6,12 @@ include config-host.mak
 CFLAGS = -O2 -g
 MAKEFLAGS += -rR
 
+NULL :=
+SPACE := $(NULL) #
+TARGET_PREFIX := $(patsubst %/,%:$(SPACE),$(TARGET_DIR))
+
+quiet-@ = $(if $(V),,@)
 quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
-cc-option = $(if $(shell $(CC) $1 $2 -S -o /dev/null -xc /dev/null \
-			 >/dev/null 2>&1 && echo OK),$2,$3)
 
 VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
 set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath $(PATTERN) $1)))
@@ -25,22 +28,33 @@ QEMU_DGFLAGS = -MMD -MP -MT $@ -MF $(@D)/$(*F).d
 	$(call quiet-command,$(CCAS) $(EXTRA_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) \
 	       -c -o $@ $<,"CCAS","$(TARGET_DIR)$@")
 
-.PHONY : all clean build-all
+.PHONY : all clean build-all distclean
 
 OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o menu.o \
 	  virtio.o virtio-scsi.o virtio-blkdev.o libc.o cio.o dasd-ipl.o
 
-EXTRA_CFLAGS := $(EXTRA_CFLAGS) -Wall
-EXTRA_CFLAGS += $(call cc-option,-Werror $(EXTRA_CFLAGS),-Wno-stringop-overflow)
+EXTRA_CFLAGS += -Wall
 EXTRA_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE
 EXTRA_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
-EXTRA_CFLAGS += $(call cc-option, $(EXTRA_CFLAGS), -fno-stack-protector)
-EXTRA_CFLAGS += $(call cc-option, $(EXTRA_CFLAGS), -Wno-array-bounds)
 EXTRA_CFLAGS += -msoft-float
-EXTRA_CFLAGS += $(call cc-option, $(EXTRA_CFLAGS),-march=z900,-march=z10)
 EXTRA_CFLAGS += -std=gnu99
 LDFLAGS += -Wl,-pie -nostdlib
 
+cc-test = $(CC) -Werror $1 -c -o /dev/null -xc /dev/null >/dev/null 2>/dev/null
+cc-option = if $(call cc-test, $1); then \
+    echo "$(TARGET_PREFIX)$1 detected" && echo "EXTRA_CFLAGS += $1" >&3; else \
+    echo "$(TARGET_PREFIX)$1 not detected" $(if $2,&& echo "EXTRA_CFLAGS += $2" >&3); fi
+
+config-cc.mak: Makefile
+	$(quiet-@)($(call cc-option,-Wno-stringop-overflow); \
+	    $(call cc-option,-fno-stack-protector); \
+	    $(call cc-option,-Wno-array-bounds); \
+	    $(call cc-option,-Wno-gnu); \
+	    $(call cc-option,-march=z900,-march=z10)) 3> config-cc.mak
+-include config-cc.mak
+
+LDFLAGS += -Wl,-pie -nostdlib
+
 build-all: s390-ccw.img s390-netboot.img
 
 s390-ccw.elf: $(OBJECTS)
@@ -63,3 +77,6 @@ ALL_OBJS = $(sort $(OBJECTS) $(NETOBJS) $(LIBCOBJS) $(LIBNETOBJS))
 
 clean:
 	rm -f *.o *.d *.img *.elf *~ *.a
+
+distclean:
+	rm -f config-cc.mak
-- 
2.34.1


