Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6225EC30D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:41:31 +0200 (CEST)
Received: from localhost ([::1]:55574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9tx-0007Gs-8b
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RW-0002xl-Cd
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:02 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:43863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RT-0004wc-Ky
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:02 -0400
Received: by mail-pf1-x42c.google.com with SMTP id d82so9341129pfd.10
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bgoeJG+EitAc6steECPvwA+eqgU3ODIY2NLoSDcVQq4=;
 b=VwLlsuJAW4kiLIJ2F4USgAVVaEFk3w0prwvq02bqZl6n9fib29D9QcuRJe94RBABnj
 DD1KPKSVzZqUVy70uMKrqzqgpRlAs6lcArol1rJtDZ3WHOXiDR0+9B/iuvh/51c1D5oN
 4/x7fam6mkBkEqP2WzE1DLBcbIUVQKqSrG/BxCmnllQIdsemcus8UK1NmIAD7h6fQYps
 5VNj+vmADdKecMpIDULVnbU55gjWymukQA4QHtedqd2O7ID57JB7yDuZ7TBx0P2nfXLU
 E9ovrwBj5WkSDCbmx0sQLiEsOrbURFfgHJMVkfR9gaHma/BDFOQtVBN9NXrLRIVoUK6D
 seqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bgoeJG+EitAc6steECPvwA+eqgU3ODIY2NLoSDcVQq4=;
 b=DHH6q91xYFcrHflYsR5KEng5uE3EH1X+f9XcVvGvI5RrZEokV7/1E+dEXlhhNRGSzF
 DTDpoJNzT4vLRB0HAJJs93pVMSRPjJJ2t6muDXD2L2kM8Re9w1uPpOEXEde3FvFL33rd
 n6B7KcE+GIR7g5qreAigEWYvevY5Nju2Hhml9x0PWW7w/ztihcxSq5CFb69uv1+FO55/
 befXXFrRHNT7IoUrwhsf5hzhWUkXVYJ43GLhlHAAhhm1jAVGEh58e+tOY0WQXJWQ1pOX
 I48T21etJ3YOBdUubSM4Fn7SRV9Katsg6B2zktjCHWOW1XO2RzOYojN0Zj+6NkrHO+LS
 DHAA==
X-Gm-Message-State: ACrzQf05k8OXDD84GI8LonWD0AZ2GBtKAjvtF/vj8TY905DOED4dkTNB
 RtfE4YQCKC+R2gmF3uu13OA/giBGQWc=
X-Google-Smtp-Source: AMsMyM6HAh79pCHR8+cpzDLacK6of6dNQCibMmmrUV3Vlo1Uwwu+M0hj7N7MOhM5/HGVvS4M4wWx9g==
X-Received: by 2002:a62:4e4c:0:b0:53e:22b6:6869 with SMTP id
 c73-20020a624e4c000000b0053e22b66869mr28253643pfb.29.1664276878526; 
 Tue, 27 Sep 2022 04:07:58 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:58 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 29/54] tests/qtest: Build test-filter-{mirror,
 redirector} cases for posix only
Date: Tue, 27 Sep 2022 19:06:07 +0800
Message-Id: <20220927110632.1973965-30-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42c.google.com
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

(no changes since v2)

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


