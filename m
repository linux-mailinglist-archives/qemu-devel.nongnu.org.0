Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E0450CA45
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 14:57:12 +0200 (CEST)
Received: from localhost ([::1]:50260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFK3-0003FP-Ic
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 08:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFF5-0006UR-V4
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:03 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFF4-00053L-C1
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:03 -0400
Received: by mail-ej1-x635.google.com with SMTP id ks6so21214824ejb.1
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eWVoNFg17cglqQICzMxJj6RBiNCEoEjYKsESWBBr/7w=;
 b=JQwHKOyov7MwTbUaPA8mkpsnFxGI/ybnM5rAUh9MA2S+7u0Ed6CLwVMdWi9niFzr/v
 5l9w5Q/jxPL/7Qk+baH/V9d/w48N8TepajxioMBrjmmLNEdD32tCQphvqLPatdvBr5JV
 Mu2ptylD6HI8QPRFPyJlFs1lsd/FnuuT/1efHa5smtGv8kcwhm+UU4J/4CPcvpqQFcg+
 O5AHustv3ubM/iQkifrro0dQ9Yu9N0m1ur3b+SDY5CU4H6L9Lj0+D5fzoE6eK4ZaKCv7
 iZKnm8I5I6ydQsWznOQ49Zdc5QRfNjoxu1RmO4+qF4hUEPNNMOqsR+oFVkZiXQhjVBSe
 +ztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eWVoNFg17cglqQICzMxJj6RBiNCEoEjYKsESWBBr/7w=;
 b=YDLXXAvQmoK1xgjnguZKhObKUl5H0Iz6SoZAscJfbukAOvPMvZHodBRkaeec5mXqYs
 1ZHg2YTqQrIMTGjGAKfDEWxYOXJC/aydZwZBn33kg6DmuI9fZg060LMn29H6lHd1gfB0
 GwTEFwzHyzbOiBI9claBmqBLhXQ9UlEFZ6OHBz1NIAbpp/6D7ffvyore7eZNdG34kDlh
 jPalL3pC/vAkpFhQ9Hy01o9ltbnntKSSnHJISYSTRL0KNn8Y/43rhGsBHu8mcfOI82Nv
 ZUNyOlf5tPF+NwZ7KXLuaU5VnFIzunlPUzjqAaSSfpi6I8e2XXnpwCL08kEaWykbV7hu
 xiKg==
X-Gm-Message-State: AOAM530xhjL0HOV+/SP0o4L3zwuut/BwTksVC5XIADDASpICU66TsIq0
 uFmAHEbQwIcdWX8y7BKhyBx3g7kK7i7w7A==
X-Google-Smtp-Source: ABdhPJwQJ57+j6cHmkPoaUqBbouENmP6e+zSwuLUzdrcapD3FwK+hHa/dPArB04pbx8A/KoUCzLJ+Q==
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id
 t1-20020a1709061be100b006ceb0a8017dmr8205700ejg.413.1650718320631; 
 Sat, 23 Apr 2022 05:52:00 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/34] configure: remove dead code
Date: Sat, 23 Apr 2022 14:51:19 +0200
Message-Id: <20220423125151.27821-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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

tcg_interpreter is never written, it is purely a meson option;
trace_backends is never read.

And SeaBIOS is only build from the source tree with roms/Makefile,
so the config.mak file is unused.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/configure b/configure
index a4942c13e4..9e32c96fce 100755
--- a/configure
+++ b/configure
@@ -320,7 +320,6 @@ linux_user=""
 bsd_user=""
 pkgversion=""
 pie=""
-trace_backends="log"
 trace_file="trace"
 opengl="$default_feature"
 coroutine=""
@@ -391,7 +390,6 @@ for opt do
                       cross_cc_vars="$cross_cc_vars cross_cc_cflags_${cc_arch}"
   ;;
   --cross-cc-*) cc_arch=${opt#--cross-cc-}; cc_arch=${cc_arch%%=*}
-                cc_archs="$cc_archs $cc_arch"
                 eval "cross_cc_${cc_arch}=\$optarg"
                 cross_cc_vars="$cross_cc_vars cross_cc_${cc_arch}"
   ;;
@@ -2881,9 +2879,6 @@ fi
 if test "$vhost_user_fs" = "yes" ; then
   echo "CONFIG_VHOST_USER_FS=y" >> $config_host_mak
 fi
-if test "$tcg" = "enabled" -a "$tcg_interpreter" = "true" ; then
-  echo "CONFIG_TCG_INTERPRETER=y" >> $config_host_mak
-fi
 
 if test "$opengl" = "yes" ; then
   echo "CONFIG_OPENGL=y" >> $config_host_mak
@@ -3024,7 +3019,6 @@ LINKS="Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
-LINKS="$LINKS roms/seabios/Makefile"
 LINKS="$LINKS pc-bios/qemu-icon.bmp"
 LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
 LINKS="$LINKS tests/avocado tests/data"
@@ -3059,24 +3053,6 @@ done
 export target_list source_path use_containers cpu host_cc
 $source_path/tests/tcg/configure.sh)
 
-# temporary config to build submodules
-if test -f $source_path/roms/seabios/Makefile; then
-  for rom in seabios; do
-    config_mak=roms/$rom/config.mak
-    echo "# Automatically generated by configure - do not modify" > $config_mak
-    echo "SRC_PATH=$source_path/roms/$rom" >> $config_mak
-    echo "AS=$as" >> $config_mak
-    echo "CCAS=$ccas" >> $config_mak
-    echo "CC=$cc" >> $config_mak
-    echo "BCC=bcc" >> $config_mak
-    echo "CPP=$cpp" >> $config_mak
-    echo "OBJCOPY=objcopy" >> $config_mak
-    echo "IASL=$iasl" >> $config_mak
-    echo "LD=$ld" >> $config_mak
-    echo "RANLIB=$ranlib" >> $config_mak
-  done
-fi
-
 config_mak=pc-bios/optionrom/config.mak
 echo "# Automatically generated by configure - do not modify" > $config_mak
 echo "TOPSRC_DIR=$source_path" >> $config_mak
-- 
2.35.1



