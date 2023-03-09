Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA306B2E21
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:08:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWk-0004QK-By; Thu, 09 Mar 2023 15:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWh-0004PD-SY
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:11 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWg-0000k9-DW
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:11 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 fr5-20020a17090ae2c500b0023af8a036d2so6580593pjb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hGhyWqWBqqY+yz4E7tcjiME/sV0L2tPqERyk+mR+NS8=;
 b=a0x5xUijjVXVWUnknlTF3kxp8wdTj+3X1z8DNRIhCOIkyMJGwiTAEFKbG2mJGhJLr7
 F+N0+nQyt6P+SZciF82Nm4fOimE2p76WG7sugKLxueN9i7evv0MDmlO/QoAxL3OFLRho
 JrahGaAvTZEHL8f2mL5ZKIp3xs76ki/IKD1G7D7xMuqvcYIynQqAzUpXyz2SLigzX1fA
 3UuQlMJdy79qC70TbHpoL4iagcRBSWjEwSvIAllrRaXoIV2N46ppQdGhcUWS+Yzt4i65
 8jhmw2XmVqnZ98tO9+bBSoiDBbPhHjaPuw9IvEZMO0AdFORTGCtgI/zGHYn0DpaR3WJW
 YkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hGhyWqWBqqY+yz4E7tcjiME/sV0L2tPqERyk+mR+NS8=;
 b=dP1lIpvRYLODP7quJQ8vFXnUDcnJkzLHz66XmfySMQQR5E861eD5MP04T78jEgNhDz
 gdiXBNWuIuDaXeKieLLvIss6RxclApDAUR/6j0kKfJ4SuUdf4UJUEP5+QJ7+87FHqrIw
 C/ppyoEpLbyaZ/4wUFGYBUhlQ3NlHo/FBB1jh4Oeyk8wWxD7kuFL2Gf1vei/6pHsZRl3
 H54+rIJC+Z5ArgquZkocwPW2zQA/zSh5lgV1otPKOtHo6l20vrx03vgYuXqk9Vp9ulp7
 kAzFHmqiE4Qp7u4ixsj32yIqxyWGts2KE9S0fU0scj0CdHsL5vOnd1ktpFR+ImfRAo5f
 0+hg==
X-Gm-Message-State: AO0yUKXtgEfiBLIHkyHFre/dK5CX04bpnp36YK4xZ8Lzv4biBKLp1EAG
 o7qZLW16CoYhS4m7xovj3DICR56jiK/CUcqzn+E=
X-Google-Smtp-Source: AK7set8ox25DFVPP/c05O6eJljajcxHYJEGadDIvNPhqZJdBmjuHageNYLybexQrhEboxaH2dmbQqQ==
X-Received: by 2002:a17:90a:de94:b0:234:881b:2e8b with SMTP id
 n20-20020a17090ade9400b00234881b2e8bmr23811262pjv.49.1678392368902; 
 Thu, 09 Mar 2023 12:06:08 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 19/91] target/avr: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:38 -0800
Message-Id: <20230309200550.3878088-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

From: Anton Johansson <anjo@rev.ng>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-5-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/avr/cpu-param.h b/target/avr/cpu-param.h
index 7ef4e7c679..9a92bc74fc 100644
--- a/target/avr/cpu-param.h
+++ b/target/avr/cpu-param.h
@@ -31,6 +31,5 @@
 #define TARGET_PAGE_BITS 8
 #define TARGET_PHYS_ADDR_SPACE_BITS 24
 #define TARGET_VIRT_ADDR_SPACE_BITS 24
-#define NB_MMU_MODES 2
 
 #endif
-- 
2.34.1


