Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5052539921
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 23:55:50 +0200 (CEST)
Received: from localhost ([::1]:39150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw9q9-0000y9-U9
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 17:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kK-0001Bp-V4; Tue, 31 May 2022 17:49:48 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:46364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kJ-0003NI-Ek; Tue, 31 May 2022 17:49:48 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-d39f741ba0so157540fac.13; 
 Tue, 31 May 2022 14:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aVYHleY9lqsPK6rCR5/x5XotnJ/qLXEhT8k9XA3yAF0=;
 b=GgkX4LWvlJvG5wnFYesAm4TTOdpzZGh4mvkJ4BAAbwEgRjaZJ5CfANsxFO5sXtU7Fr
 +N1PYAkvYQ252N6cy0fF5nemxOkbn0jXpWdqC70lsrcFaFX7y19R9PFtwAtXjBUfl7Jd
 ssGc7TXXWC8uvPXSPjfE5b5haLuPd0RJx1cWO9xr+kVJk6a8WsADDrjmxn7NZnmq/3DD
 crBOWP4fTlbCbFE0d3QIvrXXCMJEa8J4qE1kRAs6PujtILPs5j2XgAXtgnN1TEo17tAC
 WZBCEGkmPkdZdJFWMW9vYbeSNz7MjnCi2GyevFef3aF6m2o8K8TGJUbP2Eg2AZ1FVXFp
 etvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aVYHleY9lqsPK6rCR5/x5XotnJ/qLXEhT8k9XA3yAF0=;
 b=Ay4+vX+qrDE0G3Xq6MU91F2LoDsr5PN53VDSFd9a8EvG01OzBK45xRplpkX37tHMDV
 wcHj1ouScAvJVdF6ThakpmJbZTvr9LMG+V4T7pYnZe0/4Pt+AdaGXX/pMhhIpchp14e4
 vpoP21rFwHr2gyXTLcbWWZAYFXvXVrr19KMFVdMrpg5JFixDtMfEXqC+/VWsZEbf8Rf9
 T86AjvvOnSExaS+wIXvPV3CFWdZsfRpGZzIOdwBvDEs+/4h4mBEnfy2mhRPzO9j1IatG
 mT1n+Slnsk+FXkROlY9IMN19KmsVTofuUJUmQAcWoNTFDBUOnxesn9DQFAqrdMekYRvE
 sBLg==
X-Gm-Message-State: AOAM532mH3o9QVXJPfRiwY4svp/OEXKxDS1kUZN7wO5vJVSbb3guxNU+
 IUh51Y5yg3rGt1vYq00vjXM1o1VWzFD/tw==
X-Google-Smtp-Source: ABdhPJw5HXulKjloX4dyOir1Le9y+B10K1oSa5LGBQAi0k/IJ1I93pMIwpjEkhgFz1tslPasOqYy9w==
X-Received: by 2002:a05:6871:88d:b0:f3:3341:77e2 with SMTP id
 r13-20020a056871088d00b000f3334177e2mr6978579oaq.124.1654033785783; 
 Tue, 31 May 2022 14:49:45 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:49:45 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 09/16] ppc/pnv: change pnv_phb4_get_pec() to also retrieve
 chip10->pecs
Date: Tue, 31 May 2022 18:49:10 -0300
Message-Id: <20220531214917.31668-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
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

The function assumes that we're always dealing with a PNV9_CHIP()
object. This is not the case when the pnv-phb device belongs to a
powernv10 machine.

Change pnv_phb4_get_pec() to be able to work with PNV10_CHIP() if
necessary.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index a5c8ae494b..e953aabcbe 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1574,17 +1574,30 @@ void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb)
 static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
                                          Error **errp)
 {
-    Pnv9Chip *chip9 = PNV9_CHIP(chip);
+    PnvPHB *phb_base = phb->phb_base;
+    PnvPhb4PecState *pecs = NULL;
     int chip_id = phb->chip_id;
     int index = phb->phb_id;
     int i, j;
 
+    if (phb_base->version == 4) {
+        Pnv9Chip *chip9 = PNV9_CHIP(chip);
+
+        pecs = chip9->pecs;
+    } else if (phb_base->version == 5) {
+        Pnv10Chip *chip10 = PNV10_CHIP(chip);
+
+        pecs = chip10->pecs;
+    } else {
+        return NULL;
+    }
+
     for (i = 0; i < chip->num_pecs; i++) {
         /*
          * For each PEC, check the amount of phbs it supports
          * and see if the given phb4 index matches an index.
          */
-        PnvPhb4PecState *pec = &chip9->pecs[i];
+        PnvPhb4PecState *pec = &pecs[i];
 
         for (j = 0; j < pec->num_phbs; j++) {
             if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
-- 
2.36.1


