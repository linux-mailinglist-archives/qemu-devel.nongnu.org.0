Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C49580F6C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 10:55:23 +0200 (CEST)
Received: from localhost ([::1]:40534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGGLa-0002c7-Fd
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 04:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGGHU-0007Ie-88
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 04:51:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGGHQ-0000ux-Ij
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 04:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658825463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8aSav+29oJzxnp6tOaz2V0cLdh7Tr2uiOGMFX0cq84=;
 b=JqD3Rgdun/J6rhYC5FMl/gE6ZWGzxUD75gwniJ58Z/wF4kdSeCAPzYxgTa0rTPnPH3hu8O
 eUdyPs7ntWt9MrC49eCF+e2u7BfmbC31YE6tZFWyvjsXAfsGp2YEY4+MTCJCZPa32AKrSu
 sma6xHgmXlva0sjvyRn4kVJPFK0Hq9E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-lkymBlu9NhmFYIXa74so4g-1; Tue, 26 Jul 2022 04:51:02 -0400
X-MC-Unique: lkymBlu9NhmFYIXa74so4g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42466801755;
 Tue, 26 Jul 2022 08:51:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-201.pek2.redhat.com
 [10.72.12.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DB46492CA2;
 Tue, 26 Jul 2022 08:50:59 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Ake Koomsin <ake@igel.co.jp>,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL 1/3] e1000e: Fix possible interrupt loss when using MSI
Date: Tue, 26 Jul 2022 16:50:53 +0800
Message-Id: <20220726085055.17239-2-jasowang@redhat.com>
In-Reply-To: <20220726085055.17239-1-jasowang@redhat.com>
References: <20220726085055.17239-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ake Koomsin <ake@igel.co.jp>

Commit "e1000e: Prevent MSI/MSI-X storms" introduced msi_causes_pending
to prevent interrupt storms problem. It was tested with MSI-X.

In case of MSI, the guest can rely solely on interrupts to clear ICR.
Upon clearing all pending interrupts, msi_causes_pending gets cleared.
However, when e1000e_itr_should_postpone() in e1000e_send_msi() returns
true, MSI never gets fired by e1000e_intrmgr_on_throttling_timer()
because msi_causes_pending is still set. This results in interrupt loss.

To prevent this, we need to clear msi_causes_pending when MSI is going
to get fired by the throttling timer. The guest can then receive
interrupts eventually.

Signed-off-by: Ake Koomsin <ake@igel.co.jp>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 2c51089..208e3e0 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -159,6 +159,8 @@ e1000e_intrmgr_on_throttling_timer(void *opaque)
 
     if (msi_enabled(timer->core->owner)) {
         trace_e1000e_irq_msi_notify_postponed();
+        /* Clear msi_causes_pending to fire MSI eventually */
+        timer->core->msi_causes_pending = 0;
         e1000e_set_interrupt_cause(timer->core, 0);
     } else {
         trace_e1000e_irq_legacy_notify_postponed();
-- 
2.7.4


