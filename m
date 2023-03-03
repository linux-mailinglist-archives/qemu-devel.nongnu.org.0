Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2356AA131
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 22:30:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYCxR-0004cv-Ol; Fri, 03 Mar 2023 16:28:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pYCxP-0004cb-Vy; Fri, 03 Mar 2023 16:28:52 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pYCxO-00029n-Fk; Fri, 03 Mar 2023 16:28:51 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 q11-20020a056830440b00b00693c1a62101so2227656otv.0; 
 Fri, 03 Mar 2023 13:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wfPfcqwMeqajB5OGSRPf4G6T1CszDgygMYTUOB4XWjs=;
 b=Sw9zkQB2H1+foFMFG5jy7/GGj1ekIEbhz6qFDDhehIw37R7ykgT1QU6G1pBmSGM03t
 WRFef/rkwE1Q6lHDYv5UTUAj+0dVkQWhMHQLom9QOp+mUl/xuhNJuj79U4DdZPNsMTgw
 oy1W0iwWxaquJVH3DVdozFSCaliRVNka6aVYQ4EWdd53j8+GUJoljQ8ALxolyIBcjCk6
 LikMMPS4pfqMP4HQ91elzehxh7rXQfOrrIi0pHneutmI5tZPhhizG2bBQoqM4DvRhLR2
 W6uE9qT34hSAuZVa7qY65OQ5eAAh5gVmEVYQy6av2nYD/DC+1U2IganN0x4vNVMYOre8
 5Srg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wfPfcqwMeqajB5OGSRPf4G6T1CszDgygMYTUOB4XWjs=;
 b=rqqvvLivznYo+7odqC30tfVFe2uipVzBPUc3Gxxr9/u7dXydHFcFhI//K0//Q3nNOu
 pfM5G/9Ew7D4/DISUMXDvzrY7jrnHIst7NgDEu0Cv0Le4HQoT+YC7i4e+Sfw4qLNmLta
 Xbt+x94Yuu6IIzMwa28Z67PzZevl1aMmdkcncPR5kyvK98Pn6SNgRk3hntYMaR4NADYB
 YVYiYp8bhsCWbmcK8BwzaL7CU6wvcxbGjoh4xy4CbUmE+9kWpOn6B0J078YwAcD1LonN
 ul9CDAv33JLba/Mv1ExwbrBGkhJoRWZ9yv9vg1DH8WG5Sp3m3GGxiaaS7UDSf/TxKKn4
 uf9g==
X-Gm-Message-State: AO0yUKUVhxJaUj0JE14TbvoKwd+iTDgOp5/QbYAH1NfpRuZNvRtow8Iw
 3TZuO1N/mBKkyJs5Oq5vjqVsCdbKUMs=
X-Google-Smtp-Source: AK7set8FGUYf3B/c4TZfQG44Ku599GeLbGOWeqaXFhgGg0kjUYG0IpeW1ZRY0G9UY0OLN0JNEIkxWA==
X-Received: by 2002:a05:6830:3687:b0:66e:a9bd:712f with SMTP id
 bk7-20020a056830368700b0066ea9bd712fmr1484358otb.10.1677878928562; 
 Fri, 03 Mar 2023 13:28:48 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 k4-20020a0568301be400b0068d4649bedasm1473635otb.67.2023.03.03.13.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 13:28:48 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 3/5] pnv_phb4_pec: Only export existing PHBs to the device tree
Date: Fri,  3 Mar 2023 18:28:29 -0300
Message-Id: <20230303212831.830278-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303212831.830278-1-danielhb413@gmail.com>
References: <20230303212831.830278-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Frederic Barrat <fbarrat@linux.ibm.com>

So far, we were always exporting all possible PHBs to the device
tree. It works well when using the default config but it potentially
adds non-existing devices when using '-nodefaults' and user-created
PHBs, causing the firmware (skiboot) to report errors when probing
those PHBs. This patch only exports PHBs which have been realized to
the device tree.

Fixes: d786be3fe746 ("ppc/pnv: enable user created pnv-phb for powernv9")
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20230302163715.129635-3-fbarrat@linux.ibm.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 97c06bb0a0..6c9b386069 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -199,9 +199,12 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
                       pecc->compat_size)));
 
     for (i = 0; i < pec->num_phbs; i++) {
-        int phb_id = pnv_phb4_pec_get_phb_id(pec, i);
         int stk_offset;
 
+        if (!pec->phbs[i]) {
+            continue;
+        }
+
         name = g_strdup_printf("stack@%x", i);
         stk_offset = fdt_add_subnode(fdt, offset, name);
         _FDT(stk_offset);
@@ -209,7 +212,8 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
         _FDT((fdt_setprop(fdt, stk_offset, "compatible", pecc->stk_compat,
                           pecc->stk_compat_size)));
         _FDT((fdt_setprop_cell(fdt, stk_offset, "reg", i)));
-        _FDT((fdt_setprop_cell(fdt, stk_offset, "ibm,phb-index", phb_id)));
+        _FDT((fdt_setprop_cell(fdt, stk_offset, "ibm,phb-index",
+                               pec->phbs[i]->phb_id)));
     }
 
     return 0;
-- 
2.39.2


