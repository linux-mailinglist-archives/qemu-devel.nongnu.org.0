Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17DA6BB6A5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 15:54:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcSV4-0003ax-Oc; Wed, 15 Mar 2023 10:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcSUw-0003a5-8e; Wed, 15 Mar 2023 10:53:02 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pcSUu-0002qB-Cx; Wed, 15 Mar 2023 10:53:01 -0400
Received: by mail-il1-x136.google.com with SMTP id y12so6263228ilq.4;
 Wed, 15 Mar 2023 07:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678891978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rk4/ofnxCKOhROEy7poEJfMyyq0LPhjFdcbCi+gcDY8=;
 b=Fh8IAPzqTL5wwnVwTSeiNxQnwEX5EEsSN1pYGWy+OZHcPkcVZKdtHbKZ5vt1CbueSh
 IgKzrDv5LJwlArC342flaYmHZ2x7r7X6Cs2Vwcfm9IoYPAxQtjtYFSrJYgvTKQNEh9fi
 5GmtcMgQ4rMwpoSkHeOa0HCiioRV7QKvsZQIJ0cqOV1oMpiEzwi2IvLzfN7jqPMIoAnG
 br3eVG+b9+4RIdWO6Ho7bFIhom8RpBaHfbTdp8ONcdX+3NhZoaym55wOocyI+9Do44hf
 YWULvdnFpUx8IFq0HeYHoMA9REH7NZfQwbhhrbiGXcnmUonppEavRnRCQzsHzglrV3tG
 AVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678891978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rk4/ofnxCKOhROEy7poEJfMyyq0LPhjFdcbCi+gcDY8=;
 b=ZM794uJ3aap8R18HjRKzFNG4I+kG7oNAst1En/kcNsXKV7ckqmFvrRMwEB1TwSGc8B
 frVRCu691LyWUqjq8vrJqVWpnZg9g02lw7bE47oihqXO/wwVOxhJeo75Eo7kVJeZMM24
 48kc5jD3ahTSDjHPCrVMXYsaQS5YHYaeCVmpezEuwXIPJtaDTfS/ASjx1XgyQOMk9B/7
 AffJjteaNaA6yBplLbNiVBVcvrrn4Uj0T48iDLbppJh7Ubp8IJot1OZG8oJGO4v6obIa
 1iZYqwmszHHNVMJgZcH/u3xHCmCVpaC0sQRI7cN7XAxdLjwZYJmk/wyMtDk7BmeK+yBz
 Ckug==
X-Gm-Message-State: AO0yUKWgVBVmqHjhHRyyLEXTbgPNBe/Gh2YxeBT595q8QNYcPYNoeNZk
 Sj39CAIl9Lx6NMfy7YBKdVE=
X-Google-Smtp-Source: AK7set9v5IrjHnsuZq7YcXnnSJHojTNhfb6y0jouy7oOJm5gnuAIeOJoonW5i/zk9xPtv5s1eJZ3jA==
X-Received: by 2002:a05:6e02:1a2c:b0:319:6826:5577 with SMTP id
 g12-20020a056e021a2c00b0031968265577mr5697367ile.23.1678891978637; 
 Wed, 15 Mar 2023 07:52:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a02c4cb000000b003eebde09a10sm520886jaj.157.2023.03.15.07.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 07:52:58 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/5] arm/mcimx6ul-evk: Set fec1-phy-connected property to false
Date: Wed, 15 Mar 2023 07:52:46 -0700
Message-Id: <20230315145248.1639364-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315145248.1639364-1-linux@roeck-us.net>
References: <20230315145248.1639364-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=groeck7@gmail.com; helo=mail-il1-x136.google.com
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

On mcimx6ul-evk, the MDIO bus is connected to the second Ethernet
interface. Set fec1-phy-connected to false to reflect this.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/mcimx6ul-evk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index d83c3c380e..3ac1e2ea9b 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -41,6 +41,8 @@ static void mcimx6ul_evk_init(MachineState *machine)
     object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
     object_property_set_uint(OBJECT(s), "fec1-phy-num", 2, &error_fatal);
     object_property_set_uint(OBJECT(s), "fec2-phy-num", 1, &error_fatal);
+    object_property_set_bool(OBJECT(s), "fec1-phy-connected", false,
+                             &error_fatal);
     qdev_realize(DEVICE(s), NULL, &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX6UL_MMDC_ADDR,
-- 
2.39.2


