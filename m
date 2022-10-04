Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F715F43E9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:08:12 +0200 (CEST)
Received: from localhost ([::1]:41958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhed-00064A-59
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYU-0008Fd-GO
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:52 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYS-0007O6-7X
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:50 -0400
Received: by mail-wr1-x432.google.com with SMTP id b7so13595567wrq.9
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=MYX77RmAB2pRbiH9/2ZtNvCyCgj6eq+jErJpHagEy7g=;
 b=V7xwQPuKVFpcBWbg1aqC8qwlE8cofAIBkZ4V7GvpFkvPLaAV3BOZ7c8BaPCNTtDKt7
 EjX54uTHlntFbnLpoYeL5X2k5YFrels2TrWNyyzw3U4nUhWSG6wnN5xYdEvymM1pQjeg
 9KVJVvCuelxVSxjVwDIoD/qaf64nIsGIIDie3Iop5SLIlMOCpPKUus9wnILxHDGtC1GC
 Ok5k992Q0TpCUdqhdK9V+f5nr2y8WnJrjLGVCnlQ2tKu9Mu8cPSkMaFWkgYb74H/dFq7
 H7jUqCQcFvnwqSxLTMUCH06D6mDMfY8IlWm7KizLKJ/rg/zqCIBlWHn7vNEiJS3WD509
 L8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=MYX77RmAB2pRbiH9/2ZtNvCyCgj6eq+jErJpHagEy7g=;
 b=IKps0JOZeuqQETapIb1UCot8+xL/4uQOOuIGe3iO39y49OTlQ+yuyckI5MaU9GTKKy
 wPh5qFT7HYSQ/ScLosxW9Lkd+ga7j8oVaYlJN62yk0hlCFNqBPyZoV1b42rzfVZw0suk
 GvkCyvd+IAwlKG75ZTKVGrr+D7cfTKwO/LcAuzJfGLTCE/ineoD5pn422s5IpfiIcTE7
 H9Vgk+jnKjRbgKTODEDf8+V9yW1iLl7qtTUi1UrXxOmw/qAt4L48YMlQ/fJ1gHU4aJUB
 FKWCPvO4Js0LrfhzQR1pn03kyxmA7CptE85HQLIEXQ5MENKrrIzYV/9fg3dy/3vv5oaf
 j17g==
X-Gm-Message-State: ACrzQf0n9BUgPi865piOXp+EQo3O14zFEUED1HBI2omRX99CIs4xFZzk
 9qNJhVszli0kJgwamnM84kg52Q==
X-Google-Smtp-Source: AMsMyM5s0Oypsv0UpItpxYwBTT559d83ZFXbMOskYvoSQcC1Xn1bvTJ1LnUFQv43WBYiDTWiY9ON7w==
X-Received: by 2002:adf:e109:0:b0:225:4ca5:80d5 with SMTP id
 t9-20020adfe109000000b002254ca580d5mr15893420wrz.465.1664888506980; 
 Tue, 04 Oct 2022 06:01:46 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bn23-20020a056000061700b0022e55f40bc7sm1204321wrb.82.2022.10.04.06.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B5F4A1FFC4;
 Tue,  4 Oct 2022 14:01:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 12/54] configure: do not invoke as/ld directly for
 pc-bios/optionrom
Date: Tue,  4 Oct 2022 14:00:56 +0100
Message-Id: <20221004130138.2299307-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

Just use using the compiler binary, with -nostdlib in the case of the
linker; the compiler driver (whether i686-*-gcc, or x86_64-*-gcc with
the -m32 option) will then pick the right magic option to as and ld.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929114231.583801-13-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 52ae4adffc..aaa09fb957 100755
--- a/configure
+++ b/configure
@@ -2298,23 +2298,11 @@ probe_target_compiler i386-softmmu
 if test -n "$target_cc" &&
         test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
         test "$targetos" != "haiku" && test "$softmmu" = yes ; then
-    # Different host OS linkers have different ideas about the name of the ELF
-    # emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
-    # variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
-    for emu in elf_i386 elf_i386_fbsd elf_i386_obsd i386pe; do
-        if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*${emu}[[:space:]]*$"; then
-            ld_i386_emulation="$emu"
-            break
-        fi
-    done
-    if test -n "$ld_i386_emulation"; then
-        roms="pc-bios/optionrom"
-        config_mak=pc-bios/optionrom/config.mak
-        echo "# Automatically generated by configure - do not modify" > $config_mak
-        echo "TOPSRC_DIR=$source_path" >> $config_mak
-        echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_mak
-        write_target_makefile >> $config_mak
-    fi
+    roms="pc-bios/optionrom"
+    config_mak=pc-bios/optionrom/config.mak
+    echo "# Automatically generated by configure - do not modify" > $config_mak
+    echo "TOPSRC_DIR=$source_path" >> $config_mak
+    write_target_makefile >> $config_mak
 fi
 
 probe_target_compiler ppc-softmmu
diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index e90ca2e1c6..3e06c11dea 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -20,28 +20,24 @@ override CFLAGS += $(call cc-option, -fcf-protection=none)
 # Flags for dependency generation
 override CPPFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
 
-override CFLAGS += $(filter -W%, $(QEMU_CFLAGS))
 override CFLAGS += $(call cc-option, -fno-pie)
+override CFLAGS += $(call cc-option, -no-pie)
 override CFLAGS += -ffreestanding -I$(TOPSRC_DIR)/include
 override CFLAGS += $(call cc-option, -fno-stack-protector)
 override CFLAGS += $(call cc-option, -Wno-array-bounds)
 
-Wa = -Wa,
-override ASFLAGS += -32
-override CFLAGS += $(call cc-option, $(Wa)-32)
-
-override LDFLAGS = -m $(LD_I386_EMULATION) -T $(SRC_DIR)/flat.lds
+override LDFLAGS = -nostdlib -Wl,-T,$(SRC_DIR)/flat.lds
 
 pvh.img: pvh.o pvh_main.o
 
 %.o: %.S
-	$(call quiet-command,$(CC) $(CPPFLAGS) -E -o - $< | $(AS) $(ASFLAGS) -o $@,"AS","$@")
+	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<,"AS","$@")
 
 %.o: %.c
 	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@,"CC","$@")
 
 %.img: %.o
-	$(call quiet-command,$(LD) $(LDFLAGS) -s -o $@ $^,"BUILD","$@")
+	$(call quiet-command,$(CC) $(CFLAGS) $(LDFLAGS) -s -o $@ $^,"BUILD","$@")
 
 %.raw: %.img
 	$(call quiet-command,$(OBJCOPY) -O binary -j .text $< $@,"BUILD","$@")
-- 
2.34.1


