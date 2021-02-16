Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A714931D036
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 19:29:55 +0100 (CET)
Received: from localhost ([::1]:55208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC56g-0005V0-OJ
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 13:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lC53A-00035d-R7
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:26:18 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lC539-0007Mg-CP
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:26:16 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t15so14334206wrx.13
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 10:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yM4rq8u+ETi4z6NZD5DaT9kH4+V3pplWy8w5X8/SOno=;
 b=YOmNw3S/8pbnv8P9/jx28k+RB396n42r1jlZWzpeNKCf/UnXe+Sf6Vg4vo1WjIZw4Q
 eZwMnKAHclPZj+RUCYey0Apattw+JsUykQljTgPpDk/hr1asFG21qbZBOcgP/OtPnrw3
 YIoJdgZeHtvCB+uxrAF6rH1n6Y+EcUTxoquE/jtPHdZZcnubiInmxpW4vEcq4VW2UCPt
 zHgt3xTDMd+fDf3CC/HLjA9ueM446bFWCI6kLXXw595NI4alcVRKSo5wZ0cnVDuHPVnf
 uOepsZgP/3ZAXVYWsLg/VOD9ex/i238gVhKnbzPYY5vPhTuq5WnIOgGLIRFxMbvTLstB
 Nk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yM4rq8u+ETi4z6NZD5DaT9kH4+V3pplWy8w5X8/SOno=;
 b=bXpb7UvVcRHQckj85PTJov23qMo1BQwCl1JyaeuewyAccUDMJFWNSW7jzdCZgCQ028
 i4ivL/gO4SHi8T8A8fiLSu2SeY7YaIlkUCfph/c3+ZedzvNbAZ3H/heDNCndWR+Fszdk
 IQwfV4k6Uv4tnMoPdoyTw3FqGh4azTfJ65g+J9M71XeedjAQI2KrcqUy3JzJJjqNI4L7
 TAT1R4gmJlKlfM/JoAK7eR2AYx23U5OvTmpXHVsWS8E8RVa6hiAmxOWR7oQ53HzEI8TR
 QkNs7s6WW0bv/x92EwwgJjGemm4F8y1WGKHEby4VMB6aJ64Z5XKTjUhWZlajMQIHAaMg
 11IQ==
X-Gm-Message-State: AOAM5316sI+b1Jumqr14JbblgJmD0NTiOReeV8jCgqI7WOBUf2Am8HtP
 FbIo607d8n6VS23TFZIwk2E2Kaz3zDI=
X-Google-Smtp-Source: ABdhPJwRqsRNvlI5eVwh3Leba6gxgpaM56G95T96RgNdQyL+tN+GVQKMMShpKwDaFwFDJa40WerT2A==
X-Received: by 2002:a5d:620d:: with SMTP id y13mr24943612wru.88.1613499973727; 
 Tue, 16 Feb 2021 10:26:13 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i10sm39394601wrp.0.2021.02.16.10.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 10:26:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/21] event_notifier: Set ->initialized earlier in
 event_notifier_init()
Date: Tue, 16 Feb 2021 19:26:10 +0100
Message-Id: <20210216182611.139813-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210216182611.139813-1-pbonzini@redhat.com>
References: <20210216182611.139813-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.19,
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
Cc: Greg Kurz <groug@kaod.org>, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Otherwise the call to event_notifier_set() is a nop, which causes
the SLOF firmware on POWER to hang when booting from a virtio-scsi
device:

virtio_scsi_dataplane_start()
 virtio_scsi_vring_init()
  virtio_bus_set_host_notifier() <- assign == true
   event_notifier_init() <- active == 1
    event_notifier_set() <- fails right away if !e->initialized

Fixes: e34e47eb28c0 ("event_notifier: handle initialization failure better")
Cc: mlevitsk@redhat.com
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210216120247.1293569-1-groug@kaod.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/event_notifier-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
index 5b2110e861..8307013c5d 100644
--- a/util/event_notifier-posix.c
+++ b/util/event_notifier-posix.c
@@ -66,10 +66,10 @@ int event_notifier_init(EventNotifier *e, int active)
         e->rfd = fds[0];
         e->wfd = fds[1];
     }
+    e->initialized = true;
     if (active) {
         event_notifier_set(e);
     }
-    e->initialized = true;
     return 0;
 
 fail:
-- 
2.29.2



