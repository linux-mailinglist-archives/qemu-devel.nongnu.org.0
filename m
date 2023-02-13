Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3DB693EC8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:12:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSxf-0001lR-61; Mon, 13 Feb 2023 02:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxc-0001Yg-Jt
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:12 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxa-0001ny-72
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:12 -0500
Received: by mail-wr1-x42d.google.com with SMTP id o18so11075070wrj.3
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3aGr4pdXOmnCeHpCx27ssdrfJ2Facg5vKvJw+VkmOyc=;
 b=qMllGUGA7JoyWdxTdjkmgcJSrE8ykvf29RBUdYxXZ5mjkJ2m4WCwIk3+YU83fSsiG8
 H6xS0I63Lr+E8/XQbKa22b3H1dJj2N9J3zUyU3n0G3S8aJZd+WFJsV9JAYZ5awtGXdws
 s2L9tXbtB4d1boZ8EW3sqryIYZRKDaHou1w03ktLIsqQxQyuAKiAiuuZ3f/B64XKUvzH
 +Kkye24IcxKeOLn8cQtlMKopsCsF8Y050R8pwFf7D5dR824hagf5syp05DzSQYusqo0P
 6P8JYS8jmZDP88Hn+9Tx6qIrypUKFWGA60ytycARcktRuZM2hDidOO4fZWQXIdeEj92z
 FHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3aGr4pdXOmnCeHpCx27ssdrfJ2Facg5vKvJw+VkmOyc=;
 b=dgUsIvp3m3DFn9eBYzrnRo6nW4oHa+ViXcL75nBS2qlxSpnNIgy59ZeZk4zTEasSJU
 rf7NiqBUKubWPxYqHUzespxeFsdBog3hLdIHjC4jaX9mCu/1G3vFRs9UqThQ7Nlryoln
 fr7/v2f07uuFxm1AUWnWW1sI7iiKec7FYosMWNHH950jBja0LYr7Z2VoDMEhOtSEC/Wo
 ioQK25ZHG03cXKiQLMII8KFLU9iJgq5/usbCcCdyWfm7cXz6tVBveEKHFc9r9v0pdoTk
 PALPyGo5ItBAeXEqfDYpXkQlc/OkSw0RZE5ftXpSeAySWjnxsqrki9BBY3SN05nYPoTd
 CRUA==
X-Gm-Message-State: AO0yUKV3HznAs+YLTOinMM6+k5/SKhmuCX+6dPZu1cZCf25DmldfEmQb
 K+oRJkVBQaWZOuGD076EE+eKegncf5nn26YY
X-Google-Smtp-Source: AK7set8yeoq2BbCG6/rYVfT9J5EyNlf3fUxPZ1tulB76AS0XatADC3plbog8jMjDcUx3RGsEHWZepA==
X-Received: by 2002:a5d:6292:0:b0:2c5:52ef:b46b with SMTP id
 k18-20020a5d6292000000b002c552efb46bmr3887840wru.6.1676272149281; 
 Sun, 12 Feb 2023 23:09:09 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d7-20020adff2c7000000b002c55ed9e314sm328399wrp.64.2023.02.12.23.09.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:09:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 09/19] hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by
 EEPRO100()
Date: Mon, 13 Feb 2023 08:08:10 +0100
Message-Id: <20230213070820.76881-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070820.76881-1-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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


