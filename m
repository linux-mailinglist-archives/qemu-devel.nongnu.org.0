Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9D3693AA0
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:53:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLDB-0006eX-0v; Sun, 12 Feb 2023 17:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLD5-0006Op-O4
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:40 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLD3-00043y-Lk
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:39 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso10054391wms.5
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3aGr4pdXOmnCeHpCx27ssdrfJ2Facg5vKvJw+VkmOyc=;
 b=keHLgu8IICaJPgJFolVy95Sxf8QzQL8gMNfJTkr76P7op339ycvDldO9C96kqEtLxy
 1A26IwRZTMiROjyHOKE4cwU6YYazWZaz2PQln30P3gR+RaZH73S97rMTyiRWZL/v7wcF
 CPlK4GMLdX2CellFt4gri6xTAwKJ22nYACBZyReHrXYU3AVh/yGTA2PbOZgAJrUFj2KJ
 4ekIUjYZjWcbi92emoqCA7Ql/7u1YIMN/16A3XyAUOHY2j38xpuUP9Jj5hZM0fDejhzh
 V7Rl+MeurhFU9P3uepAmiO9I2sjK1ZxrKKAyYR3pbqjYAO9cuLi9dppK+N9OhG7lVt2G
 JN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3aGr4pdXOmnCeHpCx27ssdrfJ2Facg5vKvJw+VkmOyc=;
 b=6F4AdW0girvMxQUnOdRYdSSv9AUVogOpTInxDmiMaXBEeua/QXTI+XD4qUO8bHuCON
 c0Bj0DJctG03jEUPftvQJj1/u4cDn7TrJpfycViI87c1URDk2dShBp+b3ZhGoUwQsWus
 /aruU/82ngxI1iCFu/AVB+0Fi1/0rOYCg37+hBwAGEO1t15DcbazrXKNwTeCZdz5A0v1
 Z5q/eD1S4PVlgTexCxdw+J21lHQwDrZUWMekdZCnjyp2cSxRbJt/hGA29HnooknUedrd
 rCkSOFWZdZO6inUK4A1sONqI56krOGqiPC0ETRm6lZmsqeoexdwQdXajsZ7Hm8lcMh/a
 BHZQ==
X-Gm-Message-State: AO0yUKVUnGE8FWWPyGwqiv2q0hQ63stGVRRF9WYGUKMRYgCs4/HIWfyF
 zClfj4g9+gga8MX5bwiraJgayw==
X-Google-Smtp-Source: AK7set+jVtrA+dCpEADRkokfRpfA9oryYemBBvcjhBY9OoNB5mPopzADnPAQz9ArDRNuHkbD1sDgDA==
X-Received: by 2002:a05:600c:1898:b0:3df:f7ba:14e1 with SMTP id
 x24-20020a05600c189800b003dff7ba14e1mr20043703wmp.8.1676242356380; 
 Sun, 12 Feb 2023 14:52:36 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e14-20020adfe7ce000000b002c54f367fe4sm4403098wrn.100.2023.02.12.14.52.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:52:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH 09/19] hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by
 EEPRO100()
Date: Sun, 12 Feb 2023 23:51:34 +0100
Message-Id: <20230212225144.58660-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Use the EEPRO100() QOM type-checking macro to avoid DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/eepro100.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index dac42ba17b..915935a818 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -1828,7 +1828,7 @@ static const VMStateDescription vmstate_eepro100 = {
 
 static void pci_nic_uninit(PCIDevice *pci_dev)
 {
-    EEPRO100State *s = DO_UPCAST(EEPRO100State, dev, pci_dev);
+    EEPRO100State *s = EEPRO100(pci_dev);
 
     vmstate_unregister(VMSTATE_IF(&pci_dev->qdev), s->vmstate, s);
     g_free(s->vmstate);
@@ -1844,7 +1844,7 @@ static NetClientInfo net_eepro100_info = {
 
 static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 {
-    EEPRO100State *s = DO_UPCAST(EEPRO100State, dev, pci_dev);
+    EEPRO100State *s = EEPRO100(pci_dev);
     E100PCIDeviceInfo *info = eepro100_get_class(s);
     Error *local_err = NULL;
 
@@ -1895,7 +1895,7 @@ static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 
 static void eepro100_instance_init(Object *obj)
 {
-    EEPRO100State *s = DO_UPCAST(EEPRO100State, dev, PCI_DEVICE(obj));
+    EEPRO100State *s = EEPRO100(obj);
     device_add_bootindex_property(obj, &s->conf.bootindex,
                                   "bootindex", "/ethernet-phy@0",
                                   DEVICE(s));
-- 
2.38.1


