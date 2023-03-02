Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1360C6A7CBA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:33:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeGN-0004VX-Ay; Thu, 02 Mar 2023 03:26:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeG5-0003ss-E7
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeG3-0002Ne-Pj
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3HTn60RevXrUpLigk2n8Ix04V50sdVc3BBXErCPYges=;
 b=KGK2qi1SHn/E60ysNC+HP5YQJ+cJZrYSZiQninoXCN3aRRBh8g/iWz7O1adtxo+eA2rmTy
 rqQVaRf9sdnZCP6WyvgoOw6z4iG+XUnkannpXKuMyV2RFCoFMDTq5lV+KLOO3OvJZzV9cj
 z6p+lIWQyGAbRHvF48H8vb3x8SXFSPo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-oGsfxN0-Mcqt6fJ3YUKMuw-1; Thu, 02 Mar 2023 03:25:45 -0500
X-MC-Unique: oGsfxN0-Mcqt6fJ3YUKMuw-1
Received: by mail-wm1-f71.google.com with SMTP id
 e17-20020a05600c219100b003e21fa60ec1so748056wme.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745544;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3HTn60RevXrUpLigk2n8Ix04V50sdVc3BBXErCPYges=;
 b=oS555Ja8Pn1sAQ425ra18+vPAkpy/9ijkNazjuJAEff3D0cnnqLNDMFFz3+YwDxCoa
 2iO4Lb6cPmOp9d2ZKUazQ3Y/bneNUbXsoKxHutB/zb5Ilmsw9uRh9wqlwgD7bJFJ57eQ
 yiAEeE9vDQc46MH0SxrfPspRmPOSzFH37xB3EsuqCkd7QfBi1MW7e1FZk2MiaAgntQxj
 76RkwmJgRWZhSh9ZFai3Rv1YPv0viyydMSMkOVsWbGoN2JLHoqPyz5jC/O2SJsfLu11H
 WcZnrV1HuO9G+BtZJ4YgqypdPVGpgwGLcYE0zHT7npnXCiBndaA58kFzlzpxx88vA36S
 ORKw==
X-Gm-Message-State: AO0yUKVgKckQ7Kfn1PzMApTFqd5NJJGwcd8fKXpWcpZxrk3Ac8Jd0/SJ
 0ogHFgVLf0CRQVpESfeqy+QQPWt3iS0Mkxvp6qGbLgQWRYrF/c6ifQmINoF/lRpyZDyZdfOCRJf
 70BcvsAW4vgnj3zr6W8VjiYlaEmS24uzc0/Od41TudiquTjUu2RkyLWujnvnw33Ov7A==
X-Received: by 2002:a05:600c:81b:b0:3e2:6ec:61ea with SMTP id
 k27-20020a05600c081b00b003e206ec61eamr7239190wmp.28.1677745544498; 
 Thu, 02 Mar 2023 00:25:44 -0800 (PST)
X-Google-Smtp-Source: AK7set8mR2ee+fO50Muxq9m420yOP1NC7Tv6E+sWrJyY1/U4JrW95O0FwkE79gv0kfljT21rIy94Sg==
X-Received: by 2002:a05:600c:81b:b0:3e2:6ec:61ea with SMTP id
 k27-20020a05600c081b00b003e206ec61eamr7239173wmp.28.1677745544193; 
 Thu, 02 Mar 2023 00:25:44 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003dc434b39c7sm6666233wmp.0.2023.03.02.00.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:43 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 23/53] pci/shpc: more generic handle hot-unplug in
 shpc_slot_command()
Message-ID: <20230302082343.560446-24-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Free slot if both conditions (power-led = OFF and state = DISABLED)
becomes true regardless of the sequence. It is similar to how PCIe
hotplug works.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
Message-Id: <20230216180356.156832-5-vsementsov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/shpc.c | 52 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 25e4172382..959dc470f3 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -258,49 +258,59 @@ static void shpc_free_devices_in_slot(SHPCDevice *shpc, int slot)
     }
 }
 
+static bool shpc_slot_is_off(uint8_t state, uint8_t power, uint8_t attn)
+{
+    return state == SHPC_STATE_DISABLED && power == SHPC_LED_OFF;
+}
+
 static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
                               uint8_t state, uint8_t power, uint8_t attn)
 {
-    uint8_t current_state;
     int slot = SHPC_LOGICAL_TO_IDX(target);
+    uint8_t old_state = shpc_get_status(shpc, slot, SHPC_SLOT_STATE_MASK);
+    uint8_t old_power = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
+    uint8_t old_attn = shpc_get_status(shpc, slot, SHPC_SLOT_ATTN_LED_MASK);
+
     if (target < SHPC_CMD_TRGT_MIN || slot >= shpc->nslots) {
         shpc_invalid_command(shpc);
         return;
     }
-    current_state = shpc_get_status(shpc, slot, SHPC_SLOT_STATE_MASK);
-    if (current_state == SHPC_STATE_ENABLED && state == SHPC_STATE_PWRONLY) {
+
+    if (old_state == SHPC_STATE_ENABLED && state == SHPC_STATE_PWRONLY) {
         shpc_invalid_command(shpc);
         return;
     }
 
-    if (power != SHPC_LED_NO) {
+    if (power == SHPC_LED_NO) {
+        power = old_power;
+    } else {
         /* TODO: send event to monitor */
         shpc_set_status(shpc, slot, power, SHPC_SLOT_PWR_LED_MASK);
     }
-    if (attn != SHPC_LED_NO) {
+
+    if (attn == SHPC_LED_NO) {
+        attn = old_attn;
+    } else {
         /* TODO: send event to monitor */
         shpc_set_status(shpc, slot, attn, SHPC_SLOT_ATTN_LED_MASK);
     }
-    if (state != SHPC_STATE_NO) {
+
+    if (state == SHPC_STATE_NO) {
+        state = old_state;
+    } else {
         shpc_set_status(shpc, slot, state, SHPC_SLOT_STATE_MASK);
     }
 
-    if ((current_state == SHPC_STATE_ENABLED ||
-         current_state == SHPC_STATE_PWRONLY) &&
-        state == SHPC_STATE_DISABLED)
+    if (!shpc_slot_is_off(old_state, old_power, old_attn) &&
+        shpc_slot_is_off(state, power, attn))
     {
-        power = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
-        /* TODO: track what monitor requested. */
-        /* Look at LED to figure out whether it's ok to remove the device. */
-        if (power == SHPC_LED_OFF) {
-            shpc_free_devices_in_slot(shpc, slot);
-            shpc_set_status(shpc, slot, 1, SHPC_SLOT_STATUS_MRL_OPEN);
-            shpc_set_status(shpc, slot, SHPC_SLOT_STATUS_PRSNT_EMPTY,
-                            SHPC_SLOT_STATUS_PRSNT_MASK);
-            shpc->config[SHPC_SLOT_EVENT_LATCH(slot)] |=
-                SHPC_SLOT_EVENT_MRL |
-                SHPC_SLOT_EVENT_PRESENCE;
-        }
+        shpc_free_devices_in_slot(shpc, slot);
+        shpc_set_status(shpc, slot, 1, SHPC_SLOT_STATUS_MRL_OPEN);
+        shpc_set_status(shpc, slot, SHPC_SLOT_STATUS_PRSNT_EMPTY,
+                        SHPC_SLOT_STATUS_PRSNT_MASK);
+        shpc->config[SHPC_SLOT_EVENT_LATCH(slot)] |=
+            SHPC_SLOT_EVENT_MRL |
+            SHPC_SLOT_EVENT_PRESENCE;
     }
 }
 
-- 
MST


