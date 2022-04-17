Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A553F504949
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:23:01 +0200 (CEST)
Received: from localhost ([::1]:52348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAU8-0002sj-Pd
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fg-0000UY-0Q
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:52 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fa-0001pu-FL
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:48 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 i24-20020a17090adc1800b001cd5529465aso10876021pjv.0
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3gF4qhvQ8l6NXETH9Jek4ATx0dQ6TPfjnPR0XqtXWlI=;
 b=OaoH8/FvahyfzZLtvecbvCNXei4VQrCYSxynSkVsh/KU+LVUc1sk/41LhNYur30c3g
 tW35bGadQPMaJpHn7geVQUNFAi10UMoNnhGBHdkVrlt+2JrcNModzxccx1E8hiSj5xDr
 Ir1f35zshB0w83bMBJNpoINcxsabUvlJT5o2i0RKmQoOgBD626shaS+p7zZxzxO+Yshf
 Hk97kPifUBHDaIgAQBZEP9dIvqNzlEabpBvM2hr/ifOtnRFfIruDCI/4fYuISHqEMQLb
 U7G/25NtxRJllu1dgyOHzpYuJsAzWIULC36BVlJyxMXpiengPK2aUltoDezZO+Rat2Da
 4bgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3gF4qhvQ8l6NXETH9Jek4ATx0dQ6TPfjnPR0XqtXWlI=;
 b=p2knIRwgI1CC3FDRXz4GTq9q2jizP5WErh9g4fu5iq4mZb65M4cyNc7+XfQKWf0OWI
 OSE+YNzieX25aZ33IoxJY0UWcPyRMIaHJzHpRNW0kf91TzXu39MoPmrDJBnCIIyFzW9w
 0ILK9LO47WDAmquMIILmPEXmte6tmx3/WuR3emTI8tRhzbHuUzZD/Qos1ypKyZCz5cwh
 DU+VCTeTLShf1faIaGp8rglUk2EyS8xE1WGks0RRaRXyp0QZtUXQ0rzeVY45eQNJTOa9
 P9JOufZUi1n+6oz23o8Bi6O9ZqXShfQqG8/djfFu85lkvnoY9ALxekCh4Jqix/ed97d9
 EciA==
X-Gm-Message-State: AOAM5330IzdcSS9BnpSKPaFXEcYKs4wcxA4NMbHupMdvmJpaPdO2yTfN
 JlSyWOZb++ImEmi0HhP2/zjdK5QN0tYkOA==
X-Google-Smtp-Source: ABdhPJyE8DTTOnpS9UCGQ1xF1VDamJ4/gWR9EcXyHAnlFq/x64aMuxJ6MGXLrIWBEtwS4Ftk7cvebg==
X-Received: by 2002:a17:90a:4308:b0:1cb:b996:1dc with SMTP id
 q8-20020a17090a430800b001cbb99601dcmr9227848pjg.224.1650220244481; 
 Sun, 17 Apr 2022 11:30:44 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/39] bsd-user: Use qemu_set_log_filename_flags
Date: Sun, 17 Apr 2022 11:30:08 -0700
Message-Id: <20220417183019.755276-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Perform all logfile setup in one step.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index ed26fc5acb..aa13eae7f3 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -405,16 +405,16 @@ int main(int argc, char **argv)
     }
 
     /* init debug */
-    qemu_set_log_filename(log_file, &error_fatal);
-    if (log_mask) {
-        int mask;
-
-        mask = qemu_str_to_log_mask(log_mask);
-        if (!mask) {
-            qemu_print_log_usage(stdout);
-            exit(1);
+    {
+        int mask = 0;
+        if (log_mask) {
+            mask = qemu_str_to_log_mask(log_mask);
+            if (!mask) {
+                qemu_print_log_usage(stdout);
+                exit(1);
+            }
         }
-        qemu_set_log(mask, &error_fatal);
+        qemu_set_log_filename_flags(log_file, mask, &error_fatal);
     }
 
     if (optind >= argc) {
-- 
2.25.1


