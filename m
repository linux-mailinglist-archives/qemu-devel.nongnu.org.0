Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D1942A3EB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 14:08:30 +0200 (CEST)
Received: from localhost ([::1]:56676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maGa4-0005r2-PT
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 08:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFig-0000Xx-5E
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:18 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:43702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFid-0007Wq-P5
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:17 -0400
Received: by mail-ed1-x52d.google.com with SMTP id i20so63177254edj.10
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X2E66bS33R3PPOnhmYySlBMHCIuzAQUU7BlElA4jftU=;
 b=l7TrRJUr8lCT/sPxbO943tI0YmtuL0ThqySnwG4jaCfgpIZHEoyn+uYlXdo6kYx0F4
 GDE8h1PRdRY0h3xHxhGPtzMu9uS5JVYlMTJ6y8XpJFThG6Fu6GMkuq648+LXDhT3M00a
 2ZQjTFc0NjkdHwMoJDR8jByzhgRa1Wg9BgJNPgiAiWRwAAbpztE2kmRHwhJ53GwhE+Uc
 LRAX8f8XYJeXUBlaUWEsEusBYPJoWqdWWfYW2ZWfv8qbOiNLystQA7RL1S3tQxz3VoLO
 lfa9Ib/9WsfzY9Ir1e8IHMvkWquGfMiUvASUmxNIdiX+18ScfL1NLKJfOQ6kX4LdEnZU
 N1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X2E66bS33R3PPOnhmYySlBMHCIuzAQUU7BlElA4jftU=;
 b=rioxkEo6jtdmqnwfuW2y5b2Mkfn4VoR/4aFrDW8T54jzEoZD01Ow+9QLWf5vVyOyVr
 l9uveRvQ+j3pqOw1ch/hfDp+7tFN1k10qDuX77XIq+8MXq9R1egri5LVE9MrV6FhFu8C
 wNLdFzmFr9uVBvvIKYkPmqloOsSvZczgyH8YbRqAxdzs16RmM9meA6cnD/S6rrsHOUfF
 1Yf86fvigGOyFdFIgkTDigdIKWKt+5SlDMt9nUj33M6SBBg84N3hmJlrb9kUBWEgPeRE
 NZa7u6Kl74bn373RUWizogcIwanNbvMBl3MILSAGDAy+hA/rwqoCTcSYZsbXjlk6sV/j
 IouA==
X-Gm-Message-State: AOAM5303Ch4EJgCxEoaq7K1GOWmaRs2COQvnCHB8Fuk8qiD7nYIHeOdg
 DrbpdsI4e33Un34vMwnu0G0171JNmqU=
X-Google-Smtp-Source: ABdhPJxxCy1YfjqzN+TZ0baBN4tgpB2k8J+NyP52OQFRiR0Jx0AjsnWSTVRfyCh/sdfyA0zq30IiRg==
X-Received: by 2002:a05:6402:450:: with SMTP id
 p16mr49145023edw.162.1634037193435; 
 Tue, 12 Oct 2021 04:13:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/24] configure,
 meson: get HOST_WORDS_BIGENDIAN via the machine object
Date: Tue, 12 Oct 2021 13:12:49 +0200
Message-Id: <20211012111302.246627-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need to pass it in config-host.mak.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007130829.632254-6-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 4 ----
 meson.build | 3 ++-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index f91b8e1f0d..35e25bb960 100755
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
@@ -4262,9 +4261,6 @@ fi
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
index 31758400eb..f8992e4b2c 100644
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



