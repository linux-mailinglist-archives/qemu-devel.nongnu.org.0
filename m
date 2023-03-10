Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E6B6B3ACA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 10:38:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZAO-0002rP-9r; Fri, 10 Mar 2023 04:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZAL-0002qX-DR
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:35:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZAG-0008GX-5F
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:35:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678440951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FzOKIfYrEOJqCc5OXjNPvpQieB/iMudXEnCbXzPUYxM=;
 b=Pnz18ogQxoUZF61dDHh9iaK6xUF1i2XIn7F7RSTN5gdW02iCbMJTE0F8rNzOxU0Xmr/Rcy
 I6CeTxRg/cgFQlUl+tio5QSPVa7nsv0cUW/tDCrtroFIdCqizAFKGk0LEq1U7di3iGiCrF
 TKitHbV2ObN+n4lXGqnlowanJXg9hsc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-ihNxNHQZPmaCXBZsfKTGKA-1; Fri, 10 Mar 2023 04:35:48 -0500
X-MC-Unique: ihNxNHQZPmaCXBZsfKTGKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A76D185A7A4;
 Fri, 10 Mar 2023 09:35:47 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-41.pek2.redhat.com [10.72.12.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92C114014CF3;
 Fri, 10 Mar 2023 09:35:45 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 06/44] e1000e: Introduce E1000E_LOW_BITS_SET_FUNC
Date: Fri, 10 Mar 2023 17:34:48 +0800
Message-Id: <20230310093526.30828-7-jasowang@redhat.com>
In-Reply-To: <20230310093526.30828-1-jasowang@redhat.com>
References: <20230310093526.30828-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

e1000e_set_16bit and e1000e_set_12bit look so similar so define a
generic macro.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 181c1e0..1cafc38 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -2440,17 +2440,15 @@ e1000e_set_fcrtl(E1000ECore *core, int index, uint32_t val)
     core->mac[FCRTL] = val & 0x8000FFF8;
 }
 
-static inline void
-e1000e_set_16bit(E1000ECore *core, int index, uint32_t val)
-{
-    core->mac[index] = val & 0xffff;
-}
+#define E1000E_LOW_BITS_SET_FUNC(num)                                \
+    static void                                                      \
+    e1000e_set_##num##bit(E1000ECore *core, int index, uint32_t val) \
+    {                                                                \
+        core->mac[index] = val & (BIT(num) - 1);                     \
+    }
 
-static void
-e1000e_set_12bit(E1000ECore *core, int index, uint32_t val)
-{
-    core->mac[index] = val & 0xfff;
-}
+E1000E_LOW_BITS_SET_FUNC(12)
+E1000E_LOW_BITS_SET_FUNC(16)
 
 static void
 e1000e_set_vet(E1000ECore *core, int index, uint32_t val)
-- 
2.7.4


