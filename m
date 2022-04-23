Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DEC50CA69
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:11:21 +0200 (CEST)
Received: from localhost ([::1]:53768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFXk-00088M-B2
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFe-0007L5-5Z
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:42 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:39676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFc-0005BG-Kz
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:37 -0400
Received: by mail-ed1-x532.google.com with SMTP id g20so13460716edw.6
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DVskec/7TgJYKkTM4ZjusbcXkRCS9kju5lUSDbN7nEU=;
 b=AiJHNkcRroz8NjQIq8Ao+9zADknEhFRVkslttUyRabZhm4S0MUWHOxSf4IoiRgi42r
 gWH0w2wPMG4FZHykpDHONqTzdnrJD4qJfGSe2QqxEuj9cI3KeXgyQLfnEphql0PJk54r
 dTH6LtlRTkFmErNFSO1CVjQA9ez8y88205plRvEFPgSrn+zsjx1YBby2kG8qlyT4E+0W
 e9/7vyFXFxXRb0b1HB7Je+DmCpztU9iOc+d2CgCNH7vxGrbSldn5jRZ94ssdl88XyVH4
 P0vNRfFcr/nVf3Y6XVQsMnlktK0RR9ODPQwR1+0TGGqqPftwuapv3WQwv7z/iWCKlsA1
 F9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DVskec/7TgJYKkTM4ZjusbcXkRCS9kju5lUSDbN7nEU=;
 b=zHCzn2Z5kesdek9QQ7vkdpuIJ1TFtkkqtDtR2m3ezztW7YORCzgRKsYlQg8PXmg5LQ
 bVAn42z3aO5B1O1ztWyPr5k92kzpxcCfdizzU5pGlBNBW2O3wMLctcCrOwUIP/3p6csf
 B1xNLD9SJAIMLM1VyZUddZPJRQ8wXreu68Z9Ej2zqXD892ZUGhtYYRBjQyDamgPjxIUS
 kvTYOMQU2UzS5l56xdCcdgd6VGFVKeo/FfQkAoxYOy0eWuM4jA0/fHPaCYKj2Uw1a9Pl
 1MEuxEEOQg1rPXvqfOSBYSm6yLo+bHH5R7Fd911SvGW8gC5DxZuvl48pqXQqCzI6ueez
 gy/A==
X-Gm-Message-State: AOAM533SrWzhVydyC0tiRh/dOVxrg/ZlVtNnmuTmhdyq0WdBPUSaGWa/
 mX2c+bfrFND8lm84e8srILqIzfubjbJx/w==
X-Google-Smtp-Source: ABdhPJzxRvHbJo1psjazyUgyWAWNNLIdA2N77tq+KLu0qwA2pCTGwdtnora/Rsdo7rwt+/MTeZoyYQ==
X-Received: by 2002:a05:6402:4488:b0:425:9335:bbcb with SMTP id
 er8-20020a056402448800b004259335bbcbmr10138646edb.197.1650718354171; 
 Sat, 23 Apr 2022 05:52:34 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/34] configure: move Windows flags detection to meson
Date: Sat, 23 Apr 2022 14:51:34 +0200
Message-Id: <20220423125151.27821-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
v1->v2: fix get_option('optimization') comparison to use a string

 configure   | 20 --------------------
 meson.build |  8 ++++++++
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/configure b/configure
index 0b236fda59..a6ba59cf6f 100755
--- a/configure
+++ b/configure
@@ -224,10 +224,6 @@ glob() {
     eval test -z '"${1#'"$2"'}"'
 }
 
-ld_has() {
-    $ld --help 2>/dev/null | grep ".$1" >/dev/null 2>&1
-}
-
 if printf %s\\n "$source_path" "$PWD" | grep -q "[[:space:]:]";
 then
   error_exit "main directory cannot contain spaces nor colons"
@@ -2088,22 +2084,6 @@ if test "$solaris" = "no" && test "$tsan" = "no"; then
     fi
 fi
 
-# Use ASLR, no-SEH and DEP if available
-if test "$mingw32" = "yes" ; then
-    flags="--no-seh --nxcompat"
-
-    # Disable ASLR for debug builds to allow debugging with gdb
-    if test "$debug" = "no" ; then
-        flags="--dynamicbase $flags"
-    fi
-
-    for flag in $flags; do
-        if ld_has $flag ; then
-            QEMU_LDFLAGS="-Wl,$flag $QEMU_LDFLAGS"
-        fi
-    done
-fi
-
 # Guest agent Windows MSI package
 
 if test "$QEMU_GA_MANUFACTURER" = ""; then
diff --git a/meson.build b/meson.build
index 1a9549d90c..d569c6e944 100644
--- a/meson.build
+++ b/meson.build
@@ -182,6 +182,14 @@ qemu_cxxflags = config_host['QEMU_CXXFLAGS'].split()
 qemu_objcflags = config_host['QEMU_OBJCFLAGS'].split()
 qemu_ldflags = config_host['QEMU_LDFLAGS'].split()
 
+if targetos == 'windows'
+  qemu_ldflags += cc.get_supported_link_arguments('-Wl,--no-seh', '-Wl,--nxcompat')
+  # Disable ASLR for debug builds to allow debugging with gdb
+  if get_option('optimization') == '0'
+    qemu_ldflags += cc.get_supported_link_arguments('-Wl,--dynamicbase')
+  endif
+endif
+
 if get_option('gprof')
   qemu_cflags += ['-p']
   qemu_cxxflags += ['-p']
-- 
2.35.1



