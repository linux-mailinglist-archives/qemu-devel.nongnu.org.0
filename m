Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB16636A219
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:26:49 +0200 (CEST)
Received: from localhost ([::1]:58414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laL7I-00054s-Ts
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laL3K-0008C5-69; Sat, 24 Apr 2021 12:22:42 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laL3I-0004JF-Lo; Sat, 24 Apr 2021 12:22:41 -0400
Received: by mail-wr1-x436.google.com with SMTP id g9so35398870wrx.0;
 Sat, 24 Apr 2021 09:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m7SCVR8UO3iTOtnM+SWHeXIebCCBRcm2Jf0+bqY98YY=;
 b=KPd8TiAr3dVt0XPsXBADdcpnxp18vBZU6UubUixBM0BUpGaY+iIl8O36RhaoerG7iX
 +t798YEuRqc5ZN7UrI5y/7VpolY1eWTuX8irjap8Y5IFT+lCBu2VDk1nnBzJl4BnSrQZ
 Dt0+8AJGN/tHCpH3W58RDTK+e08P0YSDJ2D+zg/Wqlp4UGOKE5HP+TT9DoqwHmswrxgs
 0Zo3dwbaLNRh4IpzGyH3JMED6Uu5XgXtzGkTL0csrjijHcV+Zs/fnPv98VixCRolsmBq
 d8yTik0Mxb8qPi5mXZGR/9okXGBiqTmz7zBwy9b8Xq60DqZcoqIFwIGBxjkAKOFSrDGu
 VvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=m7SCVR8UO3iTOtnM+SWHeXIebCCBRcm2Jf0+bqY98YY=;
 b=IvksWprE3XIYuPrbn2De6ZV9JQ1wbBM0tM02HeOz9qRk824q1BixeDkGc5AWbrfGNI
 pPPAMA4O3KRe+MvJIPpCdMJKWYnTpQ98bo1P5bu08HCh+cqiJUfUdrR7l40+ddQAGSX9
 sslzqgFZIIM29HnD5BePKdE4dlicu/iDLYVmVOFpyDbnvjfiUthDWfsQwVAtbYaghYUn
 FQN6V59SxiVBmnfr+0/Aaqc4YDL1CASfzVrFzkgGJ+uSmIz0V1yYxDXehRwt5Aol9VkX
 /0p1Wnxg8U0B1zvKhIad83ipFmuk0Fg6pOX2PNgm10R799QyiQm6Ixb/luCkq9xbHfOu
 n0Eg==
X-Gm-Message-State: AOAM5334t9fiLKQYCVaRCUj52lSwH1xEV29smYPHehP17GsaYkf5dkSE
 K2P8BmZ+j+v507+WkwDZeixF5AoiIlVvnQ==
X-Google-Smtp-Source: ABdhPJy1VX9Jdck8kwdloatkSyUdHLz+JdKmqDmi2A4a+9ULG9+IVG1AkbHK1cEZWR2OFwnVvuOI9w==
X-Received: by 2002:a5d:6544:: with SMTP id z4mr3661358wrv.246.1619281358120; 
 Sat, 24 Apr 2021 09:22:38 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id s14sm12605673wrm.51.2021.04.24.09.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 09:22:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] hw/ppc/spapr_iommu: Register machine reset handler
Date: Sat, 24 Apr 2021 18:22:25 +0200
Message-Id: <20210424162229.3312116-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210424162229.3312116-1-f4bug@amsat.org>
References: <20210424162229.3312116-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Max Reitz <mreitz@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TYPE_SPAPR_TCE_TABLE device is bus-less, thus isn't reset
automatically.  Register a reset handler to get reset with the
machine.

It doesn't seem to be an issue because it is that way since the
device QDev'ifycation 8 years ago, in commit a83000f5e3f
("spapr-tce: make sPAPRTCETable a proper device").
Still, correct to have a proper API usage.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ppc/spapr_iommu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index 24537ffcbd3..f7dad1dc0fe 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
@@ -24,6 +24,7 @@
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
 #include "migration/vmstate.h"
+#include "sysemu/reset.h"
 #include "sysemu/dma.h"
 #include "exec/address-spaces.h"
 #include "trace.h"
@@ -302,6 +303,11 @@ static const VMStateDescription vmstate_spapr_tce_table = {
     }
 };
 
+static void spapr_tce_reset_handler(void *dev)
+{
+    device_legacy_reset(DEVICE(dev));
+}
+
 static void spapr_tce_table_realize(DeviceState *dev, Error **errp)
 {
     SpaprTceTable *tcet = SPAPR_TCE_TABLE(dev);
@@ -324,6 +330,8 @@ static void spapr_tce_table_realize(DeviceState *dev, Error **errp)
 
     vmstate_register(VMSTATE_IF(tcet), tcet->liobn, &vmstate_spapr_tce_table,
                      tcet);
+
+    qemu_register_reset(spapr_tce_reset_handler, dev);
 }
 
 void spapr_tce_set_need_vfio(SpaprTceTable *tcet, bool need_vfio)
@@ -425,6 +433,8 @@ static void spapr_tce_table_unrealize(DeviceState *dev)
 {
     SpaprTceTable *tcet = SPAPR_TCE_TABLE(dev);
 
+    qemu_unregister_reset(spapr_tce_reset_handler, dev);
+
     vmstate_unregister(VMSTATE_IF(tcet), &vmstate_spapr_tce_table, tcet);
 
     QLIST_REMOVE(tcet, list);
-- 
2.26.3


