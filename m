Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A721B531186
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:15:45 +0200 (CEST)
Received: from localhost ([::1]:47398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9ma-0005hY-PC
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1nt9gm-00084J-FW
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:09:44 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:56269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1nt9gc-0000Eh-Fd
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:09:44 -0400
Received: by mail-pj1-x1035.google.com with SMTP id n10so14332259pjh.5
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 08:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=7Z9f85PlDPTQN4u2n+pOp7kSbWOWz6dZLvrHDyxQ4o4=;
 b=GHpxTlOR0r9UfNRUQPXHVtEfm1iN58zn6/+s1oesheqbEG+Mr0pJok/bLinBnRcT2v
 h7UPtOAbbgrcE7muWbeQk94N6qxSSCgK8nqkkbUOnE7IC3oTNn5bwDuKmhyK8t/po20u
 hu3ktpQwL46PWh9NK2uWO6Sama5wklYMFcDp2tkktoJFZU1nXt9S1WbYe+TKnE59EOOI
 I/1qR2FqhdT6D0cYDwApWhH0F3ZrlgNIdnzeHz5Q5njYE+WTXn/fqRyhESDVjdr5BRSx
 0RVS92gYZ+mZeGAwUfh04khmzS4tjBex0srrtXlIlcJcYsfZ/Q5Ne292nlCgBb5jc1Fq
 dOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=7Z9f85PlDPTQN4u2n+pOp7kSbWOWz6dZLvrHDyxQ4o4=;
 b=SrY20I7DDcEWmtTaeVu6zqIhH/KnIW/UaxL/nBA2HwZjioqGOTtZ583i8QQWOJZ8bU
 AEuyzq0MMNDlF37XspU9tAeiKGoCf+CRe5ksLSBqz2c+fSKf8CkWOpONyI7KkJZOdviL
 zo3tsjCo9bdGtzO/Jlg3awCIT5dtoI1Omq1ScTYJ9rO8vb1f8Nwd0G4pEj8AuCuHESDH
 P9gXKjx+rmARIE+THzuPySIsm+J76shIShAygqXi4ISJF2XdrY+/jtG+V/IcohTa4A8A
 9qweUx/MlHmumNOh/mfuStSUEoyvCs+1ePhcn+PcezVMc+s2HuiMQagvCEca4SzIBEwc
 m1EQ==
X-Gm-Message-State: AOAM5333JdwJ/okIu+wDTtv+IvfxOciSw1afZjjYZERNWMDwxXwzGQDy
 Riqye7yfol/FZSyroUhaj8YVCI3HozE=
X-Google-Smtp-Source: ABdhPJwvDqLBmVTcNlhrf32MDL6lN7uPGQ/xbrQqIWmGt6zmnjkDScVkzaySNFfX4HggwCHmEKMDyQ==
X-Received: by 2002:a17:90a:6ac9:b0:1df:53ec:84bd with SMTP id
 b9-20020a17090a6ac900b001df53ec84bdmr27074361pjm.148.1653318547717; 
 Mon, 23 May 2022 08:09:07 -0700 (PDT)
Received: from localhost.localdomain ([98.97.39.45])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a170902e29300b0016213f0f99bsm3832299plc.57.2022.05.23.08.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 08:09:07 -0700 (PDT)
Subject: [RFC PATCH] mpqemu: Remove unlock/lock of iothread in mpqemu-link
 send and recv functions
From: Alexander Duyck <alexander.duyck@gmail.com>
To: qemu-devel@nongnu.org
Cc: jag.raman@oracle.com, john.g.johnson@oracle.com, elena.ufimtseva@oracle.com
Date: Mon, 23 May 2022 08:09:05 -0700
Message-ID: <165331848622.286860.14764979875661796662.stgit@localhost.localdomain>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=alexander.duyck@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Duyck <alexanderduyck@fb.com>

When I run Multi-process QEMU with an e1000 as the remote device and SMP
enabled I see the combination lock up and become unresponsive. The QEMU build
is a fairly standard x86_64-softmmu setup. After doing some digging I tracked
the lockup down to the what appears to be a race with the mpqemu-link msg_send
and msg_receive functions and the reacquisition of the lock.

I am assuming the issue is some sort of lock inversion though I haven't
identified exactly what the other lock involved is yet. For now removing
the logic to unlock the iothread and then reacquire the lock seems to
resolve the issue. I am assuming the releasing of the lock was some form of
optimization but I am not certain so I am submitting this as an RFC.

Signed-off-by: Alexander Duyck <alexanderduyck@fb.com>
---
 hw/remote/mpqemu-link.c |   25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index 9bd98e82197e..3e7818f54a63 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -33,7 +33,6 @@
  */
 bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
 {
-    bool iolock = qemu_mutex_iothread_locked();
     bool iothread = qemu_in_iothread();
     struct iovec send[2] = {};
     int *fds = NULL;
@@ -57,16 +56,6 @@ bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
      */
     assert(qemu_in_coroutine() || !iothread);
 
-    /*
-     * Skip unlocking/locking iothread lock when the IOThread is running
-     * in co-routine context. Co-routine context is asserted above
-     * for IOThread case.
-     * Also skip lock handling while in a co-routine in the main context.
-     */
-    if (iolock && !iothread && !qemu_in_coroutine()) {
-        qemu_mutex_unlock_iothread();
-    }
-
     if (!qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send),
                                     fds, nfds, 0, errp)) {
         ret = true;
@@ -74,11 +63,6 @@ bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
         trace_mpqemu_send_io_error(msg->cmd, msg->size, nfds);
     }
 
-    if (iolock && !iothread && !qemu_in_coroutine()) {
-        /* See above comment why skip locking here. */
-        qemu_mutex_lock_iothread();
-    }
-
     return ret;
 }
 
@@ -96,7 +80,6 @@ static ssize_t mpqemu_read(QIOChannel *ioc, void *buf, size_t len, int **fds,
                            size_t *nfds, Error **errp)
 {
     struct iovec iov = { .iov_base = buf, .iov_len = len };
-    bool iolock = qemu_mutex_iothread_locked();
     bool iothread = qemu_in_iothread();
     int ret = -1;
 
@@ -106,16 +89,8 @@ static ssize_t mpqemu_read(QIOChannel *ioc, void *buf, size_t len, int **fds,
      */
     assert(qemu_in_coroutine() || !iothread);
 
-    if (iolock && !iothread && !qemu_in_coroutine()) {
-        qemu_mutex_unlock_iothread();
-    }
-
     ret = qio_channel_readv_full_all_eof(ioc, &iov, 1, fds, nfds, errp);
 
-    if (iolock && !iothread && !qemu_in_coroutine()) {
-        qemu_mutex_lock_iothread();
-    }
-
     return (ret <= 0) ? ret : iov.iov_len;
 }
 



