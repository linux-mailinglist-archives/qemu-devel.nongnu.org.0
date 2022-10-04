Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEC85F4434
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:24:13 +0200 (CEST)
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhu7-0006O8-OK
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYb-0008K8-Sj
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:57 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYZ-0007Pr-Ag
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:57 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a10so8867898wrm.12
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uq8LfhcioJyFhfpF+Nws+weqCLsrNs+3nFRic6rgmME=;
 b=DUKHHWqH8xjWzP+lAIsOaqus+R4AVkN147cn+h/5y93wJQo29R2tvXIC5LSCtiDnWA
 zIaCNoLMyFn9uIpL9ZFN2AJ8nSwSdxveERJL7bDqDtCy+NGwFwMQXgX3i4/kOtNy2olC
 D5bYuZuHZeD9+ouAUn2/M0ri7n2pXMv2i/2M0jCA8maGCzK7TXhCjATcbgAGd1xFxVjk
 juBDjIT8EHew5s3vNQpExWSqeCDuYMce9UAV+l9tJEDlu53wU8LVz2vAA0kAk5cLuGD4
 oNrRImCrOToALw0c9YjVQj/NWtl/ELVJymSqiMsB0C1GVDFFUqyq88mYQSXL0PY2fy65
 6YHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uq8LfhcioJyFhfpF+Nws+weqCLsrNs+3nFRic6rgmME=;
 b=Zb6fQkbCZ3uTrCe9IVyp68jGnesDr1sg2A/B8NYIUQ7KiasIiY8AGzoCWD3sMGLBQm
 wi5F06al3R+FpskTKba5DDBazjjxQkxDN2lQ6lr3iFbK3ypN8F4RqXEu0+rdAmRM/HS+
 YsYrghY5/1Ap53Ltz6VWGt6BB+F2xsQjPHTI8ZVhnrpmNUlQYJ1H3SDWbq2fdHDNJMwe
 44wjYjUA+/FNzDb+erRHWChJ2FJd+UXHelHOBt0Z69lzw4BJ+XlEXJGbgtrATRyFqKft
 zEkTVNSEFgKT0eP6vtSejVfCZnJoSuMlARNew5FA0p05kgBguk7LO+Uuh3dAuurOXw25
 SvNA==
X-Gm-Message-State: ACrzQf3ylBmekWjNHaCNlv1rw0Y3PYbkbYEI1pOeqs5VP6eHItrCgGn5
 02WpWScFkdKdqYqho00w0dJCqw==
X-Google-Smtp-Source: AMsMyM5VFo/x6ZnVH3/xE63g7+lhOkjftFpoZ6IV7P+3ZsphvS/3NzKGkMmc4wefA8vYpY4Z6hvIlQ==
X-Received: by 2002:a5d:5944:0:b0:22e:3c67:75de with SMTP id
 e4-20020a5d5944000000b0022e3c6775demr6576749wri.5.1664888513322; 
 Tue, 04 Oct 2022 06:01:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c339400b003a5c999cd1asm17690494wmp.14.2022.10.04.06.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9F26F1FFD1;
 Tue,  4 Oct 2022 14:01:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 29/54] pc-bios/optionrom: Adopt meson style Make output
Date: Tue,  4 Oct 2022 14:01:13 +0100
Message-Id: <20221004130138.2299307-30-alex.bennee@linaro.org>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929114231.583801-30-alex.bennee@linaro.org>

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


