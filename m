Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B9B693CAD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:57:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRP1c-0007Xd-TV; Sun, 12 Feb 2023 21:57:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRP1b-0007XV-IC
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:57:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRP1a-0007dd-01
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676257021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eSONnSCSQzL00YkXEaKWMv/0oOpN2PHY8jE8o91oEEs=;
 b=JjEMo6IM2McYoV2eD9F3Y2jfwBdob5HOX9ypnSGzmwOaWUGI9eRy5R+TcwCzJmvPLGHlj/
 8cFPWjbwgbM5bqeuGglF9hC3MKssRmyxn5mv+ebo//JLoc1ERaFj9BtsPjMLouBnLtWGY9
 we1YcCOANELWECqTINLbhUdqsvW4Utg=
Received: from mail-wm1-f70.google.com (209.85.128.70 [209.85.128.70]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-383-Rs7Z1nw8O7OCk6BM9JX4Eg-1; Sun,
 12 Feb 2023 21:52:30 -0500
X-MC-Unique: Rs7Z1nw8O7OCk6BM9JX4Eg-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay19-20020a05600c1e1300b003dc54daba42so5436259wmb.7
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:52:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eSONnSCSQzL00YkXEaKWMv/0oOpN2PHY8jE8o91oEEs=;
 b=W50W2emxcQEF5osx+/9c4E4N/wHvGQHCx14YZDZr6yZ2UdUUVmxOOhq98F0rEyD4yg
 iEM1HgSS3A+96fHCiczVGyAfsJ9/B+ulw2Yg6713Fc1N6g0AlFNkfugT2dm5B5pJePjH
 CNdupr7Guwr7GAumDAHozdeL9MoHFnodNq/+9my0QpyaBNlTBHwO3PTLSbUOz3IbpeEa
 iUb5gs0maENq3ykprk/w2S8AS8OYj09FyrJ5ArdzZyjS0obpZfCn5BGo5ZI2vOfe2vJC
 4mtMjkY1YYnjx4XfFFnLhw9S8KiZlVq6WNd+GMC+kNeVFMpJYUcRZtelbt1UQCfxu8Tb
 fNSg==
X-Gm-Message-State: AO0yUKXmz42uecMQm9S0/kBAuAK7rYKLMWVzcUI/BMleFmswwjEPlpGu
 z5pvxzs1IfUjgf6/3GtDmED8/IWmzn2n2VW6+085ti9QWacbIi2TNwdPQyu9ACUuMeEL5wRNqOy
 aG+BPLKZz2iZTAs9flRtQIe/Geke2jf/Jr5qjE2k4YvsOxscKDvXfA+SegjziryDiapeSibKj
X-Received: by 2002:a05:600c:1606:b0:3e0:39:ec9d with SMTP id
 m6-20020a05600c160600b003e00039ec9dmr17977564wmn.23.1676256731125; 
 Sun, 12 Feb 2023 18:52:11 -0800 (PST)
X-Google-Smtp-Source: AK7set8385UsdxLhe6Lubligoz7bwZWXr0FJrEcwvoTK4P5+p3gm9zEpVWQGyOSmkN/kZN0gZ6ssYg==
X-Received: by 2002:a05:600c:1606:b0:3e0:39:ec9d with SMTP id
 m6-20020a05600c160600b003e00039ec9dmr17977547wmn.23.1676256730901; 
 Sun, 12 Feb 2023 18:52:10 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c459200b003db03725e86sm13712002wmo.8.2023.02.12.18.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:52:10 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PULL 11/22] migration: I messed state_pending_exact/estimate
Date: Mon, 13 Feb 2023 03:51:39 +0100
Message-Id: <20230213025150.71537-12-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213025150.71537-1-quintela@redhat.com>
References: <20230213025150.71537-1-quintela@redhat.com>
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


