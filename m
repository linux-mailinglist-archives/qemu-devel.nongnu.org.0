Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027D7314288
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:07:37 +0100 (CET)
Received: from localhost ([::1]:48202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Egx-00050v-Od
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:07:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCR-0003Bf-9f
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:51 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:39546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCP-00069B-NU
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:51 -0500
Received: by mail-wm1-x331.google.com with SMTP id u14so48151wmq.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BX3ZP47xPXHNjViaL+mWjoCAJTKiSXDCljaMBbMGeYI=;
 b=lmPX2d1OfvWm4AP1WhVZ/CjiTSUu3GpTHdjNdIZ3P/B8oVAEPJ/YJlZCHMmhyUlwv9
 PzeAd8R/Vnq9qy9l4SbAc8QWn5f8KT0cq1bdu0s+gb/0rl6gn9V3DNBTGl1FjNYDtKZx
 Z0AlOzMztRjSlk4GKpuVeaEAi4WkWwDg/Cua1DsWqICKmzcjO5bheHiqPYodJyVizOGJ
 j8o6M1dema+qL2hzO4hgCL48jsoPJfUwSr7cR/eAHHLb4nrWvmc9RZLozNXCHGA1mKQt
 AFPoZwzpU1py6jSKXh7IEtaEdejh8dc+iY509yDn6jQeqhOnBL2N8u0qqsYSNXhPhxch
 NbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BX3ZP47xPXHNjViaL+mWjoCAJTKiSXDCljaMBbMGeYI=;
 b=YU2DEvxIWZIwTMR7X1jb5l31Nd2FNVfxo62sBbJVuU5B9r+VlS5zKd4hS57UKSpPrb
 4Qm2fFVgQssZKGziI6H69r3f0+tYzN+FuyETO6exrRRcaiOFrewYFZR230rvRrGskHHR
 gBTlrbVvG6au4Ws5r5IEKjDW4CVohXJqYr5m4WMVHwcQ6O9rfXbpxTYlc/6pHAzTlw37
 c1lNo53ROdSVrN/ykEKWuKtp27TL+cRd6BfaXTR7adTM/9AyK2Sa3QJo/fs4etenFPNm
 uyOSUVMzwxr1DC5JvAgdVbRuDooLjE/dGSdt3rSgHkVb8cNamiV/Q10HLWKRK204qX1Z
 n7Tg==
X-Gm-Message-State: AOAM532XJTPTDfFbW/4nqRkENfxuPNolX0D3aSYMatVo3jW1G3atPg6a
 87csEnVw/Bx61c1ZEMQ+7sXh5Ya9et0fmw==
X-Google-Smtp-Source: ABdhPJy0GjbZLAQfF3glDgt1ccsyMogCn/EDRMvzLUl7YfvTXvZ8IVRvZ+6aFu9hykD1OhU/j/JXHg==
X-Received: by 2002:a1c:9851:: with SMTP id a78mr92422wme.66.1612808628329;
 Mon, 08 Feb 2021 10:23:48 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/46] event_notifier: handle initialization failure better
Date: Mon,  8 Feb 2021 19:23:01 +0100
Message-Id: <20210208182331.58897-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

Add 'initialized' field and use it to avoid touching event notifiers which are
either not initialized or if their initialization failed.

This is somewhat a hack, but it seems the less intrusive way to make
virtio code deal with event notifiers that failed initialization.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Message-Id: <20201217150040.906961-4-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/event_notifier.h |  1 +
 util/event_notifier-posix.c   | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/qemu/event_notifier.h b/include/qemu/event_notifier.h
index 3380b662f3..b79add035d 100644
--- a/include/qemu/event_notifier.h
+++ b/include/qemu/event_notifier.h
@@ -24,6 +24,7 @@ struct EventNotifier {
 #else
     int rfd;
     int wfd;
+    bool initialized;
 #endif
 };
 
diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
index 00d93204f9..5b2110e861 100644
--- a/util/event_notifier-posix.c
+++ b/util/event_notifier-posix.c
@@ -29,6 +29,7 @@ void event_notifier_init_fd(EventNotifier *e, int fd)
 {
     e->rfd = fd;
     e->wfd = fd;
+    e->initialized = true;
 }
 #endif
 
@@ -68,6 +69,7 @@ int event_notifier_init(EventNotifier *e, int active)
     if (active) {
         event_notifier_set(e);
     }
+    e->initialized = true;
     return 0;
 
 fail:
@@ -78,12 +80,18 @@ fail:
 
 void event_notifier_cleanup(EventNotifier *e)
 {
+    if (!e->initialized) {
+        return;
+    }
+
     if (e->rfd != e->wfd) {
         close(e->rfd);
     }
+
     e->rfd = -1;
     close(e->wfd);
     e->wfd = -1;
+    e->initialized = false;
 }
 
 int event_notifier_get_fd(const EventNotifier *e)
@@ -96,6 +104,10 @@ int event_notifier_set(EventNotifier *e)
     static const uint64_t value = 1;
     ssize_t ret;
 
+    if (!e->initialized) {
+        return -1;
+    }
+
     do {
         ret = write(e->wfd, &value, sizeof(value));
     } while (ret < 0 && errno == EINTR);
@@ -113,6 +125,10 @@ int event_notifier_test_and_clear(EventNotifier *e)
     ssize_t len;
     char buffer[512];
 
+    if (!e->initialized) {
+        return 0;
+    }
+
     /* Drain the notify pipe.  For eventfd, only 8 bytes will be read.  */
     value = 0;
     do {
-- 
2.29.2



