Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43156629AD4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 14:41:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwBd-0004Ol-SS; Tue, 15 Nov 2022 08:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouwBL-0004FV-Ej
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:40:58 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouwBI-0005Vz-S4
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:40:55 -0500
Received: by mail-wr1-x42e.google.com with SMTP id w14so24308783wru.8
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 05:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1MhvfRmBaRDx5xt7ahUGxraOYYXK+G1So5sDIUTQUPY=;
 b=emnq3gzideqq7t07PZIp/jPPj6/XF6BEME7KQvRYnKNTD/1bHl95AGCi9eVjBKWX9h
 0r5cCo6meC5r0sLrqGOKSNzVRFqTOYa8U4HJ4aYk8D13FagmZQAo1Fj7K4ifIPfpoXSl
 XEOvrKq4kg8c+OopZ2wRzwqhRlFntVcJAqrqLY+qw+fglBE5OWY2/OPPI/aTAySdukKM
 0qHKp4iRwMbfCsFwNfqfTNBSuOiOyVGUu525JMXqrgte4+oL9Dais0uCFEGZWqRTYVut
 HSHJmXHnXsnvWryN5fYPSTqGZbHjlKqSiJEctzrxrdJ2pPpJrCDPE6wf/LQR4m0c/4R4
 IvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1MhvfRmBaRDx5xt7ahUGxraOYYXK+G1So5sDIUTQUPY=;
 b=HQ10JmFFEnectrdl8ZgOsOlb6b1I9eIKZ/CiaQdjBxVREFquHDY893+EY6V0FPWbSy
 KQSv+2SfvDGPBlBLk/yd2UaU+1+Rg6XRFo4F1SEA4dATsEODH7D9iwNsiGuG1c+KOV3c
 75VsYtbVJP1QUROiVp9/ZIoswdV4BrzDBL4U6eDRdTTIK6zbtIlPeCxDwL3niV5/lrII
 mKnkeCMMP6cjmNFprUxooYNTZ/I7sJ6t06KcMiVeXhmKq5L3SMiTRet0UXVv7edaZLx4
 EGcNgUdtH7931QUffWRCk5b+y1dUTKFV1y1uoFlMoJj4Su9891kVppDUlZZhDLVVbTHP
 b+dw==
X-Gm-Message-State: ANoB5pk19kHru9ZO28h72r8Ou4DVCcDznKvAni4P3GPymAFsT2R9a7WM
 rrYFjE1eKQmBBz8l1adaNa8MMg==
X-Google-Smtp-Source: AA0mqf7U8NuGsyUa1BRZqkR5RULyhN+4tWQczCZm+QciEq0ZU45KN+/4EEH75aVyCJYPOiUr83X1BQ==
X-Received: by 2002:adf:e752:0:b0:234:3e14:ea66 with SMTP id
 c18-20020adfe752000000b002343e14ea66mr10919533wrn.272.1668519650601; 
 Tue, 15 Nov 2022 05:40:50 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 az11-20020a05600c600b00b003b4cba4ef71sm22407183wmb.41.2022.11.15.05.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:40:49 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C7E891FFBA;
 Tue, 15 Nov 2022 13:40:48 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 2/2] hw/intc: add implementation of GICD_IIDR to Arm GIC
Date: Tue, 15 Nov 2022 13:40:48 +0000
Message-Id: <20221115134048.2352715-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115134048.2352715-1-alex.bennee@linaro.org>
References: <20221115134048.2352715-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

a66a24585f (hw/intc/arm_gic: Implement read of GICC_IIDR) implemented
this for the CPU interface register. The fact we don't implement it
shows up when running Xen with -d guest_error which is definitely
wrong because the guest is perfectly entitled to read it.

Lightly re-factor this region of registers and also add a comment to
the function in case anyway was under the illusion we only return
bytes from a function called readb.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - checkpatch fixes.
v3
  - re-base on re-flow with if
---
 hw/intc/arm_gic.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 1a04144c38..7a34bc0998 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -973,8 +973,18 @@ static uint8_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
             /* GICD_TYPER byte 1 */
             return (s->security_extn << 2);
         }
-        if (offset < 0x08)
+        if (offset == 8) {
+            /* GICD_IIDR byte 0 */
+            return 0x3b; /* Arm JEP106 identity */
+        }
+        if (offset == 9) {
+            /* GICD_IIDR byte 1 */
+            return 0x04; /* Arm JEP106 identity */
+        }
+        if (offset < 0x0c) {
+            /* All other bytes in this range are RAZ */
             return 0;
+        }
         if (offset >= 0x80) {
             /* Interrupt Group Registers: these RAZ/WI if this is an NS
              * access to a GIC with the security extensions, or if the GIC
-- 
2.34.1


