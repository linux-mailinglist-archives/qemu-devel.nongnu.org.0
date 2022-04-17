Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37BF50494B
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:26:21 +0200 (CEST)
Received: from localhost ([::1]:58552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAXM-00070T-Mj
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fo-0000XR-9s
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:31:00 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fl-0001rE-8d
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:59 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o5-20020a17090ad20500b001ca8a1dc47aso15590480pju.1
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2csG3iv3TxQYzdj7Y6DVif/Sz3vBEyR+Zq5Uwd63c30=;
 b=AbtO+WAtorxlRfrpXZNSQkR05yR19iKi/JjzAeMdNujswmATyORAYLAEQrWzcP+ent
 g7xuxaCZZp7l5VmAggDjPqzimPN4GCCFJteUcP/c+DEoTGC/t5v+Rpp0Z/bzw0reNyPN
 t756333g0EVhl3nCA+6s7mE24wHJ4h4ibdfuZE/qsGuXVfBtTUsyVah0QQhgTBSjsiF4
 bUic5hsYzkjv6pep4aPtljUqF5OrHWvdPrI98nlKF7e+lm9ZXd08pDV8/7sSb2cBzx/o
 IA+MegiiXqc3chcmC59vAHdLUgYXnmY3IVmFsmyHRdjsLQytYVdB+kKokx7vHLHCIsiG
 QBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2csG3iv3TxQYzdj7Y6DVif/Sz3vBEyR+Zq5Uwd63c30=;
 b=qM6v8wJ1LymilnOnHePzD4QIJtvq+ax549SdXSyl5RqmGMAnYajQ1kPYcX/d+JQu17
 ho9N5syw+C9PHgm9ujtJczJ1axa2k96obkJWmD+o3wD8/3dYEZkkb2zda9PBMdvhuPe1
 NfTjo+1yBXeVKQXor2NEftqPb4jRsAn2AyySaijJaEbSPIIVyBNnGKh9mkxCTFHqiFeF
 mJGoYFQhWGLaGJksnp710qxkRw5Cg5/guVNvaniTPUMauUK4pqTdJ/epo0kDd8mxu/kK
 UZgw7JbCOzIEMlI+CYonyANoTHMzHHvilWyd9Y79Yp1GdQDnMjYjAi3eyPPC/uXE3NJf
 /xqg==
X-Gm-Message-State: AOAM5303o6rRHJuhrt3uixd2+9uIqHWp2ullME5tyR7AXCdfytSBr0yL
 EWTOWQRkxKrleuabNApl3VsMY/VSVZkyuA==
X-Google-Smtp-Source: ABdhPJz+1cs6KsPZ5vf9IHfFK+jeYpKdzvIdI4y1z1/abWmdwpH7W0/kwX4IfNOwAgsF/BznMVYHKA==
X-Received: by 2002:a17:90b:4b89:b0:1c8:105a:2262 with SMTP id
 lr9-20020a17090b4b8900b001c8105a2262mr9158749pjb.225.1650220250642; 
 Sun, 17 Apr 2022 11:30:50 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 36/39] util/log: Combine two logfile closes
Date: Sun, 17 Apr 2022 11:30:16 -0700
Message-Id: <20220417183019.755276-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Merge the close from the changed_name block with the close
from the !need_to_open_file block.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


