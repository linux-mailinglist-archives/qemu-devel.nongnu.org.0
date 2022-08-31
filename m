Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128905A8677
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:11:54 +0200 (CEST)
Received: from localhost ([::1]:39856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTT7x-0004e4-7u
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoj-0003bB-3J; Wed, 31 Aug 2022 14:52:01 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:38864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSog-00086e-Do; Wed, 31 Aug 2022 14:52:00 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-11edd61a9edso20211298fac.5; 
 Wed, 31 Aug 2022 11:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PaKESB+QPA+sQye3NKS8cISxq5y/K2MpMTedRaLu+GI=;
 b=PDowfpBidDdbhK4HTSvDGSmgx13QfoCap1K8upOwj6lGWwPu5CV5LPCN1lOxm7j1VC
 G7fcxErlwliQRmgK+XVQYTK9FLzyeURMEN1CcU9mqtjjSnKpW6U/npFzU+E7/LVCEqkc
 clMHCwaGsFwrR2fBN2+z3HzrjW6q2c/4clVatHwPlx++kgU/h52AWLhAqEMam9+9QN9X
 02Ja/c1ZQcbxOGviSGWrMWccELXhEQTKFVItkYsOzkBh2ZgUhJvIWbRjCKTZnyVEeAbv
 +iWy6GpcEi5JNn0JF1jEiXzN4IdVsb6peH6+ZuXJYA/9v3eIYHVBloSrkODc/NqvYYTH
 EfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PaKESB+QPA+sQye3NKS8cISxq5y/K2MpMTedRaLu+GI=;
 b=DnctHRy8Pb6Mrailvx2roYDitnZ/SwSgyT2zJ2JuKnVUZRoHyNs6sQbKoNVu2PDOwD
 3xNEay5jE1bZSSHf7DzUe35sDD6M5PkUjSRCwnKt8Mgffx6iNeQGfMN1ZcThzsJHO212
 OgAvm0r8Qct0ae71eARzeHfugWxGYQP7zBcyaE7Nf9p6SeVZAJkT+drvAXHwkImjAeKP
 yqEaOqA1o2b+TcjcTK7jr2hGwMREnB26A/P4VRGoURwfZwTqY5lugvM1mZhl2vgqiAaq
 fWPcoIgPMeBVwOP78XGTh3mC0X4SXjeIpKr8xTD5qc7VthoAXeGphUeTc9XH5ciMKVOa
 Juhw==
X-Gm-Message-State: ACgBeo2O4w/2qffh6V/3T1XlqjX2gHP48d57k0tcTmqdPBwyKyaYLvS5
 TWDcFNuFjEO5KVDwTOyYGaQ7sYkL2EU=
X-Google-Smtp-Source: AA6agR6nseTVpKVdeR6qBC3DX8b8A4p3S7E1Y9o4qMBkL6/gIpmYpJ4Oji6uptoYkk+2PGrot8rXqQ==
X-Received: by 2002:a05:6808:bd2:b0:343:4709:8846 with SMTP id
 o18-20020a0568080bd200b0034347098846mr1845254oik.201.1661971916913; 
 Wed, 31 Aug 2022 11:51:56 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:56 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 26/60] ppc/pnv: change pnv_phb4_get_pec() to also retrieve
 chip10->pecs
Date: Wed, 31 Aug 2022 15:50:00 -0300
Message-Id: <20220831185034.23240-27-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220811163950.578927-10-danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index f45f02be4c..c063d01f8d 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -284,17 +284,30 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
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
+        g_assert_not_reached();
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
2.37.2


