Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F285150493E
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:15:56 +0200 (CEST)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngANH-0005P1-PM
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fl-0000Wm-Gy
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:58 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fd-0001q7-Hv
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:51 -0400
Received: by mail-pl1-x635.google.com with SMTP id b7so1134715plh.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/sC23igQqhCyD6K5YQ5nhgAj3F77O3jvIE8pVCy+RrM=;
 b=BIPEMdhf4V0OFc3TuYoEeMoL+EiL0vZnS2LAmDBDdKLzjOzzfwFfvqpQG25HLakuhM
 sxZSnNaf1Vhn7RzNJnF//l6wmSf/P7NCLZqDlqTxgt+eKpuTyZzZ/0kLvGRs/IywrbWd
 XfJseRol8jahQRYJ+BSJiF4Li8nkrJusWPYkzDD7dDVCqAaeqKFhq/Ne/0wDggZeZy6E
 Vx4a3X9zFUL61MIM9UZm8WfQHfZjahfzCWjVPBEiCGMYiFvLGRYI8WBnA4nUrAnSkfh0
 DTi6Dk6WfB82FMP9nLkaR9TuOaogUzqd9qdJBMOXPk6vmxrzcM45pqFYj8gEsMYru2Nr
 Qhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/sC23igQqhCyD6K5YQ5nhgAj3F77O3jvIE8pVCy+RrM=;
 b=ko4RTPvq/e2SdqwgEe2FXVgREYpi7E6Yx0IYAxlDxkoqoImB9gPzPBoe9MeCUKV4NZ
 22/rbahymKlnlZTzUHmCPK+qlrH3r0jJG0hxw/2Vg+bJywRp3ycoM2FFTMU7B94WheNu
 OJez9KJYvekZ0B2A1w3TGDY87NLBaJZ10ifCUrXq20Aj5dtdPLu28YgStJtwDBYX9g44
 VP0hVnAEQRlGrRqrRGUgvxWhY2YKjCydj8zfojqbF5OlM5XS4LInmMm8B1Zw8qIEWYdE
 v4dkDqnTuRw1gPXPuwhc7WkRIc3R0yrl4sY09XScMzbSdmMDH/adYoACw2IafB9+K0et
 9K6Q==
X-Gm-Message-State: AOAM531Ub6tuhfjS1lmsVs3zUx8pxpl+pFclxAid01Ox7lW9yR2hA6OU
 SmVTCv2+jKBsYp5Nb0SJ7hs5T1zONkJVZQ==
X-Google-Smtp-Source: ABdhPJweHXRO+rbD2vabWQQANlfRgRk3Qd2hvJnpG5Me+tt1FPe5XbL3DcRKM0p4OXIaDzTTrrGieg==
X-Received: by 2002:a17:902:f70c:b0:14e:f1a4:d894 with SMTP id
 h12-20020a170902f70c00b0014ef1a4d894mr7779260plo.65.1650220245978; 
 Sun, 17 Apr 2022 11:30:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/39] softmmu: Use qemu_set_log_filename_flags
Date: Sun, 17 Apr 2022 11:30:10 -0700
Message-Id: <20220417183019.755276-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Perform all logfile setup at startup in one step.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


