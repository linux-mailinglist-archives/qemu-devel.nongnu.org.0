Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C7D3AE7EA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:09:08 +0200 (CEST)
Received: from localhost ([::1]:51606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHnf-0003VW-Mx
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjb-0002t3-E2
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:55 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:44539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjY-0003wv-Qo
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:55 -0400
Received: from quad ([82.142.1.74]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MYvse-1lhxuk0puK-00Upe1; Mon, 21
 Jun 2021 13:04:50 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] linux-user: Fix incorrect use of feature-test-macros
Date: Mon, 21 Jun 2021 13:04:44 +0200
Message-Id: <20210621110445.231771-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621110445.231771-1-laurent@vivier.eu>
References: <20210621110445.231771-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iJOuoai8zlHM3G2C8arjc8DtVhc4Sgk6kf0zndvkIcBDWZpUeqy
 q+fzE68UTJ/8ugXje9Gzif+AVqj2MSNA/jcZaD6+Ui2F7P8Pvdr31qbvfXWe+6ozfVgPYHp
 9Lm7za9gRcf3M2/Bkm+hRk8tlUVdnujT4HZ8Es2RX/PgUGJ2QdaSIdFkHvoMBOIJGHk4UXQ
 /LXEa9m/sVvChdqJfieWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fGBeoc+FZeY=:1pCgfkimJ4wlL0jIRxhLAz
 a2+13758T63+cPqz2i9GIb1W+VHJcmcujSn4tKy5EhSXny0di107qdA89Sc/vj18Px5msZqFn
 rQQ7Sfv1qjPtNYSh1RQlmW5td4d3ZaknYERHRxMnbyAHNrfKyordG0fQsN9ruzxnRBmDOuCVq
 Ueff1TkOp9n+R7VjfeASJ4WQJjv6KxCqLyMrBZUcuo0o2E47+MbqXhuWwEFqu7ge+wn2FGZ47
 GChvEM6kVqeIAi4GYi2qoAqPXs9MLQZDQbO/UzZAQY5qOPT7ZB4QLGBYKVH/9s8vP+1J2hEyF
 4RDAPYq989MNgpkGOCSwSI1lopCCUj/lxjJ3SMSFzhTBAIF73qFh3KoPh5OK6cjpfG8g74iBe
 qrLurKa1CjplmbhdVJ7Fo2wy9zUBtJITFt0o/goQJPF88R2tmwKLWtU1xhf+lkrqQ3cObMT52
 Sp8D7z/i6lfPeKYP8fW82KZprFOg1jQq79H+k/5WNG0krfwexatD7wZcUmQOBR7FxekQtOcQt
 BNbHtBwBIPGN2sxefr5SIA=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Forney <mforney@mforney.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Forney <mforney@mforney.org>

The _POSIX_C_SOURCE and _XOPEN_SOURCE macros are used by the
application to indicate to libc which declarations it should expose.
Since qemu does not define them anywhere, it does not make sense
to check their value.

Instead, since the intent is to determine whether the host struct
stat supports the st_*tim fields, use the configure test result
which does exactly that.

Signed-off-by: Michael Forney <mforney@mforney.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210526035531.7871-1-mforney@mforney.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 723cb02d2a00..70ae8884ee54 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7482,7 +7482,7 @@ static inline abi_long host_to_target_stat64(void *cpu_env,
         __put_user(host_st->st_atime, &target_st->target_st_atime);
         __put_user(host_st->st_mtime, &target_st->target_st_mtime);
         __put_user(host_st->st_ctime, &target_st->target_st_ctime);
-#if _POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700
+#ifdef HAVE_STRUCT_STAT_ST_ATIM
         __put_user(host_st->st_atim.tv_nsec, &target_st->target_st_atime_nsec);
         __put_user(host_st->st_mtim.tv_nsec, &target_st->target_st_mtime_nsec);
         __put_user(host_st->st_ctim.tv_nsec, &target_st->target_st_ctime_nsec);
@@ -7517,7 +7517,7 @@ static inline abi_long host_to_target_stat64(void *cpu_env,
         __put_user(host_st->st_atime, &target_st->target_st_atime);
         __put_user(host_st->st_mtime, &target_st->target_st_mtime);
         __put_user(host_st->st_ctime, &target_st->target_st_ctime);
-#if _POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700
+#ifdef HAVE_STRUCT_STAT_ST_ATIM
         __put_user(host_st->st_atim.tv_nsec, &target_st->target_st_atime_nsec);
         __put_user(host_st->st_mtim.tv_nsec, &target_st->target_st_mtime_nsec);
         __put_user(host_st->st_ctim.tv_nsec, &target_st->target_st_ctime_nsec);
@@ -10072,8 +10072,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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


