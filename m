Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E24D489B81
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:44:32 +0100 (CET)
Received: from localhost ([::1]:33808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vuR-0004fD-IZ
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:44:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkN-0001fa-Po; Mon, 10 Jan 2022 09:34:07 -0500
Received: from [2607:f8b0:4864:20::92c] (port=40924
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkM-0007P0-8h; Mon, 10 Jan 2022 09:34:07 -0500
Received: by mail-ua1-x92c.google.com with SMTP id v12so23734591uar.7;
 Mon, 10 Jan 2022 06:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gvsi+wHzSzQjFDv+uy0z/MepjE1ZR7vEH6PIJ0PtOAs=;
 b=qyYRxqR3ZBFGKIF5ym1sutjtS0ZfrBDsQh3TcPUwPiGZnI3kxeg/bqf1hL7LtxcQ8t
 xUvguxxiJpslalmtvmMqvxzLIJJDYqP/0/ekp0rXmgHFhaqi6clTKnXGLSYomgoyw13j
 XihbqLWOBWcviqYV3tUotX8haLJdFf6j5FaSsOHMCYQTPCl8okEwqCHWLSAypEgSipK8
 mtaAAuKL6b88UjAxvPWMA7YX0ZWFSRovSgXsvC6JOmdcagPGMqXlBwnUDsIsIEdineW8
 7g/IeoudBx3jQKna+TQLNsx3fQKDHdCHJmcFCQhjdAl5Zeuyg5uaEKFAe61v8u/zSgn6
 jlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gvsi+wHzSzQjFDv+uy0z/MepjE1ZR7vEH6PIJ0PtOAs=;
 b=mr02kDTvqAjRIEpXifDrupmY1acRIRG4lExWON7+hC2fX9gMdXhtRcqXo6+U+QXKkc
 NgSsU9LvATr1qKtfWAYD0aW9GyCkPsfuCt2/D4jitjrMzWE3jcFgFZcos5P6qbN1ecij
 uYH+Spdg+KWQzBq6w9C2O5DDN+ZRRwpW1HhAyp/i7cWhfucE3kmkRII1pW4Cdu6LC+ao
 7W3iDN2iH3vAvvh5J7pj+iRTF12B4ViV5IVnmo2eNHqszMTskOdJns255mTtt0BH6w75
 AezbAWglFgutLEnl/HcxqMRT9PSLO+u/9TUCULyMGe/rI8+2DzmROHdlwrC1zDDT1wxv
 pbJQ==
X-Gm-Message-State: AOAM533VL/sZhSO22jaEBlVRRRedbtE3pOpHu6tYFa7/2ibAYBGRtv6p
 +IOPo93i2Xe5rG280My7lL+raGZ/1qxwFmvl
X-Google-Smtp-Source: ABdhPJyoHh8yRcOqERU/Xv2FyoaFxWnN9NK3oCzUO1rDvustvUQIF0AOirHMxftXb2E6Pg6c9Hnriw==
X-Received: by 2002:a67:f041:: with SMTP id q1mr1581vsm.79.1641825244945;
 Mon, 10 Jan 2022 06:34:04 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id o11sm3709677vkf.41.2022.01.10.06.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:34:04 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/10] pnv_phb4_pec.c: move phb4 properties setup to
 pec_realize()
Date: Mon, 10 Jan 2022 11:33:41 -0300
Message-Id: <20220110143346.455901-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110143346.455901-1-danielhb413@gmail.com>
References: <20220110143346.455901-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92c.google.com
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

Previous patch added stack->phb->index handling in pec_realize() for
specific reasons (phb->index is reliant on the stack index in
pec->stacks[]).

Move pnv_phb4_set_stack_phb_props() from stk_realize() to pec_realize()
to have a single spot in which we set PHB4 properties for the default
created stack->phb. This will give us one less spot to worry about when
introducing user creatable pnv-phb4s and having to deal with stack->phb
being NULL depending on -nodefaults being set.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 417fac4cef..d2851e8040 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -405,6 +405,7 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
          */
         object_property_set_int(OBJECT(&stack->phb), "index", phb_id,
                                 &error_abort);
+        pnv_phb4_set_stack_phb_props(stack, &stack->phb);
 
         if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
             return;
@@ -576,7 +577,6 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
     pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(&stack->phb),
                           &pnv_phb4_xscom_ops, &stack->phb, name, 0x40);
 
-    pnv_phb4_set_stack_phb_props(stack, &stack->phb);
     if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
         return;
     }
-- 
2.33.1


