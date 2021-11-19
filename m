Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6BD457106
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:47:36 +0100 (CET)
Received: from localhost ([::1]:51392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo5At-0004lC-4U
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:47:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mo599-0002hW-A7
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:45:47 -0500
Received: from [2a00:1450:4864:20::52a] (port=37668
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mo597-0003Zx-F1
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:45:47 -0500
Received: by mail-ed1-x52a.google.com with SMTP id e3so43703406edu.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 06:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S4WcyNcg5hoULtV70DvWKqOAgeFCc06Rzhg1frdIwHA=;
 b=Do6umhuk2XKgbikNyj5z4g2q5TiBfCDKffpQJ9djOzjJ5tvuShBRos20QqZ5cL8+T9
 Wf+G68dCf8tnRkzsnvW3FWZZByGH894q6EZzQ3mGY3gOA1FvCHIM1TZf7CQbB9nApqo+
 tMc9fXfVcA+Z9i02ve7z66HhyOe3ufjyM1AGUGk595feIpWDmgK/yjp0iu66/tYEmBN6
 v84wCsYSOTw6xrlzdmh7MwE2xZ6U+Jj1YvdENPInwPjDqQed8MCUQe9Q/+K7hb0egZ24
 bPMADfLCTTtQ1GUgahhGEEGmf0K38YZ3B45vMR5z4IC8ypoCj15Gt8mXOsrV9jwv26+v
 Q0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S4WcyNcg5hoULtV70DvWKqOAgeFCc06Rzhg1frdIwHA=;
 b=Hjo2II4IA0Y15xStyffp4/8feJ+mUwnz9uCEcQnK9oByB4pH8lQ2hXXrW3APGw+E2V
 pmN17Kw9xcKdCJ2zGl4a8JRY4E2a03Q9/AgDoO+4J3wIHF9jfrd1wyGojqhAKqZ+UE2S
 FcGVJ6gVwZ2E5c72J+MqoZ5k2SLNQssbOSZHnoScCljQdqlXCi+BI1BusvIH1awXV6Qr
 LTe7TWxiV4KjmiFtqtoc4V97meKW3a/pgJnyBCiQMDJisXG+5EimoVRED22BADF2KsRm
 CXWUdLXdMITo7H2NXjgE1Ih47B9Yg+ofQSC+CkXL7nJpDMB/zvw7ZIP0SURhlh0RKJAu
 4iYw==
X-Gm-Message-State: AOAM532a2r9HV4pqbLVSXZTwKwlMGUEDyHkwa0z3eDvfjeLqVpZuYE0O
 5G5uzsd7nl5QA5+9O4Lj56lGFrvE3J0=
X-Google-Smtp-Source: ABdhPJz5IVJR4urJXUmauBn5PhidJdWIs4egx88QuDIArXD3c6fOlXf/Q6FKGuSGdVdMSKJEGi7TdA==
X-Received: by 2002:a17:906:ad89:: with SMTP id
 la9mr8327268ejb.178.1637333141253; 
 Fri, 19 Nov 2021 06:45:41 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z25sm26934ejd.80.2021.11.19.06.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 06:45:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] meson: fix botched compile check conversions
Date: Fri, 19 Nov 2021 15:45:33 +0100
Message-Id: <20211119144539.285740-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119144539.285740-1-pbonzini@redhat.com>
References: <20211119144539.285740-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a bunch of incorrect conversions from configure to Meson, which result
in different outcomes with --extra-cflags=-Werror.

pthread_setname_np needs "#define _GNU_SOURCE" on Linux (which I am using
also for the non-Linux check, so that it correctly fails with an error
about having too few parameters).

Fix struct checks to use has_type instead of has_symbol, and "#define
_GNU_SOURCE" too in the case of struct mmsghdr.

Remove an apostrophe that ended up at the end of a #include line.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/meson.build b/meson.build
index 2ece4fe088..93a5e50a16 100644
--- a/meson.build
+++ b/meson.build
@@ -1547,8 +1547,6 @@ config_host_data.set('CONFIG_INOTIFY',
                      cc.has_header_symbol('sys/inotify.h', 'inotify_init'))
 config_host_data.set('CONFIG_INOTIFY1',
                      cc.has_header_symbol('sys/inotify.h', 'inotify_init1'))
-config_host_data.set('CONFIG_IOVEC',
-                     cc.has_header_symbol('sys/uio.h', 'struct iovec'))
 config_host_data.set('CONFIG_MACHINE_BSWAP_H',
                      cc.has_header_symbol('machine/bswap.h', 'bswap32',
                                           prefix: '''#include <sys/endian.h>
@@ -1561,8 +1559,6 @@ config_host_data.set('CONFIG_SYSMACROS',
                      cc.has_header_symbol('sys/sysmacros.h', 'makedev'))
 config_host_data.set('HAVE_OPTRESET',
                      cc.has_header_symbol('getopt.h', 'optreset'))
-config_host_data.set('HAVE_UTMPX',
-                     cc.has_header_symbol('utmpx.h', 'struct utmpx'))
 config_host_data.set('HAVE_IPPROTO_MPTCP',
                      cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
 
@@ -1574,6 +1570,14 @@ config_host_data.set('HAVE_STRUCT_STAT_ST_ATIM',
                      cc.has_member('struct stat', 'st_atim',
                                    prefix: '#include <sys/stat.h>'))
 
+# has_type
+config_host_data.set('CONFIG_IOVEC',
+                     cc.has_type('struct iovec',
+                                 prefix: '#include <sys/uio.h>'))
+config_host_data.set('HAVE_UTMPX',
+                     cc.has_type('struct utmpx',
+                                 prefix: '#include <utmpx.h>'))
+
 config_host_data.set('CONFIG_EVENTFD', cc.links('''
   #include <sys/eventfd.h>
   int main(void) { return eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC); }'''))
@@ -1615,7 +1619,7 @@ config_host_data.set('CONFIG_POSIX_MADVISE', cc.links(gnu_source_prefix + '''
   #include <stddef.h>
   int main(void) { return posix_madvise(NULL, 0, POSIX_MADV_DONTNEED); }'''))
 
-config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_W_TID', cc.links('''
+config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_W_TID', cc.links(gnu_source_prefix + '''
   #include <pthread.h>
 
   static void *f(void *p) { return NULL; }
@@ -1626,7 +1630,7 @@ config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_W_TID', cc.links('''
     pthread_setname_np(thread, "QEMU");
     return 0;
   }''', dependencies: threads))
-config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_WO_TID', cc.links('''
+config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_WO_TID', cc.links(gnu_source_prefix + '''
   #include <pthread.h>
 
   static void *f(void *p) { pthread_setname_np("QEMU"); return NULL; }
@@ -1662,8 +1666,10 @@ config_host_data.set('HAVE_MLOCKALL', cc.links(gnu_source_prefix + '''
 
 have_l2tpv3 = false
 if not get_option('l2tpv3').disabled() and have_system
-  have_l2tpv3 = (cc.has_header_symbol('sys/socket.h', 'struct mmsghdr')
-                 and cc.has_header('linux/ip.h'))
+  have_l2tpv3 = cc.has_type('struct mmsghdr',
+    prefix: gnu_source_prefix + '''
+      #include <sys/socket.h>
+      #include <linux/ip.h>''')
 endif
 config_host_data.set('CONFIG_L2TPV3', have_l2tpv3)
 
@@ -1689,7 +1695,7 @@ config_host_data.set('CONFIG_NETMAP', have_netmap)
 # xfs headers will not try to redefine structs from linux headers
 # if this macro is set.
 config_host_data.set('HAVE_FSXATTR', cc.links('''
-  #include <linux/fs.h>'
+  #include <linux/fs.h>
   struct fsxattr foo;
   int main(void) {
     return 0;
-- 
2.33.1



