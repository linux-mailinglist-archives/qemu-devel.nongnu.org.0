Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4ED489B71
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:40:20 +0100 (CET)
Received: from localhost ([::1]:53454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vqN-0006ih-1c
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:40:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkM-0001a9-8g; Mon, 10 Jan 2022 09:34:06 -0500
Received: from [2607:f8b0:4864:20::a36] (port=33426
 helo=mail-vk1-xa36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkK-0007OW-BP; Mon, 10 Jan 2022 09:34:05 -0500
Received: by mail-vk1-xa36.google.com with SMTP id g5so4415537vkg.0;
 Mon, 10 Jan 2022 06:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tX1wnsKzobxiFnTGGNK1Ca3B9B6mxa8uZCpw6IzigXY=;
 b=lTcSPROBOpaTnv62oUgfMPhOroH/+p/fiUN6DnKVTDMOJuuAhvlYmmAwwl3DVCuVkO
 4i0mBYsrv6qFXCevNiuU2msNURnZvY7yQlwIwn8umBQrZW0Rx72fWjFJJZ3CZqnWnTT/
 eVa8rDjfZkKbYRIEtLycgmRd4nd0VGsTM9DITwf9bMxfZE4Plh2NmvGSFKR3DibnMuW2
 qeej1o5q3EGgvm9WQYAfSnWlI4Ii6ZFWTw1oGUbxbidpfQp9QLfgSv7re3+sLoelymLT
 KNFFMrdPeWT56EZgs276jzyaJGUl7O/6t6zx2Bh/iyNCsHXbsooYKRDPzsI1HLdw/P92
 Td7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tX1wnsKzobxiFnTGGNK1Ca3B9B6mxa8uZCpw6IzigXY=;
 b=FafIMbtP3U+pSuv7jnqGUxDJx9kEw+3fNkMp5uOj7PcBnn8cLdWQHL3JivWfvJ6p+W
 fteoPm7w3PPqQmIhDGx0og2N55v9ja2U1n/o7bh4t2fBYQXjZ1fPRTolKN7K/7KEgh3I
 QYWMHSsqfd9QRrgIpK14WtJfTJGQSGUan2OpcIuvbSXIrjkUQy00MaXgIPdnkvdbUukZ
 Sefc5YgJCHZkXS3BLah1q8U+B+kOiFJQbuiXCffjlCL/j7gj10i5xX6SxRfaCBY/USXF
 gUFX3mCfJ74vSKEVr/SPuKOZ7NomhMPu7Mq3l/WcnBmXlBORSAbwLB9kdbBp4sGzaLPm
 IMSQ==
X-Gm-Message-State: AOAM533p8oqKozxxZ7w/1x3dQ3W9oiY474UQiTGVEhnkvcLiGMlA+i8r
 q2af4Fjj9Yenhadk9qdwLkx9Oco4tYMmz64F
X-Google-Smtp-Source: ABdhPJwI1RNGP71B9IijkLcmww7CCLFbjlVE//vaSzwOD8hG8nGRJ9+Q/Xuq7pNMKCQURP8bal1kQQ==
X-Received: by 2002:a05:6122:d11:: with SMTP id
 az17mr24575vkb.22.1641825243129; 
 Mon, 10 Jan 2022 06:34:03 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id o11sm3709677vkf.41.2022.01.10.06.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:34:02 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/10] pnv_phb4_pec.c: remove stack 'phb-id' alias
Date: Mon, 10 Jan 2022 11:33:40 -0300
Message-Id: <20220110143346.455901-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110143346.455901-1-danielhb413@gmail.com>
References: <20220110143346.455901-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This alias is a indirect way of setting stack->phb->index. Since we have
access to a valid stack->phb (for default_enabled() at least - next
patch will deal with it accordingly) we can directly set the phb 'index'
attribute.

Let's also take the opportunity to explain why we're having to deal with
stack->phb attributes during pec_realize().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 1f264d0a9c..417fac4cef 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -395,8 +395,17 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
         int phb_id = pnv_phb4_pec_get_phb_id(pec, i);
 
         object_property_set_int(stk_obj, "stack-no", i, &error_abort);
-        object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort);
         object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
+
+        /*
+         * stack->phb->index is dependent on the position the
+         * stack occupies in pec->stacks[]. We have this information
+         * available here via the 'i' iterator so it's convenient to
+         * do it now.
+         */
+        object_property_set_int(OBJECT(&stack->phb), "index", phb_id,
+                                &error_abort);
+
         if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
             return;
         }
@@ -534,7 +543,6 @@ static void pnv_pec_stk_instance_init(Object *obj)
     PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
 
     object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
-    object_property_add_alias(obj, "phb-id", OBJECT(&stack->phb), "index");
 }
 
 static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
-- 
2.33.1


