Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8633367B2EF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:03:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKfOr-0002aG-3g; Wed, 25 Jan 2023 08:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pKfOf-0002Xb-Tt; Wed, 25 Jan 2023 08:01:08 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pKfOd-0007Tq-IJ; Wed, 25 Jan 2023 08:01:01 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so1236507wms.2; 
 Wed, 25 Jan 2023 05:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uoQgTm6KxRr/NTQpjZmPPpUvLTia7O3X8jkSnsZs31Q=;
 b=cr3VdEJz+5dH/UoNV4LWbUOjCF4cMKNZSM8TLXN5943jh6RBpAYLFw258ZbedGIuoY
 c5NbEikmou6bn5EpcpiX0eS5g28CvHNJ/TohTXAw/4MHghBGv9/M2KGwIdV7j1sFWoO4
 Nz5KJMyTbhbFfaG0wNqnhLqxxP8WYIQxzTeIBf/x7setH60o+XfCb9Cb973ROVqDGkqN
 jX2EFnXuvvLaR3Ke/4yat+c/l+IV/0WwJKTlVRy2ua90udzgD3fRddPZeep7h3AMiq8R
 c7PFwHvAzY9fjj+cj5F1E4ulwkVpKGuM5/ghy0v0bDk4Qww41HgFV3z7pHeJCZqyRbWB
 NkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uoQgTm6KxRr/NTQpjZmPPpUvLTia7O3X8jkSnsZs31Q=;
 b=kHyB/MYMuYV9iGUSthFGaC8/WloBnTiUvW44M2o8cLd7iM0rdFs8B5+/SMjdyfbcI+
 /z7hq/dHZO3p+kbAahmLS/IHfmOqTsSaDHwHCLEI+YGt9r9tVBux9TiFISl9hunqs0e5
 xCV5xIwN1BEoTVGT1ceUeiHWaR2OfWzQe2kn+et+D6sb+4dF2I7zbYR8cz+noB8gbukd
 gYgES6OWmVIsktW5WxsbQFw/0rCG34WNx7lN/wq9GhWgUv5axTnaIK5IWx72uSOkjcWA
 YPIwHIsNrfOYd8RgrjaSHXfElldCpRQun4HtDHYsvIqpJJEJ+3XcDgybptJrBIRrr2Wl
 PZog==
X-Gm-Message-State: AFqh2koeOrdqxTfiQ3zn4X9E1iX8DFJpqslwCURVQ4Mf13ajDX9PiP5r
 91iHv5xeVNsE6Vklqha8WjClRnpPIazuMw==
X-Google-Smtp-Source: AMrXdXsVyDdMhe8TAL5VafQB7xIuh26Y9+z6acpiLotsUp3cqS+liPs0IJchlfDUxAMSXuW7voyBjg==
X-Received: by 2002:a05:600c:4928:b0:3cf:a41d:844b with SMTP id
 f40-20020a05600c492800b003cfa41d844bmr30097893wmp.5.1674651650642; 
 Wed, 25 Jan 2023 05:00:50 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a05600c384f00b003d9de0c39fasm2078828wmr.36.2023.01.25.05.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 05:00:50 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/4] hw/ppc/e500.c: Avoid hardcoding parent device in
 create_devtree_etsec()
Date: Wed, 25 Jan 2023 14:00:23 +0100
Message-Id: <20230125130024.158721-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125130024.158721-1-shentey@gmail.com>
References: <20230125130024.158721-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The "platform" node is available through data->node, so use that instead
of making assumptions about the parent device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/e500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 48288c0b41..e3b29d1d97 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -241,7 +241,7 @@ static int create_devtree_etsec(SysBusDevice *sbdev, PlatformDevtreeData *data)
     int irq0 = platform_bus_get_irqn(pbus, sbdev, 0);
     int irq1 = platform_bus_get_irqn(pbus, sbdev, 1);
     int irq2 = platform_bus_get_irqn(pbus, sbdev, 2);
-    gchar *node = g_strdup_printf("/platform/ethernet@%"PRIx64, mmio0);
+    gchar *node = g_strdup_printf("%s/ethernet@%"PRIx64, data->node, mmio0);
     gchar *group = g_strdup_printf("%s/queue-group", node);
     void *fdt = data->fdt;
 
-- 
2.39.1


