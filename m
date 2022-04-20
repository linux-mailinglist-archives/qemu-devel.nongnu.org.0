Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89805508C63
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:47:54 +0200 (CEST)
Received: from localhost ([::1]:49284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCYb-0007GV-MC
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLo-0001Wv-KA
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:41 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLn-0000yY-1H
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:40 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso3987793wma.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b2djDUGICcrNyEwR4fl8U6oezbrWS28+BKVjaVOlJt0=;
 b=U7ZdGbglOC7NGKbiLjN52lLLXty3Nb+vU1Cdp4MJq/zXIV4vWkiQSD+tGWldhZ/9ko
 2N/Pn1I7RD58n0qvmz0Mtj1aUHJgcc1Z/CHLEz4ENICFxXAO/g+Ps7N4d60znQJ9l8uG
 urnz/o86EMf9Oy6+43I4h7h1HbH3VRo/eprySuwf+v8FyYECyBciR4t7m+YvsRaFj46/
 zz5t2kes7aQmuakAtOum0A/sFBSpmbkwDTA85uf+I6JNaOhpomQTEDdzs2t1b1g2YJjY
 n6hI+bCjZkzK/WtBDNutVSa1p7qzDCYUnvrcEQUE7n1CdJU50779jQGxXZrjJ01XPlWy
 9j/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=b2djDUGICcrNyEwR4fl8U6oezbrWS28+BKVjaVOlJt0=;
 b=4q4xUNxIq61rAHYwQDD4RLzAtP+UDb285WH7dbelw8IrUNCqKsePE7aao95BZ9q1UN
 Vh8NuRfhIG4v0F0h0TfUM+eLK6B0Rd32HK4yOjcv7TQxNzwrmbYdRBHJM+zMvysEd9a7
 pGZrVMhYB0BbLMVsCHW2FvcdhkgxoYK1rC14N48eNTwzsUQCin31cAqk+yiVG1M9whcP
 E1ujtKjLRsNAc7lqWNDlDGc/yyzYfQOT5Hj24cdiIQVUwl2yxNYFoEA/c5VVMRX0TDRE
 oJ5ghdjHx2VeM8gbYHK8K7ZeO89X9KOGyKpxYTJf3CdmMBPHD8VklAqiDFS9ZKn6+iKw
 NgRg==
X-Gm-Message-State: AOAM5315RN9xZofRtkpU7xuOhdK8qzxj4SS45KcdeUeWNnHX5RHUvx4i
 2rwEoGWuhzxIMScsMX6bi/d56KdgoAQHFQ==
X-Google-Smtp-Source: ABdhPJwYyw5DBFbenRstUVMJdrZLzaHzeyCl4YlUxtRedoEdxG1Yax/6LulubPEeBB4Ul/+qmX+z5g==
X-Received: by 2002:a1c:acc4:0:b0:392:9dd4:fbcc with SMTP id
 v187-20020a1cacc4000000b003929dd4fbccmr4230639wme.78.1650468877786; 
 Wed, 20 Apr 2022 08:34:37 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/34] meson, configure: move --tls-priority to meson
Date: Wed, 20 Apr 2022 17:33:52 +0200
Message-Id: <20220420153407.73926-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new support for string option parsing.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 5 -----
 meson.build                   | 3 ++-
 meson_options.txt             | 2 ++
 scripts/meson-buildoptions.sh | 3 +++
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/configure b/configure
index 8f34f2a061..3327a4887a 100755
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
index ffca473fbc..8a7e4ab5c7 100644
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
@@ -3806,7 +3807,7 @@ summary(summary_info, bool_yn: true, section: 'Block layer support')
 
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



