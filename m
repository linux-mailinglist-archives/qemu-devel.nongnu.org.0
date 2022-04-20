Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0F0508F96
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:39:20 +0200 (CEST)
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFEV-0003Qy-N7
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj8-0006Ko-1K
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:54 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:34771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj6-0001Mr-FX
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:53 -0400
Received: by mail-pg1-x52f.google.com with SMTP id t4so2342787pgc.1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/s0wl9WGt9PyoXN9DcmhdMDO6XLUI9CxJxFlhTlZYAE=;
 b=sOZrUBeqcmKoLsRnM3X8fvRQP7TiplfcXZ5+qZ+V/7QX3LAu6pQtDRepwsoOG3Zjuz
 iiefIFsUD2vtOY2Z4hVJsUQEpE6kjN86pPJFlGQabWs6F7hVmhinZbmLZ4mav3Qqda+D
 roBl5aVQgmWNMWxh0ZOMXBjghRVV/K5ihSY0l1lEpNHKpBDXPHv/7Q2wWXfyA3+ET1nc
 IT7BeRPcA3Omb/rWl501tfq3JZKAfcbbxIrcX9nYc8jQ/w2S4wsitF1JlrT0tI05o0JM
 3s3KHzlhfWiPxysvf9CNjSPw8XKueNWS9KAXnwcxBjuhSu3ReYg+6O0US+kJANT+hdU7
 8+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/s0wl9WGt9PyoXN9DcmhdMDO6XLUI9CxJxFlhTlZYAE=;
 b=c1ng0Pe2zVCuPHx+mowDolMsYbT5OTCxBMa5BUokyrHcVwoH5y13Hs3EMtRMcT8092
 HjUkJVELGvbeCBy7pEWG43jDLEcjqnTSD1GNdx8ao3iI2iuuyGO6Vs2CmOPfmxnMh7HJ
 jJRQ8PRO9k6uxfvcohaC+knqexV893pzXantCxinP52tjriq+4UMLZPSljauJBfRo3np
 UXzkaVZwDMXzCbQqSNK96txk3FStjJUtaA4N6hQdziDbGYadtVcZxzG+Ld9CVMR5h3EX
 hHvTfPugZBM3UcxJGDOqqWnkSGVr9k39U5f12LxtFdcQ+SIq8XdG/VXNvtRhQwAEIyyv
 XlYQ==
X-Gm-Message-State: AOAM531mzau4U8nYlQ56AdfP54tvwKyd+plkN6Zmg0a2WUi9qXLf60tb
 NlLiwR46HGehRnt/b2ylbsM3V3K7VGMvkg==
X-Google-Smtp-Source: ABdhPJxJh4HqdO3quAcoIxOGyAbaWfLoiWM5yXitFsanPFHq0mBmAxrtvRa9zJY/bCt8iELsvtQWgg==
X-Received: by 2002:a63:6fc4:0:b0:393:9567:16dc with SMTP id
 k187-20020a636fc4000000b00393956716dcmr20043211pgc.593.1650478010992; 
 Wed, 20 Apr 2022 11:06:50 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/39] softmmu: Use qemu_set_log_filename_flags
Date: Wed, 20 Apr 2022 11:06:09 -0700
Message-Id: <20220420180618.1183855-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Perform all logfile setup at startup in one step.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-31-richard.henderson@linaro.org>
---
 softmmu/vl.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index fe9de2f896..f679d48d74 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2560,19 +2560,16 @@ static void qemu_process_early_options(void)
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
2.34.1


