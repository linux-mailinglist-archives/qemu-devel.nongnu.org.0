Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FB8693C52
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:31:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROb6-0001Z6-17; Sun, 12 Feb 2023 21:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROb3-0001YN-BR
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROb1-00034Z-MO
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676255374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOi00Pqh/ujyWTtG6wmGTly8NpXv3aJEdCMEVs3nCBo=;
 b=Aga7YYeNM8vo8byEXN9g0n8q9cCV6C8NxmB7xpkxU2RHYfI6FFfsa2wryDTOyD0zp2JXnU
 XlMyZrbExHD9iVVPJ7/hChqlXCn8EFKSnKeGf72ae+jiEn+ZJ1QpRR1Zrtz0KynAdMzjX+
 u7CpZpUaR1Il+ff+bn35VONYDbiAIm0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-z7X9KB-cM6CmMpdtblyUow-1; Sun, 12 Feb 2023 21:29:33 -0500
X-MC-Unique: z7X9KB-cM6CmMpdtblyUow-1
Received: by mail-wm1-f71.google.com with SMTP id
 o8-20020a05600c510800b003dfdf09ffc2so5423070wms.5
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:29:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qOi00Pqh/ujyWTtG6wmGTly8NpXv3aJEdCMEVs3nCBo=;
 b=hkl5siw5P3Kqi9EH1NNiHfDp/13zqmPStwAPbgh6iv+NKcF2KdhmJOBfYjB9dMUHEF
 pWiE8iwUUKVKlArmDHEDyBVyfq6zp5LPz32Nd9FkdAiypZ5KupadWtZjjEswm0Q2eJFP
 5ybPe6iAWLVi6NO7eMy5QO//v1BuFBJokfp1VIoJNPzLi5f9yGToykAEByCwrq6OHKLk
 DoLeZrOrRftEaS/AvNRu+b3lg0ePFQbQAKDmEIU03ZS/rwDf+wHsblpOGhO5rLrkvrUH
 cA9g4mZfD6Lp+K6FnkbOvL5C3+/km8reyfggBroIrxgjBKDYOXnQRBeEaQOXVRAIiVBE
 v5zA==
X-Gm-Message-State: AO0yUKX27GpooRKxtTg6SinuZFQKLsIhe4eyZda4Y4wst6tLzRebnAib
 49Ug+dMQa9rt0frqhKZZmRmSUH4/L4bIms2/wkGJznT/8OCpG7Wp5wdlD2Qz/4aDW6eesYEXPpD
 0eEBbGMML2+9SGZaliWn0aUefD7RuSg4s74wVFq/NZTGMDJBS03VXvMFsufpbHPNXJXeHCTXq
X-Received: by 2002:adf:eb88:0:b0:2c5:4bd4:b3a8 with SMTP id
 t8-20020adfeb88000000b002c54bd4b3a8mr7133141wrn.4.1676255372026; 
 Sun, 12 Feb 2023 18:29:32 -0800 (PST)
X-Google-Smtp-Source: AK7set93r9z3DMHPpOkkw0GymiD+Q9tAwTIKRBZwn0QmaSQgLXHYJg2jzv/gVIO1TxUcoI75MMe6/g==
X-Received: by 2002:adf:eb88:0:b0:2c5:4bd4:b3a8 with SMTP id
 t8-20020adfeb88000000b002c54bd4b3a8mr7133127wrn.4.1676255371764; 
 Sun, 12 Feb 2023 18:29:31 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 z17-20020a5d6551000000b002c54c8e70b1sm6275033wrv.9.2023.02.12.18.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:29:31 -0800 (PST)
From: Xxx Xx <quintela@redhat.com>
X-Google-Original-From: Xxx Xx <xxx.xx@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 11/22] migration: I messed state_pending_exact/estimate
Date: Mon, 13 Feb 2023 03:29:00 +0100
Message-Id: <20230213022911.68490-12-xxx.xx@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213022911.68490-1-xxx.xx@gmail.com>
References: <20230213022911.68490-1-xxx.xx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

From: Juan Quintela <quintela@redhat.com>

I called the helper function from the wrong top level function.

This code was introduced in:

commit c8df4a7aeffcb46020f610526eea621fa5b0cd47
Author: Juan Quintela <quintela@redhat.com>
Date:   Mon Oct 3 02:00:03 2022 +0200

    migration: Split save_live_pending() into state_pending_*

    We split the function into to:

    - state_pending_estimate: We estimate the remaining state size without
      stopping the machine.

    - state pending_exact: We calculate the exact amount of remaining
      state.

Thanks to Avihai Horon <avihaih@nvidia.com> for finding it.

Fixes:c8df4a7aeffcb46020f610526eea621fa5b0cd47

When we introduced that patch, we enden calling

state_pending_estimate() helper from qemu_savevm_statepending_exact()
and
state_pending_exact() helper from qemu_savevm_statepending_estimate()

This patch fixes it.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/savevm.c | 50 +++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index e9cf4999ad..ce181e21e1 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1551,31 +1551,6 @@ void qemu_savevm_state_pending_estimate(uint64_t *res_precopy_only,
     *res_compatible = 0;
     *res_postcopy_only = 0;
 
-    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
-        if (!se->ops || !se->ops->state_pending_exact) {
-            continue;
-        }
-        if (se->ops->is_active) {
-            if (!se->ops->is_active(se->opaque)) {
-                continue;
-            }
-        }
-        se->ops->state_pending_exact(se->opaque,
-                                     res_precopy_only, res_compatible,
-                                     res_postcopy_only);
-    }
-}
-
-void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
-                                     uint64_t *res_compatible,
-                                     uint64_t *res_postcopy_only)
-{
-    SaveStateEntry *se;
-
-    *res_precopy_only = 0;
-    *res_compatible = 0;
-    *res_postcopy_only = 0;
-
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         if (!se->ops || !se->ops->state_pending_estimate) {
             continue;
@@ -1591,6 +1566,31 @@ void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
     }
 }
 
+void qemu_savevm_state_pending_exact(uint64_t *res_precopy_only,
+                                     uint64_t *res_compatible,
+                                     uint64_t *res_postcopy_only)
+{
+    SaveStateEntry *se;
+
+    *res_precopy_only = 0;
+    *res_compatible = 0;
+    *res_postcopy_only = 0;
+
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (!se->ops || !se->ops->state_pending_exact) {
+            continue;
+        }
+        if (se->ops->is_active) {
+            if (!se->ops->is_active(se->opaque)) {
+                continue;
+            }
+        }
+        se->ops->state_pending_exact(se->opaque,
+                                     res_precopy_only, res_compatible,
+                                     res_postcopy_only);
+    }
+}
+
 void qemu_savevm_state_cleanup(void)
 {
     SaveStateEntry *se;
-- 
2.39.1


