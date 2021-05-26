Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E22390F02
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 05:58:34 +0200 (CEST)
Received: from localhost ([::1]:53936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llkgj-0005VY-AK
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 23:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mforney@mforney.org>)
 id 1llkeD-0004ir-2F
 for qemu-devel@nongnu.org; Tue, 25 May 2021 23:55:57 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mforney@mforney.org>)
 id 1llkeB-0003Is-5A
 for qemu-devel@nongnu.org; Tue, 25 May 2021 23:55:56 -0400
Received: by mail-pj1-x1035.google.com with SMTP id q6so105227pjj.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 20:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z5DTlrEQ1O+ie24uhuzXQK8saocUch49RmAmkfzZaSU=;
 b=VZC+cjOMf/x5QoueuNaW8twywj4q97WXqEwqOOLjqnCsvargLffD9n+d85nndS1z6J
 npwSMLgS9lqOpWaWEyG3FXqkaI7J9r0oUdp3WBEQPOZoJ8BiFmnNDPGnKY1wXZU8UbwM
 Y5Ni9w6hc91S/0opE6sBvaqVBgKlUV8csFGRyWRqgHFbWbwpwBeMJlcTMsV6EpCRiyoo
 jlGInbb0BIHGIcUsjDd+qNj6zX7tngaZYqjBMQ8y8XWe+2yXLBAihn4Sbb1ZIUo5eX1j
 ADvKymOyg5XybEI5wVoTUNlJN1ejinA/WvgPDn228TPJhHFeIf8uckx65y2kEBGh5rKP
 3qfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z5DTlrEQ1O+ie24uhuzXQK8saocUch49RmAmkfzZaSU=;
 b=fIctojidOpCp/+Ar1/qK8I4oWq1Gpa0ULycpFysAJcPuEyrBGzz0uSjlenjABxVOGh
 gleUB7X4biq1EPs4Y9Ff/gu5EXYq5qB1Xiw8GP9J+VlGfSII8MVhlmLSjBvYhK9Bso6A
 GOyGuj/QvSCtM88t4gmH3VNHRxnwh20Si6JqvHH3drg9T2XkFjS6WBSAUwaEtez/M0ow
 +SjxET3oMPYL7Dp49P5VjkklFjj0w2OHrD//rBkypxlnM4nmYtDyP2VL3s/HbN6TkVXL
 37k/3Ox+fgVnaP9KLvlXkWN4X7jVdb6ejeAbu1GbzFkVRBItRvWu9mjEtnmUw28LqLXF
 3TqA==
X-Gm-Message-State: AOAM532Nuzga3/ClS+b9A1ssQQbtDt6Im0lSOyEUrTbBiotGS0qIjjK3
 Ic5hOF4pwItBTiJ6y9o0o8TYDQ==
X-Google-Smtp-Source: ABdhPJxC/24Diaq+hMyOkW1GIx/p1X6Ow+d5LNpCZDTRgMyIBFEaWSihLjMDxuY3v3ygQlFqqJ2YAw==
X-Received: by 2002:a17:90a:4298:: with SMTP id
 p24mr1796314pjg.144.1622001352042; 
 Tue, 25 May 2021 20:55:52 -0700 (PDT)
Received: from localhost ([2601:647:5180:4570:16dd:a9ff:fee7:6b79])
 by smtp.gmail.com with ESMTPSA id gn4sm3267238pjb.16.2021.05.25.20.55.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 May 2021 20:55:51 -0700 (PDT)
From: Michael Forney <mforney@mforney.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user: Fix incorrect use of feature-test-macros
Date: Tue, 25 May 2021 20:55:31 -0700
Message-Id: <20210526035531.7871-1-mforney@mforney.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=mforney@mforney.org; helo=mail-pj1-x1035.google.com
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

The _POSIX_C_SOURCE and _XOPEN_SOURCE macros are used by the
application to indicate to libc which declarations it should expose.
Since qemu does not define them anywhere, it does not make sense
to check their value.

Instead, since the intent is to determine whether the host struct
stat supports the st_*tim fields, use the configure test result
which does exactly that.

Signed-off-by: Michael Forney <mforney@mforney.org>
---
 linux-user/syscall.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index c9f812091c..9a52f235d2 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7470,7 +7470,7 @@ static inline abi_long host_to_target_stat64(void *cpu_env,
         __put_user(host_st->st_atime, &target_st->target_st_atime);
         __put_user(host_st->st_mtime, &target_st->target_st_mtime);
         __put_user(host_st->st_ctime, &target_st->target_st_ctime);
-#if _POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700
+#ifdef HAVE_STRUCT_STAT_ST_ATIM
         __put_user(host_st->st_atim.tv_nsec, &target_st->target_st_atime_nsec);
         __put_user(host_st->st_mtim.tv_nsec, &target_st->target_st_mtime_nsec);
         __put_user(host_st->st_ctim.tv_nsec, &target_st->target_st_ctime_nsec);
@@ -7505,7 +7505,7 @@ static inline abi_long host_to_target_stat64(void *cpu_env,
         __put_user(host_st->st_atime, &target_st->target_st_atime);
         __put_user(host_st->st_mtime, &target_st->target_st_mtime);
         __put_user(host_st->st_ctime, &target_st->target_st_ctime);
-#if _POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700
+#ifdef HAVE_STRUCT_STAT_ST_ATIM
         __put_user(host_st->st_atim.tv_nsec, &target_st->target_st_atime_nsec);
         __put_user(host_st->st_mtim.tv_nsec, &target_st->target_st_mtime_nsec);
         __put_user(host_st->st_ctim.tv_nsec, &target_st->target_st_ctime_nsec);
@@ -10056,8 +10056,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 __put_user(st.st_atime, &target_st->target_st_atime);
                 __put_user(st.st_mtime, &target_st->target_st_mtime);
                 __put_user(st.st_ctime, &target_st->target_st_ctime);
-#if (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700) && \
-    defined(TARGET_STAT_HAVE_NSEC)
+#if defined(HAVE_STRUCT_STAT_ST_ATIM) && defined(TARGET_STAT_HAVE_NSEC)
                 __put_user(st.st_atim.tv_nsec,
                            &target_st->target_st_atime_nsec);
                 __put_user(st.st_mtim.tv_nsec,
-- 
2.31.1


