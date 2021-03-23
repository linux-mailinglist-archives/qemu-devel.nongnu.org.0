Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B179A3465A4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:49:04 +0100 (CET)
Received: from localhost ([::1]:40758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkDH-00072P-Ny
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjKC-0005fB-5M; Tue, 23 Mar 2021 11:52:09 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjK4-0003ZI-6b; Tue, 23 Mar 2021 11:52:06 -0400
Received: by mail-wr1-x431.google.com with SMTP id 61so21255744wrm.12;
 Tue, 23 Mar 2021 08:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wacrUPXby6VxBAOyWwd3GMdytvH/G6kApR/JrO/ejAY=;
 b=OKV7cproh+phYnlnQ965o6n7nwQb2zQPwGVOb/6HfChkkqmjgWGuXV3GMN1V5RUn+s
 G2Aliv1nJAWcUD3vE+QzErO/+Ceo0om0AHkXLfdEcdoZFTy1Kti+giBkvemToLSiN3tW
 qUILq0FKh6HHOAZOfrepkViVJQ5gh1ekwbsBjvlh6kKRk828ru/i6y7NwfiFBhBaNosa
 2WSZE8R60GaOX6ymjD9hPvaovjH4zUKt93AUQN9niY0Guw1Dqxft0hR09a2wsdNYBEXU
 oXpNC8N/LJFBKjP8gOflred30MfxxGVcWSY4kKrJor/orzmoczJ4FT09aNZRJblm4y7+
 cSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wacrUPXby6VxBAOyWwd3GMdytvH/G6kApR/JrO/ejAY=;
 b=FNuFdWoGgCxlxkGd8ckXMuGE/2G748hv9OIj6d62uJKfSgw+flg+eg3JuMzaaes4sd
 2ktvQXSVpccpo2J6cspiGJnpmZFpn/n1hfufzg3HA8Kze0BEEINxnULtHDKUBvh1ERSK
 jq3qU+XV5pamB4yP46DVIWiWxzfvC/BUmQIwfYhdVoj+oiMNUQSGFwVwPLKXYu47KCC4
 ez129QG1EeDI/cH5MR/BNaZlwqlTF0Pp+MN0GT59i0O068EEHDurrZXiIsLO9O0+rtPY
 pEvUnstxLyMT4WAypMYARW4XLBvLlra0wDpuRrvE8cwZ3cCTZQl90miRqIHHYFxKQn49
 PPMA==
X-Gm-Message-State: AOAM532XhkfX8uehATu7PBETrk3zJ+4rpCFWiYs3a0TW5llJvLXSAZxD
 tJCN4RfQJ572URlj9/lanBiT4TkZmkEczA==
X-Google-Smtp-Source: ABdhPJy5y/PwDhZVyaWSa0rAe1kTg0luZ14xFYomnLq74Cin+V1haJeQXXFE3EdId88WaN4cGZmf7w==
X-Received: by 2002:adf:8562:: with SMTP id 89mr4703432wrh.101.1616514717933; 
 Tue, 23 Mar 2021 08:51:57 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id g5sm24414743wrq.30.2021.03.23.08.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:51:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 05/13] blobs: Only install npcm7xx bootrom if ARM system
 targets are built
Date: Tue, 23 Mar 2021 16:51:24 +0100
Message-Id: <20210323155132.238193-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323155132.238193-1-f4bug@amsat.org>
References: <20210323155132.238193-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Tyrone Ting <kfting@nuvoton.com>
Cc: qemu-arm@nongnu.org
---
 meson.build         | 2 ++
 pc-bios/meson.build | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index b5b8892fe7a..10c21ef52af 100644
--- a/meson.build
+++ b/meson.build
@@ -94,10 +94,12 @@
 edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
 install_edk2_blobs = false
 install_blobs_alpha = false
+install_blobs_arm = false
 if get_option('install_blobs')
   foreach target : target_dirs
     install_edk2_blobs = install_edk2_blobs or target in edk2_targets
     install_blobs_alpha = install_blobs_alpha or target in ['alpha-softmmu']
+    install_blobs_arm = install_blobs_hppa or target in ['arm-softmmu', 'aarch64-softmmu']
   endforeach
 endif
 
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 29085912d7d..635485931b9 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -81,7 +81,6 @@
   'opensbi-riscv64-generic-fw_dynamic.bin',
   'opensbi-riscv32-generic-fw_dynamic.elf',
   'opensbi-riscv64-generic-fw_dynamic.elf',
-  'npcm7xx_bootrom.bin',
 ))
 
 if host_machine.system() == 'windows'
@@ -96,6 +95,12 @@
   ))
 endif
 
+if install_blobs_arm
+  blobs_ss.add(files(
+    'npcm7xx_bootrom.bin',
+  ))
+endif
+
 blobs_ss = blobs_ss.apply(config_host, strict: false)
 
 if get_option('install_blobs')
-- 
2.26.2


