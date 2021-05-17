Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17116382977
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:08:26 +0200 (CEST)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaAj-000736-6T
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lia8L-0004mi-0G; Mon, 17 May 2021 06:05:57 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lia8I-0001fK-1a; Mon, 17 May 2021 06:05:56 -0400
Received: by mail-ej1-x62d.google.com with SMTP id lz27so8283347ejb.11;
 Mon, 17 May 2021 03:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f3bgpbEohNOOBOFnBrKBrT5ery7OficY23T1F2PzmYo=;
 b=ITMwkaOo6yy1XE3EjRD+L42V3BMweWWEGDqdC9GiGJOWk3dlEZx/2mJmYB+v9qN2ln
 FenIKH6D/k6gcOyskVbZGKNS3/bLWTUEp+mef4K9fZereCrxMYjdfd1rRbXVZFVBEGYR
 sk6ri3TVt8UszMWDVD1XlwM0IJ+y1UmjmV7GLmqispbxhhTTy/0WciES+jPOLNjrlD4c
 VsnKCZv/k+1SB+Pft8DcAhsqO6A2AR4BsXxKg21pRiT5lGA9mFmeBmToG6nLHtJkT6YC
 j8aIzrvf3WeJrNtBD6Sa2dHmmjVilRbTvMGNdzD4cIUpru0EQf8e4dewAz+XK9GeqTFv
 d1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=f3bgpbEohNOOBOFnBrKBrT5ery7OficY23T1F2PzmYo=;
 b=EYOc3varTVbBVWuVujjM+Trbkja1z1ZQCez/dgy+GlExNuRIxGJYgPJUoETvy+AaQ7
 U/OOICkzuCZNxqgAc6W8liaNkmP4aqg5qkfgIkUMAJhKoi+IZ/wjQBqUfhHKSJ54c66Q
 CX2oh9B76cry4yhd3HacGlt9MmJqOLefz54Ycr8t4mddDN1T6Dio9WxtZdszcOBv7ACQ
 UqvIZJvCLfSL+gQt+ZFyiHAIRc2796tlsX/6jXyRPLFi9+f6GqqSsMHl/mUysjd0RPNi
 h32g6MpppGKenCVU7Nrc4GEUqGcmK2ZXMBwJ6C+d+uA+7KoSn3cSSgqKlbakdEC+47tb
 gYJg==
X-Gm-Message-State: AOAM531ADmJ9e5BcEt4fCNCSNpgGtspkkxq3DRogpzaKig6ywJCaaBge
 i8S46aQgi6c7MQmUfqL/U/8U4z5n2Elzig==
X-Google-Smtp-Source: ABdhPJwX6CtdnaM+EkQn7bQq6q3DzebhFqNGdjQtrm7zJuSgut1TSgKCRHcO/067pv9c+nw3/s8kRw==
X-Received: by 2002:a17:906:e210:: with SMTP id
 gf16mr4812659ejb.472.1621245952399; 
 Mon, 17 May 2021 03:05:52 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id h9sm10659926ede.93.2021.05.17.03.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:05:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] coroutine-sleep: disallow NULL QemuCoSleepState**
 argument
Date: Mon, 17 May 2021 12:05:44 +0200
Message-Id: <20210517100548.28806-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517100548.28806-1-pbonzini@redhat.com>
References: <20210517100548.28806-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, stefanha@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify the code by removing conditionals.  qemu_co_sleep_ns
can simply point the argument to an on-stack temporary.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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



