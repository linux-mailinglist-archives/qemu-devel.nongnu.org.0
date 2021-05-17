Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B313D383BC5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:55:37 +0200 (CEST)
Received: from localhost ([::1]:47622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihSq-00084i-Ox
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lihNt-0007tB-GP
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:50:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lihNq-00037m-Fq
 for qemu-devel@nongnu.org; Mon, 17 May 2021 13:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621273825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z14YRAeNHkM20zQ1K99pTtwaHYhMgqGiS7m7zkt7SV4=;
 b=JgcsvZpkDKxfsHU+LzG1Q9Lh930+DZQL6g3WwyMrhJ38+RgEQ6FQJttBaAoIxQ/st7DUlp
 YkNXKNmm1LBMLXuRtCyVcDIJO3Y578+N8eTgWJNxU6ZZpDZd/mHztUrsq9vn9upwdHmyyW
 P5szGrg4YsewKubXVw3aRcYWGhE1950=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-rbqQBOwNO7m0Dk3NncS3nQ-1; Mon, 17 May 2021 13:50:23 -0400
X-MC-Unique: rbqQBOwNO7m0Dk3NncS3nQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 i23-20020a17090685d7b02903d089ab83fcso1327513ejy.19
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z14YRAeNHkM20zQ1K99pTtwaHYhMgqGiS7m7zkt7SV4=;
 b=LeWn1ywfmEN0ZyFMrq3wFJlVZsTaJxjHWH3QqkLtUjpuNoNLClsGG3ldUJ45Rsty4F
 DUfSKXl01tImM40iaAeBTrLCWWixFfsLRi6NTnVk2qp3uFmPlGXgEfX9BKdAlKlCIRxP
 eSlfHTYSXOz/kzm0aV3gwmSuxvQoWjYvQ+HWoxYgSr/9p+ShQ05k8T7KoV6qcMHilXoR
 Ga6T3KN8R+Jf7j3CHCC7wpwGX+wU8+RqCN1wH5fVnTTBiEMdUcWEqFU0BitF6MlbFLlp
 6lA3T2uhpUC/4v9zdMGsFRaJFY1GRIrHpyvcIq06RH/EUJOy8kET5Pz4AvTX6ZM1SaRE
 LakA==
X-Gm-Message-State: AOAM533mXZiAC09OD80SreHfe7sGy9t1SIMknVZNRx51vsDbs5juKvJe
 bcsUo4o0MaipHtvEp7EM+oMftZWOCd9OUqK9TAgfN7+gj1F/5N8YzWRFW89D97weL4uI35T+/Fn
 xPl+hWloz7tumeDZFw9UnZOXFRDb+TA4+MCfIRTIJC8P0FSsC8BZidkYNq16rpJkw
X-Received: by 2002:aa7:c787:: with SMTP id n7mr1453596eds.309.1621273822150; 
 Mon, 17 May 2021 10:50:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi2j1K+yCR15AGxnq0veIJwc1a53Y3utPJZB9BtNBPYrTMmmKWhTdMkaMl2/tYHjiG8XKKRg==
X-Received: by 2002:aa7:c787:: with SMTP id n7mr1453573eds.309.1621273821957; 
 Mon, 17 May 2021 10:50:21 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id dh21sm175127edb.28.2021.05.17.10.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:50:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v3 7/8] hw/block/fdc-sysbus: Add 'dma-channel' property
Date: Mon, 17 May 2021 19:49:46 +0200
Message-Id: <20210517174947.1199649-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517174947.1199649-1-philmd@redhat.com>
References: <20210517174947.1199649-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QDev properties to be set before the device is realized should
be exposed as a Property with a DEFINE_PROP_XXX() macro, then
accessed with the equivalent qdev_prop_set_xxx() API.

Do this with the FDCtrlSysBus 'dma-channel' property: convert
it to int32_t, default-initialize with DEFINE_PROP_INT32() and
use qdev_prop_set_int32() to set its value in fdctrl_init_sysbus().

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/fdc-internal.h | 2 +-
 hw/block/fdc-sysbus.c   | 9 ++-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/block/fdc-internal.h b/hw/block/fdc-internal.h
index 278de725e69..29b318f7525 100644
--- a/hw/block/fdc-internal.h
+++ b/hw/block/fdc-internal.h
@@ -96,7 +96,7 @@ struct FDCtrl {
     qemu_irq irq;
     /* Controller state */
     QEMUTimer *result_timer;
-    int dma_chann;
+    int32_t dma_chann;
     uint8_t phase;
     IsaDma *dma;
     /* Controller's identification */
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index 8f94c2efb63..74c7c8f2e01 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -106,15 +106,11 @@ void sysbus_fdc_init_drives(SysBusDevice *dev, DriveInfo **fds)
 void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
                         hwaddr mmio_base, DriveInfo **fds)
 {
-    FDCtrl *fdctrl;
     DeviceState *dev;
     SysBusDevice *sbd;
-    FDCtrlSysBus *sys;
 
     dev = qdev_new("sysbus-fdc");
-    sys = SYSBUS_FDC(dev);
-    fdctrl = &sys->state;
-    fdctrl->dma_chann = dma_chann; /* FIXME */
+    qdev_prop_set_int32(dev, "dma-channel", dma_chann);
     sbd = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sbd, &error_fatal);
     sysbus_connect_irq(sbd, 0, irq);
@@ -131,8 +127,6 @@ static void sysbus_fdc_common_initfn(Object *obj)
     FDCtrlSysBus *sys = SYSBUS_FDC(obj);
     FDCtrl *fdctrl = &sys->state;
 
-    fdctrl->dma_chann = -1;
-
     qdev_set_legacy_instance_id(dev, 0 /* io */, 2); /* FIXME */
 
     memory_region_init_io(&fdctrl->iomem, obj,
@@ -173,6 +167,7 @@ static Property sysbus_fdc_properties[] = {
     DEFINE_PROP_SIGNED("fallback", FDCtrlSysBus, state.fallback,
                         FLOPPY_DRIVE_TYPE_144, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
+    DEFINE_PROP_INT32("dma-channel", FDCtrlSysBus, state.dma_chann, -1),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.26.3


