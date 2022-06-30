Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35A4562390
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 21:53:04 +0200 (CEST)
Received: from localhost ([::1]:59444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o70Dn-00068R-PZ
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 15:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704S-0004Sx-OY; Thu, 30 Jun 2022 15:43:26 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:42799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704N-0006FO-08; Thu, 30 Jun 2022 15:43:22 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 q18-20020a9d7c92000000b00616b27cda7cso163253otn.9; 
 Thu, 30 Jun 2022 12:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xNY4uM6kDjCgYmiOf0Ksjc6ebFrCevJEDqhYav+a+kU=;
 b=SukSzs78FJYNAfD7nZXJsfgOLgplDg+c+GKaCagTHL7Gs5dTYEq08NoL5nxTr+07Uh
 eI5qqoVJVB6rsgBYS/V48LbtQFDgStY1u8OYXt0EaW/ZnkKjC4lust7Ml9DF3HRbk8v7
 t8/dn3ZaumNlWLuBwdjboSixfjUMMQOhgO9DO1pFR9raIDgmDtwSDCO1+ltGv+NPrZIt
 Bywpnl6o/NEoOG1h4VjxNbKEmAzPMrE6ZWqpF5IAgRUUPzLILjouln9sAk39hWYZRvAH
 PntXEmxEDIH7qWWZT4/5AjFV1QbKyKL6BlIc9eSAqxKq8/qUB0bxzOjuPvf8HVsCq+JY
 C8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xNY4uM6kDjCgYmiOf0Ksjc6ebFrCevJEDqhYav+a+kU=;
 b=MrAMlZsMkr1tvp7motOoNKAi2e7VbizCy+YJ5XWynwppmvpAyoc4zuxnFf7Miv3K5t
 ff5zIfBH2NqcvjSEFtcE5QlFLkAI+jbcTNg2FIIDNdeKwvvLxKvgmoELMxOZtf4JBU0c
 iKTCg4aHL8Ht76dei2dZu8sJGR59nzJDlFCDog+KIStb/Vaxf16yI0zZmG9nna/pWYao
 sAylahl0oU1ZakhVNKgHJAWoyj/mcNJOTN5l6xuzozkB0VC/q3OPllzxhsN0r+Od8qDZ
 VhkrFWUXSG2Y+Q9APleFJX5tMYMPAnPGGO8juzuttKMkLxcdg5hFcMkJws6/dC9QEiK+
 OUcA==
X-Gm-Message-State: AJIora8cWe71cc24E0mJ2j0006Rv92EcKwbrLs/gLmOKWbsSVUt/tBCP
 UEp4TJQQsln/QZYODkBwr8oV2IQZRRs=
X-Google-Smtp-Source: AGRyM1uL9ZCcWH0QqUV3LE/9fyTMKBI9ALMQ51hjOv1U1KGk8Ty3yAiLlLEHt17vfzETpERBKl2ZKA==
X-Received: by 2002:a05:6830:1b79:b0:616:af56:2fe7 with SMTP id
 d25-20020a0568301b7900b00616af562fe7mr4583645ote.262.1656618194788; 
 Thu, 30 Jun 2022 12:43:14 -0700 (PDT)
Received: from balboa.ibmuc.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a4aa3c5000000b0035ef3da8387sm11250519ool.4.2022.06.30.12.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 12:43:14 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 jianchunfu <jianchunfu@cmss.chinamobile.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 3/9] target/ppc: Add error reporting when opening file fails
Date: Thu, 30 Jun 2022 16:42:43 -0300
Message-Id: <20220630194249.886747-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630194249.886747-1-danielhb413@gmail.com>
References: <20220630194249.886747-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: jianchunfu <jianchunfu@cmss.chinamobile.com>

Add error reporting before return when opening file fails in
kvmppc_read_int_dt().

Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
[danielhb: use error_setg() instead of fprintf]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index bc17437097..7611e9ccf6 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1896,7 +1896,7 @@ static int kvmppc_find_cpu_dt(char *buf, int buf_len)
     return 0;
 }
 
-static uint64_t kvmppc_read_int_dt(const char *filename)
+static uint64_t kvmppc_read_int_dt(const char *filename, Error **errp)
 {
     union {
         uint32_t v32;
@@ -1907,6 +1907,7 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
 
     f = fopen(filename, "rb");
     if (!f) {
+        error_setg(errp, "Error opening %s: %s", filename, strerror(errno));
         return 0;
     }
 
@@ -1940,7 +1941,7 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
     }
 
     tmp = g_strdup_printf("%s/%s", buf, propname);
-    val = kvmppc_read_int_dt(tmp);
+    val = kvmppc_read_int_dt(tmp, errp);
     g_free(tmp);
 
     return val;
-- 
2.36.1


