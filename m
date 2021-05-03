Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AF8371442
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:28:14 +0200 (CEST)
Received: from localhost ([::1]:41434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWkH-0001D7-7T
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWi7-0008Lm-Ri
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:25:59 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWi6-0003Ym-8x
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:25:59 -0400
Received: by mail-ej1-x636.google.com with SMTP id zg3so7286113ejb.8
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 04:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gAYRYwWRZ16e9tOKn/1g9T/J1cAn4xBH38wpU2HJJek=;
 b=XEoNr/3WotaFEKaLOaGqzK6QkhRgJvoKO2G+n0tZ8v45pS3gZsNDC33LdnA3L8m9QN
 i6A8QLFEoWaL1DjiYZtFGFH/561gEEQj6l9VUSCRX5vOIhcBuQjBUT9N0LrXGXXHVWZ9
 eEJQpe/1+e6yMFadszDNw1+452J3tQy8y4HO6kDKyWBICVmanICM3jrWzwb4sC5CDxWR
 0VDblUYE1aPNb8sBDPU6LksWr3KMlWkoRuznxA5nmOySXzjjzQk1PmRHhOLtyHWQV7Vd
 wZtG7hM96NErWXlXJRDysq0IUdVe5gvQHVwFtxj7WFoS0SZVrTSO4WJEyCjUsQ7+YB5k
 LuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gAYRYwWRZ16e9tOKn/1g9T/J1cAn4xBH38wpU2HJJek=;
 b=XgIJzTMm328U0PA18Vm0BRjRROKxVuQa5PqsjdrWbfZ4hV9czPtL5aGZEVo7GH5itu
 7s6UtUrjKmtHayFwIFEPUGKqx7FIfF3Dc4Y6RwPKOif+2ZaqtIINsmEuV581JuiXdbeg
 7MpPqnLRu3EOlJUGhN3r9317sUFUsFpTlRurE6gKJ3KLna7byTTc6kNAeRHlbHNXGP8r
 7HXOeX8PfBQDTdOGHYHsQT4nWStTTCiIWsyMolrVBrYO9YE4P4KcRuF8snkdB7+JsGeN
 JpkoLks7q8Tp44Yqfxmpv4NfdnOFVU9GRfiCdGIP5UmsbGUlpKpHrhRWyYHlB8zBf5y/
 CeEw==
X-Gm-Message-State: AOAM5320fFVi66XZBw8KHd/zstBsGInlwcQNTHcakRROHqGFrvytmqEp
 dY6X3N58XoWvYqNL6nxgpTeNOE/Ug8w=
X-Google-Smtp-Source: ABdhPJxo0GYPf95ZoOKkYEcz/xClQRuM33Uk5S3ctmDVdtK6GZH2wFoS5yHHHy+AnsGUtDooKK6yDA==
X-Received: by 2002:a17:906:1957:: with SMTP id
 b23mr16266840eje.209.1620041157001; 
 Mon, 03 May 2021 04:25:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id gn36sm2981317ejc.23.2021.05.03.04.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 04:25:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] coroutine-sleep: move timer out of QemuCoSleepState
Date: Mon,  3 May 2021 13:25:48 +0200
Message-Id: <20210503112550.478521-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503112550.478521-1-pbonzini@redhat.com>
References: <20210503112550.478521-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
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
Cc: eesposit@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This simplification is enabled by the previous patch.  Now aio_co_wake
will only be called once, therefore we do not care about a spurious
firing of the timer after a qemu_co_sleep_wake.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-sleep.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/qemu-coroutine-sleep.c b/util/qemu-coroutine-sleep.c
index 096eea3444..68e9505b2e 100644
--- a/util/qemu-coroutine-sleep.c
+++ b/util/qemu-coroutine-sleep.c
@@ -21,7 +21,6 @@ static const char *qemu_co_sleep_ns__scheduled = "qemu_co_sleep_ns";
 
 struct QemuCoSleepState {
     Coroutine *co;
-    QEMUTimer ts;
     QemuCoSleepState **user_state_pointer;
 };
 
@@ -34,7 +33,6 @@ void qemu_co_sleep_wake(QemuCoSleepState *sleep_state)
 
         assert(scheduled == qemu_co_sleep_ns__scheduled);
         *sleep_state->user_state_pointer = NULL;
-        timer_del(&sleep_state->ts);
         aio_co_wake(sleep_state->co);
     }
 }
@@ -49,6 +47,7 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
                                             QemuCoSleepState **sleep_state)
 {
     AioContext *ctx = qemu_get_current_aio_context();
+    QEMUTimer ts;
     QemuCoSleepState state = {
         .co = qemu_coroutine_self(),
         .user_state_pointer = sleep_state,
@@ -63,10 +62,11 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
         abort();
     }
 
-    aio_timer_init(ctx, &state.ts, type, SCALE_NS, co_sleep_cb, sleep_state);
+    aio_timer_init(ctx, &ts, type, SCALE_NS, co_sleep_cb, sleep_state);
     *sleep_state = &state;
-    timer_mod(&state.ts, qemu_clock_get_ns(type) + ns);
+    timer_mod(&ts, qemu_clock_get_ns(type) + ns);
     qemu_coroutine_yield();
+    timer_del(&ts);
 
     /* qemu_co_sleep_wake clears *sleep_state before resuming this coroutine.  */
     assert(*sleep_state == NULL);
-- 
2.31.1



