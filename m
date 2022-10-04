Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989B65F4446
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:32:01 +0200 (CEST)
Received: from localhost ([::1]:41912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofi1g-00083F-MU
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYd-0008L3-5K
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYZ-0007Nt-U8
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:57 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j16so9271381wrh.5
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wr0Q2zD37EOoCA1/I23rxfY9vRGimGsqv7veJ+10hbQ=;
 b=CGw2D/nxUmRmC3t2Ru5zT+o8Bxu5ry//kmUJgvoIrYVHHaYYj7kbf2/zE/Mw96aGsm
 V3AGi8ZMEFtsHa7Mu6S13OglZRbysNGW+lHPSO2BEXoB3mNsxbvRed30va50fTAXa4uD
 04R/AQGPnTEgzEA+eaYHXuNr4zYRJx2xEDlnoSD1nTW4zLzwTV0EZZ4qo7jL0Gzw3wis
 uW08yjBrzwF4LC+fJVxFhWkKh1G/Dbyyc9Gzn68dfdjTjy9efmEAhjHMdhpRIDnIo1S4
 giuK9MVY3jRQWgTa/uyn1Y2zPAGaYqw3TmiHRw3p+yOk0nr7yWCLc6ynariYN4cMt+IQ
 bzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wr0Q2zD37EOoCA1/I23rxfY9vRGimGsqv7veJ+10hbQ=;
 b=aJK0N7ABMHWKX/pVwOYPVyNnD9hcvbKm4f8OMnpf2XZkVM/QBoowwTxSqngGJXnuET
 GVW71fxvguSDNSVMO3y0BKWGlrCwg5ZHuL6d6XWnr6ENuL+vwtKJF4SePH0r5hpVkTbl
 crfJVjvSCJLbBfA7e4SpomK0JS74wHZqnItJJS9fHuNIDB5kU2fYg9u7uUfGFvRXNt8B
 ntCrAltHhub0G0RuTUoM/ZTz36SsCC69Y59rQWKzmxDBN2H7Oy0R2+x4z4xPz2jHX07C
 ysLDCR7xp2V8nW1ibzYOF1kBAKOujW5uyUtn1xp3/6X/9wUYboMH6QAKOdVHAmH3xR6O
 DdEg==
X-Gm-Message-State: ACrzQf3iT/qOMf/uUyGmBPCg1Oe0MvCFiUUbSI3yuFHIomo1AlVGhPwU
 RBQvhCXSkk/sWQTtMNjT8NQghWgbKQLluA==
X-Google-Smtp-Source: AMsMyM67h4+J/1mnfe8WSjJ6aGMoYi/RkFvUqNRVNftm36Y2DH1foCtfN266PhfOPIFkT1zztDy+Og==
X-Received: by 2002:adf:ef4f:0:b0:22d:d3ae:18df with SMTP id
 c15-20020adfef4f000000b0022dd3ae18dfmr11731058wrp.141.1664888515152; 
 Tue, 04 Oct 2022 06:01:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f5-20020adfdb45000000b0022cc6b8df5esm12344146wrj.7.2022.10.04.06.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E561F1FFC5;
 Tue,  4 Oct 2022 14:01:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390-ccw boot)
Subject: [PULL 14/54] pc-bios/s390-ccw: detect CC options just once
Date: Tue,  4 Oct 2022 14:00:58 +0100
Message-Id: <20221004130138.2299307-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

In preparation for adding Docker container support, detect compiler options
just once rather than once per Make run; container startup overhead is
substantial and doing the detection just once makes things faster.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929114231.583801-15-alex.bennee@linaro.org>

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


