Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4B642DF6B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:45:37 +0200 (CEST)
Received: from localhost ([::1]:57870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3rN-0004EN-0l
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3cA-0003dM-55
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:54 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:45851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c8-0000du-JP
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:53 -0400
Received: by mail-ed1-x52a.google.com with SMTP id r18so26590410edv.12
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3AJ7J9pjFiYD04BWEyd16opDsWTc8+PpWplGqhXdlSY=;
 b=WLg7jqoGK5dStuxZy6WOdYcebUGrs1gs9430c6/EWnfXJLgttNh1T3+bGC9OXElVuj
 FhQ08ZPxIverqM7vIy90YnJoEJ26H/WjhjZoBpPYaYqnaS+z6SshXYWjAFtwmBo07a7j
 wiB4g7KEVwKFYKZv3sBmhCoPn5REMoEXjfvvMsAad716BGjkEkPpqtUiX3jYYXAXdlyo
 BVjRd3JDgt4UA8veK+lLjfZf6EsJx5oYR6n8ITbAyVV00iQ8wW9V7iAYaFSDqPiGOMuP
 ptGeUB6r44ZFTm7bcjSLvG2qzHSKNUzPHKOMQqaeVrfv7mzyAKzwiOvqMQDp+w696xk7
 kLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3AJ7J9pjFiYD04BWEyd16opDsWTc8+PpWplGqhXdlSY=;
 b=zFdB2inaDBPc562ZTBrMDzQmtG12Hxp+kdaMe5vR3u1EnS7OsLMplid7LbI+7SOv34
 MVPIJ1zw3hPzSNBSs2zOeht1i/DJ8fUUwIq7i0KB61sk2A88UlXRb2h+xR2mZaGzwID2
 xQuPamWE3e71NPW3tVTBFWRh3Z0AdeHon2vvB4gqbsCFFJBBVy/4ostKLiiFmT8TUm4p
 ksfetxzB554K3oIg+kvNSLVEOVJ/hhe8y3NUe82IpTnO3ZEoUFSFe/TTW3IcXhfjDNBD
 U4jWdFRk0NOwyVGZDALl2TgP4sgvqNxaGUf4CzvLxcS0XZbJljymEjnh/ngPCXZndF7I
 KPNQ==
X-Gm-Message-State: AOAM533WiJLYhnFvOrvdg4qwQGW3HcAbwQj7CG5rM1joD2Va6JSPLqVX
 SM4ZJXICmU15A8/VbwFr4LwwywihREA=
X-Google-Smtp-Source: ABdhPJzfDbHMg5ZxUOAizHtUsfwIUpRIP3Yf/qPCAhor+STfQ46uOAmNLUYbSoz5cWHqL58q06yxMA==
X-Received: by 2002:a50:cf4c:: with SMTP id d12mr9737851edk.115.1634228990796; 
 Thu, 14 Oct 2021 09:29:50 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:29:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/26] configure,
 meson: get HOST_WORDS_BIGENDIAN via the machine object
Date: Thu, 14 Oct 2021 18:29:23 +0200
Message-Id: <20211014162938.430211-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211014162938.430211-1-pbonzini@redhat.com>
References: <20211014162938.430211-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need to pass it in config-host.mak.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007130829.632254-6-pbonzini@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 4 ----
 meson.build | 3 ++-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index a5411c834d..648ba09f70 100755
--- a/configure
+++ b/configure
@@ -347,7 +347,6 @@ tsan="no"
 fortify_source="$default_feature"
 strip_opt="yes"
 tcg_interpreter="false"
-bigendian="no"
 mingw32="no"
 gcov="no"
 EXESUF=""
@@ -4264,9 +4263,6 @@ fi
 if test "$strip_opt" = "yes" ; then
   echo "STRIP=${strip}" >> $config_host_mak
 fi
-if test "$bigendian" = "yes" ; then
-  echo "HOST_WORDS_BIGENDIAN=y" >> $config_host_mak
-fi
 if test "$mingw32" = "yes" ; then
   echo "CONFIG_WIN32=y" >> $config_host_mak
   if test "$guest_agent_with_vss" = "yes" ; then
diff --git a/meson.build b/meson.build
index 94b092ce4f..5c3823d143 100644
--- a/meson.build
+++ b/meson.build
@@ -1463,6 +1463,7 @@ config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2]
 
 config_host_data.set_quoted('CONFIG_HOST_DSOSUF', host_dsosuf)
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
+config_host_data.set('HOST_WORDS_BIGENDIAN', host_machine.endian() == 'big')
 
 # has_header
 config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
@@ -1622,7 +1623,7 @@ foreach k, v: config_host
     config_host_data.set('HOST_' + v.to_upper(), 1)
   elif strings.contains(k)
     config_host_data.set_quoted(k, v)
-  elif k.startswith('CONFIG_') or k.startswith('HAVE_') or k.startswith('HOST_')
+  elif k.startswith('CONFIG_') or k.startswith('HAVE_')
     config_host_data.set(k, v == 'y' ? 1 : v)
   endif
 endforeach
-- 
2.31.1



