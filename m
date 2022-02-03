Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31604A8B03
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 18:56:22 +0100 (CET)
Received: from localhost ([::1]:40286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgLF-0000hp-7f
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 12:56:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0S-0005HB-FO
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:52 -0500
Received: from [2a00:1450:4864:20::62c] (port=43895
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0K-0008Jj-Px
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:52 -0500
Received: by mail-ej1-x62c.google.com with SMTP id d10so11000668eje.10
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uoavGsx5uHQgHv6smMXVvTdmy2n+xqG9XtRnmfuZ34U=;
 b=M/04lZcRGl1klSl/BqJiRo+n87/O5O62Afqw8LaSiOpeVmZrDFm5XrQKrsxNLz1fq0
 MeJOZUSkXKkYzkQPMl+xEEi/C5+1cuigOCteeHQba/wnYQBQQkNRv+p22QabzK/tsURl
 xeAzOzyoJcsQs155q6VRLllW9rUdETMQn8WZHI2yX9I6Wgao8fl/h6A0ur68Iyf2SV2K
 5VjBMlSOGmPTB12WzN8C2HT4/3VsLwD1INIQDQFNWezzuJHnu0dVfXtGMzBY/wlTE+KP
 yCKgRxNyWvPaUAlF7b8QklpDE+9NF+SP2z7g/KXplzzvJaBGZXv/TOpjuIkMnF0eQETG
 6D1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uoavGsx5uHQgHv6smMXVvTdmy2n+xqG9XtRnmfuZ34U=;
 b=ubEryp093wUgrvNe7/f1INRNy4AHchkNpajcgUVSEWmlXbEgT99SFRoN+u8BsaUFVr
 2mXj8b7ewMsNc+5AzyDW2cTGwnmW5NdCD8roJQZrdtIFf3ZttNVjBhaoI5zJ9HBz/jXo
 m0/+c3cHI6LwA6AaqOoRaYsWdhlgKtoBN9xXvXJtlRDXQfMzO03pGqKvqx5UU1+KGYzc
 kZ+MENB+3eMZWpVzadn30coJpflJYNptteWYZcLtjzexvpAL49ZLfx/LWMltgdw501RG
 YIdrIjxHg5K9fJRaQ+UVqlqK8poyqeoWAqZdz5DvolbT294MC1husNuvGZhwccpZipk3
 VVdA==
X-Gm-Message-State: AOAM532JiL1q52IY12epsSIVNnQkDJ231SqSIQHIF//IjilE/QX4+lJb
 gH8uV5YPIpwSq8ZHD2YmeJ9dQty+F00=
X-Google-Smtp-Source: ABdhPJyWEACMG39T9JLqGreYMwAmkhoTxooC7rVVFRh2WCgJZBoKNKXbmDkYBeeLZX0/d9umcfFdGA==
X-Received: by 2002:a17:907:3e8a:: with SMTP id
 hs10mr30438230ejc.112.1643909661009; 
 Thu, 03 Feb 2022 09:34:21 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/27] configure, meson: move CONFIG_IASL to a Meson option
Date: Thu,  3 Feb 2022 18:33:59 +0100
Message-Id: <20220203173359.292068-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
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
index f6b9e5a1cd..b88942bd02 100755
--- a/configure
+++ b/configure
@@ -2950,9 +2950,6 @@ echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
 echo "HOST_CC=$host_cc" >> $config_host_mak
-if $iasl -h > /dev/null 2>&1; then
-  echo "CONFIG_IASL=$iasl" >> $config_host_mak
-fi
 echo "AR=$ar" >> $config_host_mak
 echo "AS=$as" >> $config_host_mak
 echo "CCAS=$ccas" >> $config_host_mak
@@ -3170,6 +3167,7 @@ if test "$skip_meson" = no; then
         -Daudio_drv_list=$audio_drv_list \
         -Ddefault_devices=$default_devices \
         -Ddocdir="$docdir" \
+        -Diasl="$($iasl -h >/dev/null 2>&1 && printf %s "$iasl")" \
         -Dqemu_firmwarepath="$firmwarepath" \
         -Dqemu_suffix="$qemu_suffix" \
         -Dsmbd="$smbd" \
diff --git a/meson.build b/meson.build
index 98e795d21a..3ddbe6093f 100644
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
@@ -3385,6 +3384,11 @@ summary_info += {'sphinx-build':      sphinx_build}
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


