Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66B4694265
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:11:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVo6-0006HT-62; Mon, 13 Feb 2023 05:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVo4-0006C7-0i
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:11:32 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVo2-0003YK-60
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:11:31 -0500
Received: by mail-wm1-x32f.google.com with SMTP id he5so491170wmb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iAgmNlVIUOinPrwzOOaOjTPgQ/bZC+ofNOItCPLhOkw=;
 b=DADTOwmUY0Yx2wnpt7nyQKOI53EaTW5a4izqv/r3uRO6sm1J1SRuWZ+yKAuxeUGMHw
 SEy/pl630oz7JiqgPn0lf7H6FjDqEv1NfFzyRktsrPJJHfRZPf1UmwN92nrwzDNdz/xn
 Jl7GTVqzzEyaBMnJmatRQrAI+PT1keR1HHYHSosN2TXiPx8S1AmNpCahJz1eCLawxWiZ
 GQTsDZz80/XL+VOyymOmK5GqOEmdzfivdDA/xG1Y/tMREjxRDtZcdcD7RhfIVOjNzEIh
 ZtF5MIp/fvBCvxeke7LarCavukhy9ugwlKUDg3EvR0dLFpy/AF0KZYHfvDfqTCJifAqP
 BZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iAgmNlVIUOinPrwzOOaOjTPgQ/bZC+ofNOItCPLhOkw=;
 b=POMSakKao/Zj2hu9GF2yhvcXkyZtPQN9gsSbq6g0B6xPg6CpmnMNg8VKzZyK6oqSMh
 w8QdiDPJDA49xL95hvcyWSM0SwxsoGDMDDP6CLHpD1nOkEl568ywldc28VM8WmvYpuaS
 hLZ/6CTaUtOG/PHihBRYOSB5DNTh+dL6bVgRVnPIdNlYixOl81bvm3pw4XYnXxYeND25
 UEPH0h/WNon5OP3iY2ehkPHZbgY357z1ZZuUwIqDsnt3oUrIqVHmq3E1CDc0qIjvLhX3
 ogo/q9Pl5HKDKg00I/rqXFngXfomwov0qqpJAw3Rlo3dTUEcqPEqKRH/iNeF7QwWO903
 DJTA==
X-Gm-Message-State: AO0yUKUB5hidpNtlLsWTwki12Wv2RJ0Jjg7CNeSH8OzDBJPWxzXRaVhn
 wwVHUsFc9cFieEckrQj4O3YD/CHjmyeTvVAW
X-Google-Smtp-Source: AK7set+NZXJaZTc8+1GrWGImIH51z1KRsdU4xeU0h4DYgTOy8mLNrNjVQYo4+zyp1E/Ur9Bav9J4cA==
X-Received: by 2002:a05:600c:1694:b0:3de:27c3:ef13 with SMTP id
 k20-20020a05600c169400b003de27c3ef13mr18354060wmn.9.1676283084674; 
 Mon, 13 Feb 2023 02:11:24 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c4fd300b003dc59d6f2f8sm13851336wmq.17.2023.02.13.02.11.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 02:11:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 7/7] hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by
 EEPRO100()
Date: Mon, 13 Feb 2023 11:10:48 +0100
Message-Id: <20230213101048.94519-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213101048.94519-1-philmd@linaro.org>
References: <20230213101048.94519-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Use the EEPRO100() QOM type-checking macro to avoid DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/eepro100.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index bce377688e..6db15f1ba2 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -1834,7 +1834,7 @@ static const VMStateDescription vmstate_eepro100 = {
 
 static void pci_nic_uninit(PCIDevice *pci_dev)
 {
-    EEPRO100State *s = DO_UPCAST(EEPRO100State, dev, pci_dev);
+    EEPRO100State *s = EEPRO100(pci_dev);
 
     vmstate_unregister(VMSTATE_IF(&pci_dev->qdev), s->vmstate, s);
     g_free(s->vmstate);
@@ -1850,7 +1850,7 @@ static NetClientInfo net_eepro100_info = {
 
 static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 {
-    EEPRO100State *s = DO_UPCAST(EEPRO100State, dev, pci_dev);
+    EEPRO100State *s = EEPRO100(pci_dev);
 
     TRACE(OTHER, logout("\n"));
 
@@ -1891,7 +1891,7 @@ static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 
 static void eepro100_instance_init(Object *obj)
 {
-    EEPRO100State *s = DO_UPCAST(EEPRO100State, dev, PCI_DEVICE(obj));
+    EEPRO100State *s = EEPRO100(obj);
     device_add_bootindex_property(obj, &s->conf.bootindex,
                                   "bootindex", "/ethernet-phy@0",
                                   DEVICE(s));
-- 
2.38.1


