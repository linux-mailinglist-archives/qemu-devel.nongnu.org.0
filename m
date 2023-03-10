Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0886B3AF1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 10:41:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZBI-0004Xx-3U; Fri, 10 Mar 2023 04:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZBC-0004Sk-EL
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:36:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZBA-0008Qg-Gr
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678441008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjIx5SDMpja5GbvEXMQBJLPSstUi91acpPGFpSp1+NU=;
 b=BbmBvCh0tANqjtxJc1Y40nTdD4NlKc4SAmwt7kPfvceKqn0X/JQazKOd6Yq1rMSpHHeiSm
 PQxOmuX4yaFG16/Z3GI+dTY5ZDRrKN2a1brlgImy0ueq8+embBeyw4rZuLZuJsETQXWJ53
 ax4BfZrEPlxEZXr0Q25Hmt4SP94Si3c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-Mu-5UKwuNwWAEK1nEBdNKQ-1; Fri, 10 Mar 2023 04:36:43 -0500
X-MC-Unique: Mu-5UKwuNwWAEK1nEBdNKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37C5085A588;
 Fri, 10 Mar 2023 09:36:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-41.pek2.redhat.com [10.72.12.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F55F40BC781;
 Fri, 10 Mar 2023 09:36:41 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 27/44] e1000e: Do not assert when MSI-X is disabled later
Date: Fri, 10 Mar 2023 17:35:09 +0800
Message-Id: <20230310093526.30828-28-jasowang@redhat.com>
In-Reply-To: <20230310093526.30828-1-jasowang@redhat.com>
References: <20230310093526.30828-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

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
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index ff93547..76c7814 100644
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
2.7.4


