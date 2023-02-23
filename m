Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B6F6A0627
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:26:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8k3-0007ju-Tq; Thu, 23 Feb 2023 05:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jx-0007Od-RT
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:18 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jw-0002lt-3J
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:17 -0500
Received: by mail-pj1-x102e.google.com with SMTP id u10so12329741pjc.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZSa3rJ4rdM+JL+7J+WlKqYqNPxt3Id/p0w4TcjJhfgI=;
 b=xFVs4s7nGIopiaaUmqdKTKVg4rv/sx+LN/49NPhyNwo6VFwScqIsyNNif0ETq43PjJ
 D64la2gXTAsZ8n1Q//J57vPhJobl5mfwWboHs0gnblV6sLAL1cTbBRLoGwGg7WE575d7
 A99zFX+Ys0B+Byxyk+evi6gsjcLzPzPtEhXYzUMR2iZTDCRxNlLMYpnaSInCiuHpcHD8
 oigPabqrrbYE25orbbYlhwmU/MCQwIJcWJ8wvAlANrI2fvB66cTalA586u0vms4nxEkR
 K7r+oi9pi0FjcfCYIBJVooahXekiovmqeibRfT+orTAMucc9f7AeMiUelAKVPRb1KAQt
 kz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZSa3rJ4rdM+JL+7J+WlKqYqNPxt3Id/p0w4TcjJhfgI=;
 b=CpmCMFRyxGW0f4pOi/VBRc2MBxiVOdyOxY0J192v8/1o1WZ98pufYu12wvaOPlg7KH
 w41rk9JRK/ABcwOkDDtlyOvTRxpGhzkcNodUO8MaldQqkyLAYb6o3QNGRZBRGtGdxvMs
 z9ifCTWeSVxusjA8YS7SNmqq1+V63JhkeJI6wyZn0Y4GxQKGSG71ZA7n7EaO+GvPOsup
 cqEN/zAl4UqGl1Ljrfzec6XJbcGbBWba+3Gz3d86jcY7gSOE6r7goFNP4RCGwrt8zh+6
 oEJ0QfKlA49vpVi1ooImVZH90iZH5ureXigRmjvJcYqzSPOeHXWpQ7kfngslJrH3u8bx
 gYYQ==
X-Gm-Message-State: AO0yUKWagjj3dw6uZby/ZWViji7Sk3Ra/9NH2jD0OYAB6hyg8OrD2pu4
 EhVQC4Gy/a3vJiuWCHHFgIvxZg==
X-Google-Smtp-Source: AK7set9JHY2l1tF/ydcI4QBXivRi6zlU4xq2t954k1GdV10KqMO5r1waA+ZpMPLi5f9SC5GoT9QtoQ==
X-Received: by 2002:a17:902:c40d:b0:19a:8284:83a2 with SMTP id
 k13-20020a170902c40d00b0019a828483a2mr13883527plk.10.1677147733912; 
 Thu, 23 Feb 2023 02:22:13 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:22:13 -0800 (PST)
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
Subject: [PATCH v6 27/34] e1000e: Do not assert when MSI-X is disabled later
Date: Thu, 23 Feb 2023 19:20:11 +0900
Message-Id: <20230223102018.141748-28-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
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


