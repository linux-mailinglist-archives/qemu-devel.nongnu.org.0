Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E50C3AC2BF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 07:05:05 +0200 (CEST)
Received: from localhost ([::1]:41866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu6gi-0003Xr-AA
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 01:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6YW-0007VK-Ln
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:56:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6YT-0005Dc-QT
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:56:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623992193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ob/rQNCzIY1cTCAOGsXMnSfmkxoxXN8wteC7GUj8UFA=;
 b=aFwBj6osxUP8N3blDkU1P3r9DJVKy0FNcADfaabULic5A/AxWxvOsg62MO3wAo/5bxRHtc
 E3QB+DX1uOid6IBNbNnBVKoFuwlmS1HiTSNX3o5F/owtdAX5nCvmQFZlPEv3z2+fnMquiX
 W+xrNo+NhwKLrwTeuvPyMMN8xqibGeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-kLkNhtN7McqIySZUofvxVw-1; Fri, 18 Jun 2021 00:56:31 -0400
X-MC-Unique: kLkNhtN7McqIySZUofvxVw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00FBB8015C6;
 Fri, 18 Jun 2021 04:56:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 919D61001B2C;
 Fri, 18 Jun 2021 04:56:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3EF5A1803552; Fri, 18 Jun 2021 06:53:55 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/24] accel: build tcg modular
Date: Fri, 18 Jun 2021 06:53:53 +0200
Message-Id: <20210618045353.2510174-25-kraxel@redhat.com>
In-Reply-To: <20210618045353.2510174-1-kraxel@redhat.com>
References: <20210618045353.2510174-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Peter Lieven <pl@kamp.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build tcg accel ops as module.
Which is only a small fraction of tcg.
Also only x86 for now.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 accel/tcg/meson.build |  5 ++++-
 meson.build           | 14 +++++++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 1236ac7b910b..0ae9180282e3 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -15,8 +15,11 @@ specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'cputlb.c',
+))
+
+tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'tcg-accel-ops.c',
   'tcg-accel-ops-mttcg.c',
   'tcg-accel-ops-icount.c',
-  'tcg-accel-ops-rr.c'
+  'tcg-accel-ops-rr.c',
 ))
diff --git a/meson.build b/meson.build
index 8f55f563eefe..03bacca7cddb 100644
--- a/meson.build
+++ b/meson.build
@@ -92,6 +92,8 @@ if cpu in ['x86', 'x86_64']
   }
 endif
 
+modular_tcg = ['i386-softmmu', 'x86_64-softmmu']
+
 edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
 install_edk2_blobs = false
 if get_option('install_blobs')
@@ -1311,6 +1313,11 @@ foreach target : target_dirs
       elif sym == 'CONFIG_XEN' and have_xen_pci_passthrough
         config_target += { 'CONFIG_XEN_PCI_PASSTHROUGH': 'y' }
       endif
+      if target in modular_tcg
+        config_target += { 'CONFIG_TCG_MODULAR': 'y' }
+      else
+        config_target += { 'CONFIG_TCG_BUILTIN': 'y' }
+      endif
       accel_kconfig += [ sym + '=y' ]
     endif
   endforeach
@@ -1782,6 +1789,7 @@ util_ss = ss.source_set()
 
 # accel modules
 qtest_module_ss = ss.source_set()
+tcg_module_ss = ss.source_set()
 
 modules = {}
 target_modules = {}
@@ -2022,7 +2030,11 @@ subdir('tests/qtest/libqos')
 subdir('tests/qtest/fuzz')
 
 # accel modules
-target_modules += { 'accel' : { 'qtest': qtest_module_ss }}
+tcg_real_module_ss = ss.source_set()
+tcg_real_module_ss.add_all(when: 'CONFIG_TCG_MODULAR', if_true: tcg_module_ss)
+specific_ss.add_all(when: 'CONFIG_TCG_BUILTIN', if_true: tcg_module_ss)
+target_modules += { 'accel' : { 'qtest': qtest_module_ss,
+                                'tcg': tcg_real_module_ss }}
 
 ########################
 # Library dependencies #
-- 
2.31.1


