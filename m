Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2AB5EF853
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:06:28 +0200 (CEST)
Received: from localhost ([::1]:41290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odv7L-0005ZY-Hp
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsD2-0007Wy-I0
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:08 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsCx-0004QR-Bn
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:08 -0400
Received: by mail-wm1-x32a.google.com with SMTP id iv17so795644wmb.4
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 05:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=RFF0THqd2wz95c8usRFaGFV7I61JuRsTga9UE9tzX2A=;
 b=dXJsL6HfJbW49mKarQkn/W9Y/P3SzbY/BgOgVeYrTul8f9d1bYlBu+xX9ETMD1n3/u
 PJ8LjgSl+5hGDqxgfkdosLAg3KNrKcYiPPeLakpyx4GEHq/jRkXfnhlQ/SkP5sMiyOzO
 rWQwVUz5W/6lHQc6OmVdJdWHu9eBJVuGEmcpfWZhg78phn+3vpDVfmJ3HStZ259xItT6
 KF9NDLdyIm143DukN+ZsNkI3U4IS1ZzbQ0tvvy4P1TZav1uIs2yiVkPxEZUXWeTv8cXc
 nwdXc14eoM5Bbvy33aSBhYXMIEZf/aBx5brf2R0O0QY9+TedHWSoqyggiEvOqyJ+EA2r
 MBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=RFF0THqd2wz95c8usRFaGFV7I61JuRsTga9UE9tzX2A=;
 b=LefF3+DfeHRkT4uUuWyN15aKpdTfUETdJny1kvKMs+SFNlJWdqlu7EHiOsc+yczFtx
 u+SG4rab+tYaJIr84KWciEiQhxVns+DTzZ2ivRESoRvZkAO7V4eRkxGhjp6vDA7CUsxS
 e7T2nplfaem6r205wa43eJvzQtHLG8EIIo0cmMjcpLWgENyacOmCiWohR5iBBeQygo2X
 7F5fVJIzVFT7iYjdWBADbVk4fK0+dIlQr1VCehjV+8qn8BymMqLHHBmdifKfWtX/JLX4
 aGiyxBVluu5xZJG5TuyVnXKczfZT3256vWrxEthqj/mdQgV9IObXtDPKI5DEwtkIJQi+
 SU3Q==
X-Gm-Message-State: ACrzQf3aX+Nr9DsmPCXgHkQ3Xxdh6wQksfx1NYT0p55F0GYbHZN9bl/r
 XdAt3ooGPzq1qdpSYXVqJuy7hw==
X-Google-Smtp-Source: AMsMyM4V/Hc/1kNR8p7IxticKZU8HpkJNeBbl36vVXgNXZcY7DOWt8sWFfdM2LpsblvBBxUttoIEEA==
X-Received: by 2002:a05:600c:524a:b0:3b5:290:1a7c with SMTP id
 fc10-20020a05600c524a00b003b502901a7cmr10605682wmb.75.1664452800774; 
 Thu, 29 Sep 2022 05:00:00 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m67-20020a1c2646000000b003a342933727sm4189175wmm.3.2022.09.29.04.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:59:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C9C251FFD2;
 Thu, 29 Sep 2022 12:42:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org (open list:Virtual Open Firm...)
Subject: [PATCH  v1 31/51] pc-bios/vof: Adopt meson style Make output
Date: Thu, 29 Sep 2022 12:42:11 +0100
Message-Id: <20220929114231.583801-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
 pc-bios/vof/Makefile | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
index 990f26af31..be8bd96294 100644
--- a/pc-bios/vof/Makefile
+++ b/pc-bios/vof/Makefile
@@ -2,19 +2,26 @@ include config.mak
 VPATH=$(SRC_DIR)
 all: vof.bin
 
+NULL :=
+SPACE := $(NULL) #
+TARGET_PREFIX := $(patsubst %/,%:$(SPACE),$(TARGET_DIR))
+
+quiet-@ = $(if $(V),,@$(if $1,,printf "%s\n" "$(TARGET_PREFIX)$1" && ))
+quiet-command = $(call quiet-@,$2 $@)$1
+
 EXTRA_CFLAGS += -mcpu=power4
 
 %.o: %.S
-	$(CC) $(EXTRA_CFLAGS) -c -o $@ $<
+	$(call quiet-command, $(CC) $(EXTRA_CFLAGS) -c -o $@ $<,Assembling)
 
 %.o: %.c
-	$(CC) $(EXTRA_CFLAGS) -c -fno-stack-protector -o $@ $<
+	$(call quiet-command, $(CC) $(EXTRA_CFLAGS) -c -fno-stack-protector -o $@ $<,Compiling)
 
 vof.elf: entry.o main.o ci.o bootmem.o libc.o
-	$(LD) -nostdlib -e_start -T$(SRC_DIR)/vof.lds -EB -o $@ $^
+	$(call quiet-command, $(LD) -nostdlib -e_start -T$(SRC_DIR)/vof.lds -EB -o $@ $^,Linking)
 
 %.bin: %.elf
-	$(OBJCOPY) -O binary -j .text -j .data -j .toc -j .got2 $^ $@
+	$(call quiet-command, $(OBJCOPY) -O binary -j .text -j .data -j .toc -j .got2 $^ $@,Extracting raw object)
 
 clean:
 	rm -f *.o vof.bin vof.elf *~
-- 
2.34.1


