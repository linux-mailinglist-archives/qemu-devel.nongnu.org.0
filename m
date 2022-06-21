Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C94553929
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:48:32 +0200 (CEST)
Received: from localhost ([::1]:55154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3hzL-000122-DM
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hmE-00033d-Ni; Tue, 21 Jun 2022 13:34:59 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:41662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hmD-0002N4-5r; Tue, 21 Jun 2022 13:34:58 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-101bb9275bcso14331700fac.8; 
 Tue, 21 Jun 2022 10:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ztFSWJnh8BGUI0Pf+7euDhAg+N/mGyeidsCeGXEMqU=;
 b=nt9YbLUB+Rpy0krSDejrLBTzdCuanV3VxjT4NAo0xncLsSS5YPAzfI0PnvUS+YCS+J
 vBUXUQZxoKaLb92lVSLY3uZqHJhGdJApBmzKG6O3+MZ68DoiVG4kVC1RQsOSuPOYB3Ve
 FmZGJODXCUMb5Yn1PEh4YwOrbBRCTfMJsZw7D+l4NJJPqnNMQm3LoqOvmSG52FNHeRW7
 BIiFSEhWgjYCVUjtTGCc8KuUPKYiI/3VJg/dg6VMB9NxiiK+CDu8JlqFQmVPXanFYWSw
 tFcQStPX6DgKeLQSZ6FjAp+D907GoBrhl4RN70sIvtcK7U1KLxnL/MtmI94v1HT6Ssv8
 wWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ztFSWJnh8BGUI0Pf+7euDhAg+N/mGyeidsCeGXEMqU=;
 b=5Klzbt7ipPV7PuAkCW5Kkye0NIPSALXrVbQOhx6b5WoROBdxejI9AhD5juWTSKmuGT
 OFIfRhqutDr71YqwTeeiBjjYHwqT5uHa6mguotdcPxeXZIcPKwCJPwaI6Iv1dBPiZAQs
 M93WoifQ38CwRSF6dUpra92wlF79lJ3I0S77Mx6RP4AtgS2KUGzzYdCsawrRO/Q/7k/I
 VlND98j16r7kPOnq6DrdXCTRPnoj+xLSO5S4PPp9HwsPWMzfZYpjrT6pg6eOPQ3WO/4h
 vpp405eRZNSnwqFLAPa2IxJJjEscACXWWzAW0vo8UPSeABahUZrQUq6SHfWtsVVKr9lI
 ujCw==
X-Gm-Message-State: AJIora8F9nHklP/oWKwgJRea0YJ87B/rBlStSGD5NKYsEGLiiluk2lNs
 jsz74700pt1fEXHvEzY9AFZ1+hnbmP0ngQ==
X-Google-Smtp-Source: AGRyM1s5wCh4JU6bt5IMmZooEQPeMQYh7Y7KYJztRum/NXcDZopKJs8E5OlbvLdkU0hUE+glNXJYwQ==
X-Received: by 2002:a05:6870:c0c8:b0:101:b3c3:abc3 with SMTP id
 e8-20020a056870c0c800b00101b3c3abc3mr11637400oad.144.1655832894581; 
 Tue, 21 Jun 2022 10:34:54 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a056870385600b0010200e2828fsm2886556oal.30.2022.06.21.10.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 10:34:54 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 6/8] ppc/pnv: make pnv_chip_power8_pic_print_info() use
 chip8->phbs[]
Date: Tue, 21 Jun 2022 14:34:34 -0300
Message-Id: <20220621173436.165912-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621173436.165912-1-danielhb413@gmail.com>
References: <20220621173436.165912-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

It's inneficient to scroll all child objects when we have all PHBs
available in chip8->phbs[].

pnv_chip_power8_pic_print_info_child() ended up folded into
pic_print_info() for simplicity.

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 74a6c88dd2..d3f77c8367 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -652,25 +652,19 @@ static ISABus *pnv_isa_create(PnvChip *chip, Error **errp)
     return PNV_CHIP_GET_CLASS(chip)->isa_create(chip, errp);
 }
 
-static int pnv_chip_power8_pic_print_info_child(Object *child, void *opaque)
-{
-    Monitor *mon = opaque;
-    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
-
-    if (phb3) {
-        pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
-        ics_pic_print_info(&phb3->lsis, mon);
-    }
-    return 0;
-}
-
 static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
 {
     Pnv8Chip *chip8 = PNV8_CHIP(chip);
+    int i;
 
     ics_pic_print_info(&chip8->psi.ics, mon);
-    object_child_foreach(OBJECT(chip),
-                         pnv_chip_power8_pic_print_info_child, mon);
+
+    for (i = 0; i < chip8->num_phbs; i++) {
+        PnvPHB3 *phb3 = &chip8->phbs[i];
+
+        pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
+        ics_pic_print_info(&phb3->lsis, mon);
+    }
 }
 
 static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)
-- 
2.36.1


