Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CABFDEA4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 14:13:31 +0100 (CET)
Received: from localhost ([::1]:39076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVbPm-0005oM-RW
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 08:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49440)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1iVbO2-0004TG-2I
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 08:11:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1iVbNx-0004Oy-6g
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 08:11:41 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:42118)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1iVbNx-0004Oa-1K
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 08:11:37 -0500
Received: by mail-pl1-x641.google.com with SMTP id j12so4641045plt.9
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 05:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YlXtkX/1xb+644dG6zbF+PNq9V+WmAv19VZ33vFg8pI=;
 b=RsSj9gUhivxTJkHSr+Ptto0VCdQhnuD4ABejmu1BpfVu+bl+ZAoLY2uLJNC1IE3eZp
 09pIgCx6/ZxuyuouSIxAgK6mOb+VeyLoLLUrMUuL0WZ5qhsqiqr1mN/xJbPXHIkM3EfY
 QwyxCCH2PTftcwAgD0sREuaj+QImYd0AdJZ1eAAdgP7duj7LSqaYMc5nk+sjqMKuOqVX
 +m3xjcGdaa/7fbq7dwnpkqHwRSx+J9l9ddp6VV8ItC8ALI6s3tMJNdavuqozlFOb0lST
 S/R4Ni5ipqO6AFN/yAdNsMn6mL+wqZnpAGVyU8dlJujBcIFg44PFg0xz3zgTGktrJyQH
 /NLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YlXtkX/1xb+644dG6zbF+PNq9V+WmAv19VZ33vFg8pI=;
 b=hFmGb0rz55MjoyOCXDRBk9QCHdgGx89OIYAym2v87khEroQCdrZ9T9f6r5SA3inFRr
 YP9GDDQy4I7wbQPF8TUr7YD1X9PoJST4QJoihNSBJeHvmNA2i1E1RfDd2XUopACYLMym
 rDi4ccUoBcDoy4szYpoSXkNflOw5PGLx/u5hFluWNK/UKj6rwKlu+YJMG/nTcX3IwJyY
 o4mfweaT/CJkYU2HAixzrcp/gTERwZtCIKP6AahJntGeazsTxeBlqaulubFw/70Qci9j
 yZFZH0lQnCqnHTgGDGrLPJU3j8lYI3nnBoC8uptBl5eYyN86gcBFUxuzOoA4fvw22v/d
 tDbg==
X-Gm-Message-State: APjAAAXd5PFLv6G4s9GvXe2iOWa0r5XKvrskEFC55ze+f63KQPFlUrC+
 IYvjncGABSCzDFdw138afGHUTEY2h/8=
X-Google-Smtp-Source: APXvYqxN+wL51K/KYg3RIbO8SlEw+Wy//+lN1mNmEJavmvEqT3WY3kV6t4lxSdxpWsNX9YX0wDkQfg==
X-Received: by 2002:a17:902:9a04:: with SMTP id
 v4mr15261685plp.192.1573823495736; 
 Fri, 15 Nov 2019 05:11:35 -0800 (PST)
Received: from Rfoley-MA01.usrd.futurewei.com ([12.111.81.71])
 by smtp.gmail.com with ESMTPSA id w138sm12007249pfc.68.2019.11.15.05.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 05:11:35 -0800 (PST)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] Cleaned up flow of code in qemu_set_log(),
 to simplify and clarify.
Date: Fri, 15 Nov 2019 08:10:36 -0500
Message-Id: <20191115131040.2834-3-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191115131040.2834-1-robert.foley@linaro.org>
References: <20191115131040.2834-1-robert.foley@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.puhov@linaro.org, alex.bennee@linaro.org, robert.foley@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also added some explanation of the reasoning behind the branches.

Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
v2
    - This is new in patch v2.
---
 util/log.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/util/log.c b/util/log.c
index 4316fe74ee..417d16ec66 100644
--- a/util/log.c
+++ b/util/log.c
@@ -54,12 +54,25 @@ static bool log_uses_own_buffers;
 /* enable or disable low levels log */
 void qemu_set_log(int log_flags)
 {
+    bool need_to_open_file = false;
     qemu_loglevel = log_flags;
 #ifdef CONFIG_TRACE_LOG
     qemu_loglevel |= LOG_TRACE;
 #endif
-    if (!qemu_logfile &&
-        (is_daemonized() ? logfilename != NULL : qemu_loglevel)) {
+    /*
+     * In all cases we only log if qemu_loglevel is set.
+     * Also:
+     *   If not daemonized we will always log either to stderr
+     *     or to a file (if there is a logfilename).
+     *   If we are daemonized,
+     *     we will only log if there is a logfilename.
+     */
+    if (qemu_loglevel && (!is_daemonized() || logfilename)) {
+        need_to_open_file = true;
+    }
+    if (qemu_logfile && !need_to_open_file) {
+        qemu_log_close();
+    } else if (!qemu_logfile && need_to_open_file) {
         if (logfilename) {
             qemu_logfile = fopen(logfilename, log_append ? "a" : "w");
             if (!qemu_logfile) {
@@ -93,10 +106,6 @@ void qemu_set_log(int log_flags)
             log_append = 1;
         }
     }
-    if (qemu_logfile &&
-        (is_daemonized() ? logfilename == NULL : !qemu_loglevel)) {
-        qemu_log_close();
-    }
 }
 
 void qemu_log_needs_buffers(void)
-- 
2.17.1


