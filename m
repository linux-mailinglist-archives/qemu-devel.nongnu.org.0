Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483DA39F560
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:43:39 +0200 (CEST)
Received: from localhost ([::1]:60944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqa8v-0003Yn-TP
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpN-0006sm-BQ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:25 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpL-00085M-7t
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z8so21122348wrp.12
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nxQQsAycHrHRuZp2uJOU6Ym9EXI/GhjmjKYDjFLL3UU=;
 b=S94qKCbPt42FZGt2Jz/1CL4A//d8yNPPfRKqSokRzoquxCFfsv6SYnTHdRjy2zPsdP
 RIuDwswk7wmEOcqmJ1gdxhVkKl4IafqfWVL8omao9acaNcwGiVJMPthhO4NjX4dENXv4
 x+HFrXmTMeJFxed70hvgc74lRqI2SkIyV/dAHkb1b3NSqlUsfTylL2pG3Q6OTMOgAga3
 OfImvZad09OFtXWs+bjm0N2r4ypA/ZjkKMODxU0M1ktAVvkuQr3hfDO8+MOIbXvq6hh8
 v7Jv5l1+U3tSnHWNGk49w3OfsdgA192Z7/GmOquTU6RKO9bw2AmGBjeoBNUdi4v5oK+I
 w9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nxQQsAycHrHRuZp2uJOU6Ym9EXI/GhjmjKYDjFLL3UU=;
 b=lfWgpH/nVZc4lsyGsn1nMWEbCJBbcZVw5d5mgBE9rImtITaMLQqI27N8QsuJu+phqF
 HGt8Qw3avQwabI/OhBECw2omci/TjUo9UBD3kKh46jCFP6UxeUmuxh+9/ztM3b0pG1KS
 5VAOowQYnn3slvgx3Y07g0CmzEyuRumPDm37mvmSiH1jN9IDA1pCozbIsL6hfqFi9DNj
 lT46kYh95FIBSty1b084eqf3Gn8f1TgF1yZ7DbqC0LbbCxhkqVUCfGoFX6unX1POmAc4
 CVZgvMmVwZlLq2nF67bf/NlLeAkqvj979mZ2sxaiXOryInl4EKb8kRu66npinuwfPJS7
 OlwQ==
X-Gm-Message-State: AOAM5334/bBMuVqS/W+L0RCt4aa9raFM8RpAjECbV/RSFsGIRgXXZ9p/
 NbWVBDSk0ZFonTDaYckJuJg8eSQ2Exl3zA==
X-Google-Smtp-Source: ABdhPJwE5acJ2eaH5Z+JEWSkbNYltjiYx2aehltbEefCDDTE9sHoeYOGUKYt4XvY8lgnWOeHNq+C8g==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr21673039wrm.403.1623151401895; 
 Tue, 08 Jun 2021 04:23:21 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/26] configure: convert compiler tests to meson, part 2
Date: Tue,  8 Jun 2021 13:22:56 +0200
Message-Id: <20210608112301.402434-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 49 -------------------------------------------------
 meson.build |  4 ++++
 2 files changed, 4 insertions(+), 49 deletions(-)

diff --git a/configure b/configure
index b16c84ca74..7f7f548b1a 100755
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
 
@@ -4981,15 +4941,6 @@ fi
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
index 0f2b05eef6..5e63a21bc1 100644
--- a/meson.build
+++ b/meson.build
@@ -1277,12 +1277,14 @@ config_host_data.set('CONFIG_FALLOCATE', cc.has_function('fallocate'))
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
 
 config_host_data.set('CONFIG_BYTESWAP_H',
@@ -1303,6 +1305,8 @@ config_host_data.set('CONFIG_MACHINE_BSWAP_H',
                                                      #include <sys/types.h>'''))
 config_host_data.set('CONFIG_PRCTL_PR_SET_TIMERSLACK',
                      cc.has_header_symbol('sys/prctl.h', 'PR_SET_TIMERSLACK'))
+config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
+                     cc.has_member('struct stat', 'st_atim', prefix: '#include <sys/stat.h>'))
 
 # Some versions of Mac OS X incorrectly define SIZE_MAX
 config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
-- 
2.31.1



