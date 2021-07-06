Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A603BC9FA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:32:10 +0200 (CEST)
Received: from localhost ([::1]:33916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iN7-0006ck-Gr
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu1-0001FX-IL
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:05 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htz-0002PX-Gx
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:05 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso1269147wmh.4
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vY3VbBmrVZM9YYm9NAx6C9SJhnw2mI1KKJt0obRhixo=;
 b=GsW97VMQKlRYK38FvoNgYsZxFCPHsmOS2DoJc1gdAu70Zf3pi0LTn88HZvALKetJ7C
 C6gZigQVnqVI76GR5MrjV1DaIrtFsp+Up+sxE9n21IdGy95uhdKlWJHJIhKNFdHMLskd
 mb7Cshwi2NTIq4UDMBHWCMicDEFJsd+xg2A2BW+ulaWAdFnwsdOk4cAaxvwqAe8pRzoW
 hfNBsTk7zD4P7Sl1t/hwyJiHfGKmGCiHFMCn96QNrSd2LLCOcdR1741d+2eNvk5Lrr6H
 iarJrxmDmYiMGL3MxXr8QdaDElsj4l3u4rixWaIGxGAdLZvqyLWxJ9aEP601B5TnuTb+
 7WFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vY3VbBmrVZM9YYm9NAx6C9SJhnw2mI1KKJt0obRhixo=;
 b=GMqdPlii5f2NYy/T4M7MfimpVgI8gHEN1yMQfoh3iTVHQG6HBON0yS92gJAjVY07NY
 MArWUasLH2mTjFIgNz1hiE7ba1+3kJ/zdJToyT1zn8wYLPGHdvN+D+F2SdgxlykpoPKR
 cLO1pLMXigKunqzTJjYaN5aP9yAgrwG+8WZ+YEUlO7G+6w/sRPk6Lg1W3O5LEIAJLh4C
 DUsaTAISwDhZchI6dQ8IsRHHLh1DdagKz+6QoSEANUSKFDmcv2NuFUEaxwDkRG+vzzEW
 R6NR1YU0R6gGweV1t91hG9ml/Olxj91BYBgvpGuBUCnQ2cU1IXgjmcOZOIdpPBDQFmum
 5x3Q==
X-Gm-Message-State: AOAM5338/nWxSuWUdbjOnbMZjiw4GV5+5kavuohIdSSjV4mQwdOtfl0s
 5CidN8TmujsdMHWZfwIuEhcLrbTNxpw=
X-Google-Smtp-Source: ABdhPJwtrv0wf//QFkqXF5ECj1mbIB/21OrACtXvxg+WzU4Nq8X2h66fNiRe0L1uGV/uPoxz1/KqFA==
X-Received: by 2002:a05:600c:19d2:: with SMTP id
 u18mr3363360wmq.21.1625565721132; 
 Tue, 06 Jul 2021 03:02:01 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:02:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/40] configure: convert compiler tests to meson, part 2
Date: Tue,  6 Jul 2021 12:01:29 +0200
Message-Id: <20210706100141.303960-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 49 -------------------------------------------------
 meson.build |  5 +++++
 2 files changed, 5 insertions(+), 49 deletions(-)

diff --git a/configure b/configure
index e2bf77f55d..78f4a351d9 100755
--- a/configure
+++ b/configure
@@ -3783,46 +3783,6 @@ if compile_prog "" "" ; then
     posix_syslog=yes
 fi
 
-##########################################
-# check if we have sem_timedwait
-
-sem_timedwait=no
-cat > $TMPC << EOF
-#include <semaphore.h>
-int main(void) { sem_t s; struct timespec t = {0}; return sem_timedwait(&s, &t); }
-EOF
-if compile_prog "" "" ; then
-    sem_timedwait=yes
-fi
-
-##########################################
-# check if we have strchrnul
-
-strchrnul=no
-cat > $TMPC << EOF
-#include <string.h>
-int main(void);
-// Use a haystack that the compiler shouldn't be able to constant fold
-char *haystack = (char*)&main;
-int main(void) { return strchrnul(haystack, 'x') != &haystack[6]; }
-EOF
-if compile_prog "" "" ; then
-    strchrnul=yes
-fi
-
-#########################################
-# check if we have st_atim
-
-st_atim=no
-cat > $TMPC << EOF
-#include <sys/stat.h>
-#include <stddef.h>
-int main(void) { return offsetof(struct stat, st_atim); }
-EOF
-if compile_prog "" "" ; then
-    st_atim=yes
-fi
-
 ##########################################
 # check if trace backend exists
 
@@ -4967,15 +4927,6 @@ fi
 if test "$inotify1" = "yes" ; then
   echo "CONFIG_INOTIFY1=y" >> $config_host_mak
 fi
-if test "$sem_timedwait" = "yes" ; then
-  echo "CONFIG_SEM_TIMEDWAIT=y" >> $config_host_mak
-fi
-if test "$strchrnul" = "yes" ; then
-  echo "HAVE_STRCHRNUL=y" >> $config_host_mak
-fi
-if test "$st_atim" = "yes" ; then
-  echo "HAVE_STRUCT_STAT_ST_ATIM=y" >> $config_host_mak
-fi
 if test "$gio" = "yes" ; then
     echo "CONFIG_GIO=y" >> $config_host_mak
     echo "GIO_CFLAGS=$gio_cflags" >> $config_host_mak
diff --git a/meson.build b/meson.build
index 29a050066e..4314b9b4c5 100644
--- a/meson.build
+++ b/meson.build
@@ -1274,12 +1274,14 @@ config_host_data.set('CONFIG_FALLOCATE', cc.has_function('fallocate'))
 config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
+config_host_data.set('CONFIG_SEM_TIMEDWAIT', cc.has_function('sem_timedwait', dependencies: threads))
 config_host_data.set('CONFIG_SENDFILE', cc.has_function('sendfile'))
 config_host_data.set('CONFIG_SETNS', cc.has_function('setns') and cc.has_function('unshare'))
 config_host_data.set('CONFIG_SYNCFS', cc.has_function('syncfs'))
 config_host_data.set('CONFIG_SYNC_FILE_RANGE', cc.has_function('sync_file_range'))
 config_host_data.set('CONFIG_TIMERFD', cc.has_function('timerfd_create'))
 config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', dependencies: util))
+config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 
 # has_header_symbol
@@ -1306,6 +1308,9 @@ config_host_data.set('CONFIG_PRCTL_PR_SET_TIMERSLACK',
 config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
                      cc.has_member('struct sigevent', 'sigev_notify_thread_id',
                                    prefix: '#include <signal.h>'))
+config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
+                     cc.has_member('struct stat', 'st_atim',
+                                   prefix: '#include <sys/stat.h>'))
 
 # Some versions of Mac OS X incorrectly define SIZE_MAX
 config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
-- 
2.31.1



