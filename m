Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F338D4E8114
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:31:50 +0100 (CET)
Received: from localhost ([::1]:40902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6WE-0003jH-0F
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:31:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QS-0006oA-8s
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:52 -0400
Received: from [2001:4860:4864:20::2a] (port=40494
 helo=mail-oa1-x2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QM-0005Ky-TZ
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:48 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so10738185fac.7
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gySRxuYYwrwZO32brZVPz3NY1et5tLsOdakLrHT0vtA=;
 b=Y/wzKajXr3cj1SxddHduccwLyYID/tL3C4uIlWReUbPpz7UExtCrJXQ33nFWzuhZaC
 +kcrDYW3EQhCHTWuN0qyv26YR8LvByAarhvXWyI8a0s46dVcv/Ybxp6v0y86Id60PSlV
 RMFpT8YkkwUA1q+t9OB3Cn+AIrbd7NBm5YNzvBKXFj3Z/T+z8e6v/s3wlShM7aoZknig
 F0HFs7OdhapA6/6aWrI3CnT7tLNYs4CUHaWGtrGKC+FqxgbUmFc9yHrQSA9XSWzyB1dp
 5UNSdBcbuvSmWj9smosJ84hiqECy4k7APgzmC4HdWglmxhtaF0PXFP41voatzW4mrveA
 Q9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gySRxuYYwrwZO32brZVPz3NY1et5tLsOdakLrHT0vtA=;
 b=iSc+y+3w+SD/UlxgxPxv1XerMsRH5hPLSpxtbX+j8zJ1hdjjtcazTFwCgWP46HBtlS
 QYPFlNczL8UHbLD3xEa76HfmYyNIpF5lTJ98tnEHy4yHYiN2mPV3jExosMMCV1eo8bLx
 t4W0Nb6VuZe2LMFNcMyUXhipXiQudVEJraDjabdOaBFMIUbMydgFypHmfbmh5RP3AbuP
 GC3e7w6b3gCpKR/AKiLFbsJf44Q2BnlMqdTr0B08VxrzK8aVfG6yB0MINPDUd9Fx3MxS
 8ieQsE0+QP64A8m2Xg9csUY2f8X5HuTV+O8p6F8CYGFwN27TQmUwd7q46YwMVFjxrE2i
 cvxw==
X-Gm-Message-State: AOAM533lB0As2sdkhudekOq4Ssaui1aXcLbAcisL16PBlxkoxCC6mfzW
 xiWm9QfI5bl09OXp2t98hwJcTLx13YdGQefD
X-Google-Smtp-Source: ABdhPJyqGPD2KVxxU4I9vmUpQHpx7sEDkOEhyHsKHcmIQBefpkQUZXpCivxnAQ2EfhM9d1Geee5M6Q==
X-Received: by 2002:a05:6870:785:b0:da:ac31:3e04 with SMTP id
 en5-20020a056870078500b000daac313e04mr10690591oab.270.1648301145853; 
 Sat, 26 Mar 2022 06:25:45 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/39] util/log: Return bool from qemu_set_log_filename
Date: Sat, 26 Mar 2022 07:24:53 -0600
Message-Id: <20220326132534.543738-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2a
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Per the recommendations in qapi/error.h, return false on failure.

Use the return value in the monitor, the only place we aren't
already passing error_fatal or error_abort.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h | 2 +-
 monitor/misc.c     | 3 +--
 util/log.c         | 5 +++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index ed59ebd4a2..fabfbe41da 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -148,7 +148,7 @@ typedef struct QEMULogItem {
 extern const QEMULogItem qemu_log_items[];
 
 void qemu_set_log(int log_flags);
-void qemu_set_log_filename(const char *filename, Error **errp);
+bool qemu_set_log_filename(const char *filename, Error **errp);
 void qemu_set_dfilter_ranges(const char *ranges, Error **errp);
 bool qemu_log_in_addr_range(uint64_t addr);
 int qemu_str_to_log_mask(const char *str);
diff --git a/monitor/misc.c b/monitor/misc.c
index a756dbd6db..04ec0711da 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -419,8 +419,7 @@ static void hmp_logfile(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
 
-    qemu_set_log_filename(qdict_get_str(qdict, "filename"), &err);
-    if (err) {
+    if (!qemu_set_log_filename(qdict_get_str(qdict, "filename"), &err)) {
         error_report_err(err);
     }
 }
diff --git a/util/log.c b/util/log.c
index ffa66a267e..a838686a18 100644
--- a/util/log.c
+++ b/util/log.c
@@ -138,7 +138,7 @@ void qemu_set_log(int log_flags)
  *
  * filename may be NULL. In that case, log output is sent to stderr
  */
-void qemu_set_log_filename(const char *filename, Error **errp)
+bool qemu_set_log_filename(const char *filename, Error **errp)
 {
     g_free(logfilename);
     logfilename = NULL;
@@ -149,7 +149,7 @@ void qemu_set_log_filename(const char *filename, Error **errp)
                 /* We only accept one %d, no other format strings */
                 if (pidstr[1] != 'd' || strchr(pidstr + 2, '%')) {
                     error_setg(errp, "Bad logfile format: %s", filename);
-                    return;
+                    return false;
                 } else {
                     logfilename = g_strdup_printf(filename, getpid());
                 }
@@ -160,6 +160,7 @@ void qemu_set_log_filename(const char *filename, Error **errp)
 
     qemu_log_close();
     qemu_set_log(qemu_loglevel);
+    return true;
 }
 
 /* Returns true if addr is in our debug filter or no filter defined
-- 
2.25.1


