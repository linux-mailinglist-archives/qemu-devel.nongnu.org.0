Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5C959F737
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:14:46 +0200 (CEST)
Received: from localhost ([::1]:37540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnPJ-00031N-8z
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmu3-0003Nc-1U
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:27 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmu1-0001Yy-8n
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:26 -0400
Received: by mail-pj1-x102b.google.com with SMTP id g18so16539640pju.0
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=5lVamr0P85d3jCGn5N3zgxP8+z+BcFBCgzNisZd7pVc=;
 b=EwftjWsxSFoONCsCgawmZBUtodhh88DibzYCIpi5E4w6fFyKxGuj5MvWzQhMjYpH6N
 pEfXJLFpuMje4BinTZcSVOotlwptzY+Nq3K8bUiGu0743uJBBGWPn/ltiFkF4QxiCqHS
 kSQDKoyHENoid5f0+DpgHbdVHzcWS9hm/GG89/2d9YBdWbeeq0FtT4NfTsavLgOhzcPP
 rtPa6zyg6/vOmo32qLiF6FO/KxmLs4xdE3bxvi3uNjQnEYBusJrCgqAKACNsplKE6pJd
 6kJnpY9qNcfyVH6NO/gH3ksjeLu39ppHmme5qxBs1DSfsQPq5fQATEdlDriiF5xQtZF1
 gMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5lVamr0P85d3jCGn5N3zgxP8+z+BcFBCgzNisZd7pVc=;
 b=BwKVKOxKsQedrZy73uiq/CkJ7yKW5Yi6fcYlTK7n6zU5hJjXbwE1YtdlsRa6jU20j4
 bTL5BSfidfD+Pc3BKHrR8CFWpQtf+dXsblQSWdvHN10oYARnq+G+12lUkGaZAjJcnjcf
 fZuXV/o4FUq+rbN0IxvN/PjTtVK++1E7pd3OU0RTVtSSVQzAxYswn6KgeJ8zktmSXwzG
 KWgBVwoYkb+xykaSvJLUYGnhoaGsQ15jm/36d1+78Z2rmvYj6xmXVX9qndfKLEny6oRG
 VzaUpkxQDKrqZG6qHL18kSGZ4OcdRBDpSgrHNrvYtKwD4RrIKps3mmnyIZX50DDioIVv
 TGoQ==
X-Gm-Message-State: ACgBeo3QpOcJNFZ7ySjd3dQQ0YCrw233p2pftUyNCvFgAjWiOKcqZ23B
 N2l1ivy4SExv7km8o1TzeZMawzyitnw=
X-Google-Smtp-Source: AA6agR5RBHhXC1wjezFv+dNPzH4vOPdvLLIgW5x6dveS9GcLAZM98WB4VYKZ5tFiZy75v9XSsD47cg==
X-Received: by 2002:a17:90a:f0c9:b0:1fa:e017:7d13 with SMTP id
 fa9-20020a17090af0c900b001fae0177d13mr7491493pjb.128.1661334143559; 
 Wed, 24 Aug 2022 02:42:23 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:23 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 19/51] tests/qtest: Build test-filter-{mirror,
 redirector} cases for posix only
Date: Wed, 24 Aug 2022 17:39:57 +0800
Message-Id: <20220824094029.1634519-20-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
---

 tests/qtest/meson.build | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 9e484e60ba..c97da5a062 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -42,6 +42,7 @@ qtests_cxl = \
 qtests_i386 = \
   (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +             \
   (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +                     \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) +                 \
   (have_tools ? ['ahci-test'] : []) +                                                       \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +           \
   (config_all_devices.has_key('CONFIG_SGA') ? ['boot-serial-test'] : []) +                  \
@@ -95,8 +96,7 @@ qtests_i386 = \
    'vmgenid-test',
    'migration-test',
    'test-x86-cpuid-compat',
-   'numa-test',
-   'test-filter-redirector'
+   'numa-test'
   ]
 
 if dbus_display
@@ -120,29 +120,34 @@ endif
 qtests_x86_64 = qtests_i386
 
 qtests_alpha = ['boot-serial-test'] + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +     \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) + \
   (slirp.found() ? ['test-netfilter'] : []) + \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
 qtests_avr = [ 'boot-serial-test' ]
 
 qtests_hppa = ['boot-serial-test'] + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +     \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) + \
   (slirp.found() ? ['test-netfilter'] : []) + \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
 qtests_m68k = ['boot-serial-test'] + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +     \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) + \
   (slirp.found() ? ['test-netfilter'] : [])
 
 qtests_microblaze = ['boot-serial-test'] + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +     \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) + \
   (slirp.found() ? ['test-netfilter'] : [])
 
 qtests_microblazeel = qtests_microblaze
 
 qtests_mips = \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +     \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) + \
   (slirp.found() ? ['test-netfilter'] : []) + \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
@@ -152,7 +157,8 @@ qtests_mips64 = qtests_mips
 qtests_mips64el = qtests_mips
 
 qtests_ppc = \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +     \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) + \
   (slirp.found() ? ['test-netfilter'] : []) + \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_M48T59') ? ['m48t59-test'] : []) +                     \
@@ -174,13 +180,15 @@ qtests_sh4 = (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-te
 qtests_sh4eb = (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : [])
 
 qtests_sparc = ['prom-env-test', 'm48t59-test', 'boot-serial-test'] + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +     \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) + \
   (slirp.found() ? ['test-netfilter'] : [])
 
 qtests_sparc64 = \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (slirp.found() ? ['test-netfilter'] : []) + \
-  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +     \
+  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) + \
   ['prom-env-test', 'boot-serial-test']
 
 qtests_npcm7xx = \
-- 
2.34.1


