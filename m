Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A06390F0C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 06:02:33 +0200 (CEST)
Received: from localhost ([::1]:56110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llkka-00079Z-Gy
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 00:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mforney@mforney.org>)
 id 1llkeM-0004n6-UD
 for qemu-devel@nongnu.org; Tue, 25 May 2021 23:56:06 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:33285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mforney@mforney.org>)
 id 1llkeJ-0003Tw-0z
 for qemu-devel@nongnu.org; Tue, 25 May 2021 23:56:06 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 v13-20020a17090abb8db029015f9f7d7290so2943133pjr.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 20:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cyrGGae3KScjf2+1slxM8e19PZON/gYGwK8TqUwl1jE=;
 b=kQmTTI0xH78/kgfS0m9c824zc0VFSBWOWBCNLPnQdsmsCOlBErIM2jPzkkbO7X2IM9
 YHrTVgFqbXz89XF86CikstveNJlsz6Tvi8Ji6OF7A7tpaP9thFr1P+8lPA9e/q5GWKcd
 /6/xC62zHV1kPMdADV56C9CJ6Pi/IJrTJn7/8z/hgnHGZobSuNGPpIxp8wqyTBWObjge
 N/GROmfkY3rn07Q7hI9Z1vEScO3OxsqFcL4SY75J90ilz7Jt2ou03AuA47QNUMb1qmqX
 mA+4o+OwYMiOH6BgiZN77wwztR1QaSRdRI28rKHuGZnMhBFzSsHNPcIusiediXFDQFmA
 HEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cyrGGae3KScjf2+1slxM8e19PZON/gYGwK8TqUwl1jE=;
 b=ucCCKkvJNEbtkK/PphGG7jwhSMRoGhuSU2kxD85ia2btE94/IC5Rt74rzcOv/hJUdv
 CZRJamYioEr4er7fQSb0crXERM1kLAtiTr+/KVzN0clKIC2d427JOnKKz7jaAqKSqUJP
 7m3RLzAXrxoxMqsiggFTUkkzO4Rj8mf1lDn5yjmXjID+ry4/gLH3Qf78OTXB98lp9c1A
 BiO4EvXNm5sQsUoyA7Zw4vXOP1ta6RaK2K2zyogAp7NM3aPC64ov5xJPg0jX6RIv4MGy
 lViRyXug/FRzKouGdl5Q6rasz+SBbo2gyGrcrlQ8DclD8WpAxBbQjrGO4LrzKXmKRSz4
 sZLg==
X-Gm-Message-State: AOAM532BqirFzoMob3++lnaio8ukak+89IWO3+Sfdb1hMZB5L4O8mPvF
 ra9VjRDqnF4e4nCQdzAErcZ/UCGRzDDSbkYcV3U=
X-Google-Smtp-Source: ABdhPJxTa93wXu3FtZjuHUeGf/6OOWq9AlSZcMlSVzb/Oe9Pxwxf1yPycWmaNlj5vAuumBNqFVNWqw==
X-Received: by 2002:a17:902:e04f:b029:eb:66b0:6d08 with SMTP id
 x15-20020a170902e04fb02900eb66b06d08mr33954676plx.50.1622001361451; 
 Tue, 25 May 2021 20:56:01 -0700 (PDT)
Received: from localhost ([2601:647:5180:4570:16dd:a9ff:fee7:6b79])
 by smtp.gmail.com with ESMTPSA id b23sm13735607pjo.26.2021.05.25.20.56.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 May 2021 20:56:00 -0700 (PDT)
From: Michael Forney <mforney@mforney.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user: Use public sigev_notify_thread_id member if
 available
Date: Tue, 25 May 2021 20:55:56 -0700
Message-Id: <20210526035556.7931-1-mforney@mforney.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=mforney@mforney.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

_sigev_un._tid is an internal glibc field and is not available on
musl libc. The sigevent(7) man page and Linux UAPI headers both use
sigev_notify_thread_id as a public way to access this field.

musl libc supports this field since 1.2.2[0], and glibc plans to
add support as well[1][2].

If sigev_notify_thread_id is not available, fall back to _sigev_un._tid
as before.

[0] http://git.musl-libc.org/cgit/musl/commit/?id=7c71792e87691451f2a6b76348e83ad1889f1dcb
[1] https://www.openwall.com/lists/musl/2019/08/01/5
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=27417

Signed-off-by: Michael Forney <mforney@mforney.org>
---
 configure            | 16 ++++++++++++++++
 linux-user/syscall.c |  6 +++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 676239c697..fa39b0a727 100755
--- a/configure
+++ b/configure
@@ -4462,6 +4462,19 @@ if compile_prog "" "" ; then
     st_atim=yes
 fi
 
+##########################################
+# check if we have sigev_notify_thread_id
+
+sigev_notify_thread_id=no
+cat > $TMPC << EOF
+#include <stddef.h>
+#include <signal.h>
+int main(void) { return offsetof(struct sigevent, sigev_notify_thread_id); }
+EOF
+if compile_prog "" "" ; then
+    sigev_notify_thread_id=yes
+fi
+
 ##########################################
 # check if trace backend exists
 
@@ -5718,6 +5731,9 @@ fi
 if test "$st_atim" = "yes" ; then
   echo "HAVE_STRUCT_STAT_ST_ATIM=y" >> $config_host_mak
 fi
+if test "$sigev_notify_thread_id" = "yes" ; then
+  echo "HAVE_SIGEV_NOTIFY_THREAD_ID=y" >> $config_host_mak
+fi
 if test "$byteswap_h" = "yes" ; then
   echo "CONFIG_BYTESWAP_H=y" >> $config_host_mak
 fi
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index c9f812091c..63464f9a96 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7393,6 +7393,10 @@ static inline abi_long host_to_target_timex64(abi_long target_addr,
 }
 #endif
 
+#ifndef HAVE_SIGEV_NOTIFY_THREAD_ID
+#define sigev_notify_thread_id _sigev_un._tid
+#endif
+
 static inline abi_long target_to_host_sigevent(struct sigevent *host_sevp,
                                                abi_ulong target_addr)
 {
@@ -7413,7 +7417,7 @@ static inline abi_long target_to_host_sigevent(struct sigevent *host_sevp,
     host_sevp->sigev_signo =
         target_to_host_signal(tswap32(target_sevp->sigev_signo));
     host_sevp->sigev_notify = tswap32(target_sevp->sigev_notify);
-    host_sevp->_sigev_un._tid = tswap32(target_sevp->_sigev_un._tid);
+    host_sevp->sigev_notify_thread_id = tswap32(target_sevp->_sigev_un._tid);
 
     unlock_user_struct(target_sevp, target_addr, 1);
     return 0;
-- 
2.31.1


