Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6107559F70A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:02:56 +0200 (CEST)
Received: from localhost ([::1]:44378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnDr-0007pX-F4
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtt-00033f-E3
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:19 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtr-0001Y0-SW
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:17 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 t11-20020a17090a510b00b001fac77e9d1fso999675pjh.5
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=hgOj9FjN0Z4iHtZUWCA3zZlRYozZrWgeApjdLVSDtro=;
 b=Hs3oV/eG9UUNQsyok72N5M4Xj5fnLk9ESMEmuiII03ti3QEg9QQe7tDAPnpN7FsIv6
 PuLMW/sbLNua8LfW0p4hVWGbhngxkw/7AcLPBwEp01RUKfwabF4AhrtTzJLiz9wcw+37
 iSuBZV3GQ+1nz6JlLO8YOPR+e7oze770qgQ1PKeykiBI5XURyEVs60Z3hwmtom5DYGiQ
 EOu0iTraXg9pazVJCTq+o6jLC6d6MN8RXLxNZd8rCcRbus3KKe0VKHav6LNNLmWTraum
 KR8qagi83zbkG9Wt7k1JlmfUFKZmj0IjGTTeCCahEmabSl2UigNHw48sqbN/4XC5sJY6
 4IVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=hgOj9FjN0Z4iHtZUWCA3zZlRYozZrWgeApjdLVSDtro=;
 b=dDakH25aBtta/IIMH5gn1AywuiYW1mumpMknA8+IDw2cEvIhr5uOSbP117otNO5elQ
 l6inslchnGDbzdFKrw6d/wJ0griCWZ3JTZ2gHmZ0kF+GeRJPPMHwK7SKepFtlTq5DCmw
 oy0H0dm9fMHmiHDsvvRJNiUSy6sOxdqIDEl0xpx6jhEPlrvJv8il3gD7nEuoMZsnAzVq
 C9/dVsbiW3Z1+P6yfU1L1rP6Rmj1cays+4jEhnvER54bPwrVaU1qt3BaN7OuU6nI8xXA
 7g+Wvss0vFcQVDsP3egozR31GCwy1uCLmp+E8GlbyqEfvZJtZAS07gB9HuxqJoDqWunp
 x+KA==
X-Gm-Message-State: ACgBeo2w0YJE8v3nL1S32cEsxP1HpUCgW6nRB1UUx+9RXDEWMf47hDiy
 YuZyvryJPvAN5pV8QKlAKeoLPju4o1Y=
X-Google-Smtp-Source: AA6agR613Q0tucCxEj4eWjptogZOl/Ts5u43bz7w9ldVLr0zFr5XDG936ObpcvmxJezpG0aLJcJFPg==
X-Received: by 2002:a17:90a:6b0d:b0:1fa:c6fe:db6 with SMTP id
 v13-20020a17090a6b0d00b001fac6fe0db6mr7428055pjj.99.1661334134386; 
 Wed, 24 Aug 2022 02:42:14 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:14 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 15/51] tests/qtest: Adapt {m48t59,rtc}-test cases for win32
Date: Wed, 24 Aug 2022 17:39:53 +0800
Message-Id: <20220824094029.1634519-16-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

There is no tm_gmtoff member in 'struct tm' on Windows.
Update rtc-test.c and m48t59-test.c accordingly.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/m48t59-test.c | 2 +-
 tests/qtest/rtc-test.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/m48t59-test.c b/tests/qtest/m48t59-test.c
index b94a1230f7..843d2ced8e 100644
--- a/tests/qtest/m48t59-test.c
+++ b/tests/qtest/m48t59-test.c
@@ -137,7 +137,7 @@ static void cmos_get_date_time(QTestState *s, struct tm *date)
     date->tm_mday = mday;
     date->tm_mon = mon - 1;
     date->tm_year = base_year + year - 1900;
-#ifndef __sun__
+#if !defined(__sun__) && !defined(_WIN32)
     date->tm_gmtoff = 0;
 #endif
 
diff --git a/tests/qtest/rtc-test.c b/tests/qtest/rtc-test.c
index 8126ab1bdb..02ed4e1238 100644
--- a/tests/qtest/rtc-test.c
+++ b/tests/qtest/rtc-test.c
@@ -111,7 +111,7 @@ static void cmos_get_date_time(struct tm *date)
     date->tm_mday = mday;
     date->tm_mon = mon - 1;
     date->tm_year = base_year + year - 1900;
-#ifndef __sun__
+#if !defined(__sun__) && !defined(_WIN32)
     date->tm_gmtoff = 0;
 #endif
 
-- 
2.34.1


