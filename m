Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7390C6E8F2E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:07:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAM-0000le-Q1; Thu, 20 Apr 2023 06:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRAD-0000cN-FA
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:17 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA8-0003tH-B2
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:17 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l31-20020a05600c1d1f00b003f1718d89b2so2823993wms.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985109; x=1684577109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UUZfejXshrs3SIBhcXosBMyPn1kdvSAUIgMZvHXxREw=;
 b=q3YQIeeIU44SzeAZAYbrDTC0JXeiD7OL4mYayrMRBs5TDgyEw8ld8Fzy7lKpEPtFm9
 V1eEzVDsvQ4KYWalS57r9JS+aSrugFunHOv/A+lXIJeVdE/Ar21J92XU+Nd0l4N8y8ro
 kzHEWSzvGkhNSxGAW9+ZxL3ZvcfO+ZIYw4xr8ricAtfT69i/Lt+HaPfoOO59PGkN7f4P
 kCWDN3uc09KOoY8xDs4ACHOSwJWyd6gG27bVJaPL/6mX3kXnEPkZYlPvmRQjnAtxDQn2
 uiECwe87HK2ysdRY2roGRRbZF03nkwjQE67FcgI8GpTtSJQYQwGoXfSJEr0Bd0J1Vb4x
 53KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985109; x=1684577109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UUZfejXshrs3SIBhcXosBMyPn1kdvSAUIgMZvHXxREw=;
 b=dUlJmixjsTFlzY64D9aSZlep5e2rpkn43Xaocr6TwrFLNF9ZxkF8oG3Aj+TCTGw36L
 ENM34y5hwlzHM/J7u3peQGRnm2cZc1W/+DPCPjY/jjWqRe6um6OB9zaoZTI8axTjBmis
 oxFxHWMtk/JgS1g8ywPpHYbFECR8HLfKGh6qZdn0DlE9ZewVRdjpxjhiU2sULWONCMfy
 sP8QyZnWoD5E1hAeEOIHt2b0NemgD8ugM29MRKpdTTjacBDSsNqdx3CeKhJoo9hZC4Eh
 CVLeljzpvCk+5P/76xp+ReY/hKZOd7a+7t3/JIB+yTmk6H0kn7Om5yt6WDUB2aMIMd/o
 T0TA==
X-Gm-Message-State: AAQBX9fFO203+TcCH8qqrGTrq40uGOfnPxsxUui8hJAkEstLT9zLpEIs
 IAhcpJXmgr6Tdl0ThQtJpHoi6WIEXUPzfCK38Is=
X-Google-Smtp-Source: AKy350ZOf2S8HFx8ctrHv/r/DzokMglJqR4bUD5yoyqMG/cjeM61ZNdT4IeL2ltbTEsBi+9YOwFzrg==
X-Received: by 2002:a7b:cbd4:0:b0:3f1:7123:fd12 with SMTP id
 n20-20020a7bcbd4000000b003f17123fd12mr808031wmi.34.1681985109215; 
 Thu, 20 Apr 2023 03:05:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/21] arm/mcimx6ul-evk: Set fec1-phy-connected property to
 false
Date: Thu, 20 Apr 2023 11:04:54 +0100
Message-Id: <20230420100456.944969-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Guenter Roeck <linux@roeck-us.net>

On mcimx6ul-evk, the MDIO bus is connected to the second Ethernet
interface. Set fec1-phy-connected to false to reflect this.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Message-id: 20230315145248.1639364-4-linux@roeck-us.net
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mcimx6ul-evk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index d83c3c380e8..3ac1e2ea9b4 100644
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
2.34.1


