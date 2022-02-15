Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069044B68D2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:08:14 +0100 (CET)
Received: from localhost ([::1]:55598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJukl-000779-Nd
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:08:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCa-0004m7-Kg
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:52 -0500
Received: from [2a00:1450:4864:20::534] (port=43650
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCU-0008V6-Tb
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:49 -0500
Received: by mail-ed1-x534.google.com with SMTP id y17so29083376edd.10
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b+ciQvRWIHhYiOzIr5/SBokBom/pAmPzbz7GzQFHxFA=;
 b=cLJ8os5YlDp2STzYo1Z2CWj6rVMaYUbuv+yhX9Uo9BZuLtkJzm0wl6G/ExD1tvUgjh
 JwZC19+cXALlS83A59xqO866vtrkfA0zIXP7t4sq1THp3kqxVa1/TAfF8FcuOn8LCKZp
 9hLUYSitJhYbjw1x49gROAaEFDITwSDlx/JGZGuU/JCCJFO16i0dFDGAaxYov2/HAMNl
 XYgP5Clzbn5Zj3y5kKb+y1lE/aPQQwnwDhguCY/Cq3vDSxFdzew0XPlv2hf5PoAaN45D
 j6IhInLMTM3oFtLVTbNOjC2I0IfNlaFfGDvbRvm8pJJ12MBhK/N+AhhiCAAG03znWKRN
 Ueeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=b+ciQvRWIHhYiOzIr5/SBokBom/pAmPzbz7GzQFHxFA=;
 b=S4X1UFWqhT4R822LAMfM7aJ8dRrEdLetBXUdS7emAZp2h20qamSbdyA/FUlqP1twOb
 cKMfIItYLdWIR1u+XNP7yCY0SqrpUcr9w8rJMrJfnyh8WNPorCbaS5/SjXn1wMueLdkz
 FqUfhUr31Uo4BBU+oAO+u9lRHDvbjMiH5pDMj4VY3x/0YR3pC5VPEZd5PYWqBxmE7FW1
 YDFEqTSMdqIINvG3ewuG60qVOe2Lq2XQcezGIXCQSdBMqAvCq2+M/lt045B1T718L3og
 p487krvanGM1TtD2jio3vD6nAI9y9rNJuSsN7Ku7O6inHlfutWN+QgOkHsDTH6eiyMov
 1oKw==
X-Gm-Message-State: AOAM533npEMKo7EBhhlVoa+mkfhngH9LEYbeXBfFBClOMjCfUOMugICW
 vw0+5xv2IqhJ25XALrHU5JPDTJZvB94=
X-Google-Smtp-Source: ABdhPJxxabCC/VP7tVR70IeSfl15/Csw4pP/FdAok5L1INd95xA8BX8ra7QnT6zVKiO5W8p4hILLnQ==
X-Received: by 2002:a05:6402:42cc:: with SMTP id
 i12mr2975000edc.220.1644917565539; 
 Tue, 15 Feb 2022 01:32:45 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/30] configure, meson: move CONFIG_IASL to a Meson option
Date: Tue, 15 Feb 2022 10:32:23 +0100
Message-Id: <20220215093223.110827-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     |  4 +---
 meson.build                   | 12 ++++++++----
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.py |  1 +
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index 3300231279..1bf732fcdb 100755
--- a/configure
+++ b/configure
@@ -2929,9 +2929,6 @@ echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
 echo "HOST_CC=$host_cc" >> $config_host_mak
-if $iasl -h > /dev/null 2>&1; then
-  echo "CONFIG_IASL=$iasl" >> $config_host_mak
-fi
 echo "AR=$ar" >> $config_host_mak
 echo "AS=$as" >> $config_host_mak
 echo "CCAS=$ccas" >> $config_host_mak
@@ -3149,6 +3146,7 @@ if test "$skip_meson" = no; then
         -Daudio_drv_list=$audio_drv_list \
         -Ddefault_devices=$default_devices \
         -Ddocdir="$docdir" \
+        -Diasl="$($iasl -h >/dev/null 2>&1 && printf %s "$iasl")" \
         -Dqemu_firmwarepath="$firmwarepath" \
         -Dqemu_suffix="$qemu_suffix" \
         -Dsmbd="$smbd" \
diff --git a/meson.build b/meson.build
index 129776c409..99a15d0a6e 100644
--- a/meson.build
+++ b/meson.build
@@ -1468,7 +1468,9 @@ foreach k : get_option('trace_backends')
   config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
 endforeach
 config_host_data.set_quoted('CONFIG_TRACE_FILE', get_option('trace_file'))
-
+if get_option('iasl') != ''
+  config_host_data.set_quoted('CONFIG_IASL', get_option('iasl'))
+endif
 config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') / get_option('bindir'))
 config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
 config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
@@ -1963,7 +1965,6 @@ config_host_data.set('HAVE_NTDDSCSI', have_ntddscsi)
 ignored = ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
     'HAVE_GDB_BIN']
 arrays = ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
-strings = ['CONFIG_IASL']
 foreach k, v: config_host
   if ignored.contains(k)
     # do nothing
@@ -1972,8 +1973,6 @@ foreach k, v: config_host
       v = '"' + '", "'.join(v.split()) + '", '
     endif
     config_host_data.set(k, v)
-  elif strings.contains(k)
-    config_host_data.set_quoted(k, v)
   elif k.startswith('CONFIG_')
     config_host_data.set(k, v == 'y' ? 1 : v)
   endif
@@ -3381,6 +3380,11 @@ summary_info += {'sphinx-build':      sphinx_build}
 if config_host.has_key('HAVE_GDB_BIN')
   summary_info += {'gdb':             config_host['HAVE_GDB_BIN']}
 endif
+if get_option('iasl') != ''
+  summary_info += {'iasl':            get_option('iasl')}
+else
+  summary_info += {'iasl':            false}
+endif
 summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
 if targetos == 'windows' and have_ga
   summary_info += {'wixl':            wixl}
diff --git a/meson_options.txt b/meson_options.txt
index aad337592d..30237917df 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -12,6 +12,8 @@ option('smbd', type : 'string', value : '',
        description: 'Path to smbd for slirp networking')
 option('sphinx_build', type : 'string', value : '',
        description: 'Use specified sphinx-build [$sphinx_build] for building document (default to be empty)')
+option('iasl', type : 'string', value : '',
+       description: 'Path to ACPI disassembler')
 option('default_devices', type : 'boolean', value : true,
        description: 'Include a default selection of devices in emulators')
 option('audio_drv_list', type: 'array', value: ['default'],
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 01b10f7ae0..693be7b966 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -30,6 +30,7 @@
     "default_devices",
     "docdir",
     "fuzzing_engine",
+    "iasl",
     "qemu_firmwarepath",
     "qemu_suffix",
     "smbd",
-- 
2.34.1


