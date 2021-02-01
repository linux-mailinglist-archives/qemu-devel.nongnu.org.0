Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5450B30AA59
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:03:00 +0100 (CET)
Received: from localhost ([::1]:53974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ajD-0004wW-6d
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l6agw-0002yU-1P
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:00:39 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:50271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l6agn-0002g3-6M
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:00:30 -0500
Received: by mail-wm1-x332.google.com with SMTP id 190so12919842wmz.0
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 07:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KaxKbiDjsXdrLxm2nSpi8ljAnEHtCQ/fjXzgNt1vNPg=;
 b=glwjrc02nO7TPAMHf73k/KnHeg+rXmQOWBRsqzJgQobhkhywcl3D/Zs/CSOsot+kA6
 KTst0HttgkZ8Wed7JsrvjoZY/7XqaQBt5meMmzIFGclb5Pok8MvWlrYHLQx87viUZ6Yy
 4ruAxi5YOn4Ot9HQRvzbGqedvbeObPbHt8F8PIe3LrRe43uq3zVwH/eTvmnu1oNiAbYc
 5tm61jbIXY11LUyE/LvSPVXjtFdsThbIhMfRgBHZhMImL7ok0ntsSq8UtDY53JqKfkXG
 k075zeA35Dfai0Vz0tGEqhBU12XrRgfnt4RRw0IdAd/J1dluwN/2mXTXqfoycrSO+R7x
 NanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KaxKbiDjsXdrLxm2nSpi8ljAnEHtCQ/fjXzgNt1vNPg=;
 b=HfeIz9/QJMXwY7BY1fdQcdWlGh9JysOXAphdRnPrJ5aLV75pKLmDFcvX5YQ71KN2hn
 7op5gREHAk+8ZTVm1BAoXC99OnLywny8Gxyc4yN6VT6x/q6PZ3JAuWxfQiF4UcGMZ7TS
 EcjZpI+CmVP6zDcY7gRsZHz1G0AvIT474FNy/+xPoUHKs1lnbC7YfKXNGwxf6l6uPcMO
 IIKWpbVtsj1MdpuTer1AgkPus/bsWrQNhlCGwyfP2kaz2ySh6qFrEcO1GOYXENK7Yj9N
 9ge3H06J3MTfsdcQFLnqzeT0J1rc5uftblHdut8Bm36pCKt1Bw4Ra34e6v2NQey5fCXv
 tmEg==
X-Gm-Message-State: AOAM531m2gWU31vXrlB9XXptgnCgcKnpH2V5u6YAggCTzcku9LVVp6sP
 gAyRoootd9MAcyGdO6jn7vGy7j+CY6Qb3g==
X-Google-Smtp-Source: ABdhPJxsA95sPL4GSmQXKxA+uwGduBBBwPe2pVRFwRbt2NW3J5aCem9rz+phhORmIh4XlccV7Th3Sg==
X-Received: by 2002:a1c:6289:: with SMTP id w131mr7389709wmb.0.1612191625535; 
 Mon, 01 Feb 2021 07:00:25 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 q6sm25879813wrw.43.2021.02.01.07.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 07:00:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/38] replay: fix replay of the interrupts
Date: Mon,  1 Feb 2021 16:00:20 +0100
Message-Id: <20210201150021.53398-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210201150021.53398-1-pbonzini@redhat.com>
References: <20210201150021.53398-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

Sometimes interrupt event comes at the same time with
the virtual timers. In this case replay tries to proceed
the timers, because deadline for them is zero.
This patch allows processing interrupts and exceptions
by entering the vCPU execution loop, when deadline is zero,
but checkpoint associated with virtual timers is not ready
to be replayed.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

Message-Id: <161216312794.2030770.1709657858900983160.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/tcg/tcg-cpus-icount.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-cpus-icount.c
index 9f45432275..8ed485db01 100644
--- a/accel/tcg/tcg-cpus-icount.c
+++ b/accel/tcg/tcg-cpus-icount.c
@@ -81,7 +81,13 @@ void icount_handle_deadline(void)
     int64_t deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
                                                   QEMU_TIMER_ATTR_ALL);
 
-    if (deadline == 0) {
+    /*
+     * Instructions, interrupts, and exceptions are processed in cpu-exec.
+     * Don't interrupt cpu thread, when these events are waiting
+     * (i.e., there is no checkpoint)
+     */
+    if (deadline == 0
+        && (replay_mode != REPLAY_MODE_PLAY || replay_has_checkpoint())) {
         icount_notify_aio_contexts();
     }
 }
-- 
2.29.2



