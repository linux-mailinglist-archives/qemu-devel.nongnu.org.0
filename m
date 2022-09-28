Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971CE5ED843
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 10:53:54 +0200 (CEST)
Received: from localhost ([::1]:43314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odSpF-0000zo-MF
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 04:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLo-0000z9-4h
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLm-0008UX-FU
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ve8BTFEJ8SlwZ9GsTrGk7OwwXRhwG2Tbjp5rgi+qtRk=;
 b=IEm8MEbKGWpcK4s5gLsh8JNinFqmnX097VYCXVt3mufGvM+FMhKDNT1NtCtgdcbar7ETmI
 aRwR0LzgCuOaez1KkTLg+8S2zTZEAn9XhVAKGoHj6TsFfVomu2CLT6I4m8qibLin0vyxd6
 9zKPXD4ULExirIOMZbUM9HA6+36rccc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-FP2VrOwcOza9_7ti-gf-HA-1; Wed, 28 Sep 2022 03:19:18 -0400
X-MC-Unique: FP2VrOwcOza9_7ti-gf-HA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE356811E67;
 Wed, 28 Sep 2022 07:19:17 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD68D40C83D9;
 Wed, 28 Sep 2022 07:19:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 18/37] tests/qtest: Build test-filter-{mirror,
 redirector} cases for posix only
Date: Wed, 28 Sep 2022 09:18:24 +0200
Message-Id: <20220928071843.1468323-19-thuth@redhat.com>
In-Reply-To: <20220928071843.1468323-1-thuth@redhat.com>
References: <20220928071843.1468323-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Message-Id: <20220925113032.1949844-30-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
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
2.31.1


