Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0A45BE5C9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 14:30:08 +0200 (CEST)
Received: from localhost ([::1]:60380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oacO7-0001u3-8J
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 08:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYa-0000kn-8T
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:48 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYY-0004oR-Fu
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:32:47 -0400
Received: by mail-pl1-x635.google.com with SMTP id t3so1930398ply.2
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=NvXJmEVVDbrEpYS0xV/yTQ9UhV+ab4oZGiarDXwYoFw=;
 b=oz+n816d2XTEDmC/2FtICQO9l3tfq/gl7aNwwuTjSZTzidgbV71hr1c5f8fNwuOoME
 TXyhgCL6zBH4VE/k8tiGPm/ZpLme0MuZPjOz4DYKCtTF81a8D82LwCN3V06W/DFRNGil
 1mzFLJofjIbjQmzCEMzCrBVT+dGG7tANdJE+muW6r4s37cplCte+0Q0HH1WSHUc/DjWx
 jlhDG4eEYDPTydGJqyRBSwDWNBkT7xmRa9x0PqqggJwMPH2DpC2vrEAZv9sBPDjHojEq
 VQ2pJ5matjJE8GyUPHojhd6QWvP9EeFXyI4UrJxac/F0VePzGDHFlCMeYQAgvjyHABu+
 qnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NvXJmEVVDbrEpYS0xV/yTQ9UhV+ab4oZGiarDXwYoFw=;
 b=rezqOc15EoPNCN6GJgl0RN/UGTFVm4lQhMwoHWvERIkyrq4rcJ2ICv/PMMFTPEJ4e6
 vhEW0JuQf457p9BOaDTjsEh/QxP95i7pL5KxVkNgoyDMuwBDDlVs0HHaKv0UY4ICfMTc
 FiX0E3h43o1nzFpRtdODASq559BRIHg0vJ3TAlUoHEIaKG3xzixhy7FliJ6l9/Fdkm8T
 Vw36h1hQg1j6xy14uB9JjgN9Nw6IWQffekt7dT88Pg16OcZqLzLVCmXM9y5cAZdJd+5c
 5+3ewUOrHBmVCNeMjuNptmgIbQPQthkOhnPXzJYr6TtD++CdTOtFtKm5I183L+z67v4T
 d0mg==
X-Gm-Message-State: ACrzQf2wBY3hP3mjeuAkErqE6LLYBMjiX4oUSeXAuLnKLhgqR9KfNITX
 COwiU9JFnTNHlYLfI5Ztx0IvZofitdU=
X-Google-Smtp-Source: AMsMyM5JIiHeGT8a4Xj79LwP/QBsA/QxXOaMCX+4/4nb9OaJTfd8bkRTKYcXyHvcNbEO7fqCDIBMoQ==
X-Received: by 2002:a17:90b:4c92:b0:202:fcca:60ae with SMTP id
 my18-20020a17090b4c9200b00202fcca60aemr3256130pjb.52.1663669965646; 
 Tue, 20 Sep 2022 03:32:45 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:45 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 12/39] tests/qtest: Build test-filter-{mirror,
 redirector} cases for posix only
Date: Tue, 20 Sep 2022 18:31:32 +0800
Message-Id: <20220920103159.1865256-13-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

The test-filter-{mirror,redirector} cases use socketpair() API that
is only available on POSIX and should only be built for POSIX.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

Changes in v2:
- Introduce a new variable qtests_filter and add that to the
  qtests_ARCH variables

 tests/qtest/meson.build | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index e910cb32ca..455f1bbb7e 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -39,9 +39,14 @@ qtests_pci = \
 qtests_cxl = \
   (config_all_devices.has_key('CONFIG_CXL') ? ['cxl-test'] : [])
 
+qtests_filter = \
+  (slirp.found() ? ['test-netfilter'] : []) + \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) + \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : [])
+
 qtests_i386 = \
-  (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +             \
-  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +                     \
+  (slirp.found() ? ['pxe-test'] : []) + \
+  qtests_filter + \
   (have_tools ? ['ahci-test'] : []) +                                                       \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +           \
   (config_all_devices.has_key('CONFIG_SGA') ? ['boot-serial-test'] : []) +                  \
@@ -95,8 +100,7 @@ qtests_i386 = \
    'vmgenid-test',
    'migration-test',
    'test-x86-cpuid-compat',
-   'numa-test',
-   'test-filter-redirector'
+   'numa-test'
   ]
 
 if dbus_display
@@ -120,30 +124,25 @@ endif
 qtests_x86_64 = qtests_i386
 
 qtests_alpha = ['boot-serial-test'] + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
-  (slirp.found() ? ['test-netfilter'] : []) + \
+  qtests_filter + \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
 qtests_avr = [ 'boot-serial-test' ]
 
 qtests_hppa = ['boot-serial-test'] + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
-  (slirp.found() ? ['test-netfilter'] : []) + \
+  qtests_filter + \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
 qtests_m68k = ['boot-serial-test'] + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
-  (slirp.found() ? ['test-netfilter'] : [])
+  qtests_filter
 
 qtests_microblaze = ['boot-serial-test'] + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
-  (slirp.found() ? ['test-netfilter'] : [])
+  qtests_filter
 
 qtests_microblazeel = qtests_microblaze
 
 qtests_mips = \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
-  (slirp.found() ? ['test-netfilter'] : []) + \
+  qtests_filter + \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
@@ -152,8 +151,7 @@ qtests_mips64 = qtests_mips
 qtests_mips64el = qtests_mips
 
 qtests_ppc = \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
-  (slirp.found() ? ['test-netfilter'] : []) + \
+  qtests_filter + \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_M48T59') ? ['m48t59-test'] : []) +                     \
   (config_all_devices.has_key('CONFIG_TCG') ? ['prom-env-test'] : []) +                      \
@@ -174,13 +172,11 @@ qtests_sh4 = (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-te
 qtests_sh4eb = (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : [])
 
 qtests_sparc = ['prom-env-test', 'm48t59-test', 'boot-serial-test'] + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
-  (slirp.found() ? ['test-netfilter'] : [])
+  qtests_filter
 
 qtests_sparc64 = \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
-  (slirp.found() ? ['test-netfilter'] : []) + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
+  qtests_filter + \
   ['prom-env-test', 'boot-serial-test']
 
 qtests_npcm7xx = \
-- 
2.34.1


