Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD91A2E34FC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 09:18:00 +0100 (CET)
Received: from localhost ([::1]:43926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktnj5-0002JS-Ox
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 03:17:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1ktng5-0008L9-4q; Mon, 28 Dec 2020 03:14:53 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:41372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1ktng3-0004iM-Mj; Mon, 28 Dec 2020 03:14:52 -0500
Received: by mail-ed1-x52d.google.com with SMTP id i24so9022380edj.8;
 Mon, 28 Dec 2020 00:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=fuBoN8O92mxATBxE1t605VssJxkUfPn5J1youTtn9Ds=;
 b=bXUfu8dI7QB99A8C0ufFAfVwd/rGPFXfyi2SWBQaLcUxUz2BTzyYZoG0PS9wJTLqAc
 6ii08K6/1D6HsOh0rk/a+L49zlsHtq4w8M21S5MiEGox1ngwkmr+aQdTlUR04u3pvBLh
 TI59enyZE/m2m1i/LMpiJB+hOrr3rAV7n9A4KYDv5lR2FXq2LhIWo0EwJ5GaNudBrbEz
 BZzxohEOUhz2rnAgDAYID4iqeNCdyHqmHMdghE5O7AWcpFF7CbvbsBt1vvz9Kt6wEaTa
 Pk4L2La1BPFu+SuuUZsNm9qdKazVsPjUc9evtP+HCnK80ekYH0FvuyCNqveuuO6DmTql
 lPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fuBoN8O92mxATBxE1t605VssJxkUfPn5J1youTtn9Ds=;
 b=cglacu9GOeQjsDj0p0W0ymKLR1yeoaary9j3JFRJfJqdlNhXc4SNrRb7vnpB3/wwjW
 EFzvAwQt7gFBeJfPEg63TdoyYRNRoSYdxHEe0O7i4Hh6NUjhwPu3PE08sJwBe0unFY9p
 CEQ5IsBWhOdMOPY/GKzIbnCslAJ5xJOFOJSOdxe5r3O0IZfrFn4L7sDHCzx65rvf6J8x
 vW8vvX4+YWvI2Klymn7ZaUesjJXmh7fHyzpyvChK6HoNLXYKKHm2YVign1dS6Ojn67Mk
 n+5PAZtiWq2rMIQJsh0le7UHei8Ii47siQX+hN2i/6jRZGFwFM1GNAnpAkSSP7X4jqiJ
 +pwQ==
X-Gm-Message-State: AOAM531KNtrU4Pe7y28nhLjpI1XGd/btfhTaBKoMjKzOF/pnRYjVF4od
 bgwC2IqVGkVbzfloFdfrk0t7hhBP604TxuKWBAC5KDusYAdqAQ==
X-Google-Smtp-Source: ABdhPJxIo3JrI9GfBzP4Z9aYTgs0HH1gm+TxfKd7DHkgL8oeH4Fctga+WOJx6m2DqsudAkG6nboxjfiyXsOmirN7BLs=
X-Received: by 2002:a50:f9cc:: with SMTP id a12mr40505131edq.335.1609143289298; 
 Mon, 28 Dec 2020 00:14:49 -0800 (PST)
MIME-Version: 1.0
From: David CARLIER <devnexen@gmail.com>
Date: Mon, 28 Dec 2020 08:14:38 +0000
Message-ID: <CA+XhMqwrOBC49TKgX2o1qSx_tBMQfeFZOTr3m5ShxrUCuMw-4w@mail.gmail.com>
Subject: [PATCH 1/2] bsd-user, updating the FreeBSD's syscall list, based on
 the 11.x
To: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=devnexen@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

---
 bsd-user/freebsd/syscall_nr.h | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/bsd-user/freebsd/syscall_nr.h b/bsd-user/freebsd/syscall_nr.h
index d849024792..14d2465858 100644
--- a/bsd-user/freebsd/syscall_nr.h
+++ b/bsd-user/freebsd/syscall_nr.h
@@ -1,8 +1,8 @@
 /*
  * System call numbers.
  *
- * created from FreeBSD: releng/9.1/sys/kern/syscalls.master 229723
- * 2012-01-06 19:29:16Z jhb
+ * created from FreeBSD: stable/11/sys/kern/syscalls.master a61bf07
+ * 2019-04-28 emaste
  */

 #define TARGET_FREEBSD_NR_syscall   0
@@ -447,4 +447,23 @@
 #define TARGET_FREEBSD_NR_rctl_remove_rule  529
 #define TARGET_FREEBSD_NR_posix_fallocate   530
 #define TARGET_FREEBSD_NR_posix_fadvise 531
-#define TARGET_FREEBSD_NR_MAXSYSCALL    532
+#define TARGET_FREEBSD_NR_wait6 532
+#define TARGET_FREEBSD_NR_cap_rights_limit 533
+#define TARGET_FREEBSD_NR_cap_ioctls_limit 534
+#define TARGET_FREEBSD_NR_cap_ioctls_get 535
+#define TARGET_FREEBSD_NR_cap_fcntls_limit 536
+#define TARGET_FREEBSD_NR_cap_fcntls_get 537
+#define TARGET_FREEBSD_NR_bindat 538
+#define TARGET_FREEBSD_NR_connectat 539
+#define TARGET_FREEBSD_NR_chflagsat 540
+#define TARGET_FREEBSD_NR_acceptat 541
+#define TARGET_FREEBSD_NR_pipe2 542
+#define TARGET_FREEBSD_NR_aio_mlock 543
+#define TARGET_FREEBSD_NR_procctl 544
+#define TARGET_FREEBSD_NR_ppoll 545
+#define TARGET_FREEBSD_NR_futimens 546
+#define TARGET_FREEBSD_NR_utimensat 547
+#define TARGET_FREEBSD_NR_numa_getaffinity 548
+#define TARGET_FREEBSD_NR_numa_setaffinity 549
+#define TARGET_FREEBSD_NR_fdatasync 550
+#define TARGET_FREEBSD_NR_MAXSYSCALL    551
-- 
2.30.0.rc2

