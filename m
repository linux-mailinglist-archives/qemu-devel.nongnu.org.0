Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB1A680F5A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:51:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUYS-0007p5-1q; Mon, 30 Jan 2023 08:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUWf-0004nh-A1
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:53 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUWd-0003n1-Nz
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:49 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 cl23-20020a17090af69700b0022c745bfdc3so4551043pjb.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZSa3rJ4rdM+JL+7J+WlKqYqNPxt3Id/p0w4TcjJhfgI=;
 b=C8rTS8HwSZLAVNTETPWInzI0QJUP9LQyF/gJy7pSoc53JzW6sxIO7OyWamdAJca8XR
 R9Eo4YPpI/4qXQyUJJj79PqlMYKBnIcXuH+oRWGS1mkn6MJ7kNPirFgVu9nVpt1LmMQR
 59YdWllZXTCm5Jwcv19fZt+dAKzJT1K8IJJ4hWfvl/qzzg+2touTqLcyUMTiCgHOvsIw
 b9kk+fNtU3iMND0FfayChTecuGazWc8x7s7s7o+BG5Xw0wZC2kTDGWhgXRSE5KthJYwq
 0ABWCY+bgxAXrFSj2UoVLwMQORtSunxO4hAOU6L+HFPW8S+1auzIgU7whfd81HbX2iuf
 WYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZSa3rJ4rdM+JL+7J+WlKqYqNPxt3Id/p0w4TcjJhfgI=;
 b=LkPAHbHrgQeek4kWhRvcNAWPP1yIlEb12GbiYNqa9zylHPWaM7e2mibLwaPZKdcL6M
 NUT5rLiAyMULWGfdiHprqlVis3sjj2eaoaggOmZ9MCSvw9+Ox91uDJ7b/ux3y4LOzzkC
 x/1AFol7ptxkzLBbkqUnKklbKWtgfGJHQc2s7DOE746u9E4XVoPEvl/hLd8/CdFNh5s7
 Aza9/y3SMwmNMbW6OWkf7R/uPxdtNH/0PGKiwvFdebvSocBQxjJKoYsEtqZsXkzqTvHO
 cbUvZ2Y4961rjypSJw8feiMFfRG0cUQFRdrF0/uPaWwImJKRRMv5TgTBW5qs4TfjYmhS
 iZGQ==
X-Gm-Message-State: AO0yUKVvW7s53FzxF1rjHKjRyhYxwba4j28tf1zwc2gd0IaySBMBBzEC
 s9jz9KC7yBS23Vr7mgnj0R5cqA==
X-Google-Smtp-Source: AK7set9mUU5IVM/YkpJ7yDYgS1KLJzMOUyJ/k/03I4sEJv99bCAMaZyh0fa0NfjfFuaM0rfM9H8pCw==
X-Received: by 2002:a17:902:c60b:b0:196:12de:2810 with SMTP id
 r11-20020a170902c60b00b0019612de2810mr20392133plr.10.1675086527128; 
 Mon, 30 Jan 2023 05:48:47 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b0018bc4493005sm7815573plk.269.2023.01.30.05.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:48:46 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 26/28] e1000e: Do not assert when MSI-X is disabled later
Date: Mon, 30 Jan 2023 22:47:13 +0900
Message-Id: <20230130134715.76604-27-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130134715.76604-1-akihiko.odaki@daynix.com>
References: <20230130134715.76604-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Assertions will fail if MSI-X gets disabled while a timer for MSI-X
interrupts is running so remove them to avoid abortions. Fortunately,
nothing bad happens even if the assertions won't trigger as
msix_notify(), called by timer handlers, does nothing when MSI-X is
disabled.

This bug was found by Alexander Bulekov when fuzzing igb, a new
device implementation derived from e1000e:
https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/

The fixed test case is:
fuzz/crash_aea040166819193cf9fedb810c6d100221da721a

Fixes: 6f3fbe4ed0 ("net: Introduce e1000e device emulation")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index ff93547f88..76c7814cb8 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -162,8 +162,6 @@ e1000e_intrmgr_on_throttling_timer(void *opaque)
 {
     E1000IntrDelayTimer *timer = opaque;
 
-    assert(!msix_enabled(timer->core->owner));
-
     timer->running = false;
 
     if (msi_enabled(timer->core->owner)) {
@@ -183,8 +181,6 @@ e1000e_intrmgr_on_msix_throttling_timer(void *opaque)
     E1000IntrDelayTimer *timer = opaque;
     int idx = timer - &timer->core->eitr[0];
 
-    assert(msix_enabled(timer->core->owner));
-
     timer->running = false;
 
     trace_e1000e_irq_msix_notify_postponed_vec(idx);
-- 
2.39.1


