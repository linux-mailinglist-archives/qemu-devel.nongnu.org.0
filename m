Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE1A3C1606
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:31:23 +0200 (CEST)
Received: from localhost ([::1]:58300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Vzm-0007Py-O3
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmz-0000YQ-Vy
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:10 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmy-0008EX-8V
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:09 -0400
Received: by mail-ej1-x629.google.com with SMTP id i20so10270154ejw.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uuuNIH23NCYC3HB+3rBgnfJ6sMhfWC9GGXILCAAVyEg=;
 b=eDctoK8khkg0OEFn51sWQTz0gOqsrCKNvMBXyPglPZGCJG+P17ogdcWdytxaNbF7EY
 IFpg/Ut2DCwoR5c0UR+t775wKYaoQMxwNHzSbawRK9u3qlaxOYMfqaNX6EfusEWO30AE
 EFokeGoHOlQ/WhMdfkb9oXsM0NFabSe34U5ELwhmb7G0AuyBfKulpoKMfUklHOPhpGqA
 98jCkqtcJkhYjHfMnye46ShStiaitvCidxXb1LO22IbhAosUDtTNjF/Lb5UQJ2gDCgIh
 lw0Ke7VPCewlkipD1jcENiuOw7qfN6c/G8bZ0hrmcLLcZIsvLv/vKI/5MtEHB6xUrztn
 dACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uuuNIH23NCYC3HB+3rBgnfJ6sMhfWC9GGXILCAAVyEg=;
 b=fomof07UVl8yjZ90+gy2X+zcB+V6zXP1UE1jnenpjzMMVN2GAx3xM4KF090gpUY+Jk
 mcuD3YM2vxYYnG7x63JlkcMqapbFxXR+aPpRsYLIpc6gvdfBcN7u2R6kgM4mlCmeH4EP
 2nIz96yUEOBolgcxegGkQRIg8FsEaYPEFgIO+a7h+gNL7HjYLMBiMTUwvw8XER+ZLxK4
 sOXcdH58SmVaw6eXNmUnFNsXX/1Aad9tQ3WoQJhi55g4CSQcvIwol6Sx7oeRecIVWFM9
 gB3SS95kFViu5SrA5fo/LySNGysL+TSL5sjKRxxH/isi+I3MjCk+8YGBPGIMFK8NkGLF
 BpGg==
X-Gm-Message-State: AOAM532ei3beOSnrW1zDUzkKGP8JzBrHY8OuKAHWQvycbp3weXPTNj+w
 v+GZdEHBAtePURU4y/Ayn/l1ZvBAIv4=
X-Google-Smtp-Source: ABdhPJzF8An8J8V3SC5hq/SA1IFDnNlZlF8l4EZRjC4ieAaU4UJffQ/X5WQnH1Hdd7xA/qsjfSJy7Q==
X-Received: by 2002:a17:906:3b52:: with SMTP id
 h18mr32190244ejf.451.1625757486795; 
 Thu, 08 Jul 2021 08:18:06 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/48] modules: target-specific module build infrastructure
Date: Thu,  8 Jul 2021 17:17:24 +0200
Message-Id: <20210708151748.408754-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-21-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meson.build b/meson.build
index 7b827f7caa..7babef4de4 100644
--- a/meson.build
+++ b/meson.build
@@ -2001,6 +2001,7 @@ user_ss = ss.source_set()
 util_ss = ss.source_set()
 
 modules = {}
+target_modules = {}
 hw_arch = {}
 target_arch = {}
 target_softmmu_arch = {}
@@ -2280,6 +2281,42 @@ foreach d, list : modules
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



