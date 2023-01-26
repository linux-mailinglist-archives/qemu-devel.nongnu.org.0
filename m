Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6257667C913
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:50:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKzno-0003T0-6e; Thu, 26 Jan 2023 05:48:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKznV-0002tI-0L
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:48:02 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKznT-0005J3-Hf
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:48:00 -0500
Received: by mail-pl1-x62c.google.com with SMTP id d9so1466013pll.9
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 02:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o59WGdHhwe8iSCsWwjunxDpf/pqoUB2o+GMOEcSVcy8=;
 b=AEFizVOEM+mSZ/G97fU44jO/D31PdqogE2MO5iCqxRBofUcjABDEa/r1MCzRkBSkCv
 z+et/2inav8tcqIkQiff56OKFwyEGGO4FtyB6Yg2KiqZm1t9tQ8PQW6QhTrlR9qey3cX
 v+5m3LGXwx6qHVF08csJcZllVi4W4HuCF7EAUa+4XdmuLoA1wTcFyWjBGdCDfDYGaglZ
 56SCkFaKS3jS/X1H5S2HSJiTj3yvlUMpKLMW3i49tHHB2N81YTZ++9EGqZNDBteiDsJH
 K9+fj2dCf9PbpP6FqTl75ZdgshmsXfkZ+gC/aOJ9LLX2U0eGGOb9VVuen60d9TRTMB8j
 QaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o59WGdHhwe8iSCsWwjunxDpf/pqoUB2o+GMOEcSVcy8=;
 b=mQ5972jnma4cISBG05nArX5YcvAO7yeMc93EJvs1nHe897cQ5eensbFXwp6A/wf7ze
 bZ2hTGMM4F89u9RIsgbFKLj7aG6v2Q7pLM8UebcVCYlLA6o1j3rwxC2nOBVEfCKqJSHE
 da7n1BbvWkW87pfRgqjoVTY3kU1QhRmssyLTiBmcJaKF9Mx0HnZ6Y+9iIdxwF/31oW5L
 l91ctYe5Q/4p2OqifIkvpdUUFCR3N7+gNeYZUQG0kdCMwBZRNIq9t+HUXYChA8+WeZDS
 MIiTgkn0+FFRqfYh+mRvqeql2E67o0KdC54ezBhwMtPfT6TZF0hJyKF1Hx5hrl9Nzim/
 hgmw==
X-Gm-Message-State: AFqh2kq5ULgA8a2PLdYu3xJZ8ARS8mRvRdAUOLmQQToILlpe9x+XnSXK
 fV6BEB+CVyH5m7BEG7cOjN5buQ==
X-Google-Smtp-Source: AMrXdXvTS9wqt/HW8KJjC1YlpF1Q9f+M3l9/Wdt7dz32izSk94tGHSnu7tU96pqO162BpI8wRD1wYw==
X-Received: by 2002:a05:6a20:2e28:b0:b9:2705:4e4d with SMTP id
 be40-20020a056a202e2800b000b927054e4dmr27732358pzb.2.1674730078619; 
 Thu, 26 Jan 2023 02:47:58 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a63af48000000b0046b1dabf9a8sm496789pgo.70.2023.01.26.02.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 02:47:58 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 13/26] e1000: Configure ResettableClass
Date: Thu, 26 Jan 2023 19:46:52 +0900
Message-Id: <20230126104705.35023-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126104705.35023-1-akihiko.odaki@daynix.com>
References: <20230126104705.35023-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
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


