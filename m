Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB8D5EF63B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:17:38 +0200 (CEST)
Received: from localhost ([::1]:59006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtQ1-0004nB-3Z
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrwC-0004Xn-EJ
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:44 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrwA-0001CG-Gq
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:44 -0400
Received: by mail-wr1-x42e.google.com with SMTP id cc5so1752637wrb.6
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jvR/TDSR8cw2AhfrQlMzvGus+KFpvWKO7FCeQd/PjXU=;
 b=uLi7xHYm8Cj3LFxxImqi4dXcixnyVoWVtroM3Ai/PvQEvbHSup1SyjKVP/P658fGMR
 V91WX3+9hKsEduaunB+9UTDOJzx0ah66S8buBs3K9TAbdqZrztt+yEUF89t8bm0ly90G
 9PlZI1v1pAYkW32XQXQs10MOO+n13a0c5l9pVpSPQ4ebYiBOIZ2NK/9kf1aiKh6PI5at
 nk1SQh+8dfOrIP+IxHW+4s4+sTIBt4H0MslzEtR9Rcbn2EAYsa7hSpoIWraRjHZrYBeA
 e3R1HIeSWKkjajRNVlObpAMQ5xoUKW1Iv0OObtZT3vedUTfIpfkOVcJ1LmCpaTN+PIO8
 b7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jvR/TDSR8cw2AhfrQlMzvGus+KFpvWKO7FCeQd/PjXU=;
 b=eHBO2F9Rl2MJnwTy6n0rDwLKy4YCHljRGXQKyNALnAu0mEvwwhPb2ulU9kvCY74NWj
 k3b64JR7wSyjDIG9vGCWE/zzJ/yjCO14YZ/KhbP8ZG02IiytEtERpDb2JQ5CP6fvBtxD
 bao9u7Iu1cXfBdG8amZ6S1wYPw6ywvHI7btFnasrzo0VMCI3N2SOD4kAFvJBVNR3pDTb
 VOVdWVZPdRqab/qkAeWf3Iw/iCZyFihdmcPEd0P/GdQD0cRjCO7Sam4pqmUsVvgan89H
 RHfGiX2eBBeThS7tA//UStzxVM0QOOx3PrwP4EOs/iQMbGc6oQIABrpyFqKsWQnPBzHZ
 Djjw==
X-Gm-Message-State: ACrzQf2Y98WsNuYG31sEUStLvjKGXhNDSM44/uOPJ52w71J3bNHzsTVp
 PAye3E527Jobm8MsFsgfbRyh5A==
X-Google-Smtp-Source: AMsMyM76siPm8J4fETF47RGOr6d5wdxjbDLo0Hiq7E/E/JN2IAMU4kDktpB2uGHTNpaGcvhlbxW/zw==
X-Received: by 2002:a5d:460f:0:b0:22c:c851:40d4 with SMTP id
 t15-20020a5d460f000000b0022cc85140d4mr1980809wrq.130.1664451761795; 
 Thu, 29 Sep 2022 04:42:41 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m6-20020adfe946000000b0022af63bb6f2sm4349086wrn.113.2022.09.29.04.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C32011FFB7;
 Thu, 29 Sep 2022 12:42:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 13/51] pc-bios/optionrom: detect CC options just once
Date: Thu, 29 Sep 2022 12:41:53 +0100
Message-Id: <20220929114231.583801-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
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
---
 pc-bios/optionrom/Makefile | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

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


