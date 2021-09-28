Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019F841AFC2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:16:10 +0200 (CEST)
Received: from localhost ([::1]:52488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCxr-0004lG-Bn
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaJ-0006gh-2w
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:51 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaG-0001VM-Fp
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:46 -0400
Received: by mail-ed1-x52d.google.com with SMTP id g8so82855808edt.7
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uaWUay8u5sEHfBZcOQ3gcsDVPBZYoTEkLnbi0ceKMYg=;
 b=R8R5WberBR4TFCJJsROYt3HFjlvQAzH6wurAEsQP8sxLX8m49pkTiIywMil4dItBal
 s+RsGZ22Ug5mBjZB+pAY5smcvWXW3VCE4Pmj4B2eLLfdXtwJC3VTsC7D0FSYPuMhWfRp
 t3hYRE2CmMvG4enOGIF3F4N39w4CiMORuQtYnVtOLBQS4uriHhTw2aBZjaAHj5VeGtfp
 dAraygLg0qClVBWQZ+gMyDeCWMloLahtIbHAOPDeiFyBd/4ZiuXpxbZaHuACDo/2/P6h
 jtRxkti4I9pRfOu6QcYXluGUBUuhOYgv8auqroQbNzdW7mB9usJt5vfinmdHNsWJvEq6
 kwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uaWUay8u5sEHfBZcOQ3gcsDVPBZYoTEkLnbi0ceKMYg=;
 b=Ic80lREkPcNfoN7HhlvqW8rWrR8ztDJNpsp745hgduZPWu6ZLFXRiCBNRhOF0EjdAc
 z5LceON1mMDtUYO7f7SJSk1kcqtAd79XIXJxXzfk+EHmodHbNYtvj6LgbBVx76z4ic+d
 jH//jQtxkeAwjxl+JFo7Ae0mnRDb8ipca/RemrsZO9ov2jbvAtoPMntCdMTbkL/Br8Bm
 wtULfTecbLrcD7UdCxySRnd4rhzCpClwQMgyOu0NKpUPS6STR4FU8SCFHmBMJIkclTEq
 6icmuYfpYl+LCYHGy0Qia4Lx0h6a67dcuOmTixLFLG4h0lf55+3EYuF/j4pb3ZiIzp/8
 IsuA==
X-Gm-Message-State: AOAM5324I0Xh2RuI5bO+M/AkUuv2YxCE2J1J2TGu2iQ4B2mJZhM0z6j3
 /hmSDAj5MMfrT+L5zdN+4UWKhroJcCU=
X-Google-Smtp-Source: ABdhPJwvtgnEqVoIyCCVdVt4VPWv1g4S4EEjsAhHXj1I2XMusiRGdhJRtjDdyJw/TynLQdXGOplxeg==
X-Received: by 2002:a17:906:3882:: with SMTP id
 q2mr6670379ejd.396.1632833500447; 
 Tue, 28 Sep 2021 05:51:40 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/33] tests: qtest: bios-tables-test depends on the unpacked
 edk2 ROMs
Date: Tue, 28 Sep 2021 14:51:11 +0200
Message-Id: <20210928125116.183620-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Skip the test if bzip2 is not available, and run it after they are
uncompressed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210923105529.3845741-2-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/meson.build     | 3 ++-
 tests/qtest/meson.build | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index a3b3d87891..a44c9bc127 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -1,3 +1,4 @@
+roms = []
 if unpack_edk2_blobs
   fds = [
     'edk2-aarch64-code.fd',
@@ -11,7 +12,7 @@ if unpack_edk2_blobs
   ]
 
   foreach f : fds
-    custom_target(f,
+    roms += custom_target(f,
                   build_by_default: have_system,
                   output: f,
                   input: '@0@.bz2'.format(f),
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 757bb8499a..19444d4752 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -68,12 +68,12 @@ qtests_i386 = \
   (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
   (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
+  (unpack_edk2_blobs ? ['bios-tables-test'] : []) +                                         \
   qtests_pci +                                                                              \
   ['fdc-test',
    'ide-test',
    'hd-geo-test',
    'boot-order-test',
-   'bios-tables-test',
    'rtc-test',
    'i440fx-test',
    'fw_cfg-test',
@@ -180,7 +180,7 @@ qtests_arm = \
 
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
 qtests_aarch64 = \
-  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
+  (cpu != 'arm' and unpack_edk2_blobs ? ['bios-tables-test'] : []) +                            \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
   ['arm-cpu-features',
@@ -269,7 +269,7 @@ foreach dir : target_dirs
   qtest_emulator = emulators['qemu-system-' + target_base]
   target_qtests = get_variable('qtests_' + target_base, []) + qtests_generic
 
-  test_deps = []
+  test_deps = roms
   qtest_env = environment()
   if have_tools
     qtest_env.set('QTEST_QEMU_IMG', './qemu-img')
-- 
2.31.1



