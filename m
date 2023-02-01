Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0F0685DFD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:38:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3vz-0000RT-ES; Tue, 31 Jan 2023 22:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vt-0008Tz-2g
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:37:14 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vq-0000d6-PV
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:37:12 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so684296pjb.5
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZSa3rJ4rdM+JL+7J+WlKqYqNPxt3Id/p0w4TcjJhfgI=;
 b=FD5GgBhf1FJ3Rewd+L8+qDqtjy3sFI0yZ/QNNu2871KgiQ1ozUMPJqW1xF2p/mjigC
 lfCTLlSoP2GduiJ3HqzShaY1pH3l+g7TQOcaXl2vPKuFce0yJ8xzCRX6oS8PtriGeBlS
 s97K0W8P+TDWa9LXSIvsKIt+o5/r7uizV3zf5c55HPj9Sxs7jSJXH8hYWVP7wOhEvnNv
 wwB8tzCoh4qYvcQRnEF+LnjsEWTJtAYpB+K0Z5cgALGx2/wLGev6sOXP73TkWMW5Gqz8
 Ewl5QoFrBbi3A/1qddZgtA5CAKRzJ36IsEa+8M5qkglMqHGQQHj5Asr9S5lZ/xMPRVrd
 L5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZSa3rJ4rdM+JL+7J+WlKqYqNPxt3Id/p0w4TcjJhfgI=;
 b=EPhNhSdCCKtXxKBtBCdb3GEvq9RkqWmYH/4ShpM7KxqQ6odSrYFbUriGfEWoe+fWvA
 ZPRNgSfvwR/VTGAXRIn1MfbfTw75IBRkfhVbEolC+g15qMmNwbk6WrQkTJhuvpYHgTxV
 nDd2PxwJ65nlFDx8h2h0doWtoRZAUZj0vxOE9cnAsawz89rMBRoQls0sGV/MYU4h9UVC
 qGerFlJchK7skITashCoO82dlW2tJoss/n0MupRGxogqjjbaz014Me9MadI80TbV0mvT
 4X7C6c4KCSkG5Z6j4OBcnO56D2TDh19eAywNFYD6wt2WVIBBvMayDh9vJm2c3sxlpyGD
 pkHg==
X-Gm-Message-State: AO0yUKXjI/AOCuvnbx5WidZEeY/8H6ihkwdY7IIkAHYJ72+8DuD8I9+U
 2uJb8MyTd4+sb0zykFpqZMAYcA==
X-Google-Smtp-Source: AK7set8bxmWdAuApEIXeoNSM3Hpkj2aLepey5A3/QI31xcnLnyHmNw6B0WHFfZ8wYEL2f4msp6ReJg==
X-Received: by 2002:a17:902:f549:b0:198:a54a:f6e7 with SMTP id
 h9-20020a170902f54900b00198a54af6e7mr1717885plf.57.1675222629500; 
 Tue, 31 Jan 2023 19:37:09 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001968b529c98sm4185557plg.128.2023.01.31.19.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 19:37:09 -0800 (PST)
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
Subject: [PATCH v5 26/29] e1000e: Do not assert when MSI-X is disabled later
Date: Wed,  1 Feb 2023 12:35:36 +0900
Message-Id: <20230201033539.30049-27-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201033539.30049-1-akihiko.odaki@daynix.com>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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


