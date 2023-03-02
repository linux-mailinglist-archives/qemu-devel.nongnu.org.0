Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21136A7CC9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:34:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeGM-0004Mv-5H; Thu, 02 Mar 2023 03:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeG8-000409-BH
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeG6-0002O7-NU
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EFVCuIJNs11CoeniZAfk9rLQ2ZLV3j08SI6kdll+0Mw=;
 b=L8uXAPDeclh4C3+5PhTowAAZPbLstoxTFA8sGy/m8cNBhSs+HaFxbKstOdFifTFvX4G7aX
 cisMnwdjB1GsEZVi0CejbsLzRbXVMpSI1yMs7X1Z0M2RByBZenuhBF/j25S5WnXkQbOxvj
 A9r7VIh/FO0+p5X1r6IznsD0LUkiyw8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-lzQk05_KNsyeNjebHgC-nw-1; Thu, 02 Mar 2023 03:25:49 -0500
X-MC-Unique: lzQk05_KNsyeNjebHgC-nw-1
Received: by mail-wm1-f70.google.com with SMTP id
 e17-20020a05600c219100b003e21fa60ec1so748117wme.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745547;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EFVCuIJNs11CoeniZAfk9rLQ2ZLV3j08SI6kdll+0Mw=;
 b=wJVOClCBjLepdNR+9N0d1qK9s2pl6OJwK644KbwJbgmAyKyeUZ3nTD1PMzWs4R6zdS
 788M83jT0tB5MaxK4j3Kkk7leSYM8Dav5qZJfDV+RLrT7YRz7GOKS58L/JkM9I/ATIkj
 GTyF/hoNvVQmP22Uw2teHPK/H39pl2/76AH6NmHY/lFqsdyt/nQrr591kK8kt+ZwXU+l
 H24jAsn8rPGJk+XQf2pHypsVGG+HChzYwfLd0wbtfZEypVF+0Tf/cPSlF017m5p4zqSF
 Lut0cfTzx4EQXIvTEZVSKcvzPo49bIgFuYE20GJEqTdAToXlkiF1rRIH2GngUM52+irM
 d9yA==
X-Gm-Message-State: AO0yUKWyKy/jE9A1ySCWrNCw86jPkQKLw8eNP3VxDeOfLbIARUs4cC06
 zKzCKshU78fw88UW1olcrBmYGUP28DUhTvs/o4CfH7WVKg47874Ts6PS+aoAV4Ub+kHKKVnnt5G
 P8HAHmlHqczkfcHmYVsZ1sP5lsUy1I1+fq4IyVlTmUCvcx5uW/IJ/QAtGnVqTt8Jw3Q==
X-Received: by 2002:a5d:5143:0:b0:2c7:103f:7122 with SMTP id
 u3-20020a5d5143000000b002c7103f7122mr6219178wrt.28.1677745547384; 
 Thu, 02 Mar 2023 00:25:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8W06s187MkDVOuEw0eR2cT9nWt7iOmtxyxFjNYEcOZE7QACpPFbfvNRWqP80Qs0n/snfrxxA==
X-Received: by 2002:a5d:5143:0:b0:2c7:103f:7122 with SMTP id
 u3-20020a5d5143000000b002c7103f7122mr6219163wrt.28.1677745547052; 
 Thu, 02 Mar 2023 00:25:47 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 l35-20020a05600c1d2300b003e6dcd562a6sm2298358wms.28.2023.03.02.00.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:46 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 24/53] pci/shpc: pass PCIDevice pointer to shpc_slot_command()
Message-ID: <20230302082343.560446-25-mst@redhat.com>
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

We'll need it in further patch to report bridge in QAPI event.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
Message-Id: <20230216180356.156832-6-vsementsov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/shpc.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 959dc470f3..9f964b1d70 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -263,9 +263,10 @@ static bool shpc_slot_is_off(uint8_t state, uint8_t power, uint8_t attn)
     return state == SHPC_STATE_DISABLED && power == SHPC_LED_OFF;
 }
 
-static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
+static void shpc_slot_command(PCIDevice *d, uint8_t target,
                               uint8_t state, uint8_t power, uint8_t attn)
 {
+    SHPCDevice *shpc = d->shpc;
     int slot = SHPC_LOGICAL_TO_IDX(target);
     uint8_t old_state = shpc_get_status(shpc, slot, SHPC_SLOT_STATE_MASK);
     uint8_t old_power = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
@@ -314,8 +315,9 @@ static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
     }
 }
 
-static void shpc_command(SHPCDevice *shpc)
+static void shpc_command(PCIDevice *d)
 {
+    SHPCDevice *shpc = d->shpc;
     uint8_t code = pci_get_byte(shpc->config + SHPC_CMD_CODE);
     uint8_t speed;
     uint8_t target;
@@ -336,7 +338,7 @@ static void shpc_command(SHPCDevice *shpc)
         state = (code & SHPC_SLOT_STATE_MASK) >> SHPC_SLOT_STATE_SHIFT;
         power = (code & SHPC_SLOT_PWR_LED_MASK) >> SHPC_SLOT_PWR_LED_SHIFT;
         attn = (code & SHPC_SLOT_ATTN_LED_MASK) >> SHPC_SLOT_ATTN_LED_SHIFT;
-        shpc_slot_command(shpc, target, state, power, attn);
+        shpc_slot_command(d, target, state, power, attn);
         break;
     case 0x40 ... 0x47:
         speed = code & SHPC_SEC_BUS_MASK;
@@ -354,10 +356,10 @@ static void shpc_command(SHPCDevice *shpc)
         }
         for (i = 0; i < shpc->nslots; ++i) {
             if (!(shpc_get_status(shpc, i, SHPC_SLOT_STATUS_MRL_OPEN))) {
-                shpc_slot_command(shpc, i + SHPC_CMD_TRGT_MIN,
+                shpc_slot_command(d, i + SHPC_CMD_TRGT_MIN,
                                   SHPC_STATE_PWRONLY, SHPC_LED_ON, SHPC_LED_NO);
             } else {
-                shpc_slot_command(shpc, i + SHPC_CMD_TRGT_MIN,
+                shpc_slot_command(d, i + SHPC_CMD_TRGT_MIN,
                                   SHPC_STATE_NO, SHPC_LED_OFF, SHPC_LED_NO);
             }
         }
@@ -375,10 +377,10 @@ static void shpc_command(SHPCDevice *shpc)
         }
         for (i = 0; i < shpc->nslots; ++i) {
             if (!(shpc_get_status(shpc, i, SHPC_SLOT_STATUS_MRL_OPEN))) {
-                shpc_slot_command(shpc, i + SHPC_CMD_TRGT_MIN,
+                shpc_slot_command(d, i + SHPC_CMD_TRGT_MIN,
                                   SHPC_STATE_ENABLED, SHPC_LED_ON, SHPC_LED_NO);
             } else {
-                shpc_slot_command(shpc, i + SHPC_CMD_TRGT_MIN,
+                shpc_slot_command(d, i + SHPC_CMD_TRGT_MIN,
                                   SHPC_STATE_NO, SHPC_LED_OFF, SHPC_LED_NO);
             }
         }
@@ -410,7 +412,7 @@ static void shpc_write(PCIDevice *d, unsigned addr, uint64_t val, int l)
         shpc->config[a] &= ~(val & w1cmask); /* W1C: Write 1 to Clear */
     }
     if (ranges_overlap(addr, l, SHPC_CMD_CODE, 2)) {
-        shpc_command(shpc);
+        shpc_command(d);
     }
     shpc_interrupt_update(d);
 }
-- 
MST


