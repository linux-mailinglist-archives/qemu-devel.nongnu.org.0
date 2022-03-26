Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481714E815E
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:15:34 +0100 (CET)
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY7CX-0002X1-Cd
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:15:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6UD-0002uL-58
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:29:45 -0400
Received: from [2607:f8b0:4864:20::22a] (port=33767
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6UB-0005yu-MU
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:29:44 -0400
Received: by mail-oi1-x22a.google.com with SMTP id k10so11121935oia.0
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8IUyfSympPHVcXXqktu1H7rxzjIdvEh5QtmnECcsrkY=;
 b=IKlD8bVa2Xe1puGxVnGrt5HiftufZ2/k0vjbvAfUVM8ff0BJmA+wnPVIVxz4OBrsmd
 7LAy2v1kfhSSc40b9THPzYy8bXechskS+EpKDchFLL+XSgSSey2kFK4Yq77mmBSDbKO1
 7NTMTXj6jJmUj/wWZko3+GuM6/JLXAgFZvhOSk2mXQSNB34Nzl3lSqBfZNwsAsNiFvDE
 UcMHtFFTKgzGVlP9X9kBYwUZOw0cTpFacO/v5jgkI57lvLWnHJAQBx40WHUsblE5OH3I
 SePoC4sf/P3eibo4ygpOU8MCrejIeNrWWCIUDmanjn/eP6rZanzPG1l2CKvfSL8netIp
 ok/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8IUyfSympPHVcXXqktu1H7rxzjIdvEh5QtmnECcsrkY=;
 b=FJiyzs+JeCGLH75y0CK+AzkPVZvO7z0w/IzuvX3xShVHshgjd9MD6rCL8EQHaZ21JO
 SDRBuvpy4Vbi/yEfOYeEN7QN2KcTFOE4ZdCu6oQM3KWw7mmfTNJyYIPNyETqrGsd+33X
 es7mAZ14GRmRgFGSPm9JEoOt1U9SI00zvx9yf4qVvAEDJeHj4zzqWCmqiu0iFJH+B/iH
 r7UA7AWp2JfUdiuYJ8dIl/3AWZ/7qZbZIdF9zLB5o+nqLY7rUEQR2RcJZPgIFYLbdMmL
 fKS7gCqV07Old2WPr6ZqgDs3KBrPY1MKnBDihHoNSPK4cLxan2nnGlEnSALldXtMiVfh
 8EFw==
X-Gm-Message-State: AOAM5304ELdRKg9+5g564Jj92YBrqkYBuNis6pglGWcSALLxrXmupOww
 2k5VO7qmUfJY/5cDKKlsf1W+p5sEZy1mPjjx
X-Google-Smtp-Source: ABdhPJwn1+KDoTh1Tix1Lntok1COBizFl+mEBMPRw7z0GRfsNWfMQpdHw/pc6r8Ej4syD5CVzkJJpg==
X-Received: by 2002:aca:b01:0:b0:2ee:bfb8:7312 with SMTP id
 1-20020aca0b01000000b002eebfb87312mr7779732oil.22.1648301382714; 
 Sat, 26 Mar 2022 06:29:42 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 s24-20020a056808209800b002da3b9bf8e0sm4394509oiw.32.2022.03.26.06.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:29:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 35/39] util/log: Hoist the eval of is_daemonized in
 qemu_set_log_internal
Date: Sat, 26 Mar 2022 07:25:30 -0600
Message-Id: <20220326132534.543738-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only call is_daemonized once.
We require the result on all paths after this point.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/util/log.c b/util/log.c
index bb201664ac..631856e231 100644
--- a/util/log.c
+++ b/util/log.c
@@ -123,6 +123,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
                                   int log_flags, Error **errp)
 {
     bool need_to_open_file;
+    bool daemonized;
     QemuLogFile *logfile;
 
     QEMU_LOCK_GUARD(&global_mutex);
@@ -178,7 +179,8 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
      *     or to a file (if there is a filename).
      *   If we are daemonized, we will only log if there is a filename.
      */
-    need_to_open_file = log_flags && (!is_daemonized() || filename);
+    daemonized = is_daemonized();
+    need_to_open_file = log_flags && (!daemonized || filename);
 
     if (logfile && !need_to_open_file) {
         qatomic_rcu_set(&global_file, NULL);
@@ -196,7 +198,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
                 return false;
             }
             /* In case we are a daemon redirect stderr to logfile */
-            if (is_daemonized()) {
+            if (daemonized) {
                 dup2(fileno(fd), STDERR_FILENO);
                 fclose(fd);
                 /* This will skip closing logfile in qemu_logfile_free. */
@@ -204,7 +206,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
             }
         } else {
             /* Default to stderr if no log file specified */
-            assert(!is_daemonized());
+            assert(!daemonized);
             fd = stderr;
         }
 
-- 
2.25.1


