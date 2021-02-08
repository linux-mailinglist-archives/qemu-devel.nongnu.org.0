Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EB53142F2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:27:56 +0100 (CET)
Received: from localhost ([::1]:34828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9F0d-0006m4-RM
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCj-0003eI-2M
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:09 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCh-0006KH-JB
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:08 -0500
Received: by mail-wr1-x431.google.com with SMTP id m13so18331295wro.12
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wzas9nPDHeC19h63FyETLqv4l2H2HoLw6OxXXEW21pU=;
 b=D1iKcued5VbnKmj35O26iPsgiw6g21XVloAbEZdP5qh3v2tFx1uof5L0nfn8HCqwo3
 3hQZY28AF+btt9n4hISOfedezzPgiDlZnL8RWM47zPazaFvdGTdodu+ijK/uNZv8JVXK
 Qy/R0QXyhFT2MoQH6XD47Wj/C9+LqKfUWqSEhQnt9d1fGAIyBEnqkvgJvK9QIeLbelzI
 moyXKo4BAy0OfVg9D5MPixJBCj+iQocOI67Uap5tGens/p3V2WXdufEE2I0WuGl7q+gO
 J/xcQpNoRlvCR8TD5KjmM2FvBrKOcA+ukIfp6xB9XJjMinTJ5gFEvgLcTRDBysuV2JMM
 Oetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wzas9nPDHeC19h63FyETLqv4l2H2HoLw6OxXXEW21pU=;
 b=rLB0D00LG+/hhb3hbcSUREHXvGseyUbMwVHav0pjzFhZiAfh4uigPfVNdweWOmB0ho
 8GBfGKBmxEwtebp0qaOEw8wZOrSr1KXRDYc8VnuxG4narVS+9Pew2vy8K/EzwepYHRaP
 WOwWX4tVfpgMhVJHhi5l6QrJBa7xKDQE+Bv8p3mfLb47nOKMgDJO/I6mwRRzLknczyWV
 3Fs057jkdB0+nBcby7S6q11Up+FIckBJwcBQhkY4/nQinxErZSiJg40hDuehtao5XkiB
 FDZ6IjXDuioGh9SrQytVbp78rMv6SmMD2WDGlRkOjIonHyxPOzKWzv0Qe7Cd9InqWf9i
 0gRw==
X-Gm-Message-State: AOAM533CE17rzSw+cxq8vVI3gEFjIEw4CE8UCuwHZVRuRXW2XzbWsgJn
 dmF0qc2lAMSCWvzUa48rKEVozAZJG5Au4g==
X-Google-Smtp-Source: ABdhPJzGtqm7NIw1nwikxgkaoDp3rMuNM9PO57yFsOvSdYsCn4gwDF22aRoK6jUCeGN3yBs/KnbvAQ==
X-Received: by 2002:a5d:4646:: with SMTP id j6mr21344889wrs.38.1612808645933; 
 Mon, 08 Feb 2021 10:24:05 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:05 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/46] replay: rng-builtin support
Date: Mon,  8 Feb 2021 19:23:20 +0100
Message-Id: <20210208182331.58897-36-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
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

This patch enables using rng-builtin with record/replay
by making the callbacks deterministic.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <161233201286.170686.7858208964037376305.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 backends/rng-builtin.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/backends/rng-builtin.c b/backends/rng-builtin.c
index f38dff117d..f367eb665c 100644
--- a/backends/rng-builtin.c
+++ b/backends/rng-builtin.c
@@ -10,6 +10,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "qom/object.h"
+#include "sysemu/replay.h"
 
 OBJECT_DECLARE_SIMPLE_TYPE(RngBuiltin, RNG_BUILTIN)
 
@@ -37,7 +38,7 @@ static void rng_builtin_request_entropy(RngBackend *b, RngRequest *req)
 {
     RngBuiltin *s = RNG_BUILTIN(b);
 
-    qemu_bh_schedule(s->bh);
+    replay_bh_schedule_event(s->bh);
 }
 
 static void rng_builtin_init(Object *obj)
-- 
2.29.2



