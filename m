Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2174621B6
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 21:08:58 +0100 (CET)
Received: from localhost ([::1]:42710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrmxM-0006Iz-Pq
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 15:08:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmu0-0003Ov-3F
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 15:05:28 -0500
Received: from [2a00:1450:4864:20::32d] (port=55988
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmtq-0008Ce-Ht
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 15:05:27 -0500
Received: by mail-wm1-x32d.google.com with SMTP id p18so15622601wmq.5
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 12:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UnmMe2XVlfepy+SM6SWY8AYsfzJiHx81z75dkAVJ9Po=;
 b=hVFWrzAG6sPmitcIJZiRpD4zOIr/efmL+IgPmctw3dF6NV+XjHw56FsW/6b+ZmfcbC
 1aqoyiikKJTM9BHIEsUFQcueUepxNeWWwzuQT5WGaiDJNoZL0HYIq/LJaD2Y03e5/k63
 csGbmSZ8q86yYTswSviFjcg9VGDG3VnDU43bB38zdY1Kp0AIWj2mLBwAw+AXSMhaEG4P
 55zzkgxedoJ/AOGgpznc2fdPmYSg2Ww9HDXEfi7lPDsN6LQEdVbJg+wB+EKNRIjoQEO1
 I7VpIWJjzG19s7wrd4GGyJRU0kN6mf/P2msta0jHcYx4kPrs3P1L7uYClYnsbWxjIlq0
 9s7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UnmMe2XVlfepy+SM6SWY8AYsfzJiHx81z75dkAVJ9Po=;
 b=xWkjjd23S6aspXGzCtgASspb5fC6Jl19jIWz4ZaRANvdP2lfAgg7bCeEgXNYfJcdPG
 YrZ2nvZVJ9Jr8eUIINKwbuGwfFWh/GiwC41KWE1xRKlWHrye1bkzrB4SWRQ1DpiBhnKO
 cE8wD+gRydW8Gesu2WKAxKoGJiB5PyAIzczh8uVc02xAMDoyeOiNBH8CitwIwxoh4IKh
 f2XM7WYw1NC0jfjvrqAsSaWKEa73JKzzDBdTt9JAa8vC8YswDfKOgN+ZQ5BPD30nP9rs
 KPtzWJzRKN6i3h4IApHznwC8nP5ali395jWdXzutIaFffqzU74lcAeGyIq+5xVhgSmbP
 fYtw==
X-Gm-Message-State: AOAM530oqjYGqA74+fNgqzNq7tc/ihB6TwA9spactlY4LWJI5/jGn5Yb
 uiC8KtjZrwBemdrCvbBtM0v/hg==
X-Google-Smtp-Source: ABdhPJzkhmPjCushDNseY3lcnz+A4WcsEb7BxZmd2xA3VOJ9dr8EJZkGnw5ItFXFPMyGwJ6MH8uYBw==
X-Received: by 2002:a1c:7f56:: with SMTP id a83mr225953wmd.32.1638216314846;
 Mon, 29 Nov 2021 12:05:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id v15sm14678863wro.35.2021.11.29.12.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 12:05:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.0 2/4] target/hexagon/cpu.h: don't include qemu-common.h
Date: Mon, 29 Nov 2021 20:05:08 +0000
Message-Id: <20211129200510.1233037-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129200510.1233037-1-peter.maydell@linaro.org>
References: <20211129200510.1233037-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu-common.h header is not supposed to be included from any
other header files, only from .c files (as documented in a comment at
the start of it).

Move the include to linux-user/hexagon/cpu_loop.c, which needs it for
the declaration of cpu_exec_step_atomic().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/hexagon/cpu.h          | 1 -
 linux-user/hexagon/cpu_loop.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index de121d950f2..58a0d3870bb 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -23,7 +23,6 @@ typedef struct CPUHexagonState CPUHexagonState;
 
 #include "fpu/softfloat-types.h"
 
-#include "qemu-common.h"
 #include "exec/cpu-defs.h"
 #include "hex_regs.h"
 #include "mmvec/mmvec.h"
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index 6b24cbaba93..e47f8348d56 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu-common.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
-- 
2.25.1


