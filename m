Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B23151E966
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:18:36 +0200 (CEST)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPwp-0001vt-9M
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlf-0005rs-DJ; Sat, 07 May 2022 15:07:03 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:39927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPle-0001XG-1U; Sat, 07 May 2022 15:07:03 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-deb9295679so10547896fac.6; 
 Sat, 07 May 2022 12:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xmyvjZGeJMptuTaPZY79LPqXlpBB0BF1k94gn8nzXV4=;
 b=Oz3dbZxtZyV7lni0meyjy/6pg+2XbS3jUU4yrwdtzkRDqT9CKGy/N+nmEhZNa5zGop
 rNRwtiwCRk/W4l18CULUXfT+mDjzTVXIwDx7kkBj6rjlgGR1bdMg10uhBCQEzipPPuwA
 pzH0muNkE+xXa15cN+xhy/3hvdmqSfnp6RYeHmxEWedx+mqg6lh9ruPX63+qWFXPx9uz
 EOFqodXDNATgssyz1y4ua+9dnNmlqLdG4Rlc3dY2meoxVdtmwckooojx0+3NxFuD9Axa
 Ic14SUt0Qa2PwnvziWdPqnkUmH6zk3HivfavKh27t44SGXnJ7ySwuYbovEBvVB7fPE88
 4ZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xmyvjZGeJMptuTaPZY79LPqXlpBB0BF1k94gn8nzXV4=;
 b=JqHttcIavkdrNiSpLu/NP7SefiPfQMUmRlpigxZhkWXsHPhgHkTZ41zEnHBk8KgKag
 WzngJkuOLSjUs/dtNzov0Ne2b5/kbd1qaug7IpNz4N9wgGl47aa8IDxOmwho3hkl2zY2
 H6NSrr5rILI08KEO4074/qdgbubvtFlgP/ERFfJwerHMz3CZT9ltvWwz40ngiI3uEZTl
 UVrQ0QKU5gP6IfInvVwwQZjd5B3REcx7P0ozowKByut57BnvEYRIKLR5DRRJQSFTofbU
 XHOl+REzVaAC36UEEMJu+HXuskbJ64FduN6qHLpy5U6SI4YWL7b9zm6KdTG4x6TZ9EQp
 ELWA==
X-Gm-Message-State: AOAM531FS8eGzK598XQzabMW5OfAayfqky4MEJ2yMVd7tPUbzNw/tcZb
 GJIev3mcMPa18SfIgLeO+ZKqa3xYvhM=
X-Google-Smtp-Source: ABdhPJyFWcdn53SxtieUZ3jAVA0ymS7TyhRi52aoxLErMdOdldoWs9Lv7xCzk/hVUBHJpH+cVK8lvw==
X-Received: by 2002:a05:6870:8985:b0:da:b3f:3253 with SMTP id
 f5-20020a056870898500b000da0b3f3253mr3648866oaq.259.1651950420925; 
 Sat, 07 May 2022 12:07:00 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:07:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 12/17] ppc/pnv: user creatable pnv-phb for powernv10
Date: Sat,  7 May 2022 16:06:19 -0300
Message-Id: <20220507190624.507419-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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

Given that powernv9 and powernv10 uses the same pnv-phb backend, the logic to
allow user created pnv-phbs for powernv10 is already in place. This
patch just flips the switch.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 2 +-
 hw/ppc/pnv.c           | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index f911957f10..fb3222d458 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1861,7 +1861,7 @@ static void pnv_phb5_root_port_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     dc->desc     = "IBM PHB5 PCIE Root Port";
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 
     k->vendor_id = PCI_VENDOR_ID_IBM;
     k->device_id = PNV_PHB5_DEVICE_ID;
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 1a3cafcb7a..bb193b1ed3 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2174,6 +2174,8 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
     pmc->dt_power_mgt = pnv_dt_power_mgt;
 
     xfc->match_nvt = pnv10_xive_match_nvt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static bool pnv_machine_get_hb(Object *obj, Error **errp)
-- 
2.32.0


