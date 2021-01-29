Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D05F3088A7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:56:01 +0100 (CET)
Received: from localhost ([::1]:56512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SNc-0006PQ-BQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnN-0004Ta-2j
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:33 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnL-0005zf-IA
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:32 -0500
Received: by mail-ej1-x634.google.com with SMTP id a10so12414982ejg.10
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BX3ZP47xPXHNjViaL+mWjoCAJTKiSXDCljaMBbMGeYI=;
 b=QUx+D9jSQ+dYm70E6uBoAjLvi3BrjESCdjEm1yw+3lKYQp774bdGjixGRBoOZz760K
 cimiBApOJfWfhEOgFIYJAD+ASf93n3xQ1PusrUQLBsU0WaJglI0OwwYiMrCpRffYPrXB
 oZgoMIwCKu7KQGkW5W25LeC+rCuEPbPPfB4Rb6YKr9/52QjQPTrmsKCR/R43qlOHne8n
 XVFiKGVDoHv1DPvs1U73KR4sqtlhAheAT3mLmy9gH4VFRU85gp7302Jsc6Bh6aeqhwYg
 RMl8cFTSZwatVJY3SvWofqM+XPt/911ls85oAdBT6oq/sPBclPhmBXD9WsTEm2Mm1OCx
 Ntmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BX3ZP47xPXHNjViaL+mWjoCAJTKiSXDCljaMBbMGeYI=;
 b=t7b1dYcNkPYxD24hhDLh7pOx7vn5BdTnUS0fWaXOqXU65pqYJ9W3xAiqTaIAPNgL9h
 cuRqikAbq1Kz81jgcXotD5xHZRg03xJ+EZH+MwYonRKDGPxHW1w5dbMEjIpFHfpzHu9g
 lQ6I4DqMqYaLfJo9EVMCGr4G3cmYb5vJ9bRcDKoC6xxkJpOhYmH4iq4soE0Rwp9eEq05
 +rx10qpVQ1ZJtjdpMvRidd1BBkCLKIOL0JLzw23VhG2rse41X18rip6JMbIPJ/A1PF5B
 Uts26+Tgutl2/O/zJCbzlzgfOvPFTX8JWthebi1BGm1KjMLu4dg6hG74+03urrxH520t
 RpUQ==
X-Gm-Message-State: AOAM530NvnGVv5HXz2vQVSZIkhyXG/JNJiSQCrdMKEZZZCH/2JT8/fId
 5x20fJT7TkYSzSEaPXJQqXuau32q5TjXPA==
X-Google-Smtp-Source: ABdhPJzllg4TiJEeKe6Nkn0lSWUSVk9czCcM2tbvEV3v6YE6s9JsrX7RBdnraqiuLKc/NB6slAWunQ==
X-Received: by 2002:a17:906:fa85:: with SMTP id
 lt5mr4079596ejb.344.1611919110281; 
 Fri, 29 Jan 2021 03:18:30 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/36] event_notifier: handle initialization failure better
Date: Fri, 29 Jan 2021 12:17:54 +0100
Message-Id: <20210129111814.566629-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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



