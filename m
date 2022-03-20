Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA434E1D46
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:58:34 +0100 (CET)
Received: from localhost ([::1]:56188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzp3-0000al-De
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:58:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz69-0000UB-W2
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:11 -0400
Received: from [2607:f8b0:4864:20::529] (port=45992
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz68-0003WY-Dg
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:09 -0400
Received: by mail-pg1-x529.google.com with SMTP id o13so8738411pgc.12
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x13T9/TUVJR5WOXUIsAjX0bOPDpTDGONzFnTqPFV7QM=;
 b=N/rjaEk8feoQityhP/wli9aTjqe5JbWSn402XOk8mY5MeLJW4YLB23tM321QnAdC+K
 OpifwMWfYSSbexIszPRtvpyMxOuh8042aeUvHtgqfRZlIfMardfFvnRI3FqlS8Z64a47
 bkVC2IiFHGF51CHrQQoP/dcTETZcXYIRJkVIdBRJKYf/NAWgGTzVHj7hmA/E1mE8Hb2H
 k2nH6JWKCNGa7qPfz5THtVMxjluxL567PhvuK8jn7rdMw1z5ozweYBHUL5wdaA2Zo5oR
 13aHM6UdGRDEr0eiZa7/thTsTA8ndeXKJqL70hjNXDKV4dsmXS1j0TIq1vlI1VUYMojP
 4gIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x13T9/TUVJR5WOXUIsAjX0bOPDpTDGONzFnTqPFV7QM=;
 b=QcMw9LpGoeZsX3jsvDNjtQINAGAQEdwlShQZN1xD6BHTdx32+4JQS14lNW0PFU+ckA
 uXdP/iIDLR0Y4RIY9cvO3YPAcNlfe4fNUa8A8M/MOowuc9QG/1WzeaXv2bKJ2l+Ns91K
 Pi3qlzubGm6pdKMdpNtf4tx7TloLbHqo4fPM2k8ayZIiQX9QKZ2d6lEiLJieB1M/wEkc
 2+BEY+qA/DEqoqK7lsMx9MldS70RHEsl8N30ISTKB41YZKBzb+wnsyEJDShLuPBWjTqj
 vrrLDlv8aXmw8kn/WQwfG6bxIqQCbBYlhbTTXRRSmmWp2Fmxg6J0ogfsRGdetKme38Cm
 b4IQ==
X-Gm-Message-State: AOAM530IIayzEpsNeQhiVaMpZEcSWMBzcf0iZvLJSApAJa4v9aDmpABh
 3CNH6QRWpu5kW7QPry4M2Eyx+JwOq9cOZw==
X-Google-Smtp-Source: ABdhPJyYMYqESflmF/wBkpDCpxb6PeDHnTmTk6WI5EZcLBRWjTTUQbszfCv7LklMId58nwhg9m4/2A==
X-Received: by 2002:a63:ad4d:0:b0:378:4b82:b881 with SMTP id
 y13-20020a63ad4d000000b003784b82b881mr15525869pgo.282.1647796327064; 
 Sun, 20 Mar 2022 10:12:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:12:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 33/36] util/log: Combine two logfile closes
Date: Sun, 20 Mar 2022 10:11:32 -0700
Message-Id: <20220320171135.2704502-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
index f1f6d09c90..596de0050f 100644
--- a/util/log.c
+++ b/util/log.c
@@ -166,12 +166,6 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
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
@@ -191,11 +185,12 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
     daemonized = is_daemonized();
     need_to_open_file = log_flags && (!daemonized || filename);
 
-    if (logfile && !need_to_open_file) {
+    if (logfile && (!need_to_open_file || changed_name)) {
         qatomic_rcu_set(&global_file, NULL);
         call_rcu(logfile, qemu_logfile_free, rcu);
-        return;
+        logfile = NULL;
     }
+
     if (!logfile && need_to_open_file) {
         FILE *fd;
 
-- 
2.25.1


