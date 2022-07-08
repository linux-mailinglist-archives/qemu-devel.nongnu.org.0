Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6B156BD0F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:52:15 +0200 (CEST)
Received: from localhost ([::1]:58222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qH8-0004EX-OK
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCG-0003v4-TS
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:13 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:34613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCF-0002LY-Ce
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:12 -0400
Received: by mail-pf1-x430.google.com with SMTP id 70so8743622pfx.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iiRXuoRm0+6hZcCT7CVhc/aX8fiaQgpUOM3IjX/kYqE=;
 b=EXmm3to53nsWS9DEDIkMCrgn8NrlmwgZC0zqNF0sq2jMvUgM86rlQVlpm+BOjLiMig
 zI73swUSdOvgPIT2s6enl1Vqs85aLOgSY58HzaHM0QivPslefXfMr1f38LYGIUHIVwtk
 JMO0rEA8IlkAymc8l1yRM/WanxNeIp2isRHADdMWKIv57E3iiDgGeuWdYwrcDo2qWM8h
 kMHCBnZBiXLG4ZWyfQ7Nfqf3zXK3OWt2uNRE2VQSG7gQjNWz4XJgyxCDF5ajolKLc1G4
 F8iaXDUNsu2MvglKfZJKq6ciNbQyvLvbAQ7PWFmLrmdLakH4CdzjX9/6ix+/5hJo1IEk
 wm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iiRXuoRm0+6hZcCT7CVhc/aX8fiaQgpUOM3IjX/kYqE=;
 b=vIurX2nZMKyB5zgt1DBTqiIz/Bd95zPoJmHn3RHTVOVufeJ6h2xJCvSvSTRcJYDwh5
 EoSJuqVKXm54foAfLJDFTqt+jXCmUPD/iKAVWqdjRCVvGDn8QdyUi8fs/ADor97/ngI+
 /oThj58UlUfZJiHOeXC3LVQflcGDyCJcRlbvUGAY1fO92Taf+hUHPbZ/j3RrumkYU3p7
 mN1JT0hfuUIZpPCUM54S+m0tO7HClPcYgT+EmDzpWxwPrZDAMGqGbahqFSKBQpmWSadq
 UIK4kl03HABa2uzGzlvuahRiMtlbJhDSareiH0lEDQHmSHVjFkZM79kTK0E9sL0qKqZR
 /4XA==
X-Gm-Message-State: AJIora/m0GIP0660MFCMBMJyTW6VklrJVLB+VonmQUNAtc3yvmeo2ylA
 s+1Sp0gXZ4CrbUqpbNIhiRfOwXNMBpYASMtm
X-Google-Smtp-Source: AGRyM1vRq0YPcAc+6t0N3Eappi4kTgoYPE8pENcmvxwdkjIWfzASmXf4T2K6rp/6gkz8NlUaBQvkRA==
X-Received: by 2002:a63:481a:0:b0:411:7951:cbcd with SMTP id
 v26-20020a63481a000000b004117951cbcdmr3866584pga.66.1657295229649; 
 Fri, 08 Jul 2022 08:47:09 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:47:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RISU PATCH v4 01/29] Use bool for tracing variables
Date: Fri,  8 Jul 2022 21:16:32 +0530
Message-Id: <20220708154700.18682-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.h    | 3 ++-
 reginfo.c | 2 +-
 risu.c    | 8 ++++----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/risu.h b/risu.h
index 8d2d646..e2b4508 100644
--- a/risu.h
+++ b/risu.h
@@ -17,6 +17,7 @@
 #include <ucontext.h>
 #include <stdio.h>
 #include <getopt.h>
+#include <stdbool.h>
 
 /* Extra option processing for architectures */
 extern const struct option * const arch_long_opts;
@@ -96,7 +97,7 @@ int recv_and_compare_register_info(read_fn read_fn,
  * Should return 0 if it was a good match (ie end of test)
  * and 1 for a mismatch.
  */
-int report_match_status(int trace);
+int report_match_status(bool trace);
 
 /* Interface provided by CPU-specific code: */
 
diff --git a/reginfo.c b/reginfo.c
index dd42ae2..1b2a821 100644
--- a/reginfo.c
+++ b/reginfo.c
@@ -141,7 +141,7 @@ int recv_and_compare_register_info(read_fn read_fn,
  * Should return 0 if it was a good match (ie end of test)
  * and 1 for a mismatch.
  */
-int report_match_status(int trace)
+int report_match_status(bool trace)
 {
     int resp = 0;
     fprintf(stderr, "match status...\n");
diff --git a/risu.c b/risu.c
index 01525d2..79b1092 100644
--- a/risu.c
+++ b/risu.c
@@ -31,7 +31,7 @@
 void *memblock;
 
 int apprentice_fd, master_fd;
-int trace;
+bool trace;
 size_t signal_count;
 
 #ifdef HAVE_ZLIB
@@ -228,7 +228,7 @@ int master(void)
                     signal_count);
             return 0;
         } else {
-            return report_match_status(0);
+            return report_match_status(false);
         }
     }
     set_sigill_handler(&master_sigill);
@@ -250,7 +250,7 @@ int apprentice(void)
 #endif
         close(apprentice_fd);
         fprintf(stderr, "finished early after %zd checkpoints\n", signal_count);
-        return report_match_status(1);
+        return report_match_status(true);
     }
     set_sigill_handler(&apprentice_sigill);
     fprintf(stderr, "starting apprentice image at 0x%"PRIxPTR"\n",
@@ -344,7 +344,7 @@ int main(int argc, char **argv)
             break;
         case 't':
             trace_fn = optarg;
-            trace = 1;
+            trace = true;
             break;
         case 'h':
             hostname = optarg;
-- 
2.34.1


