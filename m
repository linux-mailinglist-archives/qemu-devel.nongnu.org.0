Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F4C693EA7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:06:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSta-0000rQ-F2; Mon, 13 Feb 2023 02:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRStY-0000qU-4a
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:05:00 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRStV-0000ns-Vw
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:04:59 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o36so8015208wms.1
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nNOrNrdb50vLty1kgJSdCEtWYQ6pUAsz/+ttGOyu3ag=;
 b=SZHeQUxGMDunui3vw8GbRBp2K6OJj7AhQjfieEKKfFX6Jh6WyOhDwwLM6E138+r/Sm
 FOlx470IuAt4B/YPjUOjlipTzIYeIH2y6whKsyNuRBVjUsZj+4HRuasR+hy3ofB9JRu5
 KA/XmDQBqFiv6O34KMyhR9gM+tiHmVf3tcWyvPnpZTXxrjFiW1C2JTxecAMSVF2zS0SW
 OQksu7q8KH999s8VAu8D3uCrKsyqMi2OzAcTbs2Fd/+EgJYOYQ5cwd/ocXWivPoNHErI
 ZviqzSgKRk1v11YYFpySihX8TpRPaXCPjOgSVCzF3hAbLw1gwQvwmJybzCDdeU+CZNMS
 DI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nNOrNrdb50vLty1kgJSdCEtWYQ6pUAsz/+ttGOyu3ag=;
 b=VhhevZaEho6uSXpm0OMQh969ou3maDnFOZuZJgsD7SWKdp7AiHOqZAh8s1u5YretTZ
 EaEksV+8nW3lweFu5ycTsVbGVAtJP9ZD6T05c8DoeHe+1MWdxmg1JgFvl0fRqG2dK77B
 9z3yWmgtfb/+0JO0O0ZMcMzPlPsLWfctHCWkaesFiyrmJFSHtEuutF18ieqSg5PgCVDr
 0f23xgwu//eyAyRMUfz8X8cs2Rcc4mDkB9EKU378H5lipxqe7hjvn4i8JshzT+o7rnEn
 5Rfrc8/Y7xVWys3FRslIUOu1ir3U5ABI61VPnLdrLgRFOpHWOgT3ic+fGjmus+ScvgzB
 Ufhw==
X-Gm-Message-State: AO0yUKVvJGC3JvqIdf3haGnRUP5IYHFGkqBl21rrAMZoMQUIHC+wNfAz
 l1wwqem2Z4Oih8MLzuc/S0V+ItLw/LaAqrbO
X-Google-Smtp-Source: AK7set9MuLpv9q4isPoFGFGtbTrnMgw9fqslmrA706l9Z6w23PH9VVqUiqBY2VN8CQfun7Jgp6DseA==
X-Received: by 2002:a05:600c:3b92:b0:3df:eedf:df1c with SMTP id
 n18-20020a05600c3b9200b003dfeedfdf1cmr22149527wms.38.1676271896498; 
 Sun, 12 Feb 2023 23:04:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a5d4b84000000b002c55b0e6ef1sm898198wrt.4.2023.02.12.23.04.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:04:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Gonglei Arei <arei.gonglei@huawei.com>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Hu Tao <hutao@cn.fujitsu.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 6/9] hw/ppc: Replace dev->parent_bus by
 qdev_get_parent_bus(dev)
Date: Mon, 13 Feb 2023 08:04:20 +0100
Message-Id: <20230213070423.76428-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070423.76428-1-philmd@linaro.org>
References: <20230213070423.76428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

DeviceState::parent_bus is an internal field and should be
accessed by the qdev_get_parent_bus() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/spapr_vio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index 9d4fec2c04..dfc5c436bd 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -382,7 +382,7 @@ static void rtas_quiesce(PowerPCCPU *cpu, SpaprMachineState *spapr,
 
 static SpaprVioDevice *reg_conflict(SpaprVioDevice *dev)
 {
-    SpaprVioBus *bus = SPAPR_VIO_BUS(dev->qdev.parent_bus);
+    SpaprVioBus *bus = SPAPR_VIO_BUS(qdev_get_parent_bus(DEVICE(dev)));
     BusChild *kid;
     SpaprVioDevice *other;
 
@@ -492,7 +492,7 @@ static void spapr_vio_busdev_realize(DeviceState *qdev, Error **errp)
         }
     } else {
         /* Need to assign an address */
-        SpaprVioBus *bus = SPAPR_VIO_BUS(dev->qdev.parent_bus);
+        SpaprVioBus *bus = SPAPR_VIO_BUS(qdev_get_parent_bus(DEVICE(dev)));
 
         do {
             dev->reg = bus->next_reg++;
-- 
2.38.1


