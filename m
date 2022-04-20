Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923FE508C90
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:55:02 +0200 (CEST)
Received: from localhost ([::1]:43516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCfV-0005l3-KY
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLk-0001Uq-DJ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:37 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLi-0000wj-PF
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:36 -0400
Received: by mail-wr1-x42f.google.com with SMTP id u3so2803379wrg.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oFhOJ2oEOYPIMxyhC4C3gtr5BJGhpLVFlV1F6OwU/AM=;
 b=MoWElpHqPaG6RnAJLKRtgKpOa5TT7LwIOcdOo84ZdY+iZsIm82sM8Q4xlEqoBj9vW7
 MwJzcOh2+3G3EjlhJTzVncFsstRfMKYaltGJRtw3PhuJWwat1DGbjfHCrSvyH+qCnAzy
 KkaxkooKvpRYG2YYlIemtrGdp8qHyNEUZ5jkwJjYWoVVUfyyg09SR3onXfXKXVHXlq2A
 yDL9bvfeP0lqG6dpY9sRp+lC/yA2RX9Bjlb048RceshpYwW7YBPEYM1SRCGGgCTQT8uz
 o8gHtZb4n6jQY3nJ1NVRfsJgthPU++V82FyNlpxlQAKsCvnxbhwDJvNXPEjN1WcuGqJT
 hBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oFhOJ2oEOYPIMxyhC4C3gtr5BJGhpLVFlV1F6OwU/AM=;
 b=nXqAlRrp82RXkQJT4WsPgkP0rMBA9nSOoYGNkE7NEEjxPZ90QuPk2tjXPwap1EmCxj
 8BOjfe2bZCWHjK50n3rLYM20kLawtgpBxWqDvj/LbI/v2QOEJVsHs1uTevOOfjzsIAWT
 V6l7TMh0iF4zfeuk3lr9wMkJwNfYQChSoT2BajL7NdtrD6hUfsRMBE2F9Y7q22hIcO24
 WKnkMn9J3MRYqwJwUkrLM/U05yQ41saFsSj3Oh3tuw38vCW7bE63+Z9kllwYaUtL0e7W
 hGKJwA2DXXbE7It6ucXg0c2MMfD8cgNHiw8mVTmmzFLDR67DC4ggGt4wwIUPjn9jqSGk
 CgMA==
X-Gm-Message-State: AOAM532hsdXdCZRQmuPLVVsKNFsixQ6R/H60UOigoSZFACsti6rENle3
 jm/5f/7X3wXQMYnVHYj9rqx/h75+xMOADw==
X-Google-Smtp-Source: ABdhPJw22AhFOChJEfECIgjVFpw8Coda4CtSypN0n9nKa6dYgVnJzjIYW3j1uor88IqvdwOrLGXtZQ==
X-Received: by 2002:adf:f611:0:b0:207:ac80:73f5 with SMTP id
 t17-20020adff611000000b00207ac8073f5mr16084718wrp.623.1650468873497; 
 Wed, 20 Apr 2022 08:34:33 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/34] configure, meson: move iasl detection to meson
Date: Wed, 20 Apr 2022 17:33:49 +0200
Message-Id: <20220420153407.73926-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   |  2 +-
 meson.build | 16 +++++++++-------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index 11d3cc19ca..772714d386 100755
--- a/configure
+++ b/configure
@@ -2507,7 +2507,7 @@ if test "$skip_meson" = no; then
         -Daudio_drv_list=$audio_drv_list \
         -Ddefault_devices=$default_devices \
         -Ddocdir="$docdir" \
-        -Diasl="$($iasl -h >/dev/null 2>&1 && printf %s "$iasl")" \
+        -Diasl="$iasl" \
         -Dqemu_firmwarepath="$firmwarepath" \
         -Dqemu_suffix="$qemu_suffix" \
         -Dsmbd="$smbd" \
diff --git a/meson.build b/meson.build
index 7cbb771393..d255facbfd 100644
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
@@ -3617,11 +3623,7 @@ summary_info += {'sphinx-build':      sphinx_build}
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



