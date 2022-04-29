Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B92D514FA3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:37:06 +0200 (CEST)
Received: from localhost ([::1]:48202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSg5-000702-6c
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSp-0001yn-Rm
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:23 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:41795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSo-00068p-2l
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:23 -0400
Received: by mail-ed1-x52c.google.com with SMTP id d6so9459558ede.8
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mXDxkE9hGoUrZ6f+HtgdaCZPXnV++dYqWjZUuFCEstw=;
 b=ozFFBdC//NwICBYcVqyk2iHb/rJrBtKECFIslrFYLWUo6Hpd8iWBxKYX7TciprJCuP
 iEIaVPtIEXNnAqtb1YzT4Frgp9S9bp5jgMnwoTPRYCp+YP1vH4yTD49+OkTPZYa3iV/a
 3dd6Y5ch0OvLkH3/T6uo6zpunyNqXj42kqAv7CkWGnZRBYTJl5FJzxPkJHz53NNfS55P
 DrmUnaPPVtByezTgWPrQwTJvttOnVVzs+YXbA9YB/q9GQMYKkkLf2tZlUpWhqlIu5GJv
 +Z/i4vo8cNM2u4l2Je4SBs3GmavEeZE02rgQHvyZuE9Rbjb45sss+Xi0Dn3cY9XocOeD
 SKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mXDxkE9hGoUrZ6f+HtgdaCZPXnV++dYqWjZUuFCEstw=;
 b=JJN6FpU8IwJ5dVIXYwgBqZVu58kJ/UL+pw0no/ixswyU6OKiwU+hjJD5L6PY/OSC6M
 ydzaKv1QYT0j6c/EAtD6pSMbAw9uZ/y9ovwAiDjl1sBVmJur25oRbvMcwpcvvI6mvx5u
 1Qcvl4zGNnDWpC7YRCjbZBhB5UyRYqwhK+VwS5lXlgS5IilnMcKD53aOix6ONtKjp0q3
 S8H9JhX1TXS3T7fZX9fc8JVSGZajUgEkz5G6tKdWfVrIGseu05GCgDo8TErM5OOEY3zq
 fQ9wthRpnWBiNf6tBGGOZY0AgKxwZsK5STp6DB2JH27p3gBaCKiREGvYoL43uCe5queZ
 0LmA==
X-Gm-Message-State: AOAM531eGDbsr3KtZO/QLD3x5Mx+oZbFDGfRxM+agxpaQUaEmk6/uDGf
 NaGzLMYEwCDIrVzMBC/KkIVMhrY/jX6nqw==
X-Google-Smtp-Source: ABdhPJztdGHC5/6mhl/pUHnZZkiOX2ne+nQDPawMcyw9Ukv0mbaFgXgtGpr5x/23vUxSzEaPgllwUA==
X-Received: by 2002:a05:6402:358f:b0:426:2b74:2c03 with SMTP id
 y15-20020a056402358f00b004262b742c03mr8788615edc.402.1651245800759; 
 Fri, 29 Apr 2022 08:23:20 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/25] meson, configure: move --tls-priority to meson
Date: Fri, 29 Apr 2022 17:22:56 +0200
Message-Id: <20220429152312.335715-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new support for string option parsing.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 5 -----
 meson.build                   | 3 ++-
 meson_options.txt             | 2 ++
 scripts/meson-buildoptions.sh | 3 +++
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/configure b/configure
index c1eb4923dd..9062f9ccd6 100755
--- a/configure
+++ b/configure
@@ -311,7 +311,6 @@ bsd_user=""
 pkgversion=""
 pie=""
 coroutine=""
-tls_priority="NORMAL"
 plugins="$default_feature"
 meson=""
 meson_args=""
@@ -939,8 +938,6 @@ for opt do
   --enable-uuid|--disable-uuid)
       echo "$0: $opt is obsolete, UUID support is always built" >&2
   ;;
