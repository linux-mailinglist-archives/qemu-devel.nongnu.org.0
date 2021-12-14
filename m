Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869A94739A0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 01:35:38 +0100 (CET)
Received: from localhost ([::1]:52298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwvn7-0000Do-LI
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 19:35:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwve3-0007tq-R5
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:15 -0500
Received: from [2607:f8b0:4864:20::534] (port=41809
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwve2-0005S9-5P
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:15 -0500
Received: by mail-pg1-x534.google.com with SMTP id k4so15965173pgb.8
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 16:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TFNb/strBQB9hLaOeOMEOLWgIeKVijWjHGUQ12nJnAw=;
 b=PPModKLwQ5yV7V3sebUjlcZyy03stKkBYSPswRxm/NZlYwQm1ttk3xEF0BhqALmO+C
 1VyEWIHR4lhzLnXhwxYbGGpy+8svAOtxlCLTqAn8WAJS+HvGzy/sTYuvo1RBceGH3nX/
 kE/ZHl1/tf0/f3GuhihB0TbrjmDnLPcdOVebcvWLScmTBWCfOekI6UV8fEqHHqJEaXRR
 7MFgylGCT4mJQ5Vc/dC0RaER1WKqLGnY9M/jmYyMCxjvkFFqM40vnX4M+wIyo6sSRAZZ
 zK4lqNXPudRiV6IxwSdPfLordy7EeS5rhNtA3n4wMcJGiLFwEJVY+3fRYRkhV4UuMeH6
 cCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TFNb/strBQB9hLaOeOMEOLWgIeKVijWjHGUQ12nJnAw=;
 b=c9GpndgNURw4qqTRBjyeXZ5FGL2ognBrLts7O0e8mNtoVpZxYyClz8LDHGUYxu7z9N
 1bGzjoQ3+Cwg8LVOSKN9CDMKEMvwJ93KLkVspuvmVWoOtYgWho0r4wVd+aAa2mhcdGYi
 P19vUEw00p3RXBWi2Aj1z/C7hbcXZr1ui5IQFRNCkEPc2+a1QrkOJ8x9MCfDfjyJThv3
 LI6axFQ+td1n+Nny6zjCvs9bB8XMJoYUIn5HdkO26N/y+lAPXRea4XpuYe8XFhZzxJqT
 se3DNT1OYORzozxyaIi/kRR6ZeYjw37+fWFxFw7ksS6I2HWO83qvMvFFxDK31WR4Na7J
 NLgA==
X-Gm-Message-State: AOAM5317UNlc3I4C/zHEnON1x6+ZnequHRL9q6Fe9SH4QqIN+QAKf1Iq
 KE+kSZTxx9/zQFILpocV6poIFdIN8lO9IA==
X-Google-Smtp-Source: ABdhPJx7mMd01lCjTlHLOKK4g+B5Z29bKCS6qABUwFmdsOvnuGykTzYERn1o50BYqe+XprkSYK9MNA==
X-Received: by 2002:a65:44c4:: with SMTP id g4mr1410287pgs.103.1639441572992; 
 Mon, 13 Dec 2021 16:26:12 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w7sm11320253pgo.56.2021.12.13.16.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 16:26:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/15] bsd-user: Rename TARGET_ERESTARTSYS to
 QEMU_ERESTARTSYS
Date: Mon, 13 Dec 2021 16:25:56 -0800
Message-Id: <20211214002604.161983-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214002604.161983-1-richard.henderson@linaro.org>
References: <20211214002604.161983-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This value is fully internal to qemu, and so is not a TARGET define.
We use this as an extra marker for both host and target errno.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/errno_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/errno_defs.h b/bsd-user/errno_defs.h
index 832671354f..141e08456c 100644
--- a/bsd-user/errno_defs.h
+++ b/bsd-user/errno_defs.h
@@ -151,6 +151,6 @@
 /* Internal errors: */
 #define TARGET_EJUSTRETURN      254             /* Just return without modifing regs */
 #define TARGET_ERESTART         255             /* Restart syscall */
-#define TARGET_ERESTARTSYS      TARGET_ERESTART /* Linux compat */
+#define QEMU_ERESTARTSYS        TARGET_ERESTART
 
 #endif /* !  _ERRNO_DEFS_H_ */
-- 
2.25.1


