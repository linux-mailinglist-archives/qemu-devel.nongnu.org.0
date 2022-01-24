Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D10499F1E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 00:17:29 +0100 (CET)
Received: from localhost ([::1]:52110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC8aW-0005Xd-CW
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 18:17:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC8XF-0004JR-F7; Mon, 24 Jan 2022 18:14:05 -0500
Received: from [2607:f8b0:4864:20::432] (port=43912
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC8XD-0004wp-FB; Mon, 24 Jan 2022 18:14:04 -0500
Received: by mail-pf1-x432.google.com with SMTP id u10so13024626pfg.10;
 Mon, 24 Jan 2022 15:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=imo7Wy5hgWMnz1KgDMaD90e9iwmwMmg1CP8nFgO71sM=;
 b=FuvamHsIC1GdHiKK8+bJJahkruREU1hfUrxa0Q+sPX4GEFGd41GNvyIMyhrIvrNwoR
 5bNys2aHka9ZFVVA/ExNs6fY8BhmxdZHTk3IgVozFgJVEn2GIprt7M+aLRMJVN4xjiI/
 51OEd4Nz8hUk7f80G6Z0UOHtykCfeamus8Dg4TMphgB5+TKvfgmU2NpKUs47EHpDhaOi
 zXWV8NH3xBafwPBpEKofjnhJ5i+kzZs7o3HguVdk5VxffVB2rp1ylk9bLbxNyoecRBvk
 gpj9JGxAB9FhkcYAxxRavUUtnN3qGE1PUXv672us1++a0vHx2SZWdaoBbokifKprr7Ry
 Q7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=imo7Wy5hgWMnz1KgDMaD90e9iwmwMmg1CP8nFgO71sM=;
 b=HAy5m+KWj7Ljt6ebYkPYHLOk9F0LgMw7k9mjE+y71lSt2C2aGDYxibosYGkjcWa/J5
 4n8Og3pYDyUziC73t9ahwYKkX277VRl9EK60uV++jnBAMr0KxcS/76tz5IK2WlNFgpyq
 G1uGQr2JEWibT5uhjuiUSqUYQP+/GgWDWqotZE2NpGLLvDSTa+FsuarURI4q1vt2aZtU
 RMXbzowRVU08DxlTnJhzSD/yoE3kgJVjWG/vIpTSHAwBhNVfj1TCz30sRu6MriOGk9zz
 ibL0cXxUopU8tuNVDv+KXZ349tzx0k2Ffb+1MfGNohfQ9TaTZjTyxz3OkrMgqMYsD44A
 /ZUg==
X-Gm-Message-State: AOAM532PkPTvfcimG7qvRNo/a9J7hAe8D1HIZrNYrvyOeNjC2vsoSgji
 wIM/W1My739tHxEXCAOPf6QWdAYsYe0=
X-Google-Smtp-Source: ABdhPJyIX7N4OVLmDuqSd1o3NqhKPCjEPkh1tsyvvmZE1souNot1f5et9zSzD6/GX5UpZap1byFW5g==
X-Received: by 2002:a63:5a51:: with SMTP id k17mr13045506pgm.129.1643066041248; 
 Mon, 24 Jan 2022 15:14:01 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id f15sm11965981pfn.19.2022.01.24.15.13.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jan 2022 15:14:00 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] hw/misc/macio/cuda: Simplify using the ldst API
Date: Tue, 25 Jan 2022 00:13:55 +0100
Message-Id: <20220124231355.48210-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

This code is easier to review using the load/store API.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/macio/cuda.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index e917a6a095..f1186671bf 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -36,6 +36,7 @@
 #include "sysemu/runstate.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
+#include "qemu/bswap.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
@@ -345,10 +346,7 @@ static bool cuda_cmd_get_time(CUDAState *s,
 
     ti = s->tick_offset + (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
                            / NANOSECONDS_PER_SECOND);
-    out_data[0] = ti >> 24;
-    out_data[1] = ti >> 16;
-    out_data[2] = ti >> 8;
-    out_data[3] = ti;
+    stl_be_p(out_data, ti);
     *out_len = 4;
     return true;
 }
@@ -363,8 +361,7 @@ static bool cuda_cmd_set_time(CUDAState *s,
         return false;
     }
 
-    ti = (((uint32_t)in_data[0]) << 24) + (((uint32_t)in_data[1]) << 16)
-         + (((uint32_t)in_data[2]) << 8) + in_data[3];
+    ti = ldl_be_p(in_data);
     s->tick_offset = ti - (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)
                            / NANOSECONDS_PER_SECOND);
     return true;
-- 
2.34.1


