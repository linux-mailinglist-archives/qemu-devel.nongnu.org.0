Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D315EF5BC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:52:47 +0200 (CEST)
Received: from localhost ([::1]:43300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odt1y-0000BH-FL
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw7-0004OJ-Q5
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:40 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw5-0001Cy-NX
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:39 -0400
Received: by mail-wr1-x430.google.com with SMTP id u10so1641076wrq.2
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=nhWT7dn5jhHKp/a/I3xktJp1WlGBzEtR15pMyKD1w7s=;
 b=sJDwU4OivINnhIbUJ6XrelocPypzGM7kWgWQG1YKHetGB3tZSIACOQOpsiyLs7d5aK
 /+uEGgEhuPzo1nlx9u9QeMRcsw/b1bYC9mEPZnyIa/YUiMqRCA7VeZkY71mdrABf27fz
 TcymzoWrjOmg6dDKdy7CLh5AjEkEp5xRhVSn5+dSuHcKYCcNCqLt1c82nK4b6RPcXMv1
 WQBQ5xDBsXGhB/c3xA0pCggttyxI9bIVXHmRPNRCmzwIvvIzJioNInWQcfqEpMNMnDSi
 yn3+kAR2yBbB0jpHUy0zSO78qup5hD+kBE5cvKr5NMIMeBzPfHxVhAvs6FNK9+j3YZac
 ocvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nhWT7dn5jhHKp/a/I3xktJp1WlGBzEtR15pMyKD1w7s=;
 b=7mUxUpyH8oyboun04oyTuU1fZOvh1RRe2e0CAPDEgPeh+SSeLVssPnm9MBnbt1bXa7
 bKBXIpC70rq3cqXS9BePLCHzWfRDZ3d8FGTwCcZcff3ECCQgSA5pHLLtSB7Xp0eerALt
 YK1AtYUBBKQuAZ+uYLidT9KWnku3uY8C9RAxDRdnaBuwRpvapymw3alyK88momC7+IFy
 yix9NRLEKkUmaNKzx4e8rdMW2H5Y3PE9LKd95spuDRgQX33MylyO8fKgNIhLuSxSp5tC
 pY0Ei17Hy/4vAATwwwnJak+dXFamjHznko194wO0mVbXf9c8LtFh+KJ3SQrwmSNAL6oQ
 nU5A==
X-Gm-Message-State: ACrzQf2vc1sKz2pDs9ysEV44pCrru1eAOAyC8J48Q+rgiWtDjNPIeG1O
 YpwTNtc7rdieiQGUYyMVPDJj6g==
X-Google-Smtp-Source: AMsMyM6fRyEfQTz2nV5d/XjQUUfLG7doV2ldoxFGp9nspq0IcORCggaF/QBhCZ7zTdEjCbc3hEf6MQ==
X-Received: by 2002:adf:fe08:0:b0:22b:311:afcd with SMTP id
 n8-20020adffe08000000b0022b0311afcdmr1950501wrr.629.1664451756036; 
 Thu, 29 Sep 2022 04:42:36 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k15-20020adfd22f000000b0021badf3cb26sm6897482wrh.63.2022.09.29.04.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ACD0F1FFC4;
 Thu, 29 Sep 2022 12:42:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 12/51] configure: do not invoke as/ld directly for
 pc-bios/optionrom
Date: Thu, 29 Sep 2022 12:41:52 +0100
Message-Id: <20220929114231.583801-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
---
 configure                  | 22 +++++-----------------
 pc-bios/optionrom/Makefile | 12 ++++--------
 2 files changed, 9 insertions(+), 25 deletions(-)

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


