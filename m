Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD7A50CA5A
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:07:57 +0200 (CEST)
Received: from localhost ([::1]:45368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFUS-0002Pj-S8
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFc-0007L2-Sh
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:42 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:44753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFX-0005Ax-5s
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:34 -0400
Received: by mail-ej1-x62a.google.com with SMTP id u15so21097568ejf.11
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7hKDbCtZzuTgitwVi6udR59qz5G6WpBEdGofMT1O4FI=;
 b=RhtfFpgAORDP2IHS2Qhz9jRSQUn9473u7dNNjsgfyQY8T/ZmOgFBIc6b4bMB11Tw3E
 CMUzuPJIv60QgA3mjP5qZUQb5EhiKt9NakxB+rXm7VwiM+mUfOxgS6E5uaycZJl7fZgN
 1bgXIOwGMql3Vl+4Z8qLDTjWCXBviapO50bR/BiLcbmRUluxjnnmRstwk4TRFZb+5DjJ
 rgo5BdQHuaErpC+sS4f4Sxs9ut7EgE1yF/2TcrUFMngKvWPdOSS6YfFhYaduQZuTVYsD
 O4TSewHz1gcLefYKPXjFH7IZHKzuaooPquhXMrEKjQwmZ2rGn5NOcRt4TuZ6V+1Tv4UM
 5Wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7hKDbCtZzuTgitwVi6udR59qz5G6WpBEdGofMT1O4FI=;
 b=FmGSSY5+sEMerZvbKz4R/YSdCDo1cgWG95NjpPiwXW+cXpdvhvdV5UbxdDFcCVT7f7
 u3R8PLE1nkJfXLQm2Y+i4GEZc8RXbGY7F+AwbQ9T+KLdembOBNhOitfItZOt11pjv27n
 b+uCPNbz4XAz4jF8kpBcG7GksY6TZ9T6jcUId6tfG81/XSlEA0W57IY+CDk1rEukRt/D
 SxZYVVjYQ/fngWKpa3Hn7irRd15eCanTN85DqQnUWMJGefN3aaHDMRfbFQaQsN3zG2AG
 O2T+jYWe7sPa6WZuQY5e7GeSU9WIer5Z42r77yy8FIJZQwJudtMAC4kGi6W3H5E+ac+h
 IUVg==
X-Gm-Message-State: AOAM530ALgdy7Uu0aSAJ4aFcxNwD/rI/UNZCIzvR+pZBO2jWLapAa/Ll
 DW+LzCxv0gCwdLehQZloTr6aYee4UBNwyA==
X-Google-Smtp-Source: ABdhPJwdtzr3Yw/pl6+Yg27TZlfqy/J4A/5MCLBQVXgDVTXyv+WStDeXsqImBwtaxLEOHquyzaQaZw==
X-Received: by 2002:a17:906:3144:b0:6ce:de5d:5e3b with SMTP id
 e4-20020a170906314400b006cede5d5e3bmr8238452eje.689.1650718349989; 
 Sat, 23 Apr 2022 05:52:29 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/34] configure, meson: move iasl detection to meson
Date: Sat, 23 Apr 2022 14:51:33 +0200
Message-Id: <20220423125151.27821-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
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

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   |  2 +-
 meson.build | 16 +++++++++-------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index a3ac5af863..0b236fda59 100755
--- a/configure
+++ b/configure
@@ -2506,7 +2506,7 @@ if test "$skip_meson" = no; then
         -Daudio_drv_list=$audio_drv_list \
         -Ddefault_devices=$default_devices \
         -Ddocdir="$docdir" \
-        -Diasl="$($iasl -h >/dev/null 2>&1 && printf %s "$iasl")" \
+        -Diasl="$iasl" \
         -Dqemu_firmwarepath="$firmwarepath" \
         -Dqemu_suffix="$qemu_suffix" \
         -Dsmbd="$smbd" \
diff --git a/meson.build b/meson.build
index 47e874f0c3..1a9549d90c 100644
--- a/meson.build
+++ b/meson.build
@@ -167,6 +167,12 @@ if 'dtrace' in get_option('trace_backends')
   endif
 endif
 
+if get_option('iasl') == ''
+  iasl = find_program('iasl', required: false)
+else
+  iasl = find_program(get_option('iasl'), required: true)
+endif
+
 ##################
 # Compiler flags #
 ##################
@@ -1582,8 +1588,8 @@ foreach k : get_option('trace_backends')
   config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
 endforeach
 config_host_data.set_quoted('CONFIG_TRACE_FILE', get_option('trace_file'))
-if get_option('iasl') != ''
-  config_host_data.set_quoted('CONFIG_IASL', get_option('iasl'))
+if iasl.found()
+  config_host_data.set_quoted('CONFIG_IASL', iasl.full_path())
 endif
 config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') / get_option('bindir'))
 config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
@@ -3628,11 +3634,7 @@ summary_info += {'sphinx-build':      sphinx_build}
 if config_host.has_key('HAVE_GDB_BIN')
   summary_info += {'gdb':             config_host['HAVE_GDB_BIN']}
 endif
-if get_option('iasl') != ''
-  summary_info += {'iasl':            get_option('iasl')}
-else
-  summary_info += {'iasl':            false}
-endif
+summary_info += {'iasl':              iasl}
 summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
 if targetos == 'windows' and have_ga
   summary_info += {'wixl':            wixl}
-- 
2.35.1



