Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB86A5F450C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:02:58 +0200 (CEST)
Received: from localhost ([::1]:50782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiVc-0000Qq-Bj
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq7-0001JT-Up
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:06 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:41964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq3-0001rI-8Y
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:03 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so7532079wmb.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3LTggSEZatvPcBvFCXmvKoMFx3yNgp223ZmA4XoxSHQ=;
 b=i1fwKlOpgHlAe/QlLoLxvxCNoSDEJnQQO0CdfdWbm2XYcKvT2Dr1uDTvOH4K5bC3u0
 vPMkYl5af4FnpnPyyrv0IXtJD6gS8gmC47GgWY8Mx0+oc+mUfWsT480cElKvqbhUGqcJ
 2kj+G+lxE9tO+SwMomNBKAIkc7m2qEdkwp+BMOA9uFqceSQEIHgtm3bFlI/t1hz98V6z
 OMlSzfko8eM+NhGfppa4iP8TxHdRkjPf+iS962NTgi41dBpK8pC7JEIfAF6u3w/ppg4B
 QWu3HZ1v983rnAVMd1Bbk0Jaw4Y/+yRaeScu1x2CrHrHN5V8qr7Tk2i8slGiGVQUEdCS
 2Imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3LTggSEZatvPcBvFCXmvKoMFx3yNgp223ZmA4XoxSHQ=;
 b=zFyWoHUv99+ZwCvIwKSjXxKtWQg3k7/fJWV6unDgDETheSkzr3BlesgjdtX1o5qD5r
 M03Tj5SnZqq4rRngdutID1rP5cX16tNiesF22UQj5yF7vHBWsGHaa+YPc3IhXII+LIwf
 xisQNt+7ytVQHv3ZUHQDa3pqS0YKiT1W11Nkio5lVmVYg56MIJf2V30HwA2vwrysTFpW
 biIUJtYqCCMUVkCUKwhiIqePrZgyFqarJjagrgOnRLBUChBd6xnBZ2hlfk0oaZwRbxCT
 0BBaiDeYf2ssl/pn31NiaOGTfgps3Osd+ShbM0qTLqPAvQmf8DrcHWcnHfXTrJUj0RRm
 gGVg==
X-Gm-Message-State: ACrzQf2+v4JvehIPgOi+Y8hs97ag3+pfEd5KC4JZpHnRUIwWhXX0OIVi
 qQUgfYweblv7YLnKOlUYgKbvyg==
X-Google-Smtp-Source: AMsMyM7qA40kSDKBWTOx1kgCD2YMzIEJhtLZOdENtWUEXTXUIvvYGwdK+zgd7FymWqKHZ0nkSn4e9g==
X-Received: by 2002:a05:600c:3515:b0:3b4:a0fa:c4e1 with SMTP id
 h21-20020a05600c351500b003b4a0fac4e1mr10406242wmq.191.1664889597187; 
 Tue, 04 Oct 2022 06:19:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bw15-20020a0560001f8f00b0022cdeba3f83sm12897189wrb.84.2022.10.04.06.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:19:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CF0531FFD3;
 Tue,  4 Oct 2022 14:01:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org (open list:Virtual Open Firm...)
Subject: [PULL 31/54] pc-bios/vof: Adopt meson style Make output
Date: Tue,  4 Oct 2022 14:01:15 +0100
Message-Id: <20221004130138.2299307-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Message-Id: <20220929114231.583801-32-alex.bennee@linaro.org>

diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
index 4e59009e67..d1eb6ced7e 100644
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


