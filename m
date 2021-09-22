Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D33414199
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 08:21:09 +0200 (CEST)
Received: from localhost ([::1]:47094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSvcy-0000oH-PM
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 02:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWx-0001Pc-Rv
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:55 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:34662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWv-0007ZD-5P
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:55 -0400
Received: by mail-il1-x12a.google.com with SMTP id w1so1610902ilv.1
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 23:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K3Gn3xv8FemFjNekMbg6gJlXlkLXoZBMvz48zkc34HI=;
 b=BXtX0118tKY79WhumSZFZsPF/5oD6Ay2qri5wn3Kggplyk54I/JYx+Se41d9PAfCPx
 YFHNV0DqiWRuNYI/P9Ilj4gbeUb6cFkrqCuBTqXVGieZ2FnlK9qcVeka9EEb9zTscS7A
 Xm8Qmi8Bz6RUF+xz+A2ODPWCfHeZAIkZlcEGGRqi4e66MMzps3DY9aOaBrm35dGyzUh8
 n9hAhsN40Ow9GtJBPSzbqPnPz/XzPIj76A7GymnhBO2HLP99IBpUEniMtj02TTTen+xx
 2cROiD7aWhzv4sLC7u2iOXHbO32IdHHbuU5yvuJz5FB3/EV8WCo5PxoScwWxXM/ka3Ok
 BWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K3Gn3xv8FemFjNekMbg6gJlXlkLXoZBMvz48zkc34HI=;
 b=kIZttZLzyr2Gxc2puBrruzC45pxzKBkmxHTdyiSi7dQNsdrTCLQ9EJ+C9riMFIUzJJ
 tIkbNuKbfCrizNmQbOEWLaZzsH+ajEZGyaBCBiKnvCH5MK73shfzhIUqkSpd6deo7EKg
 sY1j3/n6UkR1P3m/r6DTgER3rhnIVGbWNQTNrs40Vv5NvhU2v3WLmQC2ctZl2H0pEm6S
 9AgC+WIYHQpo7iBrVwsUVagCWocHeTc62XRmeb/oUhto+zZztcCxthTLeDpowPaW/+5Q
 ugmfSVtPSKkPhr1+a8ZOnH6uCKXFdOTNUKO3Q9J+SSZycnvQWCgKWnrSANtLjxXceLVM
 miTw==
X-Gm-Message-State: AOAM533ElyP9jhSlaIAg8ayRDt0PvSJRvSXzZPEiWMaqOuZ0kshVSdYA
 UIqaGikiXHX183s0FMa/OAlUeMEK+TG5gd0Mfz4=
X-Google-Smtp-Source: ABdhPJyCX+xBrC7qThFe540QR8sfe2i9BblDosSv48OXl8wO1uEQz+OFFE7XwK+2zuuXTsoUiV+Fdg==
X-Received: by 2002:a92:2c0d:: with SMTP id t13mr23645713ile.99.1632291291897; 
 Tue, 21 Sep 2021 23:14:51 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a25sm540817ioq.46.2021.09.21.23.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:14:51 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/14] bsd-user: Rename sigqueue to qemu_sigqueue
Date: Wed, 22 Sep 2021 00:14:37 -0600
Message-Id: <20210922061438.27645-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922061438.27645-1-imp@bsdimp.com>
References: <20210922061438.27645-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To avoid a name clash with FreeBSD's sigqueue data structure in
signalvar.h, rename sigqueue to qemu_sigqueue. This sturcture
is currently defined, but unused.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 3dde381d5d..5a2fd87e44 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -73,15 +73,15 @@ struct image_info {
 
 #define MAX_SIGQUEUE_SIZE 1024
 
-struct sigqueue {
-    struct sigqueue *next;
+struct qemu_sigqueue {
+    struct qemu_sigqueue *next;
+    target_siginfo_t info;
 };
 
 struct emulated_sigtable {
     int pending; /* true if signal is pending */
-    struct sigqueue *first;
-    /* in order to always have memory for the first signal, we put it here */
-    struct sigqueue info;
+    struct qemu_sigqueue *first;
+    struct qemu_sigqueue info;	/* Put first signal info here */
 };
 
 /*
@@ -95,8 +95,8 @@ typedef struct TaskState {
     struct image_info *info;
 
     struct emulated_sigtable sigtab[TARGET_NSIG];
-    struct sigqueue sigqueue_table[MAX_SIGQUEUE_SIZE]; /* siginfo queue */
-    struct sigqueue *first_free; /* first free siginfo queue entry */
+    struct qemu_sigqueue sigqueue_table[MAX_SIGQUEUE_SIZE]; /* siginfo queue */
+    struct qemu_sigqueue *first_free; /* first free siginfo queue entry */
     int signal_pending; /* non zero if a signal may be pending */
 
     uint8_t stack[];
-- 
2.32.0


