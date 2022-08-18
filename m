Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C05D5980ED
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 11:38:44 +0200 (CEST)
Received: from localhost ([::1]:48082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oObyw-0000Ml-KS
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 05:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oObqZ-0002hd-ET
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:29:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oObqX-0002uk-Ru
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660814988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JeGQTz1PHlwEEK4zTizYgsxIMf+o5AamQIj8405QzFU=;
 b=VysrLGQ5iMub2i2pRGqZ8AFvoL+qV6wmgJNsafhURkkZ1MZK/7gUItTOMR2a5rl0RZPJMO
 fqTDh70B6SFMA9mbiqe/YaieMb+GKj1D97W3VdFmqUj9d5pytOZJx1GdRgpjJKhQ67EjoR
 BISqxPrMVkmxOvNDRy+gKRgF6Pu2DSE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-237-VDvtfginOz2QcE6_3zq93A-1; Thu, 18 Aug 2022 05:29:47 -0400
X-MC-Unique: VDvtfginOz2QcE6_3zq93A-1
Received: by mail-ed1-f69.google.com with SMTP id
 b13-20020a056402350d00b0043dfc84c533so611702edd.5
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 02:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=JeGQTz1PHlwEEK4zTizYgsxIMf+o5AamQIj8405QzFU=;
 b=nDe/nahfjCUZKSqD9X6BS14zXi/qW67gGNrC7MaigSjDinIgMHh/MkwxhiVKHnNr0F
 Vm6aSPws00ypPBcFsTBBxgYkwPA4ZUXsX3kMd45ptEoOeVAhZ4td+Ps+j7HTHqSr2KjW
 6eqLUt1wA1KLfbdluKPzeWBURh599Wxc0+XAhVZwDkz/h8+smin9/2ceGBjK2jSuU6mM
 4AeqYBpIDGt8sjwDm2o8kPY+lfHrYEvu7//QTrtidYpV9tdaXCim3NftsqPQKoc0wau6
 ipMA0aCFCFmyDTUYEOt5dSxGrOvLQkPVCgefDrnAqSZzk+/N9keWV0oBJpSxF1ZEU9ev
 kP4g==
X-Gm-Message-State: ACgBeo101A4x7mr7P8yRNbbSr+qL84nu6Acm2FYm7mY9Lsp03tBrYX2u
 mcUonOasz0iuJRO4MSSEN55oh+iAVbw6n02iJJz3s5tsO+PrOOKTJBc6kSBEZygdfb0ulVzJmdU
 fLp+sxtQXnPLqk9lVTJSIgnKgbO+2IFbEdH63lL8jA6DoHmTBvhx++XbsWjMedS4nyoc=
X-Received: by 2002:a17:907:970e:b0:731:4fb4:5f7b with SMTP id
 jg14-20020a170907970e00b007314fb45f7bmr1343062ejc.556.1660814985872; 
 Thu, 18 Aug 2022 02:29:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6VSfelER7UTWar8Qvw6GM/sDO1iswGC+txdbBbyCn2XFEIhzWr4sbSMPctJBLwm2oTelkWLw==
X-Received: by 2002:a17:907:970e:b0:731:4fb4:5f7b with SMTP id
 jg14-20020a170907970e00b007314fb45f7bmr1343052ejc.556.1660814985535; 
 Thu, 18 Aug 2022 02:29:45 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a056402164f00b0043d1a9f6e4asm812567edx.9.2022.08.18.02.29.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 02:29:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: remove dead code
Date: Thu, 18 Aug 2022 11:29:42 +0200
Message-Id: <20220818092943.106451-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Found with "muon analyze".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                 |  2 --
 pc-bios/keymaps/meson.build |  1 -
 qapi/meson.build            | 15 ---------------
 target/riscv/meson.build    |  2 --
 4 files changed, 20 deletions(-)

diff --git a/meson.build b/meson.build
index 30a380752c..8e927fc457 100644
--- a/meson.build
+++ b/meson.build
@@ -3405,7 +3405,6 @@ foreach target : target_dirs
     target_inc += include_directories('linux-headers', is_system: true)
   endif
   if target.endswith('-softmmu')
-    qemu_target_name = 'qemu-system-' + target_name
     target_type='system'
     t = target_softmmu_arch[target_base_arch].apply(config_target, strict: false)
     arch_srcs += t.sources()
@@ -3422,7 +3421,6 @@ foreach target : target_dirs
     abi = config_target['TARGET_ABI_DIR']
     target_type='user'
     target_inc += common_user_inc
-    qemu_target_name = 'qemu-' + target_name
     if target_base_arch in target_user_arch
       t = target_user_arch[target_base_arch].apply(config_target, strict: false)
       arch_srcs += t.sources()
diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 2837eb34f4..06c75e646b 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -38,7 +38,6 @@ if meson.is_cross_build() or 'CONFIG_XKBCOMMON' not in config_host
 else
   native_qemu_keymap = qemu_keymap
 endif
-cp = find_program('cp')
 
 if native_qemu_keymap.found()
   t = []
diff --git a/qapi/meson.build b/qapi/meson.build
index fd5c93d643..840f1b0e19 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -68,21 +68,6 @@ if have_system or have_tools
   ]
 endif
 
-qapi_storage_daemon_modules = [
-  'block-core',
-  'block-export',
-  'char',
-  'common',
-  'control',
-  'crypto',
-  'introspect',
-  'job',
-  'qom',
-  'sockets',
-  'pragma',
-  'transaction',
-]
-
 qapi_nonmodule_outputs = [
   'qapi-introspect.c', 'qapi-introspect.h',
   'qapi-types.c', 'qapi-types.h',
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 2c1975e72c..6b9435d69a 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -1,6 +1,4 @@
 # FIXME extra_args should accept files()
-dir = meson.current_source_dir()
-
 gen = [
   decodetree.process('insn16.decode', extra_args: ['--static-decode=decode_insn16', '--insnwidth=16']),
   decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
-- 
2.37.1


