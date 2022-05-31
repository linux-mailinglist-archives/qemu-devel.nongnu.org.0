Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94995539957
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 00:08:25 +0200 (CEST)
Received: from localhost ([::1]:36590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwA2K-0002B9-Na
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 18:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kX-0001pz-96; Tue, 31 May 2022 17:50:01 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:37777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kV-0003Kv-Nn; Tue, 31 May 2022 17:50:00 -0400
Received: by mail-oi1-x235.google.com with SMTP id s188so198370oie.4;
 Tue, 31 May 2022 14:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0xm+pvgnLXF6YChbzXzgN2uXzqkvWIe+xZmI1Mbyfg8=;
 b=VeA0R2qfOchgloJNnQ/+JqMlBTmPCiawaTc4MbrHaWSpz7a6Zlxhb7/pHzSHOABKnZ
 Q7pkwRz3wp+YOBhhWLsab2+6jEQC5BfKE4OI8d8/DP55XiEbGLhjGgNBMdAd/CimN7Sg
 92WX/Gv007VY9zBCNoP+Y5Yf1CBOe0glGzWiwe9yQnh/g8LLCsQfGAaLNJYfU5Qn0Ipz
 PMpkQAXbcpDJ4BIvxVRyAj5AcTMOTalZ+HrpN7fdmgv6elR8u42fTAYl1AnKcqQ5HWsj
 cNSE0LZofuXwaKmLlOct6tT299dUsnYc1KzNXadDreczYXac3zLEHmxiu75xBCeaGQa+
 9A3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0xm+pvgnLXF6YChbzXzgN2uXzqkvWIe+xZmI1Mbyfg8=;
 b=JmuOlpKVW556utcbeGApUQxEjJbXiOm0ISKqmx7kn29OB4phnlc5GKRX44LRKPBRiW
 xx7GIKLS3zUpcvmCKORYrH3SM2TAVCsSiz4+8fhxyJUInDYX/8C8ZzuVBZw2Xh3OhIRQ
 QbTbiAKSkMkRvxwxlwFVfToJSYS0E1O5qJZY3d84F+Z6flQotkGtJvj+CDlE+j6epre2
 PONttzZv3r2XkhJFXv5k8KdAKjarT0/ulQfHUoeYpPf16vhJCCFlBrgdq06QqI5URPdD
 EIJU7KKVlNYHAAjp8fHMjzJDUmD3joOiO3x+fBRzY3EPrzs9p/pyNCtyoqSsCKFKg9gh
 DNjA==
X-Gm-Message-State: AOAM5324hnBY+kX7Ia66nh6CgkKMWpqOhjGsRx+1KbAg9JUVkFIsBNAU
 eY7N9a9EwUHTy/k9MOCVNhUK8N+Ai2oWUw==
X-Google-Smtp-Source: ABdhPJwj/8qB5OhAuVvCGOonkc15JGVSLEo5t771pJhjIBY6c+Bc1Dr+D9U/ojp5z/h+dZwd+Jl3tA==
X-Received: by 2002:a05:6808:3084:b0:32b:a2a3:7706 with SMTP id
 bl4-20020a056808308400b0032ba2a37706mr12961691oib.288.1654033798692; 
 Tue, 31 May 2022 14:49:58 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:49:58 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 14/16] ppc/pnv: remove 'phb_rootport_typename' in
 pnv_phb_realize()
Date: Tue, 31 May 2022 18:49:15 -0300
Message-Id: <20220531214917.31668-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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

The var is being initialized using the TYPE_PNV_PHB_ROOT_PORT value for
all values of phb->version.

Remove it and call pnv_phb_attach_root_port() using
TYPE_PNV_PHB_ROOT_PORT directly.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index f1c106edf1..c33223d275 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -25,7 +25,6 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
     PnvPHB *phb = PNV_PHB(dev);
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
     g_autofree char *phb_typename = NULL;
-    g_autofree char *phb_rootport_typename = NULL;
 
     if (!phb->version) {
         error_setg(errp, "version not specified");
@@ -35,15 +34,12 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
     switch (phb->version) {
     case 3:
         phb_typename = g_strdup(TYPE_PNV_PHB3);
-        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
         break;
     case 4:
         phb_typename = g_strdup(TYPE_PNV_PHB4);
-        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
         break;
     case 5:
         phb_typename = g_strdup(TYPE_PNV_PHB5);
-        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
         break;
     default:
         g_assert_not_reached();
@@ -75,7 +71,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
     }
 
     if (defaults_enabled()) {
-        pnv_phb_attach_root_port(pci, phb_rootport_typename);
+        pnv_phb_attach_root_port(pci, TYPE_PNV_PHB_ROOT_PORT);
     }
 }
 
-- 
2.36.1


