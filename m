Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6343B240BA6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 19:10:46 +0200 (CEST)
Received: from localhost ([::1]:60996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5BJt-0006z6-BX
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 13:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BIc-0005GX-4I
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:09:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51842
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BIa-0002hK-4F
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:09:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597079363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7YfJeKoZjmp5EjXaiy91R897KhxVAZLBJndd9VXwKjc=;
 b=OXtvcmOsDsFn6CLcqy/t3Bp/tJjoaOirOw/L8ZAC6DsQMzLvlganF7HhjMFWvwduhxx98i
 0TLPSbmml+4H38yhZx0vbQucCPNg8OG2+nGJOeEUk7Tfje4ExmuQYYlyBz25EsFd157t97
 z7u5G8vyAvFG6e6fwxHXFQo7Aoep/ME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-48BC0E8RPiKsIaVhCcdCKw-1; Mon, 10 Aug 2020 13:09:19 -0400
X-MC-Unique: 48BC0E8RPiKsIaVhCcdCKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 685E0100CCC0
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:09:18 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A002387D64;
 Mon, 10 Aug 2020 17:09:14 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 002/147] optionrom: simplify Makefile
Date: Mon, 10 Aug 2020 19:06:40 +0200
Message-Id: <1597079345-42801-3-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 11:00:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Make it independent from the rules.mak, and clean up to use pattern rules.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/optionrom/Makefile | 67 ++++++++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 26 deletions(-)

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index e33a24d..51cb6ca 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -1,13 +1,16 @@
-all: build-all
+CURRENT_MAKEFILE := $(realpath $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))
+SRC_DIR := $(dir $(CURRENT_MAKEFILE))
+TOPSRC_DIR := $(SRC_DIR)/../..
+VPATH = $(SRC_DIR)
+
+all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
 # Dummy command so that make thinks it has done something
 	@true
 
 include ../../config-host.mak
-include $(SRC_PATH)/rules.mak
-
-$(call set-vpath, $(SRC_PATH)/pc-bios/optionrom)
 
-.PHONY : all clean build-all
+quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
+cc-option = $(if $(shell $(CC) $1 -S -o /dev/null -xc /dev/null >/dev/null 2>&1 && echo OK), $1, $2)
 
 # Compiling with no optimization creates ROMs that are too large
 ifeq ($(lastword $(filter -O%, -O0 $(CFLAGS))),-O0)
@@ -15,48 +18,60 @@ override CFLAGS += -O2
 endif
 override CFLAGS += -march=i486
 
-# Drop -fstack-protector and the like
-QEMU_CFLAGS := $(filter -W%, $(QEMU_CFLAGS)) $(CFLAGS_NOPIE) -ffreestanding
-QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS), -fno-stack-protector)
-QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS), -m16)
-ifeq ($(filter -m16, $(QEMU_CFLAGS)),)
+# Flags for dependency generation
+override CPPFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
+
+override CFLAGS += $(filter -W%, $(QEMU_CFLAGS))
+override CFLAGS += $(CFLAGS_NOPIE) -ffreestanding -I$(TOPSRC_DIR)/include
+override CFLAGS += $(call cc-option, -fno-stack-protector)
+override CFLAGS += $(call cc-option, -m16)
+
+ifeq ($(filter -m16, $(CFLAGS)),)
 # Attempt to work around compilers that lack -m16 (GCC <= 4.8, clang <= ??)
 # On GCC we add -fno-toplevel-reorder to keep the order of asm blocks with
 # respect to the rest of the code.  clang does not have -fno-toplevel-reorder,
 # but it places all asm blocks at the beginning and we're relying on it for
 # the option ROM header.  So just force clang not to use the integrated
 # assembler, which doesn't support .code16gcc.
-QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS), -fno-toplevel-reorder)
-QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS), -no-integrated-as)
-QEMU_CFLAGS += -m32 -include $(SRC_PATH)/pc-bios/optionrom/code16gcc.h
+override CFLAGS += $(call cc-option, -fno-toplevel-reorder)
+override CFLAGS += $(call cc-option, -no-integrated-as)
+override CFLAGS += -m32 -include $(SRC_DIR)/code16gcc.h
 endif
 
-QEMU_INCLUDES += -I$(SRC_PATH)
-
 Wa = -Wa,
-ASFLAGS += -32
-QEMU_CFLAGS += $(call cc-c-option, $(QEMU_CFLAGS), $(Wa)-32)
+override ASFLAGS += -32
+override CFLAGS += $(call cc-option, $(Wa)-32)
 
-build-all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
 
-# suppress auto-removal of intermediate files
-.SECONDARY:
+LD_I386_EMULATION ?= elf_i386
+override LDFLAGS = -m $(LD_I386_EMULATION) -T $(SRC_DIR)/flat.lds
+override LDFLAGS += $(LDFLAGS_NOPIE)
 
+all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
+
+pvh.img: pvh.o pvh_main.o
 
 %.o: %.S
-	$(call quiet-command,$(CPP) $(QEMU_INCLUDES) $(QEMU_DGFLAGS) -c -o - $< | $(AS) $(ASFLAGS) -o $@,"AS","$(TARGET_DIR)$@")
+	$(call quiet-command,$(CPP) $(CPPFLAGS) -c -o - $< | $(AS) $(ASFLAGS) -o $@,"AS","$@")
 
-pvh.img: pvh.o pvh_main.o
-	$(call quiet-command,$(LD) $(LDFLAGS_NOPIE) -m $(LD_I386_EMULATION) -T $(SRC_PATH)/pc-bios/optionrom/flat.lds -s -o $@ $^,"BUILD","$(TARGET_DIR)$@")
+%.o: %.c
+	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@,"CC","$@")
 
 %.img: %.o
-	$(call quiet-command,$(LD) $(LDFLAGS_NOPIE) -m $(LD_I386_EMULATION) -T $(SRC_PATH)/pc-bios/optionrom/flat.lds -s -o $@ $<,"BUILD","$(TARGET_DIR)$@")
+	$(call quiet-command,$(LD) $(LDFLAGS) -s -o $@ $^,"BUILD","$@")
 
 %.raw: %.img
-	$(call quiet-command,$(OBJCOPY) -O binary -j .text $< $@,"BUILD","$(TARGET_DIR)$@")
+	$(call quiet-command,$(OBJCOPY) -O binary -j .text $< $@,"BUILD","$@")
 
 %.bin: %.raw
-	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/signrom.py $< $@,"SIGN","$(TARGET_DIR)$@")
+	$(call quiet-command,$(PYTHON) $(TOPSRC_DIR)/scripts/signrom.py $< $@,"SIGN","$@")
+
+include $(wildcard *.d)
 
 clean:
 	rm -f *.o *.d *.raw *.img *.bin *~
+
+# suppress auto-removal of intermediate files
+.SECONDARY:
+
+.PHONY: all clean
-- 
1.8.3.1



