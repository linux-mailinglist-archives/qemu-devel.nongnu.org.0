Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F74648EFAA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:10:42 +0100 (CET)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8R28-0000Ln-KX
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:10:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8QzK-0005wa-90; Fri, 14 Jan 2022 13:07:46 -0500
Received: from [2607:f8b0:4864:20::22e] (port=33312
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8QzI-0000Py-JX; Fri, 14 Jan 2022 13:07:45 -0500
Received: by mail-oi1-x22e.google.com with SMTP id x193so13295844oix.0;
 Fri, 14 Jan 2022 10:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+s3nhtSk2YpzWrGuoOJzW9TunNDpdDP8jlJZEj/uFJ0=;
 b=QPucnjcUzn1Hrc37ySoRoExFIen76RwJlM0y5nMJ/QerLjYEKDGgYnufxQGVgRYmrc
 FxuC4wih96kBA1jEQP3Q682QCj6TXXLWUOo+Zk+A0kXZuLQDu/yiC6SSWvGoGxyrkKyd
 pgoH9iP5TCQ0zp5MFSWe4rpl7o/PEg5WBVCH3YK0nQcqvpjldz+qVHAZkjLomEHkPspN
 a4t47KxScFL6Rv8bHQnoeBJ13LWV/zRXC7Aes8mfKs4TadAB3ioG8RQ+I4Oeok61XJ+o
 JW6Psslqap3Xok0KFX8nFMQOHIAMzC9C9MOzZRW0I9CY7Lfb6NBnk1OJDGz72iaa1PXw
 LsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+s3nhtSk2YpzWrGuoOJzW9TunNDpdDP8jlJZEj/uFJ0=;
 b=aRE+kkGR04khlnRdivZ2wAcaG/zudoF/x5TBlLnAzXN8Lrfydgcxx4sV7qccrQcBFG
 p9Uh0/jX10IJ83mkI25Ndiz3B2IxtXIcEto/GhrkjdA6hu+sTi5ivpoZ8byqmKeQeNcx
 cMdQf2CHHNyUeO2zowT+nrPCj97qihubxwuihg3kOvAKSWw9iFr/MLBRIQKJe72brsa9
 3rsIpWuMovkSiZhdkpVKNNen5TKCBWikwcRBhLc9zlKYMKyx8cAELt9BF1yagkkeB2kh
 vMu7ILBjRi8zdYToO3zAedr/JOJjOHO6yPiVCxjTnon1FqOE9XYmxveasDUTCrewZ3EF
 e5Pw==
X-Gm-Message-State: AOAM532c74I9t7sbdL/wLhsRoXE/Kuv7PfIm6tz1oF+pTBdt94KZGpGN
 ETTlaCN3zvlV877lDeXG6XxtvSBI2MAZS9rP
X-Google-Smtp-Source: ABdhPJyQQRcAsH6PceZxVo+pLpOLy8yjfq1Te8WIwpkr83BxfMkCj4AOhUCUkl09v6CEVcdjKN3tgQ==
X-Received: by 2002:a05:6808:91a:: with SMTP id
 w26mr101907oih.145.1642183663211; 
 Fri, 14 Jan 2022 10:07:43 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id e17sm1353584otr.13.2022.01.14.10.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 10:07:43 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] ppc/pnv: remove PnvPhb4PecStack object
Date: Fri, 14 Jan 2022 15:07:18 -0300
Message-Id: <20220114180719.52117-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220114180719.52117-1-danielhb413@gmail.com>
References: <20220114180719.52117-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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

All the complexity that was scattered between PnvPhb4PecStack and
PnvPHB4 are now centered in the PnvPHB4 device. PnvPhb4PecStack does not
serve any purpose in the current code base.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c     | 33 ---------------------------------
 include/hw/pci-host/pnv_phb4.h | 17 -----------------
 2 files changed, 50 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 852816b9f8..12aa459628 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -278,42 +278,9 @@ static const TypeInfo pnv_pec_type_info = {
     }
 };
 
-static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
-{
-}
-
-static Property pnv_pec_stk_properties[] = {
-        DEFINE_PROP_LINK("pec", PnvPhb4PecStack, pec, TYPE_PNV_PHB4_PEC,
-                         PnvPhb4PecState *),
-        DEFINE_PROP_END_OF_LIST(),
-};
-
-static void pnv_pec_stk_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    device_class_set_props(dc, pnv_pec_stk_properties);
-    dc->realize = pnv_pec_stk_realize;
-    dc->user_creatable = false;
-
-    /* TODO: reset regs ? */
-}
-
-static const TypeInfo pnv_pec_stk_type_info = {
-    .name          = TYPE_PNV_PHB4_PEC_STACK,
-    .parent        = TYPE_DEVICE,
-    .instance_size = sizeof(PnvPhb4PecStack),
-    .class_init    = pnv_pec_stk_class_init,
-    .interfaces    = (InterfaceInfo[]) {
-        { TYPE_PNV_XSCOM_INTERFACE },
-        { }
-    }
-};
-
 static void pnv_pec_register_types(void)
 {
     type_register_static(&pnv_pec_type_info);
-    type_register_static(&pnv_pec_stk_type_info);
 }
 
 type_init(pnv_pec_register_types);
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index e750165e77..74fdec2b47 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -164,23 +164,6 @@ extern const MemoryRegionOps pnv_phb4_xscom_ops;
 #define TYPE_PNV_PHB4_PEC "pnv-phb4-pec"
 OBJECT_DECLARE_TYPE(PnvPhb4PecState, PnvPhb4PecClass, PNV_PHB4_PEC)
 
-#define TYPE_PNV_PHB4_PEC_STACK "pnv-phb4-pec-stack"
-OBJECT_DECLARE_SIMPLE_TYPE(PnvPhb4PecStack, PNV_PHB4_PEC_STACK)
-
-/* Per-stack data */
-struct PnvPhb4PecStack {
-    DeviceState parent;
-
-    /* The owner PEC */
-    PnvPhb4PecState *pec;
-
-    /*
-     * PHB4 pointer. pnv_phb4_update_regions() needs to access
-     * the PHB4 via a PnvPhb4PecStack pointer.
-     */
-    PnvPHB4 *phb;
-};
-
 struct PnvPhb4PecState {
     DeviceState parent;
 
-- 
2.33.1


