Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AFD2FDCDD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 00:25:02 +0100 (CET)
Received: from localhost ([::1]:58100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2MqT-0001sq-CP
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 18:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l2Mor-0000Ou-3i; Wed, 20 Jan 2021 18:23:21 -0500
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:45205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l2Mop-0005kQ-FZ; Wed, 20 Jan 2021 18:23:20 -0500
Received: by mail-qk1-x733.google.com with SMTP id b64so27110840qkc.12;
 Wed, 20 Jan 2021 15:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hg71OBcLzDNQS/O/QSEJZoTF7ksGsyQQlX4bvjHlEns=;
 b=ivp02S9ZrawMM455lDGw28X3iX4rbwcVR2X+XlyRlSU1O7SuVjDUfGM3FtoYxZQ7zL
 z9BZscyZzPX2/6yN/mSzjvINXPwCRCNz224swszhbXx2In+PaNF80ogDRaVFl8FbjCXL
 1peZ8jnYnCePnARl5LY/QpUkQa53Lg6gIZ2DhTN6OijZIJtG91vOk4ybTY9rxUS/9vD4
 ETg2wqkjtAEVdP7RMZDXjHWADjPKmGr3KHZxWHD+Yui/6Khc0HDCl9LIOiE4Tc3OPpvA
 3klXkkBTRRkc/Mr5Oen7/fWIihjD0CoaAtRJNSvO5tlaQ/WWlS0vORpCD3WXp4l5eYSf
 IF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hg71OBcLzDNQS/O/QSEJZoTF7ksGsyQQlX4bvjHlEns=;
 b=TWNRKgW6TPlhxLk5qoK3l08WJ4MmiV5mUY+3brqW8FZhATZKvo9oFuU94hQPPBc2RQ
 c7KI3w7TS98dCvW0gBxDQjH9U7bY95WoRnKdP0Yaz/bec8eSxpaa4npnlSbcFt7K0Vs1
 m9HYk/NHg1AU+9Fz61MdM2LiHuV7LhRp/0ryW53wdbR5o4evtoGkTKRVhqO6TXisA+Qd
 EywFt/GikDrI5+yH/Ze19i1zSxByg4QgHS4KnoPXukxZYK4WbAzujR6Dsf6QAan95iRi
 COrbsa0LoHug4ZLnIGPRL0JB1ikf1jhD2+JGKcMpKxhLowMbHQ6CorDRmTfAWJD8u4vf
 9eXA==
X-Gm-Message-State: AOAM532YNdEo5nqmIUaf90sEq2z74LV4pu+pSuoRA0rk/0Gh1Top3eBF
 Y6Sl+dhve71nBn6OvnvMgne+XJtddjs=
X-Google-Smtp-Source: ABdhPJyiTuSsTOlj2eC/EIKlBTwjTctJTVDEFXaiwjwhaJjhhXH6LInlz4Q/z/WB2zgLNkuRZekI1Q==
X-Received: by 2002:ae9:c107:: with SMTP id z7mr12199954qki.160.1611184998124; 
 Wed, 20 Jan 2021 15:23:18 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:a75a:cb34:ba60:6de6:be1d])
 by smtp.gmail.com with ESMTPSA id b6sm2452548qkc.128.2021.01.20.15.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 15:23:17 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] spapr.c: use g_auto* with 'nodename' in CPU DT
 functions
Date: Wed, 20 Jan 2021 20:23:04 -0300
Message-Id: <20210120232305.241521-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210120232305.241521-1-danielhb413@gmail.com>
References: <20210120232305.241521-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x733.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Next patch will use the 'nodename' string in spapr_core_dt_populate()
after the point it's being freed today.

Instead of moving 'g_free(nodename)' around, let's do a QoL change in
both CPU DT functions where 'nodename' is being freed, and use
g_autofree to avoid the 'g_free()' call altogether.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 6c47466fc2..cc1b709615 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -790,7 +790,6 @@ static void spapr_dt_cpus(void *fdt, SpaprMachineState *spapr)
     CPUState *cs;
     int n_cpus;
     int cpus_offset;
-    char *nodename;
     int i;
 
     cpus_offset = fdt_add_subnode(fdt, 0, "cpus");
@@ -818,6 +817,7 @@ static void spapr_dt_cpus(void *fdt, SpaprMachineState *spapr)
         PowerPCCPU *cpu = POWERPC_CPU(cs);
         int index = spapr_get_vcpu_id(cpu);
         DeviceClass *dc = DEVICE_GET_CLASS(cs);
+        g_autofree char *nodename = NULL;
         int offset;
 
         if (!spapr_is_thread0_in_vcore(spapr, cpu)) {
@@ -826,7 +826,6 @@ static void spapr_dt_cpus(void *fdt, SpaprMachineState *spapr)
 
         nodename = g_strdup_printf("%s@%x", dc->fw_name, index);
         offset = fdt_add_subnode(fdt, cpus_offset, nodename);
-        g_free(nodename);
         _FDT(offset);
         spapr_dt_cpu(cs, fdt, offset, spapr);
     }
@@ -3743,12 +3742,11 @@ int spapr_core_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     DeviceClass *dc = DEVICE_GET_CLASS(cs);
     int id = spapr_get_vcpu_id(cpu);
-    char *nodename;
+    g_autofree char *nodename = NULL;
     int offset;
 
     nodename = g_strdup_printf("%s@%x", dc->fw_name, id);
     offset = fdt_add_subnode(fdt, 0, nodename);
-    g_free(nodename);
 
     spapr_dt_cpu(cs, fdt, offset, spapr);
 
-- 
2.26.2


