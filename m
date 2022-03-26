Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343874E8156
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:09:17 +0100 (CET)
Received: from localhost ([::1]:39950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY76S-0001qs-9p
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:09:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Ra-0007sH-8a
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:27:02 -0400
Received: from [2607:f8b0:4864:20::235] (port=39737
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6RS-0005YR-Qo
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:56 -0400
Received: by mail-oi1-x235.google.com with SMTP id j83so11086126oih.6
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jzU0lMIGHRXlXJG9JfTKmdopHzJcZP5ngZbLDRCyMfA=;
 b=e4AW8isiiagHmsxuBHXQJRphddATA9qjirymc9621qEcxML4m7wDMqI6yMQKusrrsf
 x/1yHYF+qoMDmi7lX6aaEL92DwTo+CHIGt5aBAyJl3QFu1+huCH6jYsBAUZvXa42til1
 DAxD81Ame2GyAjN9v+RTjXUIPEAyXqBsoy3rWV3R1QUVfAGLa90XTr0GuDTNLS0hXKZK
 /6ehd5IUc9364xHEUoK61JA2JsLA0VmgPEc1VK1xY60TtB3DQqp6vRi40G4Uw32f1xZQ
 gmDHpE5SuNNy4vzaJXH1mD8F/RFPntPV9HaJDYCPs6LdTsi7ZvM4crwI8oEzcu+T5HTv
 13iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jzU0lMIGHRXlXJG9JfTKmdopHzJcZP5ngZbLDRCyMfA=;
 b=Cfny2DwTfG0O1GVHGo7r+SPE2N+j7FTPTEqyyUHQG0TaOdBfaJRmWQmoXMymDbj5Q0
 /tTkvfosMSGamaNHREp7ngmvJm74spmOmJ009jdSnS2oq8wZESp0kjM0Iy6xq9oFR6b+
 kQrjA+N+a+eTdVwZMkyFgtfz6PS+k/3XBb+76t1VI7hDiZxX4qRTMibUQ8L1MZxQtNMU
 PH+2wAdSo6dwxfTVMxMIZLufkg/fl1aqEgt/609icWbex4dgeHYjKdP9yPoXaj1DmAxL
 LRgsQwsifomvnojrfntjE45nrLsLaodKrL64kqmuPbM5V3o50nf2idvfSZt2IJhFW5Eq
 JomA==
X-Gm-Message-State: AOAM530RrT1xDXyEqO6ACEZ75EGcGcRiD/AgggDYHe/xMuee64AkJk0O
 CPi9l1F84r/y33H1Ai/RWt5ImVnre5tidS9K
X-Google-Smtp-Source: ABdhPJxSDHAgXRq/uUwK+10T6z6awHXzeUBZttKgYPUaD4s7iZZIhwNcjgxzoZ4UnXf31o71J4k/9w==
X-Received: by 2002:aca:1817:0:b0:2ec:f542:c96c with SMTP id
 h23-20020aca1817000000b002ecf542c96cmr8117276oih.36.1648301196058; 
 Sat, 26 Mar 2022 06:26:36 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/39] softmmu: Use qemu_set_log_filename_flags
Date: Sat, 26 Mar 2022 07:25:25 -0600
Message-Id: <20220326132534.543738-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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

Perform all logfile setup at startup in one step.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/vl.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index a74d0a44a2..65c02963b6 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2559,19 +2559,16 @@ static void qemu_process_early_options(void)
 #endif
 
     /* Open the logfile at this point and set the log mask if necessary.  */
-    if (log_file) {
-        qemu_set_log_filename(log_file, &error_fatal);
-    }
-    if (log_mask) {
-        int mask;
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
-    } else {
-        qemu_set_log(0, &error_fatal);
+        qemu_set_log_filename_flags(log_file, mask, &error_fatal);
     }
 
     qemu_add_default_firmwarepath();
-- 
2.25.1


