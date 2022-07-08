Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25B856BB14
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 15:44:34 +0200 (CEST)
Received: from localhost ([::1]:56374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9oHZ-0001QI-Ex
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 09:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzS-0003Ck-5B; Fri, 08 Jul 2022 09:25:51 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:35427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzO-0007AU-Fi; Fri, 08 Jul 2022 09:25:47 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-10be0d7476aso22335401fac.2; 
 Fri, 08 Jul 2022 06:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fr3ghyevK9vsVAzKmFGfsmqLPnplPGI8L5S5Df8BMxk=;
 b=poLaTrbr0dPsRheoRtApi4/lcQ8SF66No9NndeM4rLIqbhWHxWa85QV3ZTxfEyC+iN
 N+sTc31luMMontZbrGNeJjQALT4dhg/YlAzmuwszjM72e7oNX/8RIAjKYRVS24lIFx/e
 wRZ/QXMA5OXHkqWTGqCDewA46X5BXSSnik97/CoJJqXXqPIygnLTrpSZua30mb0lSuXv
 i76vsXR9HTxCyRd2XXSR7YJyxST9sqMKyojNliFOP+CSrjCnFR4/F5L0WMx6FmHECOE0
 zqEBfnok18ehomYmGrLGAa6sXVbMOYKKYctQ1g4Vme4qv1boMeeCcsHK7CAg3rAq8XiL
 soGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fr3ghyevK9vsVAzKmFGfsmqLPnplPGI8L5S5Df8BMxk=;
 b=7SdT9CbQKvI5rCDHfY6niSp6gXTpD80Sieru7cxYEildHm80ufdbE5GdHHslap8RW6
 ibd5Iri59YfJlQuqxPjBOYtyLHytjzLv8HVMB1sKqHO4P2EqiAAnXu+Z+PN0snDf2PT2
 i65h0NuCJEAaASj10N0vVtlD1Nbua0BTFb6CLmPAV2ZCRjCmYxBtozo6HdOnzCIiFvK7
 bp12h5K1ognUPQH5NtlrbMw3iY89wcd1GjxvwLpfV04SottM+lSah+TXo0tM5U2HjpuH
 vBlSCi6bDjTmYd/KFWTGUsALgfROcj3EtzMu/lpbF48A8kmvaIiMr6AgZu9azqqUJakk
 j7TA==
X-Gm-Message-State: AJIora9pyfzXwLT3xiQDTqZzPkMqEwwhNVvkAxxKXlfybCYl3dePUbMy
 KrR3LHDY+DkFhEgFBzAlmaurPVzqJEw=
X-Google-Smtp-Source: AGRyM1sLTWcpL4qSJEI/MUF9Ab+5nkfQmfoelrON/MM52UQu1Fw1uqQm7ceFfiYCPBtFk61UDdDLtw==
X-Received: by 2002:a05:6871:5d4:b0:10c:1f1b:8c81 with SMTP id
 v20-20020a05687105d400b0010c1f1b8c81mr1934629oan.205.1657286744914; 
 Fri, 08 Jul 2022 06:25:44 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 f108-20020a9d03f5000000b0060c00c3fde5sm18435797otf.72.2022.07.08.06.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 06:25:44 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 09/10] ppc/pnv: change pnv_phb4_get_pec() to also retrieve
 chip10->pecs
Date: Fri,  8 Jul 2022 10:25:21 -0300
Message-Id: <20220708132522.581382-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708132522.581382-1-danielhb413@gmail.com>
References: <20220708132522.581382-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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
 hw/pci-host/pnv_phb.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index c241e90036..a5f3a8d256 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -53,17 +53,30 @@ static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child)
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


