Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95693017CC
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:54:26 +0100 (CET)
Received: from localhost ([::1]:33646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3O3E-0000ma-5u
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3Nzc-0005FE-15
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:40 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3NzU-0008FZ-1T
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:39 -0500
Received: by mail-pj1-x102b.google.com with SMTP id kx7so5856091pjb.2
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W7GA19BzjsaVlb4cNdmGQMkPm1CutshKMo07MTWHTyQ=;
 b=Wy4HJVZ8A5QabipftgesTjaJoNOAdfuD7fGQdPqKg0pSu9Y75W6mtFQ+984z3DXHlA
 CN0gidKTNwVn/5zxgtrzEbueZgWEnJwHke0WCRjhfmpW1H+xM0zK1OywsLw6IZKxv9zA
 Hj1bhca/EsXYR4BZg8NxATlq4bZss6ecv9dP4BPxl0mCVQRmeocFUGm1BD6O2alcD2WG
 zr1pWKjWji67fkCH4kk4Y238O1hu4hwMmFLFQB7w5U5t9PiatV9ykL67BsumWJXn6eAM
 PHAqTceOCoQAyjjeK/NOrMz/pbeIfN8yXaoNSHwYxSR6q1i/bpn15eeC3lq7pn24Ifbw
 axuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W7GA19BzjsaVlb4cNdmGQMkPm1CutshKMo07MTWHTyQ=;
 b=SY6gODMERAlnTlz7uL56plj8oSdK+W73NiDYzG4PPFTAlSY0hAgfZWfqQXjM3tmuuf
 cKdNOTweryJxnbyq66fpqyeywwtL8N60O0ax5YT2y0j/hkjDvo4soXbOuUhr0EOT4g7Q
 foCZON16bYLtU7sseQT+y4DWXpCZMX4Xt+J94ME1H/6E1s4AGlSbHLjBoDqUcP3CSXQn
 GAomQD5451Y2ZBteVRqOGKvPmrWA81hUaCSHaUecdRvtACt0Q+l1zbw+AYIwVzQnnzGC
 bNn9NtLBid06bC773w66Qhjgk/IFLK9AFC+l5zecNb3LAxklL50Qi3HNXM4yWt8zx3IT
 Al9Q==
X-Gm-Message-State: AOAM533AQACCVKYDrlsW7tJBvwCL2RsgXX9oLDZPtMWSJxnsi0jDQiu7
 ZQjvEpyQ7yaNLlnOKy0t94N7Oxs2f8j5Rw==
X-Google-Smtp-Source: ABdhPJxl5JlSIrzt71lIAXDnKbylnJcLBEHJO3o1mvfubdBeQpaksjG8usBEQsOj9+mQObJKTv7L/A==
X-Received: by 2002:a17:90a:17a5:: with SMTP id
 q34mr6039866pja.47.1611427830567; 
 Sat, 23 Jan 2021 10:50:30 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id j19sm5018614pfn.14.2021.01.23.10.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 10:50:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/10] tcg: Increase the static number of temporaries
Date: Sat, 23 Jan 2021 08:50:14 -1000
Message-Id: <20210123185020.1766324-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123185020.1766324-1-richard.henderson@linaro.org>
References: <20210123185020.1766324-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This isn't a total or permanent solution to the problem of running
out of temporaries, but it puts off the issue for a bit.

Make the assert in tcg_temp_alloc unconditional.  If we do run out
of temps, this can fail much later as a weird SIGSEGV, due to the
buffer overrun of the temp array.

Remove the inlines from tcg_temp_alloc and tcg_global_alloc.

Buglink: https://bugs.launchpad.net/bugs/1912065
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 2 +-
 tcg/tcg.c         | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index c5a9d65d5f..0187de1352 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -275,7 +275,7 @@ typedef struct TCGPool {
 
 #define TCG_POOL_CHUNK_SIZE 32768
 
-#define TCG_MAX_TEMPS 512
+#define TCG_MAX_TEMPS 1024
 #define TCG_MAX_INSNS 512
 
 /* when the size of the arguments of a called function is smaller than
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8f8badb61c..5110f6f39c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1204,14 +1204,14 @@ void tcg_func_start(TCGContext *s)
     QSIMPLEQ_INIT(&s->labels);
 }
 
-static inline TCGTemp *tcg_temp_alloc(TCGContext *s)
+static TCGTemp *tcg_temp_alloc(TCGContext *s)
 {
     int n = s->nb_temps++;
-    tcg_debug_assert(n < TCG_MAX_TEMPS);
+    g_assert(n < TCG_MAX_TEMPS);
     return memset(&s->temps[n], 0, sizeof(TCGTemp));
 }
 
-static inline TCGTemp *tcg_global_alloc(TCGContext *s)
+static TCGTemp *tcg_global_alloc(TCGContext *s)
 {
     TCGTemp *ts;
 
-- 
2.25.1


