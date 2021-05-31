Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E424E395526
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 07:53:27 +0200 (CEST)
Received: from localhost ([::1]:44702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnare-0007tb-TM
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 01:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapW-0004wn-5J
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:14 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapU-0003oo-JN
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:13 -0400
Received: by mail-pl1-x62d.google.com with SMTP id v12so4647145plo.10
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 22:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DAsgew0PuL4nW9yTQE28tqe8JgDQa0h/wMivkuc7Sqs=;
 b=YJNev2eneIe6WmmLgurJ2stSBhx5kKSiExGV3uLvfyOjdfZUOlc1UovaIwAvh21LD6
 V57+HI0dpqOqqdoCRevAZdqnahe1oJ/kwWnVA1bPHzj7PAqXCueHMHG4kQ6xV6fbu/Pc
 sWMNjxAbCbqv7iVG7rMTk3YWuXhjXUWUk20JQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DAsgew0PuL4nW9yTQE28tqe8JgDQa0h/wMivkuc7Sqs=;
 b=iT4laYPPC6KHFNBKA2DPR8KHLHNPfuS5kZqedYfnfZEHOUdMC5NSQuifUc1A1dLJly
 uNhBfXBHI3l+khjnQKT4JmjtCL0xA9m2qUc26XETrNJnqs2H8X383oroAOVfkItbSPjP
 fo7Z07ZQnXtUs06ZlFEJ3Wns5900uQdsWiRkd5XxSpFNW/O23SUEU/IlH+gStnn7Ts3C
 +hWVvncJrAomuJqAoPqiD65Wi3HL8GeI6IYkazbupyC7DSqmVrfWF3tXG9Y0SQXNm2L+
 kQDQG5S80YCLFXk3BoB9m5ZEm5cgZo8mWq0/7tZ+cPRtSS6S1udECoECliiRuxj0wtZv
 jCfQ==
X-Gm-Message-State: AOAM530qproxLX/x6PsLFYoZuFTEUBtXEMHV/Pm6VE2IhF6ECwlt62Od
 aFJu5Kv5KXwijHFTMXUWGZe+/QJG1Lg9Hw==
X-Google-Smtp-Source: ABdhPJxyHFIOisANzzN2h3H/XQ95b/AJM0t3feppzfdN+U2yf6tsywUSh747UiMvL9K77QiXIiQoJg==
X-Received: by 2002:a17:90b:4384:: with SMTP id
 in4mr17741440pjb.159.1622440271198; 
 Sun, 30 May 2021 22:51:11 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id b10sm4744058pfi.122.2021.05.30.22.51.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 May 2021 22:51:11 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 04/11] linux-user: make exec_path realpath
Date: Mon, 31 May 2021 14:50:11 +0900
Message-Id: <20210531055019.10149-5-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
In-Reply-To: <20210531055019.10149-1-yamamoto@midokura.com>
References: <20210531055019.10149-1-yamamoto@midokura.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=yamamoto@midokura.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise, it can be easily fooled by the user app using chdir().

Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
---
 linux-user/main.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index a9d02f9583..be604a84f9 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -55,6 +55,7 @@
 #endif
 
 char *exec_path;
+char exec_path_store[PATH_MAX];
 int exec_fd = -1;
 
 int singlestep;
@@ -611,7 +612,20 @@ static int parse_args(int argc, char **argv)
         exit(EXIT_FAILURE);
     }
 
-    exec_path = argv[optind];
+    /*
+     * Try to get the realpath of the executable to avoid being
+     * fooled by chdir is the user app.
+     *
+     * Note: realpath here can fail for some use cases.
+     * For example, runc executes an unlinked binary via
+     * /proc/self/fd.
+     * It isn't fatal as far as we have an exec fd.
+     * (Otherwise, we will fail to load the binary.
+     */
+    exec_path = realpath(argv[optind], exec_path_store);
+    if (exec_path == NULL) {
+        exec_path = argv[optind];
+    }
 
     return optind;
 }
-- 
2.21.1 (Apple Git-122.3)


