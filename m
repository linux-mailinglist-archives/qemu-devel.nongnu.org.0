Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D754A8600
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:17:41 +0100 (CET)
Received: from localhost ([::1]:39330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFcvb-0002tW-UT
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:17:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nFcgG-0005Ja-T1; Thu, 03 Feb 2022 09:01:48 -0500
Received: from [2a00:1450:4864:20::12d] (port=43891
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nFcgE-0000Qc-QS; Thu, 03 Feb 2022 09:01:48 -0500
Received: by mail-lf1-x12d.google.com with SMTP id u6so6128867lfm.10;
 Thu, 03 Feb 2022 06:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5cC47Sv0aLp7tnKjjmWCbq8mH4nDRh0G2Q/XihE2vyw=;
 b=QX/hLqxS2NbvscfGj2aexAHUqdN9LWP7vxOKm6EE1H7JUWJnxARzeW2vUHyVWDT5SF
 YDPQWzDZ+MKGXSzPVeF3s63UcY1twUBOXRK02Zqzd0NgmoYZffqwXzekadsUmCH5GFVK
 dvO+SzJxsDMKC+zNLSj7qNo1JWze4uNgOLK5blgnrTtGrZdYCBydck2cWmU4MIkYIOJi
 P6BUboat5aFa1i5k6r3/cLDTqdil0a4SuFXE+ejk12ZYlZkNxL5UAYqv0QjQY5OOZeMK
 vw714jkmv7bddKLXwIPAv6WrtVudiheTFbVnFDqkT0+crY3IIblhA1du87sXe434KdTy
 DWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5cC47Sv0aLp7tnKjjmWCbq8mH4nDRh0G2Q/XihE2vyw=;
 b=kJIme+0kLjx3FVM1HKjXqGFSa+mU8mceyVlqor2lyxSpgF3lNFdRcWCP7Xxx9FTwqK
 ipDXBvkkBj+IrRXn9c1Pjp5XG25HDHrjMzRxN/oPCHxNMl3bzK3uUVkDG4DcYqkIE20F
 m5H1GW5wuGWBY2StHaq5igW5tOygYv/f6JU88cPRGvIcNq44bsFYdKdB8FAI/CqXWVa0
 iqvpwbGTB/4dmP1J/Si3qz//cVSD/isItM0yokEmXG2XOJDbbqmW3sbEI9COcClVG11Z
 ZDJP3RqnVVAf5jvEC/Grg9lUZvTf3jSLmFeTyJVHybwYy5rliHVyGL+hrCnyWRjqzRx7
 0HBQ==
X-Gm-Message-State: AOAM531/U2EfydiQwqLhO4Eoym/QWFrJVfSS5gbKQ4eQ02Em+jTzE7X8
 BY9b9EsnMcJmbND+4sIQNZE/meeeeTXnJA==
X-Google-Smtp-Source: ABdhPJxEjDtQ8GxfURLwIe19WHkMB+rM0OY7IFJPweBeDE6cvZCwZT7UnVbc8d8HgAu4Mu5Ae/4uyA==
X-Received: by 2002:ac2:4346:: with SMTP id o6mr25925287lfl.296.1643896904593; 
 Thu, 03 Feb 2022 06:01:44 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id j23sm4379218lfh.35.2022.02.03.06.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 06:01:44 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] target/arm: Make rvbar settable after realize
Date: Thu,  3 Feb 2022 15:01:37 +0100
Message-Id: <20220203140141.310870-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203140141.310870-1-edgar.iglesias@gmail.com>
References: <20220203140141.310870-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, f4bug@amsat.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Make the rvbar property settable after realize. This is done
in preparation to model the ZynqMP's runtime configurable rvbar.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/arm/cpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5a9c02a256..e30ae088fe 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1128,9 +1128,6 @@ static Property arm_cpu_reset_cbar_property =
 static Property arm_cpu_reset_hivecs_property =
             DEFINE_PROP_BOOL("reset-hivecs", ARMCPU, reset_hivecs, false);
 
-static Property arm_cpu_rvbar_property =
-            DEFINE_PROP_UINT64("rvbar", ARMCPU, rvbar, 0);
-
 #ifndef CONFIG_USER_ONLY
 static Property arm_cpu_has_el2_property =
             DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
@@ -1233,7 +1230,9 @@ void arm_cpu_post_init(Object *obj)
     }
 
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_rvbar_property);
+        object_property_add_uint64_ptr(obj, "rvbar",
+                                       &cpu->rvbar,
+                                       OBJ_PROP_FLAG_READWRITE);
     }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.25.1


