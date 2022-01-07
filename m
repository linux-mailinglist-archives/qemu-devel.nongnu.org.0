Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186A4487B91
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:41:01 +0100 (CET)
Received: from localhost ([::1]:55298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5tEa-0002qb-7U
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:41:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5swD-0005LZ-Fr
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:22:01 -0500
Received: from [2a00:1450:4864:20::336] (port=50801
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw9-0007uq-PV
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:22:00 -0500
Received: by mail-wm1-x336.google.com with SMTP id m20so4430838wmi.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1MGFxE2DadJZLuKhTnRZO3dY+yqs9rmzcKNVV40KfbM=;
 b=pwdNjtqdoLBURz0NsNRg9v2WcOuwldy79D22dT3T6OzgpeXmF1E2QObvV3xRrVzQBy
 7mlndkzl8AWZmhaNV3mg3JHj4y5eZhepoETwfO2K5BiAGBa+tE6AtiU4XI6mrb2kNuhH
 dpOb8UdkLOrCFCTrZv04dsFylN9evNqI2rN8lstHbXJWm7V9fMUG/O9rD46BK9HC7TpQ
 hW3eLCt0MkDCebo2yEjqrsUNh6pX+cJnH6ALzDt3kH/hyeEIW9tr9Oa7KiAhoUabiR2S
 LgUBEqCl44TxS5aWvSeN6Solb0Aa1pZwjH5CI9vxVJuLKa+B1PtOzB4igaqjRO89nBf5
 LKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1MGFxE2DadJZLuKhTnRZO3dY+yqs9rmzcKNVV40KfbM=;
 b=TmDu8numIlLxdmSxbt6JP1lbGoevsFzsukE4Zpe/1I1c9p87pJgoWF1dFnAn+HD5P2
 ToHyry105ZDfMR6nC73RnHVlOQAnqWw10gFV0UQDueTR+lkhwPCXfJmwzFhKgfpy5YV1
 S6jjmOy1FQbLOmdZ8HvfQMVYGzk3yl2bVfuE30Ow4x+YdT3TdagcJ1dRxmr7c+dK+MuH
 mNLdyfc3q38qAmPJpru31TsrcC8cRFtTtm5SUMW4p+ayftDnDAAb4Qoc2PxeweSkSHZ3
 nLXOyS/qjc6r3bnob3fv/YzJbiEaTnNjsuyPjGuVuwEB5gJYMCbCJQo3cB2OZNPvs0BR
 ALaw==
X-Gm-Message-State: AOAM5312PiJrEZ7vzygnpfo+9s+IThMMe//QXNeNt7IoXjpfrUnO7q7s
 hwNt8GrE4pLLzB9UgwSWO2bIUnrRkcTbfQ==
X-Google-Smtp-Source: ABdhPJyFLB33iVUna9y5oN1FPHBkhiAwrIrkQtOOaMLAbtd5ZwmYKBVudwcMMv7CfdkjIHGAXc4HvA==
X-Received: by 2002:a05:600c:1990:: with SMTP id
 t16mr11797899wmq.87.1641576114085; 
 Fri, 07 Jan 2022 09:21:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/19] hw/arm: attach MMC to kudo-bmc
Date: Fri,  7 Jan 2022 17:21:40 +0000
Message-Id: <20220107172142.2651911-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Message-id: 20220102215844.2888833-3-venture@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 37de9fef434..257bf638fd5 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -399,6 +399,7 @@ static void kudo_bmc_init(MachineState *machine)
                           drive_get(IF_MTD, 3, 0));
 
     kudo_bmc_i2c_init(soc);
+    sdhci_attach_drive(&soc->mmc.sdhci, 0);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.25.1


