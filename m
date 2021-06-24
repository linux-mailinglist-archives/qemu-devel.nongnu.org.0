Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F243B2CF4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:52:59 +0200 (CEST)
Received: from localhost ([::1]:39394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMyg-0006A2-KI
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMnL-00040A-8N
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:41:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMnI-0008AD-3d
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624531271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+BKDlmPA7NNdhmix8TmXxQQehHJQ81Rtjwtzs/AW4A=;
 b=XYWKUUJnxKfz8c8CnP/9DjIQ9O+7ffvftSP11aZblIrQ5mSfLCf5xs9nWgAalubOV1w7Cy
 CF7pXfCYkHTq2fYnXfXUWAHKyOwVDljl/oRukS3bBzXN0WdAmHYxg1liofq2E458s6HQeX
 iRye2xvoQWa0HwQCNsc2NY4iJoWt6uU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-st5c5T9MOzCPZ0puYgSX5A-1; Thu, 24 Jun 2021 06:41:10 -0400
X-MC-Unique: st5c5T9MOzCPZ0puYgSX5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 945E1106B7DB;
 Thu, 24 Jun 2021 10:41:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 505B560871;
 Thu, 24 Jun 2021 10:40:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EB8B8180354A; Thu, 24 Jun 2021 12:38:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/34] modules: target-specific module build infrastructure
Date: Thu, 24 Jun 2021 12:38:22 +0200
Message-Id: <20210624103836.2382472-21-kraxel@redhat.com>
In-Reply-To: <20210624103836.2382472-1-kraxel@redhat.com>
References: <20210624103836.2382472-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson.build | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meson.build b/meson.build
index 6ae2b9ab9443..76020b43fb32 100644
--- a/meson.build
+++ b/meson.build
@@ -1781,6 +1781,7 @@ user_ss = ss.source_set()
 util_ss = ss.source_set()
 
 modules = {}
+target_modules = {}
 hw_arch = {}
 target_arch = {}
 target_softmmu_arch = {}
@@ -2060,6 +2061,42 @@ foreach d, list : modules
   endforeach
 endforeach
 
+foreach d, list : target_modules
+  foreach m, module_ss : list
+    if enable_modules and targetos != 'windows'
+      foreach target : target_dirs
+        if target.endswith('-softmmu')
+          config_target = config_target_mak[target]
+          config_target += config_host
+          target_inc = [include_directories('target' / config_target['TARGET_BASE_ARCH'])]
+          c_args = ['-DNEED_CPU_H',
+                    '-DCONFIG_TARGET="@0@-config-target.h"'.format(target),
+                    '-DCONFIG_DEVICES="@0@-config-devices.h"'.format(target)]
+          target_module_ss = module_ss.apply(config_target, strict: false)
+          if target_module_ss.sources() != []
+            module_name = d + '-' + m + '-' + config_target['TARGET_NAME']
+            sl = static_library(module_name,
+                                [genh, target_module_ss.sources()],
+                                dependencies: [modulecommon, target_module_ss.dependencies()],
+                                include_directories: target_inc,
+                                c_args: c_args,
+                                pic: true)
+            softmmu_mods += sl
+            # FIXME: Should use sl.extract_all_objects(recursive: true) too.
+            modinfo_files += custom_target(module_name + '.modinfo',
+                                           output: module_name + '.modinfo',
+                                           input: target_module_ss.sources(),
+                                           capture: true,
+                                           command: [modinfo_collect, '--target', target, '@INPUT@'])
+          endif
+        endif
+      endforeach
+    else
+      specific_ss.add_all(module_ss)
+    endif
+  endforeach
+endforeach
+
 if enable_modules
   modinfo_src = custom_target('modinfo.c',
                               output: 'modinfo.c',
-- 
2.31.1


