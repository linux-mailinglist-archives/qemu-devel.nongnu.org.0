Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4FD58ADE4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 18:07:14 +0200 (CEST)
Received: from localhost ([::1]:50022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJzqz-00088G-I2
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 12:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oJzeb-0007d8-73
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:54:25 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oJzeY-0004oS-TF
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:54:24 -0400
Received: by mail-wr1-x42a.google.com with SMTP id p10so3691266wru.8
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rfrHuYofA2jTHYlyVlxL0WVJKLrnjdxClG3/+p9uXxc=;
 b=UMt/6ONZE4d7i8r+HjDr+1yRMzmeymuO+74l1T3asAl+Tl1RGNT+DTxE7u2wx5lcQB
 8kdbMDr6ilHFhkffCtYlmJZTQlaFyhFDxN8nF2W97cny4OYrqhMLGrAiMsdRULSy/7pS
 Ry++das2y4F8gvuTPoYUUZva0cfQexZ8IxJznRnFl2x+stO1m7DnEC8Xln+9sUJfM+tG
 LlObm12rMHaIGOqD3qyZqHqpEcOQ0KMMuKNmdUq7aRo97GZW87rtelf1TT5j8L4fgAz4
 VuK8DOuGSusEzjtf6L0KVKTOXviQjmY1hFGmZHklZfi6jFCW/Pa0TqQRkvenxZ3C2PhJ
 u8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rfrHuYofA2jTHYlyVlxL0WVJKLrnjdxClG3/+p9uXxc=;
 b=ztMocy1kHr5i9f2vTymRyt6Wb9SYIz+kfINPbk3S4VVHZJmQmLXWBZfvRYP25p+l4m
 RVkalWNusrK7vs3cnl+u6eZEZsW8UwS9lK/DomASwF1JQ7x4m944eL+WqlFbzk3wwxO5
 RyNTZUOoujhQbEHLMZfMetnlBn+gF/Q2HFxeDw2bPlRyjuVON+fyh0aurdjEBumgNi4w
 Zf1H891Ad7BS23PQ51UKcjIKdKe/uNZb2U2cdALSXRqURieo1K18X7nxpzpNZcOUUm91
 YBl3NSDV8DZgQ5giKKHN+u6ulbKIwV048O2AsWS5nWVFe7yyCKmIUdqCZoJnMbtpUfDf
 kvCg==
X-Gm-Message-State: ACgBeo1v27bgMDLDAq2eqAXvPxz84m8GBE0yLyz4rm9I7Q8qAl3K89lO
 H6glWoinMzMDCjs3fQW1Qt7Jjg==
X-Google-Smtp-Source: AA6agR7rwBoF/VmMijr0QsVwMVUZd/R8yy5zn2l6NKz7JXNM0HX+pRHkPvA4FpOzuoDDk3ygtfN69g==
X-Received: by 2002:a05:6000:1564:b0:221:7cbd:df6b with SMTP id
 4-20020a056000156400b002217cbddf6bmr943177wrz.511.1659714861666; 
 Fri, 05 Aug 2022 08:54:21 -0700 (PDT)
Received: from henark71.. ([93.107.66.220]) by smtp.gmail.com with ESMTPSA id
 t10-20020a5d49ca000000b0021d6dad334bsm4133543wrs.4.2022.08.05.08.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 08:54:21 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 5/5] hw/core: fix platform bus node name
Date: Fri,  5 Aug 2022 16:54:05 +0100
Message-Id: <20220805155405.1504081-6-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805155405.1504081-1-mail@conchuod.ie>
References: <20220805155405.1504081-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 05 Aug 2022 12:00:43 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Conor Dooley <conor.dooley@microchip.com>

"platform" is not a valid name for a bus node in dt-schema, so warnings
can be see in dt-validate on a dump of the riscv virt dtb:

/stuff/qemu/qemu.dtb: platform@4000000: $nodename:0: 'platform@4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
"platform-bus" is a valid name, so use that instead.

CC: Rob Herring <robh@kernel.org>
Fixes: 11d306b9df ("hw/arm/sysbus-fdt: helpers for platform bus nodes addition")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/core/sysbus-fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
index 19d22cbe73..edb0c49b19 100644
--- a/hw/core/sysbus-fdt.c
+++ b/hw/core/sysbus-fdt.c
@@ -539,7 +539,7 @@ void platform_bus_add_all_fdt_nodes(void *fdt, const char *intc, hwaddr addr,
 
     assert(fdt);
 
-    node = g_strdup_printf("/platform@%"PRIx64, addr);
+    node = g_strdup_printf("/platform-bus@%"PRIx64, addr);
 
     /* Create a /platform node that we can put all devices into */
     qemu_fdt_add_subnode(fdt, node);
-- 
2.37.1


