Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ED866A90F
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 05:02:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGXj2-0000Ui-C0; Fri, 13 Jan 2023 23:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXiV-0000ET-SC
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:30 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXiS-0005dU-D1
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:26 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 cx21-20020a17090afd9500b00228f2ecc6dbso2834537pjb.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 20:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o59WGdHhwe8iSCsWwjunxDpf/pqoUB2o+GMOEcSVcy8=;
 b=LZ6qkNBHZ1pB9xONifHgESDG+eHgpuk6lBuwNM6mK1Dz32lP/5Xka2q+1Mtfq+d/we
 Zhjejom5zRSAtWEWaUjSz054rLKEwPHeKeFdhg5Prf54V0QAvtTYxxRsrg+b+GI36Llf
 LylhvwwEqvZyqz6c28vIIOxPfFDbC4rvITkpWn74boa6tW2KJVbqj+YojbQgFDRQMVcd
 WJyT4Z2sA2sqKYGnytXSlVWLA92Jco2R1jtNMgLysE3XH8ayz8twQB2lTjU/NNCWVGUM
 nPa+gwButcVDpiJWWZ7QKn7axqEkQ4tFHaWmajPsmIPrMOFyavc6q9iWp4mxPRAFFcZt
 N/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o59WGdHhwe8iSCsWwjunxDpf/pqoUB2o+GMOEcSVcy8=;
 b=40obcxGBbpRb6D4jmnZrpxsX9yo4deGvcJgVsd7kyEhMNg8cHax+bqMToSfKG4UFAr
 RbwqdVW4TmIKkIbMUEA/Z9+BVFaFPWNmgK3RwX95z16AprzihQymtLM4h9/kP0ZRkR9s
 odmQk+8gMP9T/FENKxFOftvX3OSqF8SOhRTHvdoiNwW0PzqnWtmClWio85jeySsBq0qB
 VhdHV439EP3zlBrtiguNuzlQm8ORjHFOpEbCfomCQvVi6hIYjxCsxIewsY32zJZlPxck
 0NTQ1QMex08C0F8/+E+3N1pMwLLebT55zaDYVJPRjHR/L/zqaWGNH4CecHtsIyMlXADr
 twTw==
X-Gm-Message-State: AFqh2krL34Y4zrZYsFg8zIc4hRpKpqM80EJ3V1Z7/tbZcOV1d8yvDmb5
 40IHQ7xUS9KwxurB3FkH4JHscA==
X-Google-Smtp-Source: AMrXdXu8nnCJToU57fsFMCBUNNZkNQ3v7fqCtiKGKpHJAbrRYgfxclzHyZ46vbQwwb47cdfNdVemkw==
X-Received: by 2002:a17:902:d587:b0:194:457d:6dca with SMTP id
 k7-20020a170902d58700b00194457d6dcamr15826234plh.44.1673668823018; 
 Fri, 13 Jan 2023 20:00:23 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a170902868f00b00189fdadef9csm910894plo.107.2023.01.13.20.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 20:00:22 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/19] e1000: Configure ResettableClass
Date: Sat, 14 Jan 2023 12:59:13 +0900
Message-Id: <20230114035919.35251-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114035919.35251-1-akihiko.odaki@daynix.com>
References: <20230114035919.35251-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This is part of recent efforts of refactoring e1000 and e1000e.

DeviceClass's reset member is deprecated so migrate to ResettableClass.
There is no behavioral difference.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/e1000.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 3353a3752c..c81d914a02 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -377,9 +377,9 @@ static bool e1000_vet_init_need(void *opaque)
     return chkflag(VET);
 }
 
-static void e1000_reset(void *opaque)
+static void e1000_reset_hold(Object *obj)
 {
-    E1000State *d = opaque;
+    E1000State *d = E1000(obj);
     E1000BaseClass *edc = E1000_GET_CLASS(d);
     uint8_t *macaddr = d->conf.macaddr.a;
 
@@ -1731,12 +1731,6 @@ static void pci_e1000_realize(PCIDevice *pci_dev, Error **errp)
                                         e1000_flush_queue_timer, d);
 }
 
-static void qdev_e1000_reset(DeviceState *dev)
-{
-    E1000State *d = E1000(dev);
-    e1000_reset(d);
-}
-
 static Property e1000_properties[] = {
     DEFINE_NIC_PROPERTIES(E1000State, conf),
     DEFINE_PROP_BIT("autonegotiation", E1000State,
@@ -1762,6 +1756,7 @@ typedef struct E1000Info {
 static void e1000_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     E1000BaseClass *e = E1000_CLASS(klass);
     const E1000Info *info = data;
@@ -1774,9 +1769,9 @@ static void e1000_class_init(ObjectClass *klass, void *data)
     k->revision = info->revision;
     e->phy_id2 = info->phy_id2;
     k->class_id = PCI_CLASS_NETWORK_ETHERNET;
+    rc->phases.hold = e1000_reset_hold;
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
     dc->desc = "Intel Gigabit Ethernet";
-    dc->reset = qdev_e1000_reset;
     dc->vmsd = &vmstate_e1000;
     device_class_set_props(dc, e1000_properties);
 }
-- 
2.39.0


