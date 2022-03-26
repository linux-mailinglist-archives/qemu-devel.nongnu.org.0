Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63314E8134
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:56:09 +0100 (CET)
Received: from localhost ([::1]:34908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6tk-0004HS-My
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:56:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6UE-0002wP-7R
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:29:46 -0400
Received: from [2607:f8b0:4864:20::232] (port=46670
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6UC-0005z6-RL
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:29:45 -0400
Received: by mail-oi1-x232.google.com with SMTP id b188so11067759oia.13
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=go+GYnXGkWPQcv2j/hc2xPgBqJ1JmT544mDHf3z2u08=;
 b=CCv+fh7ZkpClVw+E0S4VVEZMtdFZr3mW+CJPCh2g7x3iI3TrxX46577jrrNa5W1qEp
 QVhZt1i07+mC4iCBRO9Wg27AFmel5m32WfR6Rf8jnQy/blT0bOgU9hfkhS8KxmP2pnr3
 G8VhwPFrtCHAvWwQ3nirKhe3GLd3Epi0tAC+eUBX6vpSiYK5JU3yCYz8r5cKxD3/B1b9
 Ky8mJ0qmwUdA2hOk2Ty/SsfscCoZQB48//8/BCAAyXv+gdapB8rlqYM+HZfR5N15M6US
 SmmC/HTkkQup3Hbux0E5vxrZu0W1oC/tuAJpe9DR4Y1x4557Bx/iLcnj3L0by+Ow0Ff0
 MdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=go+GYnXGkWPQcv2j/hc2xPgBqJ1JmT544mDHf3z2u08=;
 b=yfX8rYkFLH6Jwogh2lOf7McKsYToXWFR75/zcREkriD5ykHFpChPCBu/QWiADvg3qc
 +hkkSvPLKGiliatfsxy/Kkk7EXdx4fRDt5spfxPcXll1GCufp+QvrsoQ8UCMauXSf+dx
 vTBm5/Yj/M/gXmaw3PjUNNpc9cjiaxAfeYNlN1nanZZrSOjRABg4zXZqwmH5IoooOsQN
 lGuIKo3t0c4eDS112SetscgccWt4OetLVqA47Ub9VL6XwtbkOoMRzo9fsuFAT2pubYJR
 5KLxZyfGWKBUH+E6LSj1+gQBa+rI5i2v+HlABfjv3gM99KNQfN4vcXmiCBNDHGlt1+sX
 exmw==
X-Gm-Message-State: AOAM5338BDzayLJzjrnFI2oTjb/EMADfpQb6QZZwVfQMk8OCggs9Dj1r
 nbUMpe5Su4xc27ouOV0zImWSRaM6cVAHcrp2
X-Google-Smtp-Source: ABdhPJxDnS9u6nlYfs5bIJ336eFOfcu16IG+UYrhrQYnvF6CZRvrLzm8AXO5C12jY++5dy3lQG6HIw==
X-Received: by 2002:a05:6808:11cd:b0:2d9:a01a:4bc6 with SMTP id
 p13-20020a05680811cd00b002d9a01a4bc6mr8176506oiv.237.1648301383855; 
 Sat, 26 Mar 2022 06:29:43 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 s24-20020a056808209800b002da3b9bf8e0sm4394509oiw.32.2022.03.26.06.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:29:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 36/39] util/log: Combine two logfile closes
Date: Sat, 26 Mar 2022 07:25:31 -0600
Message-Id: <20220326132534.543738-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Merge the close from the changed_name block with the close
from the !need_to_open_file block.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/util/log.c b/util/log.c
index 631856e231..21da961d8d 100644
--- a/util/log.c
+++ b/util/log.c
@@ -157,12 +157,6 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
         g_free(global_filename);
         global_filename = newname;
         filename = newname;
-
-        if (logfile) {
-            qatomic_rcu_set(&global_file, NULL);
-            call_rcu(logfile, qemu_logfile_free, rcu);
-            logfile = NULL;
-        }
     } else {
         filename = global_filename;
     }
@@ -182,11 +176,12 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
     daemonized = is_daemonized();
     need_to_open_file = log_flags && (!daemonized || filename);
 
-    if (logfile && !need_to_open_file) {
+    if (logfile && (!need_to_open_file || changed_name)) {
         qatomic_rcu_set(&global_file, NULL);
         call_rcu(logfile, qemu_logfile_free, rcu);
-        return true;
+        logfile = NULL;
     }
+
     if (!logfile && need_to_open_file) {
         FILE *fd;
 
-- 
2.25.1


