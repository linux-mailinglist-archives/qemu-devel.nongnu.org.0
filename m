Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5805E2F94F4
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:39:10 +0100 (CET)
Received: from localhost ([::1]:47544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1DtF-0004H8-Dv
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:39:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dft-0007fD-1w; Sun, 17 Jan 2021 14:25:21 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dfr-00054R-I4; Sun, 17 Jan 2021 14:25:20 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d13so14417271wrc.13;
 Sun, 17 Jan 2021 11:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qdebcebcEgAUy36pbkwOtCiC8gYa7FMBNTjw+ZgzJr8=;
 b=okh6rYyT8WPB0Ldi5fnznckOXxu8R9A29W7mOana5evBSJUO9M+PZ+mXlLmf12WOoE
 5jGrSGADlg8sUsn4uA0vkc74lAAqe/Qo4RqoQzjoh989ikJDMP2WHAYOBZgx6olSyBW0
 rEIpmWGBSK/ojnfD51oSIXJeIMvHoJYWhSE7823T+P+txI7hi33ylobdsh10L1kGJDRj
 7t/rEYZ2CHvxACFy9OUpIsfexlmg/zHHRh2ReiVK/aoODvSgQL+HVhKoAmcg2BfW66RZ
 yFkJCS2BTSzCngRyJ+m0NoAa4xWon5eo71UfslsmaPo81qwsbR6rGMRskT2guhxyRpbB
 c+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qdebcebcEgAUy36pbkwOtCiC8gYa7FMBNTjw+ZgzJr8=;
 b=rcqtMv1BgceMZq0tjKQy5KecbA325kZzSFcGXduq1FHzGt115FlXRdHMPxWRnh8dIe
 f2g/FDeEXqSnyQ9iQQ5FC2j4F/HVcw94ej8hHGJG5tZLinm/Tt/DPYVOqQVREXj+++R0
 S06dpwL6Qe0Rbr7igfL8wI2hkM+gYsjfz0RnzYMB5lWf0w0/JKH1B0xuJ6rsMIGh+Dun
 tptFVjbHC8F6wKySY1zBgty3SXAlKQkxmAmnpcjIDK1mtFNWiW/IdgXFFLTMuz1UGH/v
 vZKq+fFGtLA+vlTdU2UxSZ8DuPu7ieShCCpIr9GI1NTKrocAptnuoa3CcAKwP+RtmF17
 A4lg==
X-Gm-Message-State: AOAM531Szrj9BSnMggIrmKNLelMsSO8j60aZbU9sh7PYl1OYMsE3qPan
 MGGi4Z6Ug+jCjzQ1r+JRF6k=
X-Google-Smtp-Source: ABdhPJxbcsgYoEjcTophK/SL5VZkGui8pHNjy61kf97Brgh1NWMVJ2NHSLes7iCFjvWlfgu/zrgpfA==
X-Received: by 2002:a05:6000:368:: with SMTP id
 f8mr22623971wrf.150.1610911518019; 
 Sun, 17 Jan 2021 11:25:18 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b13sm23004714wrt.31.2021.01.17.11.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:25:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 05/20] hw/arm/bcm283x: Mark devices with no migratable
 fields
Date: Sun, 17 Jan 2021 20:24:31 +0100
Message-Id: <20210117192446.23753-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These devices don't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Add a more descriptive comment to keep a clear separation
between static property vs runtime changeable.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/bcm2836.h     | 5 +++--
 hw/arm/bcm2835_peripherals.c | 1 +
 hw/arm/bcm2836.c             | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
index 6f90cabfa3a..becb6cfd0a7 100644
--- a/include/hw/arm/bcm2836.h
+++ b/include/hw/arm/bcm2836.h
@@ -35,13 +35,14 @@ struct BCM283XState {
     DeviceState parent_obj;
     /*< public >*/
 
-    uint32_t enabled_cpus;
-
     struct {
         ARMCPU core;
     } cpu[BCM283X_NCPUS];
     BCM2836ControlState control;
     BCM2835PeripheralState peripherals;
+
+    /* Properties */
+    uint32_t enabled_cpus;
 };
 
 #endif /* BCM2836_H */
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index dcff13433e5..8cf85f028fd 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -386,6 +386,7 @@ static void bcm2835_peripherals_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = bcm2835_peripherals_realize;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
 }
 
 static const TypeInfo bcm2835_peripherals_type_info = {
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index de7ade2878e..d2de99147cc 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -176,6 +176,7 @@ static void bcm283x_class_init(ObjectClass *oc, void *data)
 
     /* Reason: Must be wired up in code (see raspi_init() function) */
     dc->user_creatable = false;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
 }
 
 static void bcm2835_class_init(ObjectClass *oc, void *data)
-- 
2.26.2


