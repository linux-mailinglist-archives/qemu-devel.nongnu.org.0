Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3D44C0043
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:41:19 +0100 (CET)
Received: from localhost ([::1]:50732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZA6-0006Ou-2e
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:41:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMZ7T-0003Pe-79; Tue, 22 Feb 2022 12:38:35 -0500
Received: from [2a00:1450:4864:20::529] (port=41692
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMZ7Q-0002kr-Ki; Tue, 22 Feb 2022 12:38:34 -0500
Received: by mail-ed1-x529.google.com with SMTP id w3so38746110edu.8;
 Tue, 22 Feb 2022 09:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hu2rdGt9hnCPLiEwvn+rLf/s7l/Y32BM0wU7w8P1XdI=;
 b=JpOS/IAXSki0RhrvpKFvleiKgfXBy7Wcl4FufF/+CwFjxbHbyrpXNeoPsJ8FPGk3pI
 2KjncnXTMDWMZ8YMQHHXWW4xjrX9FzASI1TcABWn6ulkDNTXYxvZl+Fuq0SkZp44qY8b
 X0fg3KcuAzMkHzK6lsDHKvlWvn0tm9yROEJ9lrSf69lJBTZ7kr0fdlrXLxODXAfwBfBe
 Ol3DDY/MOXo4Dg9wnoxk0bbMl+anwjTUqy9wiaxd08337DAcGZPZ8awtpJndhpGRxbvA
 iLAtgpS7wrQ9tfFNtFxNa8JWYvDFFR/UHlYfHYIUy7iDWE9Adyl+RqYfC0Kv3L3aNycy
 feAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hu2rdGt9hnCPLiEwvn+rLf/s7l/Y32BM0wU7w8P1XdI=;
 b=OEu3/pI9Bnr5jNl1SGp+8d/2FcpZvKCmL7gjdSlEjUkST6KVx1oCeyeOceLWiyxPnb
 U0vjN8Gbtz0rfdcqYFvDxoRRj0BzoO3aNUKqhcZyQgai2Q4vCz6Rh+g3LBaE4E3UZqEY
 VzA2c08/FSet2eM3MRs05HapGQyiXncjMVgj2JmwhnVEMdx/LCdEpu90jTUInZ23K75f
 ck+ZBweEkFlIRERepFSXV/HAF0ajPAHJLPIjdBe4qU2pcuIs0SDY+Mcc4Rv7++xZn/zQ
 q7Ve0qIDldJGRmgxbhsc1tE4pZO9lA1bbhl5VitEl+eZbkt4QxW53kLU4f2Udr1sCvku
 O4wg==
X-Gm-Message-State: AOAM533nAoX6/iugse25LY53AWBlN2FUIrY42EAL8O+l1J0WfOsMdmiR
 OVpc9eL+VjPaxNAFKCNLI7HKHSmE4EM=
X-Google-Smtp-Source: ABdhPJxRUXDtES9+8J3Gt8DfCdGUekFNqfYevauT/Cz1rP87bxm8Su38HjSbUPiIS0LSDbIilbT5Pg==
X-Received: by 2002:a05:6402:4245:b0:410:ee7d:8f0b with SMTP id
 g5-20020a056402424500b00410ee7d8f0bmr27537067edb.295.1645551510306; 
 Tue, 22 Feb 2022 09:38:30 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:29 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/22] hw/rtc/m48t59-isa: QOM'ify IRQ number
Date: Tue, 22 Feb 2022 18:37:59 +0100
Message-Id: <20220222173819.76568-3-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: "open list:PReP" <qemu-ppc@nongnu.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Exposing the IRQ number as a QOM property not only allows it to be
configurable but also to be printed by standard QOM mechanisms. This allows
isabus_dev_print() to be retired eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/rtc/m48t59-isa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/rtc/m48t59-isa.c b/hw/rtc/m48t59-isa.c
index dc21fb10a5..d1c1d789a5 100644
--- a/hw/rtc/m48t59-isa.c
+++ b/hw/rtc/m48t59-isa.c
@@ -42,6 +42,7 @@ struct M48txxISAState {
     ISADevice parent_obj;
     M48t59State state;
     uint32_t io_base;
+    uint32_t isairq;
     MemoryRegion io;
 };
 
@@ -79,6 +80,7 @@ static void m48txx_isa_toggle_lock(Nvram *obj, int lock)
 static Property m48t59_isa_properties[] = {
     DEFINE_PROP_INT32("base-year", M48txxISAState, state.base_year, 0),
     DEFINE_PROP_UINT32("iobase", M48txxISAState, io_base, 0x74),
+    DEFINE_PROP_UINT32("irq", M48txxISAState, isairq, 8),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -99,7 +101,7 @@ static void m48t59_isa_realize(DeviceState *dev, Error **errp)
 
     s->model = u->info.model;
     s->size = u->info.size;
-    isa_init_irq(isadev, &s->IRQ, 8);
+    isa_init_irq(isadev, &s->IRQ, d->isairq);
     m48t59_realize_common(s, errp);
     memory_region_init_io(&d->io, OBJECT(dev), &m48t59_io_ops, s, "m48t59", 4);
     if (d->io_base != 0) {
-- 
2.35.1


