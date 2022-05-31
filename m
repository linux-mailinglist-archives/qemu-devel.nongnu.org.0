Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C6539955
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 00:07:06 +0200 (CEST)
Received: from localhost ([::1]:33226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwA14-0008KH-3y
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 18:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kN-0001IA-MV; Tue, 31 May 2022 17:49:51 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:39735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kM-0003La-3M; Tue, 31 May 2022 17:49:51 -0400
Received: by mail-oi1-x22a.google.com with SMTP id y131so187532oia.6;
 Tue, 31 May 2022 14:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EYwRgrfp2jDsmjKY4q+HaGJtVpSXvdhqen5h2JILt0g=;
 b=dFWROts1/hyD9Koht0YgU0hy4ymsQBSrKOJnuErBtARHzvYL85oNyVPyLujojaWBJS
 oaaGirx0pHBOZufdl3SpDnoyii6WNjVs/e1qbF/Y6GXZuvKzLQllH08pgr64dYrfYtz8
 JF7kMLrk+HEEAvSrTLrBC1s2kMIHGEZEHJENDRgXcJF5ivIhFUCV6FkIkBCAS6J3oyqH
 YTJklVMM0eiH9P8wibUi3SWSylsGiigstTSyzWTfkzi+c8OrFtCE00g7bNUBhknAamc4
 Owk1gNYniBKg95dkBVMGYSLjIW8hakhROwKSf/We1Z2UtISMtK9iMCM8urxpYhQssgl3
 hLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EYwRgrfp2jDsmjKY4q+HaGJtVpSXvdhqen5h2JILt0g=;
 b=MGR2wPU+omSmnS1XbIbvQKa0z3DXn9ERmaknu+LJ4tjy7i/uakuBCgLtJsPg/xQnQL
 ywPHguUbJ1vB7/gHLw3zk8yS+LmKTIxgQ11nEAARl8WM/7Or2opdRuhoCslhZhI8Ncz1
 IwFPUe2Tnu4zQ/tti+xwtV3/BkpYqfnv9vMAjeG0e3ZsI/c8W3V8wg8CfJ8V89vvmX38
 EvbgGkXdmAxJULO6NKkFjQhuhESAPVRtjDgQdJtRai+nJ3dlH+tuTVjGBux2k1mYiCQn
 xtUVVJGk2VzLtRfoHDjAa+nFHwt7Xg4mnl3bEajuwIxTllN8UIbSvsSYeGnhWnWSJG0x
 d34A==
X-Gm-Message-State: AOAM530VCJ37QvZ/ayczw0MH1AMNbEeJPrlPWo3jZIhuFKXqQyc03oru
 8FivcozUtU7+TME+8AUV8TahAtbEbIYzGw==
X-Google-Smtp-Source: ABdhPJwmJ5geswipPUULOaRPkxYvBJmLhzPiyCCpY8v9AjdlD1WL2gCiF46g/o7JxqQ2f9LjTGFekQ==
X-Received: by 2002:a05:6808:179e:b0:32b:7c3d:f431 with SMTP id
 bg30-20020a056808179e00b0032b7c3df431mr13750174oib.299.1654033788440; 
 Tue, 31 May 2022 14:49:48 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:49:48 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 10/16] ppc/pnv: user creatable pnv-phb for powernv10
Date: Tue, 31 May 2022 18:49:11 -0300
Message-Id: <20220531214917.31668-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
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

Given that powernv9 and powernv10 uses the same pnv-phb backend, the
logic to allow user created pnv-phbs for powernv10 is already in place.
This patch just flips the switch.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 2 +-
 hw/ppc/pnv.c           | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index e953aabcbe..8a907a77a7 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1902,7 +1902,7 @@ static void pnv_phb5_root_port_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     dc->desc     = "IBM PHB5 PCIE Root Port";
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 
     k->vendor_id = PCI_VENDOR_ID_IBM;
     k->device_id = PNV_PHB5_DEVICE_ID;
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 697a2b5302..4d2ea405db 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2210,6 +2210,8 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
     pmc->dt_power_mgt = pnv_dt_power_mgt;
 
     xfc->match_nvt = pnv10_xive_match_nvt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static bool pnv_machine_get_hb(Object *obj, Error **errp)
-- 
2.36.1


