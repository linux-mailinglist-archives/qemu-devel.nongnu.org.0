Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9694C0230
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:44:40 +0100 (CET)
Received: from localhost ([::1]:36466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMb5T-0003kw-8Y
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:44:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMaw5-0003JF-Ni; Tue, 22 Feb 2022 14:34:59 -0500
Received: from [2a00:1450:4864:20::531] (port=46938
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMaw3-0006pg-Ut; Tue, 22 Feb 2022 14:34:57 -0500
Received: by mail-ed1-x531.google.com with SMTP id s1so6332065edd.13;
 Tue, 22 Feb 2022 11:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PhyuktrkWy4e5TMw2cdB1vt2X+4+1uiUI5Kq4ZX1GHU=;
 b=JRoSC7uZ1OzLniBubmDdh4zh5ea0HdbH/A4JpGsGR96E257YeCG3f+JvF154yygdxV
 VzJoz6fnUyQM3kROjihzC62/HBVpOW4C9404O1XBosxTTXOAY3AkF0p4xBlU5gfl117q
 0us+2iStGniI4ts4Tpl471NPMEksEH0p/s3g5Yo/3elUOBTaBz5t8wdNXiwr8v98dliV
 8XUkwBt5xT7C75UF+8t0BCxRNX/CXvLpOt6cSm1ppgeNyANGw5l4WLuJuz6NBiMNBYXT
 DLgP1sid37UxyKMehC2uVopdF+W3LysM3bGBQ1nFDZrugpaGz5T3x69UNJJUZn7FXkfE
 wasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PhyuktrkWy4e5TMw2cdB1vt2X+4+1uiUI5Kq4ZX1GHU=;
 b=36epW2cdYWZLItSkHgqtQE46D0vTPdDGJHXT+ItWbiOJVN/tIp0SnoKssU3ddr7DRm
 dIfaOcf5y+XTau/YUbd7pZ2iRKlzL9HwugX6eMz6b3KCU8Q6fxUK/HVuEUzsV1VYsf4C
 fUOSW0nciCA98JY5s4IW8yrLguclsLqnxiNm1/L9nRrVBGVcjQs3QUd1aXnMk5l+Vik+
 oWyCo6UmKhbSvRZIyXlb/eFT9mCQNZ/6B0TxUh1gzZmnoPfJnr7eFN4dOu9xamj5W7dD
 N6hTanIqHsnIWBt+yhwxy/bPf4UKp3uFpwH89MuWghv6+MAEv8nNQSHUgd1S9Uf/GWUq
 TEtg==
X-Gm-Message-State: AOAM530MQOVWRu4SFfXMT5/cTWY0/8KPlhkkBAqKynsa8bLcokMGGBmq
 aCZw8UshSs4YPNOCBqeWRU6nhjjRAgk=
X-Google-Smtp-Source: ABdhPJxA8P4OyxP7IaV/yN1IekL1xUfMEWvcldcPZbuo7W0UMjEBde6AbvLmF9mXzn6NODKJueEXXg==
X-Received: by 2002:a05:6402:128d:b0:410:f204:6ec2 with SMTP id
 w13-20020a056402128d00b00410f2046ec2mr28392025edv.104.1645558494312; 
 Tue, 22 Feb 2022 11:34:54 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:34:54 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/22] hw/rtc/m48t59-isa: QOM'ify IRQ number
Date: Tue, 22 Feb 2022 20:34:26 +0100
Message-Id: <20220222193446.156717-3-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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
 hw/rtc/m48t59-isa.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/rtc/m48t59-isa.c b/hw/rtc/m48t59-isa.c
index dc21fb10a5..cd63138e1e 100644
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
 
@@ -97,9 +99,14 @@ static void m48t59_isa_realize(DeviceState *dev, Error **errp)
     M48txxISAState *d = M48TXX_ISA(dev);
     M48t59State *s = &d->state;
 
+    if (d->isairq >= ISA_NUM_IRQS) {
+        error_setg(errp, "Maximum value for \"irq\" is: %d", ISA_NUM_IRQS - 1);
+        return;
+    }
+
     s->model = u->info.model;
     s->size = u->info.size;
-    isa_init_irq(isadev, &s->IRQ, 8);
+    isa_init_irq(isadev, &s->IRQ, d->isairq);
     m48t59_realize_common(s, errp);
     memory_region_init_io(&d->io, OBJECT(dev), &m48t59_io_ops, s, "m48t59", 4);
     if (d->io_base != 0) {
-- 
2.35.1


