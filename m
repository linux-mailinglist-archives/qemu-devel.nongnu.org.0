Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D6F4D4878
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:57:50 +0100 (CET)
Received: from localhost ([::1]:36148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJIb-00017T-On
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:57:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9z-00075v-NJ; Thu, 10 Mar 2022 07:44:51 -0500
Received: from [2a00:1450:4864:20::430] (port=33642
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9x-0005GW-Lx; Thu, 10 Mar 2022 07:44:51 -0500
Received: by mail-wr1-x430.google.com with SMTP id j17so7850801wrc.0;
 Thu, 10 Mar 2022 04:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nT+l8ptDt61ghJ2d9zhtYyUlzG0YgTu30zE7V3Dxlek=;
 b=QPaaKshCe/aFzxAcH+4LzUmA0tl/BsWlWTIgGzmaLPnePtQIZBB6XUpB/0OklOkORd
 BShy/3NL+NYYc0+GAxX5eOrHxtFxSo1pHBkdlxRGyXnkGq2foN2QJFL4XcixejC08S26
 w6MRVLRsM20URa7FogBGiB9Z5NsrJ3P/+h3WGfUIeGYw1VPa8xI5Lm791dHCtzpkz9a1
 lnXwiM/g7WeSWFyHNN4J/ph7Kmh1hfmXfpU1/trfJClJzshgRS8fL4BGl8W24vkKQFpW
 Tbd05dsnKjzYwO4/1cxdtlwkKN7CVyvCL10nRRbjGgsy8u5QuAnD0u2voP6CQcbjYatK
 M4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nT+l8ptDt61ghJ2d9zhtYyUlzG0YgTu30zE7V3Dxlek=;
 b=kLckmwk/HE0EDQoRHzFTrsKCiqrrLjQ5F3c198ynYMpCjW0MHJfseOERYZrtVTnpxE
 ADCB0/F2IXF1XlVXt8WvzH00FsIzPwruAzyVFK83rkiaf2wLBa6dMf86yBR3ZxtrJZiq
 9QXGsEzs6SLaM6JqHzIviESsJ8Dupx+JLDgIZ0DHCoZ9/mAE1GNEiBdivl6QMVH0mptF
 9wse55ESX8FnO8h05TrcO8G4ivzZmFuhyrPaXVipNuJm512zAPpsaxbHFKSqyFWR1YPo
 cwE61Bi4SUvuwTcYJkM9zT+9huxV3m4Sd03aqL0kPMV0fNLqqlBLcHw0FJAMVbWUocr3
 +fBg==
X-Gm-Message-State: AOAM530YqLklVs+VnM/WzjMH8SwlzJvmKsgvTl00kCdBV6O2TOuxKl2+
 wipwII0khl33eztrBdSQes1zvYdc6HY=
X-Google-Smtp-Source: ABdhPJwn+GBW+G2lfqkBpZE30U/PIKR0le91KvlfHqdf+ZJyurDrfKCJh59x9ojVDQLFN3arIxIleQ==
X-Received: by 2002:adf:e44b:0:b0:1f0:250a:d3ef with SMTP id
 t11-20020adfe44b000000b001f0250ad3efmr3461052wrm.402.1646916288138; 
 Thu, 10 Mar 2022 04:44:48 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/35] convert qemu_co_mutex_lock_slowpath to magic macros
Date: Thu, 10 Mar 2022 13:44:04 +0100
Message-Id: <20220310124413.1102441-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the hand-written frame structure with one built with the CO_* macros,
just to shake them a bit.  The produced code is exactly the same (except for
CO_INIT_FRAME using a statement expression to keep the "return" statement
visible in the code).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-lock.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 061a376aa4..51f7da8bda 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -198,21 +198,13 @@ static void coroutine_fn qemu_co_mutex_wake(CoMutex *mutex, Coroutine *co)
     aio_co_wake(co);
 }
 
-struct FRAME__qemu_co_mutex_lock_slowpath {
-    CoroutineFrame common;
-    uint32_t _step;
-    AioContext *ctx;
-    CoMutex *mutex;
-    Coroutine *self;
-    CoWaitRecord w;
-};
+CO_DECLARE_FRAME(qemu_co_mutex_lock_slowpath, AioContext *ctx, CoMutex *mutex, Coroutine *self, CoWaitRecord w);
 
 static CoroutineAction co__qemu_co_mutex_lock_slowpath(void *_frame)
 {
     struct FRAME__qemu_co_mutex_lock_slowpath *_f = _frame;
-    AioContext *ctx = _f->ctx;
-    CoMutex *mutex = _f->mutex;
-    Coroutine *self;
+    CO_ARG(ctx, mutex);
+    CO_DECLARE(self);
     unsigned old_handoff;
 
 switch(_f->_step) {
@@ -244,11 +236,11 @@ case 0: {
     }
 
 _f->_step = 1;
-_f->self = self;
+CO_SAVE(self);
     return qemu_coroutine_yield();
 }
 case 1:
-self = _f->self;
+CO_LOAD(self);
     trace_qemu_co_mutex_lock_return(mutex, self);
     mutex->holder = self;
     self->locks_held++;
@@ -260,12 +252,7 @@ return stack_free(&_f->common);
 
 static CoroutineAction qemu_co_mutex_lock_slowpath(AioContext *ctx, CoMutex *mutex)
 {
-    struct FRAME__qemu_co_mutex_lock_slowpath *f;
-    f = stack_alloc(co__qemu_co_mutex_lock_slowpath, sizeof(*f));
-    f->ctx = ctx;
-    f->mutex = mutex;
-    f->_step = 0;
-    return co__qemu_co_mutex_lock_slowpath(f);
+    return CO_INIT_FRAME(qemu_co_mutex_lock_slowpath, ctx, mutex);
 }
 
 CoroutineAction qemu_co_mutex_lock(CoMutex *mutex)
-- 
2.35.1



