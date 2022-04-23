Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC81B50CA6B
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:12:31 +0200 (CEST)
Received: from localhost ([::1]:56376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFYs-0001Zn-SY
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFg-0007LY-K0
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:42 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFe-0005BV-NW
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:40 -0400
Received: by mail-ed1-x534.google.com with SMTP id e30so9919653eda.0
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KE5W/d6LlVFZ2XZ1tI5f3QXLsONnqElJa/y8Ub4p8Ko=;
 b=I+/5VOfPqWrzEqX+7SwismSe+uqC6xgv51QJd5u0nYas3VlGgh2HhKXB/fq+fijMK5
 F6VPKH/5ZqjX7PMGEoE2alCEPCWfgnXcZvidpxmvXod4Ee+Gf4GmkhKxmsi/Wdg+HMQO
 0JllNQSq8TAsDpGxecXfOw7TAOnGDZ8MP9j/c6ujqQaSJe1tTys2wXyghiHXSPdBbgwr
 uuyW+legZLB/sJKviO7lOHtln9zfTEP1c1pQPAhsXOMZXXPTadZJd+lrQTKCn/CV8hly
 kSRwAgVLDTUwc4ZANfexVcbMQMw80YgC41SfzIp6Th/teJ55JK67MCTl4aoP68kLz5GT
 Q6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KE5W/d6LlVFZ2XZ1tI5f3QXLsONnqElJa/y8Ub4p8Ko=;
 b=jJ3sO2JV5QFVZ+HQGL+nz36BzeRXmc+TacBJpLIWwP8eJhnzAYPyjJyda9eXvLj3Ld
 90zx72/o0PLSTcFVUuYApmv0b2CQ3Qd+sHiZ5Wdfk9QM/0r6m8NiP8UGDtPv4Ojt5Qig
 FoR9u//Rg/nXHzZZzbeNT+OnejA1cEZQQMlgufR4vDS1JXCME4Erk2HsTKhj6gRO9CHy
 uejSUWZ3pUC5HmIp2h1+hPAg7SbZ5uNzBguU0v5X6QTSYCvrZSLHhuMsNYO8U/DbaOdV
 zltFzzcgVf5QPHsQ9rR15IaE2mCdOMrR767OLvZ4voPx+u2sgpzsF/x39BePpYSUN0xF
 jrGg==
X-Gm-Message-State: AOAM530stK4fEyBwsRakudvx3CBezdv7xa5tY8m4qtWN5U2LwXPrXUIe
 ByPb2x8GeOVHEj/AZ55v7lEsD0vnp7xMmQ==
X-Google-Smtp-Source: ABdhPJxukG0Ep0dwPmiU79sR8zMPS7MRZEmDwId8R6KAKMuxz8QsbMEQrKLBR88OGGAoxwoaIsmJ0g==
X-Received: by 2002:a05:6402:524a:b0:422:2959:1266 with SMTP id
 t10-20020a056402524a00b0042229591266mr9836618edd.308.1650718357375; 
 Sat, 23 Apr 2022 05:52:37 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/34] meson, configure: move --tls-priority to meson
Date: Sat, 23 Apr 2022 14:51:36 +0200
Message-Id: <20220423125151.27821-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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
Cc: marcandre.lureau@redhat.com
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
index 8de8fea4af..c23f12159e 100755
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
@@ -938,8 +937,6 @@ for opt do
   --enable-uuid|--disable-uuid)
       echo "$0: $opt is obsolete, UUID support is always built" >&2
   ;;
-  --tls-priority=*) tls_priority="$optarg"
-  ;;
   --disable-vhost-user) vhost_user="no"
   ;;
   --enable-vhost-user) vhost_user="yes"
@@ -1169,7 +1166,6 @@ Advanced options (experts only):
   --with-coroutine=BACKEND coroutine backend. Supported options:
                            ucontext, sigaltstack, windows
   --enable-gcov            enable test coverage analysis with gcov
-  --tls-priority           default TLS protocol/cipher priority string
   --enable-plugins
                            enable plugins via shared library loading
   --disable-containers     don't use containers for cross-building
@@ -2200,7 +2196,6 @@ if test "$modules" = "yes"; then
   echo "CONFIG_STAMP=_$( (echo $qemu_version; echo $pkgversion; cat $0) | $shacmd - | cut -f1 -d\ )" >> $config_host_mak
   echo "CONFIG_MODULES=y" >> $config_host_mak
 fi
-echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
 
 if test "$vhost_scsi" = "yes" ; then
   echo "CONFIG_VHOST_SCSI=y" >> $config_host_mak
diff --git a/meson.build b/meson.build
index d569c6e944..f0b861aacd 100644
--- a/meson.build
+++ b/meson.build
@@ -1596,6 +1596,7 @@ foreach k : get_option('trace_backends')
   config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
 endforeach
 config_host_data.set_quoted('CONFIG_TRACE_FILE', get_option('trace_file'))
+config_host_data.set_quoted('CONFIG_TLS_PRIORITY', get_option('tls_priority'))
 if iasl.found()
   config_host_data.set_quoted('CONFIG_IASL', iasl.full_path())
 endif
@@ -3817,7 +3818,7 @@ summary(summary_info, bool_yn: true, section: 'Block layer support')
 
 # Crypto
 summary_info = {}
-summary_info += {'TLS priority':      config_host['CONFIG_TLS_PRIORITY']}
+summary_info += {'TLS priority':      get_option('tls_priority')}
 summary_info += {'GNUTLS support':    gnutls}
 if gnutls.found()
   summary_info += {'  GNUTLS crypto':   gnutls_crypto.found()}
diff --git a/meson_options.txt b/meson_options.txt
index 415fcc448e..891c0ec130 100644
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
index 63f2f1abcf..0e0548aa87 100644
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
@@ -349,6 +351,7 @@ _meson_option_parse() {
     --disable-tcg) printf "%s" -Dtcg=disabled ;;
     --enable-tcg-interpreter) printf "%s" -Dtcg_interpreter=true ;;
     --disable-tcg-interpreter) printf "%s" -Dtcg_interpreter=false ;;
+    --tls-priority=*) quote_sh "-Dtls_priority=$2" ;;
     --enable-tools) printf "%s" -Dtools=enabled ;;
     --disable-tools) printf "%s" -Dtools=disabled ;;
     --enable-tpm) printf "%s" -Dtpm=enabled ;;
-- 
2.35.1



