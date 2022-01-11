Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1667D48A4AD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 02:04:38 +0100 (CET)
Received: from localhost ([::1]:53132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n75aX-000886-6h
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 20:04:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n75SQ-0007rn-K4; Mon, 10 Jan 2022 19:56:16 -0500
Received: from [2607:f8b0:4864:20::929] (port=42622
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n75SN-0003pe-Aq; Mon, 10 Jan 2022 19:56:14 -0500
Received: by mail-ua1-x929.google.com with SMTP id p1so26867643uap.9;
 Mon, 10 Jan 2022 16:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7iKHpUcdC7fmMFDj5oY1t0/24e0sDOIq68C6F5HZzTk=;
 b=qYO97sYA7ElOsHU8iJSdR71B4rPQgC3roKwJ1Wy0nyR8Ef32CKgU00x1XBLwUQJdUh
 Rp5Kyr4quXt0vJHQYlSbK8hqiTekfkNk2UNIRD2Uoea02BMnrmmaxmnsiqyJYLyxEgBZ
 nTCndferWL3SiZZdtzpoc7d6lJBQcVOhkD1sGoYK89pSPSsZsMrgG79w6JUs5dlwLtJS
 GLtSEQtA0TuiLslX+6WCwrlptqjwc0YyANW3Qzxgx8L/sE3kfaEHHi9nUWdRjLfkg5Qa
 gtwLPrghmc97WwB90tSuKtB0N+1/pyW/giN+PjTyHnH2RZ1twc4JZurjyN1HIaVC2Vn5
 MaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7iKHpUcdC7fmMFDj5oY1t0/24e0sDOIq68C6F5HZzTk=;
 b=acV1uQ4dauZNvRwUFKCWZZyMnL3++SSTE6DbUpP92ksbLPg35r5cZQFCWekJbTYVAE
 PwgrIDLj1noI2BgjnBWlNLKD8ee3oBtx6KPC1r9qX28u/9y9uu8ZHLj5lMXFMkXKqMqJ
 pk2pTjZIRktOkHmSPo25W3qwo7ZVtq78AXm20uX28hun6+eYLUJvozRQ0j/kZVOqGMGN
 OeOKkOClQ92wJDirdzRPKqTUBlKHYuY+mlk7Qa+gmyJmUaxuAJvowLGTqmbnOMBXD1QX
 6QKN8xeVvjR3eWL9WyuL4TgtJNtO0Z+rwYIKt/k0J6AyDrv19Whqmavb1WLFFmy58pHs
 XvQQ==
X-Gm-Message-State: AOAM531cmzJR8vur7E2/iLZQiP0IFGaPBITfPwDFLOhFirMoxLb5bb3U
 ai+ywrVvHfvmWklxa9UJxx+UlgTnh9Qgs4ju
X-Google-Smtp-Source: ABdhPJxU6we1oiASy/C03qX2J+/0o6hNYJsjO4NbInW4bSWS6xvx1A7UU79VbG1zc1HGxA/t9K3rgg==
X-Received: by 2002:a05:6102:3708:: with SMTP id
 s8mr1064488vst.56.1641862569556; 
 Mon, 10 Jan 2022 16:56:09 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id x190sm4645562vkf.56.2022.01.10.16.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 16:56:09 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/5] ppc/pnv: set phb4 properties in stk_realize()
Date: Mon, 10 Jan 2022 21:55:54 -0300
Message-Id: <20220111005558.549685-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111005558.549685-1-danielhb413@gmail.com>
References: <20220111005558.549685-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
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

Moving all phb4 properties setup to stk_realize() keeps this logic in
a single place instead of having it scattered between stk_realize() and
pec_realize().

'phb->index' can be retrieved using stack->stack_no and
pnv_phb4_pec_get_phb_id(), deprecating the use of 'phb-id' alias that
was being used for this purpose in pec_realize().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index d64310e7db..f8038dff17 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -392,10 +392,8 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack = &pec->stacks[i];
         Object *stk_obj = OBJECT(stack);
-        int phb_id = pnv_phb4_pec_get_phb_id(pec, i);
 
         object_property_set_int(stk_obj, "stack-no", i, &error_abort);
-        object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort);
         object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
         if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
             return;
@@ -534,7 +532,6 @@ static void pnv_pec_stk_instance_init(Object *obj)
     PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
 
     object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
-    object_property_add_alias(obj, "phb-id", OBJECT(&stack->phb), "index");
 }
 
 static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
@@ -543,6 +540,7 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
     PnvPhb4PecState *pec = stack->pec;
     PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
     PnvChip *chip = pec->chip;
+    int phb_id = pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
     uint32_t pec_nest_base;
     uint32_t pec_pci_base;
     char name[64];
@@ -570,6 +568,8 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
 
     object_property_set_int(OBJECT(&stack->phb), "chip-id", pec->chip_id,
                             &error_fatal);
+    object_property_set_int(OBJECT(&stack->phb), "index", phb_id,
+                            &error_fatal);
     object_property_set_int(OBJECT(&stack->phb), "version", pecc->version,
                             &error_fatal);
     object_property_set_link(OBJECT(&stack->phb), "stack", OBJECT(stack),
-- 
2.33.1


