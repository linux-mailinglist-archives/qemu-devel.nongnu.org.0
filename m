Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081C23142F3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:28:04 +0100 (CET)
Received: from localhost ([::1]:35496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9F0l-00072p-2c
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCh-0003cv-Rf
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:08 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:47038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCg-0006Ix-B4
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:07 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q7so18319994wre.13
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OxasQlrwiThoLa1q6VoVzBYxyPV3qzsQEumjwD3F1As=;
 b=D2+8iSmZcQUdZ2LxXGR9ndmWHmCyhGFxRaw6GIqAeSwN3TlTpoHhtFcz6tD9nuwjqf
 ITaYyBUjxt+kU9DznOCKvJGkOGdB0ij3CaSaVr1NVx75dTvdhPX9csjFhoJiwBox0My+
 XcPpFvLH+MI5uaz3iovb/Z2PrkR4rZ1DnPFpK4fCAB/KNYc0+OTCsg2//EvCt9kBWLGE
 1gXxcfFNiF43CQlzrA6gtz7wcsE99FbpG/3iFhXtxVcNDggeFb1iZFYlw/FlwgMN3elc
 a1j2BQX0p4BSIGZspXlPofg0Kh9Zzi0TGu/hDyk5EUvlDDt3HYbEH6+IbF1fAGUavMLe
 QuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OxasQlrwiThoLa1q6VoVzBYxyPV3qzsQEumjwD3F1As=;
 b=MecMECOJ9CRlju/gPtpB5Gqujn4WkqYCXubaAEzjABAiwVIbmDtf6YT+90giOyP2KD
 YRsVcEmv7qrO0Cf0I6QK2OaDBi8Y7fhGFFLZZE5RwkJv0YX5nUvLBWdeJvNDqtv9+AYh
 GnDwXTQvXCJYjtSsodzR+DQgj0lwgTuqyypWxPb2UorGfvAucXT2BA9iy+EKij81XIIg
 6hGrvQUVHRGy4XoeBJCBGCR+eQ7PREn+MHeJHOJ7DngkDpsQy5KJlKzBfWplzfyD6wFA
 Yz8kC+y2szt9REYzjLQUdsip73IoM7WGWFetujxtthTCYNKp5hlgVDZcWFHK8Ht+qzO8
 c3lQ==
X-Gm-Message-State: AOAM5304bpJXqwNrWV8i0vhM6o4OqVFervcvznDvPXV+ZgpCt/iC/NLX
 CaTy0igDAZbdvTsy66Pu2qhI3pKh8AIz9g==
X-Google-Smtp-Source: ABdhPJzyMriO7f27Uk6hCH1OKEmQCYplfJ7mHfinx6obq84+DmbF8FXeMM99+uzq6GIlIZYXh/vzBA==
X-Received: by 2002:adf:a196:: with SMTP id u22mr2671378wru.416.1612808644087; 
 Mon, 08 Feb 2021 10:24:04 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/46] replay: fix replay of the interrupts
Date: Mon,  8 Feb 2021 19:23:18 +0100
Message-Id: <20210208182331.58897-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 accel/tcg/tcg-accel-ops-icount.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index 87762b469c..13b8fbeb69 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
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



