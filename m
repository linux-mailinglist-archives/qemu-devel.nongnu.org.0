Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41A96A7CDB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:36:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeGL-0004Jp-LX; Thu, 02 Mar 2023 03:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeG2-0003jR-O0
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeG0-0002Mt-SB
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DDvNE5AAxqmSM2z9TpCyi27x5+BVphcIk/6uvEz55eQ=;
 b=hTwVMXVhUVRldltjcPm6wRFNBQLUVvRs38fAnDP2AFzS19UkAZn+FWPVfAfgK5ZBS7mqZm
 TL9BXzkJZ0S69RdDflS3WdluPb2Jy3gywlrKAo3tW6iLneGz4EqDd4gzu3vGVefFo/thAN
 VllEDbAWUO+yo6vyrDUo7zULQ2PMhOA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-222-wrrw5VEqMbuSWu0tt8j_YA-1; Thu, 02 Mar 2023 03:25:43 -0500
X-MC-Unique: wrrw5VEqMbuSWu0tt8j_YA-1
Received: by mail-wm1-f70.google.com with SMTP id
 e17-20020a05600c219100b003e21fa60ec1so748001wme.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745541;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DDvNE5AAxqmSM2z9TpCyi27x5+BVphcIk/6uvEz55eQ=;
 b=E2/ukMOKG3E3Bu1qXyRjZKLuvM1C58htB+fDp79bSapupcx11OJnSz5VkjW3jqX2Qf
 shX+pexvt/i1O5AJtBiPhVcuHXZLFzsuMWj8MIWfcJOU8AAPIVr4nEoyp9NAkclx7j+i
 bJLpq9wxTx/8iIMMRfRwLclojhXGecp7AJm5O3ppYNweVybvbXNEKpFXQNl8YmuvdaBD
 KvmGolanXUkxFFhx0+Bk4Phhc++OP8MFj/t2KAIpCEG2byEFs0/7mbDhrsHgTAk7TfW2
 CJ7quKQRjH6lbZxU1N8rd3f6M09fo7ugExkFRTDWDs1BA5kmOuy9dDsfzvyKmjie/ov3
 NbXQ==
X-Gm-Message-State: AO0yUKWfPWFH62qrLtJM2LLAgTKXemlzvljW69Q1RTCUKcLKh+835an0
 acgQ1tyr5DT8wxCbVnpG83lCsiih12Yg8HueMaaALcI0n1H0wu8HezXrxLJvxJ3gpaeveXmrCKh
 iZhaYr+FZOn6nT5pF/cd5Cg6xSWKCl3PV035/Rg80Ya+WrnGuXK0iQsEltdHgoQLjZg==
X-Received: by 2002:a05:600c:310e:b0:3eb:3148:a1b7 with SMTP id
 g14-20020a05600c310e00b003eb3148a1b7mr7193730wmo.12.1677745541727; 
 Thu, 02 Mar 2023 00:25:41 -0800 (PST)
X-Google-Smtp-Source: AK7set+bGy+bLMmO9bkMtGsRQ0UTOGtUvH7jwUmxQ84ZMl6J75XUrAN15gOCquMB4FSFbg98oH9YXQ==
X-Received: by 2002:a05:600c:310e:b0:3eb:3148:a1b7 with SMTP id
 g14-20020a05600c310e00b003eb3148a1b7mr7193705wmo.12.1677745541331; 
 Thu, 02 Mar 2023 00:25:41 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 hg13-20020a05600c538d00b003d9aa76dc6asm2142379wmb.0.2023.03.02.00.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:40 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 22/53] pci/shpc: shpc_slot_command(): handle PWRONLY ->
 ENABLED transition
Message-ID: <20230302082343.560446-23-mst@redhat.com>
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

ENABLED -> PWRONLY transition is not allowed and we handle it by
shpc_invalid_command(). But PWRONLY -> ENABLED transition is silently
ignored, which seems wrong. Let's handle it as correct.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
Message-Id: <20230216180356.156832-4-vsementsov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/shpc.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 5d71569b13..25e4172382 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -273,28 +273,22 @@ static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
         return;
     }
 
-    switch (power) {
-    case SHPC_LED_NO:
-        break;
-    default:
+    if (power != SHPC_LED_NO) {
         /* TODO: send event to monitor */
         shpc_set_status(shpc, slot, power, SHPC_SLOT_PWR_LED_MASK);
     }
-    switch (attn) {
-    case SHPC_LED_NO:
-        break;
-    default:
+    if (attn != SHPC_LED_NO) {
         /* TODO: send event to monitor */
         shpc_set_status(shpc, slot, attn, SHPC_SLOT_ATTN_LED_MASK);
     }
+    if (state != SHPC_STATE_NO) {
+        shpc_set_status(shpc, slot, state, SHPC_SLOT_STATE_MASK);
+    }
 
-    if ((current_state == SHPC_STATE_DISABLED && state == SHPC_STATE_PWRONLY) ||
-        (current_state == SHPC_STATE_DISABLED && state == SHPC_STATE_ENABLED)) {
-        shpc_set_status(shpc, slot, state, SHPC_SLOT_STATE_MASK);
-    } else if ((current_state == SHPC_STATE_ENABLED ||
-                current_state == SHPC_STATE_PWRONLY) &&
-               state == SHPC_STATE_DISABLED) {
-        shpc_set_status(shpc, slot, state, SHPC_SLOT_STATE_MASK);
+    if ((current_state == SHPC_STATE_ENABLED ||
+         current_state == SHPC_STATE_PWRONLY) &&
+        state == SHPC_STATE_DISABLED)
+    {
         power = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
         /* TODO: track what monitor requested. */
         /* Look at LED to figure out whether it's ok to remove the device. */
-- 
MST


