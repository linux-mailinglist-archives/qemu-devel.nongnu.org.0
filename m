Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47376BB6A2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 15:54:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcSVQ-0003h9-FR; Wed, 15 Mar 2023 10:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcSUz-0003bJ-0Y; Wed, 15 Mar 2023 10:53:05 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcSUx-0002qx-C9; Wed, 15 Mar 2023 10:53:04 -0400
Received: by mail-io1-xd36.google.com with SMTP id bf15so7921372iob.7;
 Wed, 15 Mar 2023 07:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678891982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yJFWehCA11brbTrRUqSDJJtjVUTS8uqYWPz8CgZG0N0=;
 b=j/4Npo6x81I9s7rz6D1yuUN+gSYxckOE+bLEc9PAWES967rn7Yr7BJIgMTLuwSiVKA
 biakefkXUIjmiPi7zHYH3wF4QWXZNhARitImkZvK73M3VBWHkR45Fiw+xKiDshFGg12q
 wLbB7YT+mjZUlVoZktu5EVWlwfNUxsZQNiLO0TV832XFIyQ5PXm+3lQIn3Khz8Gi+Gf3
 I7zXtT847/AfQwhmA/CaEUgi5xQxL2x0t+A5G+JCa0/AeSqF4CumkbZF9raQebkJ04Za
 hTAES3Yh9jZzvNzk1w9/3E3juP8CP7PjGka0/i0YkCWfq7IUSyeOT2e8NtPQDHlXqW02
 KIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678891982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yJFWehCA11brbTrRUqSDJJtjVUTS8uqYWPz8CgZG0N0=;
 b=Hi2s/m17VVrpSEyfMWj1EILY7diVOAAo8wNXbOcMgN81doDgegMBcJ+aY46g47Izm9
 XI2u7zt7FSTLM3YBB4MP96hWWu7v4l7B0I1z/kFbSiGOycPFpH18W1HR5UETCl7Z4k6p
 HxJEDNY4HZuHxKIXEgb2wFaQwRsSXC1AwH3MwNHMASBj9nlhcP8hHXCwoPNgX2cvsPWO
 VrEJ5Vj5VF4/vl2i4GhJuoNFvCe1d9L7U5HFO5FA85w7+rmBtvFJySnLEkyExb1T5SXd
 SeXo62wkcTD4rUNXGuwncJjAtBMWhB4d+ZET2sNciZQqkHz7ntN+MeaF6stETnlBF8h+
 4u4A==
X-Gm-Message-State: AO0yUKVGNrV+DBpMHwLyzjXtwq56mpT5/Pk3IFlKIFYy2SU3vo/GrXsX
 Y9W5Hb63VU0hf6AtY6lkHw8=
X-Google-Smtp-Source: AK7set8eUFQ9JsIIWgSZBfcz3YZM++B7wVdKnPQpo7d7kwTvEN2Ax4y0IBLuTzdokDBZknDESqiKsQ==
X-Received: by 2002:a6b:3c04:0:b0:74c:e1a5:c5e3 with SMTP id
 k4-20020a6b3c04000000b0074ce1a5c5e3mr25785424iob.0.1678891981872; 
 Wed, 15 Mar 2023 07:53:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a02ac16000000b003ed8808d450sm1686369jao.161.2023.03.15.07.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 07:53:01 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/5] arm/mcimx7d-sabre: Set fec2-phy-connected property to
 false
Date: Wed, 15 Mar 2023 07:52:48 -0700
Message-Id: <20230315145248.1639364-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315145248.1639364-1-linux@roeck-us.net>
References: <20230315145248.1639364-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=groeck7@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On mcimx7d-sabre, the MDIO bus is connected to the first Ethernet
interface. Set fec2-phy-connected to false to reflect this.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/mcimx7d-sabre.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index 6182b15f19..d1778122b6 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -41,6 +41,8 @@ static void mcimx7d_sabre_init(MachineState *machine)
 
     s = FSL_IMX7(object_new(TYPE_FSL_IMX7));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
+    object_property_set_bool(OBJECT(s), "fec2-phy-connected", false,
+                             &error_fatal);
     qdev_realize(DEVICE(s), NULL, &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX7_MMDC_ADDR,
-- 
2.39.2


