Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9396A0601
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:23:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8jG-0006GB-Lh; Thu, 23 Feb 2023 05:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jF-0006Fd-AD
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:33 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jD-0002GR-M6
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:32 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so4105413pjb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A95PLfu5QduSNtWNtARVjFG+JlZHlsOhrX6r7BxoUgQ=;
 b=qutgqOUhHGfar/oR8rIK0tnfrTA19Nt/ufXOa/KLPac+p6B7TvXSxvI4sF//OcGPI9
 Wd3kWa2CMhNpInMq2r8dVilFivIz7eYAG/bUYS8Swj84zmIiWXamtxlbpOlX7ElG7dCm
 0BJWjQ+R46a2pNfG89+dd2k7PfwOpIPAPf1SttDv88X7ZuM8woDh59XKlhmO7WjCUMtl
 tVCCq0oxbaBcB8ju1wAPegUEDxL7CDBqy9TLNjAJlDjSSPdAbEr8TK9Qz0dKlePo8jFS
 M2BkIC92ZXnUY1N3FE5alnmBpdpfAQjI5TFixL2ZxbfSIHVGjn0XZBLMPq/Div0G5cKy
 tKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A95PLfu5QduSNtWNtARVjFG+JlZHlsOhrX6r7BxoUgQ=;
 b=dPPeXjgQgO7GG8ZEMz6UiPSxoV3BgY3tfqs8WzkfaJQ1IOBqBg5YtR/oaRzuvrxWyB
 EY092tTEFCdBD1NXHjwxnePQPzTD5N+SH3L0ku/C1N8jZDfw8zgfXwfYt44HRmuPgDi9
 02R1wJdlghnWv7y2mPBRjAsTIL2YauGc/fc6cA+dsb2SfdBgOWQuAZ3ypeN+dYyz+whm
 x63CBDvwJ9C42HolwA8NNhzfUANAkp4MGqm6jKrPYRp4RTmzTAKZIYVoGUHbQWV62Ewp
 of+OwdDdedrbs/O0Y1jJtRfBxw16m9U174ATdIAWy1tLVtHl/oshGnkGM+xgpuiQf/J1
 26AA==
X-Gm-Message-State: AO0yUKUcqeD1Z7l7nrxSsHzSXHORpCZC4MbZk/Y0FgjYo6XiCGecWmu/
 Q4KhFyVUAMC8S+uif+rUrD0ZXg==
X-Google-Smtp-Source: AK7set+pYT7UGjEWVDukF3eeP/0M9lSeVUEAb/YSJebzjIBsRRIYiMHTeoJ1HtkddOespKTKPkRB+w==
X-Received: by 2002:a17:902:ecc1:b0:19a:b67a:5bd8 with SMTP id
 a1-20020a170902ecc100b0019ab67a5bd8mr13744937plh.55.1677147690550; 
 Thu, 23 Feb 2023 02:21:30 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:21:30 -0800 (PST)
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
 Alexander Bulekov <alxndr@bu.edu>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 14/34] e1000: Configure ResettableClass
Date: Thu, 23 Feb 2023 19:19:58 +0900
Message-Id: <20230223102018.141748-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
2.39.1


