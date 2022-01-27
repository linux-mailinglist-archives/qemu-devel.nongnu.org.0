Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14E49DB4F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 08:17:23 +0100 (CET)
Received: from localhost ([::1]:36010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCz22-0006HT-HB
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 02:17:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyMj-000444-Eu
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:34:41 -0500
Received: from [2607:f8b0:4864:20::436] (port=42576
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyMi-0005iy-0U
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:34:41 -0500
Received: by mail-pf1-x436.google.com with SMTP id i65so1768200pfc.9
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 22:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OnCbwXhM9/o/J8yHFW89wxfhUkfvaIKD6NjXHeW3Thc=;
 b=APGbKKDARtRzYgk0pW3JYlGmeECbs7z71LfffzOQJOWZHVOFqcKFeMw1u8KElSBS8R
 /t1e455RPe9PLWoTM0eP5cSXjynSQ3mZuDeEu3j0Imgbz31wlBfyPZ4BiAgZI4HCeLSg
 roIEjoQHA6MMeIWZ6tAWvHYeB654evQeEg69xS/Oyfna6XgWn/3P5wMRFckPtsGK7hdy
 6tNXfUWZB/y2TKLgW0TlhGR7x24gbZeatW11cKeCk8fEc7OBAC5Ffe0Ve+NU15Ac8p1v
 NffvyEU0c1LeSvC2Ur5zbrMXTYyl0v1rmnmISr55aS2g8qyaHCVLWNCgwK5Imly2VtHU
 AGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OnCbwXhM9/o/J8yHFW89wxfhUkfvaIKD6NjXHeW3Thc=;
 b=FhwChfqV/f+/51atJX5UP4XCsT9hd+gv+H+46FoDwLBUQziO9DnZUB4yp4W//I9aIe
 sMzTF0ZrvnDCq/MgjEbXDV4QQOxEp9aOWCF94RBNuE61mb80ldSGFAPWcGjYeg1S++8q
 Zj+pPd380ei3WYUu9r2plF5pSVS2OHW79LOYCsjcIWUxXIO8DhCZTmZyiqoyT4HLjobR
 ud0AwNzH7Nrr7AZ0HOnxUhn5ziBBBYAJ5os+cJoJtR2740Rv1fDDtpENL4Ltdh6PnCv9
 /Vvy1vcEQ+mojvSaOUg5GUnQ2aLcU2dSOgX4wEbM2FOJcOPcLaElCGHuqn5ch8Zgmg+0
 LKxw==
X-Gm-Message-State: AOAM531VUyDKPZnxNab1WFgh2yppxN3QFGCGW5IBRdEU+BneIdh2lF4L
 a8nOXBydrOSwxqA93R/+P5mQlwbt4vdyyjvT
X-Google-Smtp-Source: ABdhPJzOPlwrV4KBztxDpjk2OOtVeUftsqRz3XKwCpNs9rFa5aJ4ew+I/ou7uNyCiiOWO9jmBJECMQ==
X-Received: by 2002:aa7:88c9:: with SMTP id k9mr1882623pff.58.1643265278574;
 Wed, 26 Jan 2022 22:34:38 -0800 (PST)
Received: from localhost.localdomain (alanje.lnk.telstra.net.
 [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id y20sm4231855pfi.78.2022.01.26.22.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 22:34:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/arm: Tidy sve_exception_el for CPACR_EL1 access
Date: Thu, 27 Jan 2022 17:34:26 +1100
Message-Id: <20220127063428.30212-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127063428.30212-1-richard.henderson@linaro.org>
References: <20220127063428.30212-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: yuzenghui@huawei.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract entire fields for ZEN and FPEN, rather than testing specific bits.
This makes it easier to follow the code versus the ARM spec.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d9ee2ba5f4..cd48560786 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6154,30 +6154,28 @@ int sve_exception_el(CPUARMState *env, int el)
     uint64_t hcr_el2 = arm_hcr_el2_eff(env);
 
     if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-        bool disabled = false;
-
-        /* The CPACR.ZEN controls traps to EL1:
-         * 0, 2 : trap EL0 and EL1 accesses
-         * 1    : trap only EL0 accesses
-         * 3    : trap no accesses
-         */
-        if (!extract32(env->cp15.cpacr_el1, 16, 1)) {
-            disabled = true;
-        } else if (!extract32(env->cp15.cpacr_el1, 17, 1)) {
-            disabled = el == 0;
-        }
-        if (disabled) {
+        /* Check CPACR.ZEN.  */
+        switch (extract32(env->cp15.cpacr_el1, 16, 2)) {
+        case 1:
+            if (el != 0) {
+                break;
+            }
+            /* fall through */
+        case 0:
+        case 2:
             /* route_to_el2 */
             return hcr_el2 & HCR_TGE ? 2 : 1;
         }
 
         /* Check CPACR.FPEN.  */
-        if (!extract32(env->cp15.cpacr_el1, 20, 1)) {
-            disabled = true;
-        } else if (!extract32(env->cp15.cpacr_el1, 21, 1)) {
-            disabled = el == 0;
-        }
-        if (disabled) {
+        switch (extract32(env->cp15.cpacr_el1, 20, 2)) {
+        case 1:
+            if (el != 0) {
+                break;
+            }
+            /* fall through */
+        case 0:
+        case 2:
             return 0;
         }
     }
-- 
2.25.1


