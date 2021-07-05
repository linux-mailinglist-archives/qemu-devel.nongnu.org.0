Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19703BC178
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:13:48 +0200 (CEST)
Received: from localhost ([::1]:52788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0REB-0005ME-EX
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1Q-0001NY-Et
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:37 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:33510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1K-0003fk-Rk
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:32 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso185739wme.0
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vY3VbBmrVZM9YYm9NAx6C9SJhnw2mI1KKJt0obRhixo=;
 b=SKA1to0VNTNgAr7jCff2tRcApVY0QrbBSSoYsC1hwrcNggTEEwtR0zAtc9jI8OoRE6
 n/bKF0Z7jUg9M3bZDswhYRf7RBN3zS9IudQGOQQJSAGO0KYmaVv7rOXIJvT0NSDh8YZG
 0qGIBT4a275tLLOWSwh9/ic3dRRlMmwKMFRhlRqIQFp1PD2kWaYRL6Hv4IPu4Z+nWkyd
 L2arqksW+wHmch3zX70px8+3c1+Pa8YOeXPvYUZ5DvN8ol3TVL/BxeVFOIg643PZKKWy
 WHmz5NU59D+LeTSNUMp8HdrcawfEVrJ1ZuKeuvD7nsBLb6XhF5DdPWbYz0eYYoCnGbQV
 wu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vY3VbBmrVZM9YYm9NAx6C9SJhnw2mI1KKJt0obRhixo=;
 b=cxX0SjkVQ3tfV5jMsgWJSuf/wyvMTRlMrYMUveBcwXVyJP9rn3yGhD+NdZ3wl3YRVl
 ZUcoTK3y91odHx+6Soj5ObRUON2zFnO1gPmbFY8oUKX1m6UFGONVt3lkSQZTHpCWoyzH
 oOkJi9KQ9pJ584cKHPqw8q3aTKfgOdbuSeOBGmU/3N7qSLbmTyeNOtkapo5ft4MeKS1B
 w3l0SPGJJ7ziFnm9phDSkGan1WG/QcX7TiBDlQuZprh8MlEFeAiEA5CSWgO3xn+Xq6J4
 eBiAU1tChJ+hDhIllxo5kejfpzuFXuFyBP126AwRotdVGyC6TRJ5QdGFv8Q199DFXbhV
 OpFw==
X-Gm-Message-State: AOAM531Gw7O6236oHBwH2DmgmhLkxAshNMD0XqeyDmNPo2j13mab5pWM
 UsiUz1lioZIV8/Mwd9d7CtdOOlYgExg=
X-Google-Smtp-Source: ABdhPJx9b64sJ4y6s0I3kt1O4X8OUjjkXgI/MWstF7fxvQ2+zAE0z8iJ26voAr4ZVMsgDlglyt/2eQ==
X-Received: by 2002:a05:600c:198c:: with SMTP id
 t12mr15226964wmq.140.1625500829418; 
 Mon, 05 Jul 2021 09:00:29 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b12sm1217063wrt.78.2021.07.05.09.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 09:00:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/17] configure: convert compiler tests to meson, part 2
Date: Mon,  5 Jul 2021 18:00:14 +0200
Message-Id: <20210705160018.241397-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705160018.241397-1-pbonzini@redhat.com>
References: <20210705160018.241397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
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



