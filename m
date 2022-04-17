Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84921504911
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:54:03 +0200 (CEST)
Received: from localhost ([::1]:48188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngA24-0001H2-SO
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fK-0000PC-Hl
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:31 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fF-0001jl-Lf
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:27 -0400
Received: by mail-pl1-x631.google.com with SMTP id c12so10788978plr.6
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p4KreqFWRFVCoMDsRPqyRSaTvtdjID/fSH1d8UX0olM=;
 b=iflEclTi5QEbVWyw/urkd2SlnCHeDJSBebCeSN2MzS4hcph96SauKvPGOQMkmUHdiw
 9cfS/EDe9+qRb0LlF688Uln63TEIlyMOIEsjmomKkjD48qkzWMAYlPryKhuOExrVl3mg
 zCbUWve7JJTztpu/zmw1EzGXjI82xWQ5WM6UtJuUAUYVBnBME3/N4Q1QHn2ddgMcOUG+
 sKdMmaFKXet4bJc0JgcOJXrbuSLZ24F56gkcAYcGG9VZ08pGPWQfBzBqIYdsOaEPNRf0
 6/MScrmVUtEeuQcIY1i5rxBJJ6XZ5WYyLeXIJsca9jYpd1gTwGmDQChzYmNmiz+8lr8a
 6JNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p4KreqFWRFVCoMDsRPqyRSaTvtdjID/fSH1d8UX0olM=;
 b=3v731jBbw9p3VVAAkQ/XNYdgu4QFz2c+OmsylPu47GmLecaHmRYjiLSG6wAXdyRZUd
 /BiScgbYqEF4OcgT3uq5cm6FogM9ywVYuuUHt5wfP/KETQfgEtmW5uM+FgcQnGH8NmF8
 g0J6s3SzM3m39WUrLmrf/CFNc47NptTha+vPghXXqpfWm/hAtYDPwQCGRljBzVZjm3Sd
 VRqNWddCujkWCtjZSgIS/Y0RjhrOPBY58bgP62Objd4oLgJVLaGjfWN/Bg3V7pNk2xnp
 hO6pYpmNgTtjRH8hZwsBOf1oGlB/F+tyL3XYLt9YLa+hV1XPdPkF0voUyareO6md+dNE
 GXXg==
X-Gm-Message-State: AOAM531uqUK/UqYXK2rhN5Ghzmvrm+/KJEjQFhTeibemePd0Qfc758FW
 smJKU2b+nNaYWeiNpTstDQcbvzz8eK0uMA==
X-Google-Smtp-Source: ABdhPJwY8vGAi157qX7F7k9fTmXZS+rPUpEznj1ca6pG2ZHWPG3HSIedwx/pwkqyRNun798oJSHfgw==
X-Received: by 2002:a17:90b:2305:b0:1d2:812e:8279 with SMTP id
 mt5-20020a17090b230500b001d2812e8279mr4366224pjb.47.1650220223173; 
 Sun, 17 Apr 2022 11:30:23 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/39] util/log: Return bool from qemu_set_log_filename
Date: Sun, 17 Apr 2022 11:29:43 -0700
Message-Id: <20220417183019.755276-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Per the recommendations in qapi/error.h, return false on failure.

Use the return value in the monitor, the only place we aren't
already passing error_fatal or error_abort.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


