Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3861F5EFCA2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 20:06:44 +0200 (CEST)
Received: from localhost ([::1]:38986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxvm-0002Ju-RT
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 14:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQo-0003hC-EP
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQl-000368-KP
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664469035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HPT28RrcUjLUQw60OIcNqXsyvIh0beuV4wvIwCLtC44=;
 b=RmU/Q+7XLcLpMwcXwPcPIjuMT+umZ2EtPHold0jM4yjkoz8yAvsi83agid1nDfxoyORZs9
 R25G3HCA9gh/cJcZIFUaCQtsXabctNQsti0upqhpBlHeXIZlzLUh4Umnualywc99slY1U7
 RQb+/ZruhXQnX4a3uvw2UJ9SiBTMU4s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-AnXqNFwbNd2Tqf2AQTY_Eg-1; Thu, 29 Sep 2022 12:30:30 -0400
X-MC-Unique: AnXqNFwbNd2Tqf2AQTY_Eg-1
Received: by mail-ed1-f72.google.com with SMTP id
 f18-20020a056402355200b0045115517911so1648469edd.14
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HPT28RrcUjLUQw60OIcNqXsyvIh0beuV4wvIwCLtC44=;
 b=NBSdebWgNyZJHHt47UiKctPFi/1q8j9uLtdujsnCOHI/qUsfUw3tcj1DmAbKkWBBHh
 6Ak34cpMwZsjDq9LTKAcBUjbuu4m7en3ej5KBo4Zz6o50T9Cd1XSXgRqYBBtkFlGVUqT
 0UXNG5h8ACG7ou/ZrbEOS5dgVoiIGJ8zmHAGb3U1XbNQu7bxgch+4KLFV5cMIxIr8r6d
 AHIOGPY/3qaPIAurO2MMs3nAnSzwigBjMFCzXmP5Xn0TYP87/MTGgF/wdrckPwSA23qh
 f/rUwNsjlyjrU8gk42DrVHLXGm6oVRi0wle+I8FZFk8VTkO/Z0ebyYh0l1UlfNYrNVtX
 D+Aw==
X-Gm-Message-State: ACrzQf3ssWzLJtocn2myEWvciQo6UlOJWqmi1miMrPA0t3Q510izN80c
 7huqC5YjNGjhcFG1ql4nEaUMXeCLbdxCMs7aVzqnw+wL/MW7A1Y6+E9i8tyZh2502aQUvOzd+TZ
 WDeKC0jW4tIZ0BkmO1dWUS1ud9ug3DezQhNowYDepp0J2Q+5dnN2YPpAQ9msmCArHy8U=
X-Received: by 2002:a17:907:7621:b0:741:6656:bd14 with SMTP id
 jy1-20020a170907762100b007416656bd14mr3291586ejc.298.1664469029020; 
 Thu, 29 Sep 2022 09:30:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5cxrCcidS57gfqm3J3eVspuADAnvLBFMBekdfTKKGcU4Gh71sH2mQSzF1bFT3dPztr5kr2xg==
X-Received: by 2002:a17:907:7621:b0:741:6656:bd14 with SMTP id
 jy1-20020a170907762100b007416656bd14mr3291567ejc.298.1664469028781; 
 Thu, 29 Sep 2022 09:30:28 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ca5-20020a170906a3c500b007778c9b7629sm4174426ejb.34.2022.09.29.09.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:30:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Laurent Vivier <laurent@vivier.eu>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 04/14] x86: re-enable rng seeding via SetupData
Date: Thu, 29 Sep 2022 18:30:04 +0200
Message-Id: <20220929163014.16950-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929163014.16950-1-pbonzini@redhat.com>
References: <20220929163014.16950-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

This reverts 3824e25db1 ("x86: disable rng seeding via setup_data"), but
for 7.2 rather than 7.1, now that modifying setup_data is safe to do.

Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-Id: <20220921093134.2936487-4-Jason@zx2c4.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/microvm.c | 2 +-
 hw/i386/pc_piix.c | 3 ++-
 hw/i386/pc_q35.c  | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 52cafa003d..7fe8cce03e 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -332,7 +332,7 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     rom_set_fw(fw_cfg);
 
     if (machine->kernel_filename != NULL) {
-        x86_load_linux(x86ms, fw_cfg, 0, true, true);
+        x86_load_linux(x86ms, fw_cfg, 0, true, false);
     }
 
     if (mms->option_roms) {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 8043a250ad..0b1a79c0fa 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -439,7 +439,6 @@ static void pc_i440fx_7_2_machine_options(MachineClass *m)
     m->alias = "pc";
     m->is_default = true;
     pcmc->default_cpu_version = 1;
-    pcmc->legacy_no_rng_seed = true;
 }
 
 DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
@@ -447,9 +446,11 @@ DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
 
 static void pc_i440fx_7_1_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_7_2_machine_options(m);
     m->alias = NULL;
     m->is_default = false;
+    pcmc->legacy_no_rng_seed = true;
     compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
     compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 53eda50e81..a496bd6e74 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -376,7 +376,6 @@ static void pc_q35_7_2_machine_options(MachineClass *m)
     pc_q35_machine_options(m);
     m->alias = "q35";
     pcmc->default_cpu_version = 1;
-    pcmc->legacy_no_rng_seed = true;
 }
 
 DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
@@ -384,8 +383,10 @@ DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
 
 static void pc_q35_7_1_machine_options(MachineClass *m)
 {
+    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_2_machine_options(m);
     m->alias = NULL;
+    pcmc->legacy_no_rng_seed = true;
     compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
     compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
 }
-- 
2.37.3


