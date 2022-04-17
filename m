Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD2350492E
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:07:57 +0200 (CEST)
Received: from localhost ([::1]:37474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAFY-0007LE-Sw
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fY-0000U3-RI
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:49 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:34316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fW-0001om-EL
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:44 -0400
Received: by mail-pl1-x631.google.com with SMTP id n8so10810091plh.1
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8o87i5bNiHOl6x8JfiL+JMb4mpGfXlTZfUHEJQ6T1J8=;
 b=v2WvRjI6Fqo/TbfXMcM6B/h8exEVsq9t3N28saFL+7eyIRsPEfYi/YfK+eYeWUzLGp
 WTY7nGJtz1nuKRqoOo0JC2HhWyU/f6bsbXQuvgeFdxQxE05dx7BtmrGfHghdU8HAfLyW
 SHGyzd6ULLU7AroiXvin9s9fxZzhO4kmh6ny268kA78nA9sNMbtyW/p4qfWdiCZT2al1
 imsTrcE0YmhDRgfEkQ978hoNziDI5JGRq9IKSokb6coVvTb6//Du8CpipThT3vV4rXDi
 GBjXXIorp8qe/IvchgoIyRDFrg5sF+4LYxWSmNm5W2qCGcQ7pU5d6FdYWmYUfaXpSoR3
 AJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8o87i5bNiHOl6x8JfiL+JMb4mpGfXlTZfUHEJQ6T1J8=;
 b=nCy/OFlwezQIFq8NNokUcp/JBuIvDFaONK60tjFKYUvh5/lhjAA4AWA44v93YO03sl
 7lA7i017rw3Wp4mDVrxbLefSkt3jv0MaLLM/pHhU3x+B7Ew4Gac9xGEBEdevmA2GXgl/
 UqpmouINZ2QHCW4KA6DsjEwvEWlja6nXLGWpHWAKz1N0pHA8QaTx+VrXI2TOsQP+1uXq
 CuGVrojrOr2P+idVGfZQZYwFaNSKo53B9NPM/9RejVgkFdRzELXd76fa+9dEML8lq/A8
 2s3jV6pQUsSztXhJ5gxM1hzkt7GayeLnVeyFaKlfY7Y9EKz3n1cCT40Q7ZOZlcpF0XjW
 cx2Q==
X-Gm-Message-State: AOAM532Juddr/td5IOvmkKBVJC0g+225Ng3uzbxZ/773jcLIcDHwRrgH
 kwY1Wq4EB2zuY4+7rl7EBJzm0QAvV2332Q==
X-Google-Smtp-Source: ABdhPJwnVg0wbfk8e9GoUJuYOAK+0ZHEI1fZBqUF4bLg9YIqbyQqioTtwEQpYejVI2RzBrwo6Vxc/A==
X-Received: by 2002:a17:902:ecc1:b0:158:6e96:83a7 with SMTP id
 a1-20020a170902ecc100b001586e9683a7mr7819315plh.79.1650220241060; 
 Sun, 17 Apr 2022 11:30:41 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/39] include/exec/log: Do not reference QemuLogFile
 directly
Date: Sun, 17 Apr 2022 11:30:04 -0700
Message-Id: <20220417183019.755276-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

Use qemu_log_trylock/unlock instead of the raw rcu_read.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/log.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/include/exec/log.h b/include/exec/log.h
index ad0a40cfeb..4a7375a45f 100644
--- a/include/exec/log.h
+++ b/include/exec/log.h
@@ -15,15 +15,10 @@
  */
 static inline void log_cpu_state(CPUState *cpu, int flags)
 {
-    QemuLogFile *logfile;
-
-    if (qemu_log_enabled()) {
-        rcu_read_lock();
-        logfile = qatomic_rcu_read(&qemu_logfile);
-        if (logfile) {
-            cpu_dump_state(cpu, logfile->fd, flags);
-        }
-        rcu_read_unlock();
+    FILE *f = qemu_log_trylock();
+    if (f) {
+        cpu_dump_state(cpu, f, flags);
+        qemu_log_unlock(f);
     }
 }
 
-- 
2.25.1


