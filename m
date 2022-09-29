Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8C65EF740
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:13:27 +0200 (CEST)
Received: from localhost ([::1]:60512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oduI2-0001Ml-Sm
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3C-0000N9-7P
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:05 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods38-0002NK-3w
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:49:56 -0400
Received: by mail-wr1-x42d.google.com with SMTP id l18so1768036wrw.9
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=iRY+rdLsNzUlIPl9aP+Ctca98eiNinjQ4tNo5/5rKPg=;
 b=Ec/1wt1EKGzFt4Zq8wq+TJ/jeVyX7t4uxYd5N9CVf5ruf9MgAcutNPPdSqr01RrVq2
 0ZUFVfSxCrsgBD/PD8LwEag/hMPZMp20CZ7VNHpomxszzyitJofkJLx7LzbijIz2dC7C
 EbkL+SP3JjIF6MO/Ky51BqDjVRuHwt9ecifCu0prIBDqrdz295kHXQCveI/Vg7j+EXIY
 hp7i9wUzMgvg8J0Qnc9N8uJfgfLNrhrBmYEtJvShzD2Zd0KQaZO7OVsrc5Btutal4JTv
 eXfXX4T5gKzN9/BcKKkqRC2p0gP/ZwRUw4iqc+LJgpgFlQqCWOdkETmo81rxaGDI0hmV
 A6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iRY+rdLsNzUlIPl9aP+Ctca98eiNinjQ4tNo5/5rKPg=;
 b=ZNSI+oJnliFWQEhdngjtk1PCapFT/9OosMoSxbfoqTjZfIaE+FKz75tPKIRB7n2qcg
 0SkrIH2Sc/lR01Cl9zKmsWvm5oO+oLI9Vl42aTBqUtsYL9SMJQ+uEDvYcqrhCAzWeUB/
 90i+oJ3vGx1cS6WIqoFOBAyGL00piisId5ChuVk3nGpGN2rcGZKgRUms4/vjIo8au2Kb
 3j8+tQwloXhr1nTdUyAveborQ+EKT5TGje3DcE3EUB3bJQo4UtAzNDX2AZxOzDefKkSy
 5IzA7vmXBosMr9ZGpTJ/0+6jTTzATDXfFtUwiUAq2CaENIw2mv7gGErIDerKVjcRwve2
 ofCQ==
X-Gm-Message-State: ACrzQf1ZrOW7KRWNIan4TJehkCIkZoZ/9W7XY/X5hhe9XiuA9t+qdMC8
 IjBG1feIzam5LfrIV3LKkheWQQ==
X-Google-Smtp-Source: AMsMyM6G6AJGnBeEz2ooZ3CdKEMzCYQIsKDaYSs+Sji7ceTE6rYIak2TLBZtnnrw5du++K8ge5Bwkg==
X-Received: by 2002:adf:d1ef:0:b0:228:a9ee:8f13 with SMTP id
 g15-20020adfd1ef000000b00228a9ee8f13mr1900280wrd.686.1664452192529; 
 Thu, 29 Sep 2022 04:49:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a5d4a0d000000b0021e43b4edf0sm6419674wrq.20.2022.09.29.04.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:49:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 96C951FFD1;
 Thu, 29 Sep 2022 12:42:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 29/51] pc-bios/optionrom: Adopt meson style Make output
Date: Thu, 29 Sep 2022 12:42:09 +0100
Message-Id: <20220929114231.583801-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 pc-bios/optionrom/Makefile | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index f514e4f84b..b1fff0ba6c 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -12,8 +12,8 @@ NULL :=
 SPACE := $(NULL) #
 TARGET_PREFIX := $(patsubst %/,%:$(SPACE),$(TARGET_DIR))
 
-quiet-@ = $(if $(V),,@)
-quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
+quiet-@ = $(if $(V),,@$(if $1,printf "%s\n" "$(TARGET_PREFIX)$1" && ))
+quiet-command = $(call quiet-@,$2 $@)$1
 
 # Flags for dependency generation
 override CPPFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
@@ -41,19 +41,19 @@ override LDFLAGS = -nostdlib -Wl,-T,$(SRC_DIR)/flat.lds
 pvh.img: pvh.o pvh_main.o
 
 %.o: %.S
-	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<,"AS","$@")
+	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<,Assembling)
 
 %.o: %.c
-	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@,"CC","$@")
+	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@,Compiling)
 
 %.img: %.o
-	$(call quiet-command,$(CC) $(CFLAGS) $(LDFLAGS) -s -o $@ $^,"BUILD","$@")
+	$(call quiet-command,$(CC) $(CFLAGS) $(LDFLAGS) -s -o $@ $^,Linking)
 
 %.raw: %.img
-	$(call quiet-command,$(OBJCOPY) -O binary -j .text $< $@,"BUILD","$@")
+	$(call quiet-command,$(OBJCOPY) -O binary -j .text $< $@,Extracting raw object)
 
 %.bin: %.raw
-	$(call quiet-command,$(PYTHON) $(TOPSRC_DIR)/scripts/signrom.py $< $@,"SIGN","$@")
+	$(call quiet-command,$(PYTHON) $(TOPSRC_DIR)/scripts/signrom.py $< $@,Computing checksum into)
 
 include $(wildcard *.d)
 
-- 
2.34.1


