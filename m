Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8950B6521E6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:02:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3Z-0004Ff-0N; Tue, 20 Dec 2022 08:53:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3V-0004D2-R4; Tue, 20 Dec 2022 08:53:18 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3T-00012P-MG; Tue, 20 Dec 2022 08:53:16 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1445ca00781so15457911fac.1; 
 Tue, 20 Dec 2022 05:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=umE98gdRHDRDK4EVpp4UFfCVYlLLuK/yAYvtgaqx+tI=;
 b=JXaWnjf5mseHwm75UFOaxAmd1AoEgMMdZO/09DWwhFMKY9dfUUMNKOV5z3do0Y0A3w
 sK2i1sGUuT/CQLsF1VvIJKm+Jo100pXBneJlzAjH/wVEqOEfZRdnnaMj6M0TNx5A608P
 4SUWCVv2HQkfZ7ojyn9UAB5rC9Su1Og+G44Tzhrf/t/HCxBX129jS/9Dj7V/FYyNra52
 VL01emwNa1kEofV8keseO06WLlHMac/mdw7oFpfYRYoR5+w3C8SIYAhfS7K7tB1CUfeN
 PqwHN63wIjNCLO3UapiwVG22lwm5nZ87EZZQjVII5Iva5snIjXw7DeJHWsLk5O2pEGxy
 L7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=umE98gdRHDRDK4EVpp4UFfCVYlLLuK/yAYvtgaqx+tI=;
 b=WcpZTLL/ET2O8YbgPIB05VMeVmwECzY+ZvUBBadOS5g9jKAEag00+c0Fiy13ufg+R5
 n6AVZhOQQHI2RDNaVudEa/WlRnixaKOkuXJ9ObW5w7R90S+p7egh7fIGabkuKUuKx8zl
 6EjLhMoLV0zvR0PE1wGvCQFRGjGSipvIqpz5iqvuI0lHzd1vV7GfmWw4tarTPyLSe+H+
 54qj8GvWCX1zF5XN35BGVt/m/YJfSD340ZLSJVDZTxyXRb0GRNzhuPknTilQal3CdphX
 N8gAgCnn27UFRZIb6KeOP+UtQu+lmSj5lFeSNelNoGIXnDfuTBNdWl2BftDQHap2YVpF
 SB6A==
X-Gm-Message-State: AFqh2kr6waCKg5ccCKqGGmTjyA5M+NpbwJAS6XwsBaGC5/P16cG6sWOZ
 RSvrSmL3aNOAshVGy6ryjY8hSloTV0Y=
X-Google-Smtp-Source: AMrXdXveQpOu7/Qj1jV5nX6lB1I3mVpPjntiVH5ZkLdYJZIq7DTuZwx7OfJTjCUBO41fdnFSOn4DpA==
X-Received: by 2002:a05:6870:9f84:b0:14b:cdc5:870 with SMTP id
 xm4-20020a0568709f8400b0014bcdc50870mr7266500oab.10.1671544394266; 
 Tue, 20 Dec 2022 05:53:14 -0800 (PST)
Received: from fedora.dc1.ventanamicro.com (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056870898e00b0014474019e50sm5994933oaq.24.2022.12.20.05.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:53:14 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 06/15] hw/ppc/vof: Do not include the full "cpu.h"
Date: Tue, 20 Dec 2022 10:52:42 -0300
Message-Id: <20221220135251.155176-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220135251.155176-1-danielhb413@gmail.com>
References: <20221220135251.155176-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

"vof.h" doesn't need the full "cpu.h" to get the target_ulong
definition, including "exec/cpu-defs.h" is enough.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20221213123550.39302-3-philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/hw/ppc/vof.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
index f8c0effcaf..d3f293da8b 100644
--- a/include/hw/ppc/vof.h
+++ b/include/hw/ppc/vof.h
@@ -9,7 +9,7 @@
 #include "qom/object.h"
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
-#include "cpu.h"
+#include "exec/cpu-defs.h"
 
 typedef struct Vof {
     uint64_t top_addr; /* copied from rma_size */
-- 
2.38.1


