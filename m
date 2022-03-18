Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B454DE00C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:36:13 +0100 (CET)
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGWK-0007pi-DY
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:36:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTo-0004Wo-0O; Fri, 18 Mar 2022 13:33:36 -0400
Received: from [2607:f8b0:4864:20::c2a] (port=44818
 helo=mail-oo1-xc2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGTm-0002AX-G7; Fri, 18 Mar 2022 13:33:35 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so10921800oot.11; 
 Fri, 18 Mar 2022 10:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WicwrvEJOoYrd1fFE86yccnEjSgRWVX8GsAPL07xOkA=;
 b=J0iqlPbh/Qm2f/zHeK2pEumvZttodvmekazpM+i2cARJelq7FSfZl1QGKJItwFk0uE
 3QvNQeq6ehcVkohvAC27Ci2OwH0tu3X2s1XdT2SGgST91u8WWNwcfEXcAteyxQ/GWYuV
 wILvWEJC0zNPWzr5GRGoc1kP84Y1m9deyx3xj1FnH6Is88oJvYll2YXRZ37Y42K3egYU
 XgmR0BbGYeU4d3yDB5qqT9crv8mqvK8TH6ArZIhV8SrFKaik2KYwNQzBCVhLd2e/MGar
 aGNtDUoeietMsRrLaq9VpMZibqAyV7C05zujHJGhHB4k0u5rmYoVOqtNZX5FItoiDf8Z
 3/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WicwrvEJOoYrd1fFE86yccnEjSgRWVX8GsAPL07xOkA=;
 b=TGFDCprhKlD1Qw6nst/lzkllFNTxiZAFmTptW1pVpujsbFRl+yGgNwxf0c70/v2Lny
 JwNSNqH3tGi9EmRlkgS3024DRe5gNqo9lLDQ7z1mZM6VQ6Nl96TGZEkwUIuqkWFaK5UT
 7GnfXQ628Vzm+ecRUik0esvavmnDaVu246Hi7ggF+FDaSKFnlYZOkb4XMHRxOxpM7izv
 fXrvQ9pXmCLYtUs8J1njE5DM3D876vd6ZdmJj2NglUFjEDuj0iaShAQb5Mbz+PJ14zQI
 Jx25Lvn2yh6HnQvVM9ifvyd3nnqGrudDP7zEz+RIy0BYaWVNVq3CDi175/OoWwhsxf+9
 tqmw==
X-Gm-Message-State: AOAM5317Na4zxq12SoxNu50HU75YnCF4aLuhpaj06wvk2d6AWHw6YcoJ
 zL3fHFyGwzIqQ2E7YEQAn+z2VJbR0g8=
X-Google-Smtp-Source: ABdhPJxOCCQAY2sYGsIfTDp0IABSiuIrCdDLthiiyVc340gu6rHPBHYm51xkEQe5gkZCnTHdQ2+rLQ==
X-Received: by 2002:a4a:1784:0:b0:324:5b06:dd0d with SMTP id
 126-20020a4a1784000000b003245b06dd0dmr3108389ooe.77.1647624813038; 
 Fri, 18 Mar 2022 10:33:33 -0700 (PDT)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:daa8:d948:1d15:1451:398f])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a05683025c200b005c93d78e1f6sm4324662otu.29.2022.03.18.10.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:33:32 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 2/9] hw/ppc/spapr_drc.c: redefine 'index' SpaprDRC
 property
Date: Fri, 18 Mar 2022 14:33:13 -0300
Message-Id: <20220318173320.320541-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318173320.320541-1-danielhb413@gmail.com>
References: <20220318173320.320541-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

'index' is defined as an uint32 retrieved by prop_get_index(). Change it
to instead return the value of drc->index the same way it's done with
the 'id' property that returns drc->id.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 1b8c797192..1a5e9003b2 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -316,14 +316,6 @@ static SpaprDREntitySense logical_entity_sense(SpaprDrc *drc)
     }
 }
 
-static void prop_get_index(Object *obj, Visitor *v, const char *name,
-                           void *opaque, Error **errp)
-{
-    SpaprDrc *drc = SPAPR_DR_CONNECTOR(obj);
-    uint32_t value = spapr_drc_index(drc);
-    visit_type_uint32(v, name, &value, errp);
-}
-
 static void prop_get_fdt(Object *obj, Visitor *v, const char *name,
                          void *opaque, Error **errp)
 {
@@ -577,8 +569,8 @@ static void spapr_dr_connector_instance_init(Object *obj)
     SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
 
     object_property_add_uint32_ptr(obj, "id", &drc->id, OBJ_PROP_FLAG_READ);
-    object_property_add(obj, "index", "uint32", prop_get_index,
-                        NULL, NULL, NULL);
+    object_property_add_uint32_ptr(obj, "index", &drc->index,
+                                   OBJ_PROP_FLAG_READ);
     object_property_add(obj, "fdt", "struct", prop_get_fdt,
                         NULL, NULL, NULL);
     drc->state = drck->empty_state;
-- 
2.35.1


