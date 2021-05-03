Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9808371443
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:28:14 +0200 (CEST)
Received: from localhost ([::1]:41448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWkH-0001DR-IR
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWi6-0008KV-0I
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:25:58 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:42925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWi4-0003XB-75
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:25:57 -0400
Received: by mail-ed1-x529.google.com with SMTP id j28so5823901edy.9
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 04:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dTX1qlMVrqn0zkYoEbmN6njTA5ZU+LQuOVOSTFV+c4o=;
 b=WDATq7UIhzfD2OnvlG++ZnbUl+HkR0n5eHFVpHnUS64nZEAuWynqHfQHoZlMkCNmnd
 XMW9J/ZUl824wVtePzGF5QDa55AZGXj1Cem3MMjidiEAndaRhYWenWPuYtC1GtGGjTcb
 sVCWwE/IozbE5sb7r5RrKD36BAdqJLZ7mp7T1ShS+5/sKr7xg1UzD1EU4bEB/3mSoDC4
 rZzzSNUSdHBsZ8LlxPXWPcHeIkm93ZRnWMZTfsV4pR13wGLEpQqR8y1SjcdjpGSgeaf1
 GZr+6T1gyCxCCWGTXZVP65OSd1RD2+VW/lv4Rt8KGnRlluZcZXEdXh+LR8B5D56m7fnQ
 MIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dTX1qlMVrqn0zkYoEbmN6njTA5ZU+LQuOVOSTFV+c4o=;
 b=Nu7M6Tfo82hsf6hSi7kZZK//0T19gm1mxMN/GhdbLZnOO258GjKr0gvKHpcr194HZK
 JxCCprjMAOdwwIerP8KebSDRSBiha59iyTO+YWE5ZJeAfrgOygpAGtVEQ8xGRUpwO0Iw
 DhCskO1vE26ZXPPV6kf2mKMIZZYZ2aHh3ZLftR2Yxn0SQ/DmvzwTA+mCOtwJEiAGQKxG
 OEicSr243VOTozizK7Jp7g2JEf4thtRu6r/yw4Gbc7czO8EddSzWTmDo7yH575pR4z0P
 eNe3457uTzLCPrQ92NX4XUfR+OTDA55u8BwaeD3Fs5uBTqssnEzeOMRPVVXn4fwP3JfU
 zPgg==
X-Gm-Message-State: AOAM532dSZpxzF6FsdpOiGRgQXfFgMCFyN3Vv2esrNeZyNR1LXvqfSeI
 TTjGibHhcBSKTyBewNpJ+XVqhFohmRo=
X-Google-Smtp-Source: ABdhPJy0xC11js1GuAIjQ/4i7NCnKSJzQ9f3TZfBKKaU3H3jz74t52SKOxwVqnAJetcSlqXjkDLKAw==
X-Received: by 2002:a50:fc99:: with SMTP id f25mr19484673edq.147.1620041154884; 
 Mon, 03 May 2021 04:25:54 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id gn36sm2981317ejc.23.2021.05.03.04.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 04:25:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] coroutine-sleep: disallow NULL QemuCoSleepState** argument
Date: Mon,  3 May 2021 13:25:46 +0200
Message-Id: <20210503112550.478521-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503112550.478521-1-pbonzini@redhat.com>
References: <20210503112550.478521-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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

Simplify the code by removing conditionals.  qemu_co_sleep_ns
can simply use point the argument to an on-stack temporary.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h    |  5 +++--
 util/qemu-coroutine-sleep.c | 18 +++++-------------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index ce5b9c6851..c5d7742989 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -295,7 +295,7 @@ typedef struct QemuCoSleepState QemuCoSleepState;
 
 /**
  * Yield the coroutine for a given duration. During this yield, @sleep_state
- * (if not NULL) is set to an opaque pointer, which may be used for
+ * is set to an opaque pointer, which may be used for
  * qemu_co_sleep_wake(). Be careful, the pointer is set back to zero when the
  * timer fires. Don't save the obtained value to other variables and don't call
  * qemu_co_sleep_wake from another aio context.
@@ -304,7 +304,8 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
                                             QemuCoSleepState **sleep_state);
 static inline void coroutine_fn qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
 {
-    qemu_co_sleep_ns_wakeable(type, ns, NULL);
+    QemuCoSleepState *unused = NULL;
+    qemu_co_sleep_ns_wakeable(type, ns, &unused);
 }
 
 /**
diff --git a/util/qemu-coroutine-sleep.c b/util/qemu-coroutine-sleep.c
index eec6e81f3f..3f6f637e81 100644
--- a/util/qemu-coroutine-sleep.c
+++ b/util/qemu-coroutine-sleep.c
@@ -32,9 +32,7 @@ void qemu_co_sleep_wake(QemuCoSleepState *sleep_state)
                                            qemu_co_sleep_ns__scheduled, NULL);
 
     assert(scheduled == qemu_co_sleep_ns__scheduled);
-    if (sleep_state->user_state_pointer) {
-        *sleep_state->user_state_pointer = NULL;
-    }
+    *sleep_state->user_state_pointer = NULL;
     timer_del(&sleep_state->ts);
     aio_co_wake(sleep_state->co);
 }
@@ -63,16 +61,10 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QEMUClockType type, int64_t ns,
     }
 
     aio_timer_init(ctx, &state.ts, type, SCALE_NS, co_sleep_cb, &state);
-    if (sleep_state) {
-        *sleep_state = &state;
-    }
+    *sleep_state = &state;
     timer_mod(&state.ts, qemu_clock_get_ns(type) + ns);
     qemu_coroutine_yield();
-    if (sleep_state) {
-        /*
-         * Note that *sleep_state is cleared during qemu_co_sleep_wake
-         * before resuming this coroutine.
-         */
-        assert(*sleep_state == NULL);
-    }
+
+    /* qemu_co_sleep_wake clears *sleep_state before resuming this coroutine.  */
+    assert(*sleep_state == NULL);
 }
-- 
2.31.1



