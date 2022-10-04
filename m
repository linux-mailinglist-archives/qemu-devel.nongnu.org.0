Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8755F4436
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:26:13 +0200 (CEST)
Received: from localhost ([::1]:50762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhw4-0000Ei-EL
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYb-0008I0-1j
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:57 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYY-0007Ph-Sk
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:56 -0400
Received: by mail-wr1-x42e.google.com with SMTP id n12so1624756wrp.10
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8QMsgeIatFeOsU7rOIV2h+ocmtxm0p2LUfAd++X9wdY=;
 b=T/JF7L1ykf9wIqIndd5D+iwHRuwv/7OBDBabb8R0Crj5+6A/qmz1oj2JG/iWmBqXqc
 VKCwinHrVkrHXDJfJ4AQHYprcfY4ZDBaXQpdGw5PHrBpXZZYZuUcLcko7aAz7CvgyQ3W
 YcKP22lBiGebkXztyPGBF67N0gxkrjqqBTlgvj9xNTm8056xtnMMm2XmUMkd6mc6+mVi
 tIRj2CY+H9deWFGL0KtF2KC4eSgwTqx+LtAC/xFyWaYTX/d6JrhcLTEQ7w7QV5GI4GKn
 DGyZ5EqPvn+DAoIO3oKHpbuJ6a9fpT5Zt03g5GDWNZ+/mvLMqac49Bl5RKiteeHdM9p0
 Ypgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8QMsgeIatFeOsU7rOIV2h+ocmtxm0p2LUfAd++X9wdY=;
 b=uKyLdvsMtumqoLj6XMqGilQ9Arsm63qUEFk36OhTlOVchtGeULAbvNofHtWn3A4uZU
 1HPf6M9XiHq9HxFUaUbDw9GXCjlatF4SxyYzy6D5WiBF5e5aD/sAVJoHxlo5dKnVUqXy
 +mNnFFwe/2VBOsHvYpEgAfkD8iUsQnz/8Dx91IbsS3Hgbz7wc1u40elpNLSIF+IO5rul
 wfsP/ixDVefJlHL3eLco12hQDGku6e+ndRNSEVVsMDj2pe5uZsHumjHP+dh51gaoevnK
 rnkxKJWfsLf6vpsJtazPjZu6+SMLSy27xkZBqkf29h7K4pGHKZW4biAQxoccVmL7Qrbr
 6hIQ==
X-Gm-Message-State: ACrzQf10q/2tLge3A+fkc2VPAsHEorh9pLbt1TbRspG8DwKsn2EBlFA6
 6hb18tGYxHu34Kdao2maZbsBHZGWSDe1Nw==
X-Google-Smtp-Source: AMsMyM7vZk7OV3358FEIdIn7lsrr0juH5s3Z1b5SsIpFw0wI4WC/3y6H4F+KILadW4c6vpOJpwOevw==
X-Received: by 2002:a5d:6d0a:0:b0:22e:3f3a:5cdf with SMTP id
 e10-20020a5d6d0a000000b0022e3f3a5cdfmr5067378wrq.156.1664888511826; 
 Tue, 04 Oct 2022 06:01:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bw18-20020a0560001f9200b00226dedf1ab7sm6930003wrb.76.2022.10.04.06.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC15C1FFB8;
 Tue,  4 Oct 2022 14:01:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 13/54] pc-bios/optionrom: detect CC options just once
Date: Tue,  4 Oct 2022 14:00:57 +0100
Message-Id: <20221004130138.2299307-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Message-Id: <20220929114231.583801-14-alex.bennee@linaro.org>

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 3e06c11dea..f514e4f84b 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -8,23 +8,33 @@ all: multiboot.bin multiboot_dma.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bi
 
 CFLAGS = -O2 -g
 
-quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
-cc-option = $(if $(shell $(CC) $1 -c -o /dev/null -xc /dev/null >/dev/null 2>&1 && echo OK), $1, $2)
-
-override CFLAGS += -march=i486 -Wall $(EXTRA_CFLAGS) -m16
+NULL :=
+SPACE := $(NULL) #
+TARGET_PREFIX := $(patsubst %/,%:$(SPACE),$(TARGET_DIR))
 
-# If -fcf-protection is enabled in flags or compiler defaults that will
-# conflict with -march=i486
-override CFLAGS += $(call cc-option, -fcf-protection=none)
+quiet-@ = $(if $(V),,@)
+quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
 
 # Flags for dependency generation
 override CPPFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
 
-override CFLAGS += $(call cc-option, -fno-pie)
-override CFLAGS += $(call cc-option, -no-pie)
+override CFLAGS += -march=i486 -Wall $(EXTRA_CFLAGS) -m16
 override CFLAGS += -ffreestanding -I$(TOPSRC_DIR)/include
-override CFLAGS += $(call cc-option, -fno-stack-protector)
-override CFLAGS += $(call cc-option, -Wno-array-bounds)
+
+cc-test = $(CC) -Werror $1 -c -o /dev/null -xc /dev/null >/dev/null 2>/dev/null
+cc-option = if $(call cc-test, $1); then \
+    echo "$(TARGET_PREFIX)$1 detected" && echo "override CFLAGS += $1" >&3; else \
+    echo "$(TARGET_PREFIX)$1 not detected" $(if $2,&& echo "override CFLAGS += $2" >&3); fi
+
+# If -fcf-protection is enabled in flags or compiler defaults that will
+# conflict with -march=i486
+config-cc.mak: Makefile
+	$(quiet-@)($(call cc-option,-fcf-protection=none); \
+	    $(call cc-option,-fno-pie); \
+	    $(call cc-option,-no-pie); \
+	    $(call cc-option,-fno-stack-protector); \
+	    $(call cc-option,-Wno-array-bounds)) 3> config-cc.mak
+-include config-cc.mak
 
 override LDFLAGS = -nostdlib -Wl,-T,$(SRC_DIR)/flat.lds
 
@@ -50,7 +60,10 @@ include $(wildcard *.d)
 clean:
 	rm -f *.o *.d *.raw *.img *.bin *~
 
+distclean:
+	rm -f config-cc.mak
+
 # suppress auto-removal of intermediate files
 .SECONDARY:
 
-.PHONY: all clean
+.PHONY: all clean distclean
-- 
2.34.1


