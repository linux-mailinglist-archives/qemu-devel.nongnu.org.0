Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53134C0089
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:55:06 +0100 (CET)
Received: from localhost ([::1]:59110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZNR-0005oS-Ph
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:55:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7c-0003sa-Lh
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:44 -0500
Received: from [2a00:1450:4864:20::535] (port=35745
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7b-0002ph-AJ
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:44 -0500
Received: by mail-ed1-x535.google.com with SMTP id bq11so17423944edb.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OuZTr6rv/jwpyEGm5IkqFfaSg0z98+rElW1EZeduKOw=;
 b=C4vHBmwFM1e0t7nY0tsQWZpayR73eRlf5/rXQkGN/AQh1uzQt7jAlRmSLLpnEejBey
 Njj2LWYPW1szc5+k1fHYbPSohEf4qjlZ0gcekwNJRULsuJSn2NvO5FrzPx4F5hBEEiiS
 mb8cdJvulhXgm9nKeaDOk3iiscIy+NX4DvBGtulPLn2pQj7wa2Wy/3bAWKIZVmBTXuzW
 xWtaOOykWgpyuI2A+RIxSDbx/4VtxW2F3AVOrkRODWzWxVt+VJqnng66vnmo6RTkTqqG
 uoJ8SaUerGEZjgqboDRmuhRq22u+gzl+Z1/Mcc9KnsOpqGUicmHCxaaNMtCMB0z41cho
 kDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OuZTr6rv/jwpyEGm5IkqFfaSg0z98+rElW1EZeduKOw=;
 b=ZeFVlFxjDyQbIiFwnvxG67JGRJPVmCOo4UNeANQnANK8SS9xybP6xmJSufhCyMi5lD
 3GslzxJQDM5+naQSCEN6Gbq/dqm5Wy+FHEBr92CrdQJLJqHHCrfuVOKRGE/Yaj3w2Vku
 G10329DfOUhYv4ZST9Fhz/NQCEFBFJbrEOGMz2KBThkXGXWO0BUMg9oxYd8X0db5H1hm
 NhUqfjWnpNf8wdWpzwMAe9nW3juNmOvz17uerd4PW68vTAPy1hRudazXWqFWBazHwNeV
 VpxEgPbBio1BnqhN0b45iPGEzUuOICKofTqurqk6LeBLpvHFiyQoH+rFDPq61ANpxAND
 7uRw==
X-Gm-Message-State: AOAM533vZ/i5dmBPN63sGkcC3cUdlZsD/p0RJUu8RWtlRRgItf3hrQt7
 7gH26uAgJlchasSmUjE40lwMVbJBXcc=
X-Google-Smtp-Source: ABdhPJzXH3P+jSht7WqTFp3xZpciomL15lq+rDtEeFJ84+AauY2S0/P7PNINzmDShIUv+yHVS+2QMg==
X-Received: by 2002:a05:6402:90b:b0:412:e7f8:6de6 with SMTP id
 g11-20020a056402090b00b00412e7f86de6mr16021527edz.182.1645551521949; 
 Tue, 22 Feb 2022 09:38:41 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:41 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/22] hw/ipmi/isa_ipmi_bt: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 18:38:12 +0100
Message-Id: <20220222173819.76568-16-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bernhard Beschow <shentey@gmail.com>, Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ipmi/isa_ipmi_bt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index 02625eb94e..88aa734e9e 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -92,7 +92,7 @@ static void isa_ipmi_bt_realize(DeviceState *dev, Error **errp)
     }
 
     if (iib->isairq > 0) {
-        isa_init_irq(isadev, &iib->irq, iib->isairq);
+        iib->irq = isa_get_irq(isadev, iib->isairq);
         iib->bt.use_irq = 1;
         iib->bt.raise_irq = isa_ipmi_bt_raise_irq;
         iib->bt.lower_irq = isa_ipmi_bt_lower_irq;
-- 
2.35.1


