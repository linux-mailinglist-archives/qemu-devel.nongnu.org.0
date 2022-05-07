Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F62751E975
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:25:55 +0200 (CEST)
Received: from localhost ([::1]:48200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnQ3u-0004bI-JB
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPls-0006C3-4T; Sat, 07 May 2022 15:07:17 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:45756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlq-0001bT-JX; Sat, 07 May 2022 15:07:15 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 s18-20020a056830149200b006063fef3e17so7217480otq.12; 
 Sat, 07 May 2022 12:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FOJO9raqz4oO5wZuKU5nJraBsnKISn5vRpyh3JyIUO4=;
 b=ZB6Ce5Yrzxfi4xbiS0f2RWxKLrpGg+48Hx4cySuvOnfytGg3jskGkGsTKr965XeWup
 JXQmxxYTbsQv7wz4Gb5tHnbE8trNKWrV9ipsuL9O3zBRq+p1LRE/trYHPTqAZ+D7pHQP
 94O0IgjO17jenHz0S2ApNBE0XIJCBBqkcg30+X8UhK6pblmlW3q9u3sQGc9700hI9XqW
 3cfJpOfxbEpwYraNsynmAGWi/UkjiGqUCxeGarsRioMOaqUu9Bc+E86GRoUwkMPuYJTa
 7S77uvMXbfEpKAKvLo4N+Eowfiep5voo/asSyCO+a41IX9k1C4Gez1tmtu0yJTzcBFBv
 88HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FOJO9raqz4oO5wZuKU5nJraBsnKISn5vRpyh3JyIUO4=;
 b=L56oSmguDX+a+YN2L56xVlWDQQTdQjgsjcNGYCPuzcPFLml7zJ3CUgvtwq2MwMazEn
 AI86XLOwWI/If911Hjx/Adk1JhkZqL4HvcYqUzt4NUsRDRZ0nNU0UrihgM0CwEPr65MK
 jIsANJ2Nd3/KQPHJtj1c42WtIF3WN0wV+AKm97039mmK30l9NP+ZC7paYMqkTk2UWF59
 gMudX4CGlszsa4gUABQwq9Vg7ud8HDYXov5L39EyXqDrJL7z/3E1E/q2BaDhwjPCeAJm
 wLl3oklRsGYg368PCsSyHfsx1qau3nhh7cCcOUA68Ot5jX0bUsnjIVPi7223OzVB8AZB
 JQrA==
X-Gm-Message-State: AOAM532HfDDMkRPf6DX7Z3c7FYCbSfWibTLazoUYgioAGDuzpcDYItIZ
 qqgPx2ThXfTmVkH9rl4p5wo2eiO3jt0=
X-Google-Smtp-Source: ABdhPJyfqofVV0/biF/RUT/TMB1boW6Wbcv+cHPc7466R4bVN3Wltzvpyx332UwEFbKvKn9pegtwjg==
X-Received: by 2002:a05:6830:1d64:b0:606:799a:8e9a with SMTP id
 l4-20020a0568301d6400b00606799a8e9amr603153oti.147.1651950432858; 
 Sat, 07 May 2022 12:07:12 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:07:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 17/17] ppc/pnv: remove pecc->rp_model
Date: Sat,  7 May 2022 16:06:24 -0300
Message-Id: <20220507190624.507419-18-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x332.google.com
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

The attribute is always being set to TYPE_PNV_PHB_ROOT_PORT.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c     | 4 +---
 include/hw/pci-host/pnv_phb4.h | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 51821276e9..509039bfe6 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -132,7 +132,7 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
     }
 
     /* Add a single Root port if running with defaults */
-    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), pecc->rp_model);
+    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), TYPE_PNV_PHB_ROOT_PORT);
 }
 
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
@@ -266,7 +266,6 @@ static void pnv_pec_class_init(ObjectClass *klass, void *data)
     pecc->version = PNV_PHB4_VERSION;
     pecc->phb_type = TYPE_PNV_PHB;
     pecc->num_phbs = pnv_pec_num_phbs;
-    pecc->rp_model = TYPE_PNV_PHB_ROOT_PORT;
 }
 
 static const TypeInfo pnv_pec_type_info = {
@@ -319,7 +318,6 @@ static void pnv_phb5_pec_class_init(ObjectClass *klass, void *data)
     pecc->version = PNV_PHB5_VERSION;
     pecc->phb_type = TYPE_PNV_PHB5;
     pecc->num_phbs = pnv_phb5_pec_num_stacks;
-    pecc->rp_model = TYPE_PNV_PHB_ROOT_PORT;
 }
 
 static const TypeInfo pnv_phb5_pec_type_info = {
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 8c57d836d1..b2c59ea1a0 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -116,7 +116,6 @@ struct PnvPhb4PecClass {
     uint64_t version;
     const char *phb_type;
     const uint32_t *num_phbs;
-    const char *rp_model;
 };
 
 /*
-- 
2.32.0


