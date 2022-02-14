Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF034B5A3F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 19:54:57 +0100 (CET)
Received: from localhost ([::1]:36586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgUz-0002U8-0k
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 13:54:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg9v-0000H6-FY
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:33:13 -0500
Received: from [2607:f8b0:4864:20::102a] (port=53968
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg9t-0002dd-AC
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:33:10 -0500
Received: by mail-pj1-x102a.google.com with SMTP id qe15so15383137pjb.3
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 10:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ACXjZ42irWmc9J5XdgnnEwe1NZp3Dgve5RNkDpLdHCY=;
 b=PblDwE3slQoeiz5HfWqRRYWk3nCLJnhFYNUYJAA7L/vVA/gsGrfpRh29LuDFZgKu7Y
 F5gy1rAUxWWu9mFPixEP4jlNfVpkBnkN44FM5dSHsmHtX2rUQVkV/ZAgpAgWYHOcaIn0
 +/4FSFGgdNvyhVy//tZd0xISD1Q074u54Dl6YcISjl0Kv2MgH1K5yuuIjrBk0Xii0Ep0
 j6TIb7W3066bbbI/v59n6YKmpjkdUw3u7D5BWZTjBLeVE1xMIt3G1vScNWXpR/RhEyTw
 ftp+mOWhZohMuLJnRNK0v48I83iQFDHHsZkvIx9kh4ElJULT0vmWT9ukaFaF+lOqOJRL
 ZUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ACXjZ42irWmc9J5XdgnnEwe1NZp3Dgve5RNkDpLdHCY=;
 b=jEYdR6D59zMZtHEPQAEAHTzv6wifNnWbrUHP0bBnpjsewLkqOVhkq1ao/6+HRN0Mp3
 51ill9uId7zJ33lWGl4WUFeHpJOAKL9+TVUwPnSSIRk/ORRmGi3VL3doV5e00U/mwkYO
 L3P9CcS8Rge429W58AL4aRGvS6lG8g73FlLMyiTvRFMrQsyysEJzM24iuO5EK5NZH3Kc
 wESokvq6cKajscVr35xx8D2fTaaHBRIqnZQQwK7TrjBY0Kk8Pe+iWch3lej0X7HKDeAN
 8ntC4l+Nn5cTdiEXWkOgQ1vyF/cEyf4isOJkF0AOr4IpNP2Rl9sDMX9NO3qalYdmIeZl
 AdqA==
X-Gm-Message-State: AOAM533HO40mpowAA8kTfQYeSONaBjzzbRmW3R669J+IhVPAOTi5dMXF
 drszT8a4MviketZRn0dmDE2t/ri/ErE=
X-Google-Smtp-Source: ABdhPJwYLNjxadYakAQl2S0+FoTRZbETouC9TKq4SyAeJGDsf+jvGqNB0qwcUEkIDsHuN1WCE86D8Q==
X-Received: by 2002:a17:902:f712:: with SMTP id
 h18mr204319plo.24.1644863578419; 
 Mon, 14 Feb 2022 10:32:58 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id a3sm14413129pjq.43.2022.02.14.10.32.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:32:58 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 08/14] Hexagon (target/hexagon) convert to
 OBJECT_DECLARE_TYPE
Date: Mon, 14 Feb 2022 19:31:38 +0100
Message-Id: <20220214183144.27402-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214183144.27402-1-f4bug@amsat.org>
References: <20220214183144.27402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220211033034.21107-1-tsimpson@quicinc.com>
[PMD: Add missing "qom/object.h" include]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hexagon/cpu.h | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 58a0d3870b..096aa2deb6 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -1,5 +1,5 @@
 /*
- *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *  Copyright(c) 2019-2022 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
@@ -26,6 +26,7 @@ typedef struct CPUHexagonState CPUHexagonState;
 #include "exec/cpu-defs.h"
 #include "hex_regs.h"
 #include "mmvec/mmvec.h"
+#include "qom/object.h"
 
 #define NUM_PREGS 4
 #define TOTAL_PER_THREAD_REGS 64
@@ -131,12 +132,7 @@ struct CPUHexagonState {
     VTCMStoreLog vtcm_log;
 };
 
-#define HEXAGON_CPU_CLASS(klass) \
-    OBJECT_CLASS_CHECK(HexagonCPUClass, (klass), TYPE_HEXAGON_CPU)
-#define HEXAGON_CPU(obj) \
-    OBJECT_CHECK(HexagonCPU, (obj), TYPE_HEXAGON_CPU)
-#define HEXAGON_CPU_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(HexagonCPUClass, (obj), TYPE_HEXAGON_CPU)
+OBJECT_DECLARE_TYPE(HexagonCPU, HexagonCPUClass, HEXAGON_CPU)
 
 typedef struct HexagonCPUClass {
     /*< private >*/
-- 
2.34.1


