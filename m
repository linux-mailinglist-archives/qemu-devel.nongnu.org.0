Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AED585794
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 02:42:39 +0200 (CEST)
Received: from localhost ([::1]:50484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHaYw-0006RF-Bk
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 20:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHaUb-0002Xa-TK
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 20:38:09 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:47041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHaUU-0003Hw-47
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 20:38:09 -0400
Received: by mail-pf1-x42d.google.com with SMTP id c3so5912778pfb.13
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 17:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YKnWKxobxWr0eoYl/6FV/vOfO1g5odZSiiZMd2jnFpE=;
 b=dWYYGKq9+UxDjRpTsCP2HMazqT1i+KHyMydoCRGzqNN32el09GbBrglBdGxs0D/Q2S
 /Tt1oXvKEjUSTK6uEM2T3w61Vb4sHegnD0WoQ86OwDZNze6TTT9GjMJNcBLipNR2EYmT
 sHdpWLknBuj2ge+21x52NWHxXrkB/ua0pN82rBvcXO1uoRrzWPTXaRVbmfh00cF6izMU
 Hw/ufe6PNfWgJ71WbJAaxvvR1fvmf/exZZ9mrP9iXqqZ+5gnGG0IvrF2DB2RsxjBZ35M
 AmHkWSCr9e9YbCcerC+PUKVhlyU++hk/Uwkz2GGqh6rPzarz1psYHKpfXhjgmEhPWB53
 iYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YKnWKxobxWr0eoYl/6FV/vOfO1g5odZSiiZMd2jnFpE=;
 b=QXPaIOE3QJHgWicfrgzXykfomc/ezUaFb1swLyZt8Vctr/Qx8hPBTzAY5JOqWNXUZM
 8Gny+VF/MpGqhsvjSUPh3bH+oHwE5lfwn88fqfVRKOO9DIXgZGGDXUPAwA0GrjOpPKeZ
 CfsYRbIhf/p96FhkvGlOql4kx0vhAxvGiA5l58vYwRc2EMFWtgq9Lotn1LsodYMksUrK
 O+cVO0b1ZuVS7ZEDQdp5T3HQ5R2trUO66EF791TDD+2wEBxX6CZKeBWQkykPnV+XwzVk
 ez8nMWRYcr2JMgw5fHKwAGRMdiLt7Ohy9cYFx+9iFWDq3JMzRCnGMR2LxXFyNt/Nw+nx
 lJfA==
X-Gm-Message-State: AJIora87v/8JD4efgxjO/0MldrnGB4xRdgRf69V4EAh74gKiH45iQieo
 JN7t6ErAT/vzlmwl6Wet/621XH9GyKeSNw==
X-Google-Smtp-Source: AGRyM1tfuDP5ymbIgUyhy0DTharfDLUlWsGnUt4cvstt5p27mr/LpYsi8VOnAj0lkm6F9pSDGarunA==
X-Received: by 2002:a63:a1d:0:b0:41b:4483:35d1 with SMTP id
 29-20020a630a1d000000b0041b448335d1mr4823663pgk.441.1659141480112; 
 Fri, 29 Jul 2022 17:38:00 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:a427:660:88d4:8559])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a1709027e4d00b0016dbc169316sm4228345pln.187.2022.07.29.17.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 17:37:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 1/2] hw/loongarch: Rename file 'loongson3.XXX' to 'virt.XXX'
Date: Fri, 29 Jul 2022 17:37:54 -0700
Message-Id: <20220730003755.54019-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220730003755.54019-1-richard.henderson@linaro.org>
References: <20220730003755.54019-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

1. Rename 'loongson3.c' to 'virt.c' and change the meson.build file.
2. Rename 'loongson3.rst' to 'virt.rst'.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Message-Id: <20220729073018.27037-2-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/loongarch/{loongson3.c => virt.c} | 0
 MAINTAINERS                          | 2 +-
 hw/loongarch/meson.build             | 2 +-
 target/loongarch/README              | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename hw/loongarch/{loongson3.c => virt.c} (100%)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/virt.c
similarity index 100%
rename from hw/loongarch/loongson3.c
rename to hw/loongarch/virt.c
diff --git a/MAINTAINERS b/MAINTAINERS
index 6af9cd985c..5ce4227ff6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1129,7 +1129,7 @@ Virt
 M: Xiaojuan Yang <yangxiaojuan@loongson.cn>
 M: Song Gao <gaosong@loongson.cn>
 S: Maintained
-F: docs/system/loongarch/loongson3.rst
+F: docs/system/loongarch/virt.rst
 F: configs/targets/loongarch64-softmmu.mak
 F: configs/devices/loongarch64-softmmu/default.mak
 F: hw/loongarch/
diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
index 6a2a1b18e5..c0421502ab 100644
--- a/hw/loongarch/meson.build
+++ b/hw/loongarch/meson.build
@@ -2,7 +2,7 @@ loongarch_ss = ss.source_set()
 loongarch_ss.add(files(
     'fw_cfg.c',
 ))
-loongarch_ss.add(when: 'CONFIG_LOONGARCH_VIRT', if_true: [files('loongson3.c'), fdt])
+loongarch_ss.add(when: 'CONFIG_LOONGARCH_VIRT', if_true: [files('virt.c'), fdt])
 loongarch_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-build.c'))
 
 hw_arch += {'loongarch': loongarch_ss}
diff --git a/target/loongarch/README b/target/loongarch/README
index 9f5edd10c8..1823375d04 100644
--- a/target/loongarch/README
+++ b/target/loongarch/README
@@ -15,7 +15,7 @@
   3A5000 support multiple interrupt cascading while here we just emulate the extioi interrupt
   cascading. LS7A1000 host bridge support multiple devices, such as sata, gmac, uart, rtc
   and so on. But we just realize the rtc. Others use the qemu common devices. It does not affect
-  the general use. We also introduced the emulation of devices at docs/system/loongarch/loongson3.rst.
+  the general use. We also introduced the emulation of devices at docs/system/loongarch/virt.rst.
 
   This version only supports running binary files in ELF format, and does not depend on BIOS and kernel file.
   You can compile the test program with 'make & make check-tcg' and run the test case with the following command:
-- 
2.34.1