-  --tls-priority=*) tls_priority="$optarg"
-  ;;
   --disable-vhost-user) vhost_user="no"
   ;;
   --enable-vhost-user) vhost_user="yes"
@@ -1170,7 +1167,6 @@ Advanced options (experts only):
   --with-coroutine=BACKEND coroutine backend. Supported options:
                            ucontext, sigaltstack, windows
   --enable-gcov            enable test coverage analysis with gcov
-  --tls-priority           default TLS protocol/cipher priority string
   --enable-plugins
                            enable plugins via shared library loading
   --disable-containers     don't use containers for cross-building
@@ -2201,7 +2197,6 @@ if test "$modules" = "yes"; then
   echo "CONFIG_STAMP=_$( (echo $qemu_version; echo $pkgversion; cat $0) | $shacmd - | cut -f1 -d\ )" >> $config_host_mak
   echo "CONFIG_MODULES=y" >> $config_host_mak
 fi
-echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
 
 if test "$vhost_scsi" = "yes" ; then
   echo "CONFIG_VHOST_SCSI=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 31380f1f2e..f4f518c7b8 100644
--- a/meson.build
+++ b/meson.build
@@ -1598,6 +1598,7 @@ foreach k : get_option('trace_backends')
   config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
 endforeach
 config_host_data.set_quoted('CONFIG_TRACE_FILE', get_option('trace_file'))
+config_host_data.set_quoted('CONFIG_TLS_PRIORITY', get_option('tls_priority'))
 if iasl.found()
   config_host_data.set_quoted('CONFIG_IASL', iasl.full_path())
 endif
@@ -3819,7 +3820,7 @@ summary(summary_info, bool_yn: true, section: 'Block layer support')
 
 # Crypto
 summary_info = {}
-summary_info += {'TLS priority':      config_host['CONFIG_TLS_PRIORITY']}
+summary_info += {'TLS priority':      get_option('tls_priority')}
 summary_info += {'GNUTLS support':    gnutls}
 if gnutls.found()
   summary_info += {'  GNUTLS crypto':   gnutls_crypto.found()}
diff --git a/meson_options.txt b/meson_options.txt
index 390701517c..c8e0a10d91 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -14,6 +14,8 @@ option('sphinx_build', type : 'string', value : '',
        description: 'Use specified sphinx-build for building document')
 option('iasl', type : 'string', value : '',
        description: 'Path to ACPI disassembler')
+option('tls_priority', type : 'string', value : 'NORMAL',
+       description: 'Default TLS protocol/cipher priority string')
 option('default_devices', type : 'boolean', value : true,
        description: 'Include a default selection of devices in emulators')
 option('audio_drv_list', type: 'array', value: ['default'],
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index bdaa128ee4..3919eeec0b 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -36,6 +36,8 @@ meson_options_help() {
   printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
   printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
   printf "%s\n" '  --sphinx-build=VALUE     Use specified sphinx-build for building document'
+  printf "%s\n" '  --tls-priority=VALUE     Default TLS protocol/cipher priority string'
+  printf "%s\n" '                           [NORMAL]'
   printf "%s\n" '  --with-trace-file=VALUE  Trace file prefix for simple backend [trace]'
   printf "%s\n" ''
   printf "%s\n" 'Optional features, enabled with --enable-FEATURE and'
@@ -351,6 +353,7 @@ _meson_option_parse() {
     --disable-tcg) printf "%s" -Dtcg=disabled ;;
     --enable-tcg-interpreter) printf "%s" -Dtcg_interpreter=true ;;
     --disable-tcg-interpreter) printf "%s" -Dtcg_interpreter=false ;;
+    --tls-priority=*) quote_sh "-Dtls_priority=$2" ;;
     --enable-tools) printf "%s" -Dtools=enabled ;;
     --disable-tools) printf "%s" -Dtools=disabled ;;
     --enable-tpm) printf "%s" -Dtpm=enabled ;;
-- 
2.35.1



