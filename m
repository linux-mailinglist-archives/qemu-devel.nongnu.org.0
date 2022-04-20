Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC18508F30
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:14:17 +0200 (CEST)
Received: from localhost ([::1]:46682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhEqG-0004CZ-Ll
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEih-0005Kd-I4
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:30 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEig-0001B6-3r
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:27 -0400
Received: by mail-pl1-x630.google.com with SMTP id b7so2525366plh.2
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Acrdd8Fm08SC2Pv9DkKl+01rcq3tkQdmCCMEajfWbE=;
 b=v4Wr19ufbUX3KmnVoQbvzqg5KQkDOfHvzNLNIXrerpRLPtDD9WRWpuZTY3xm9RKMJh
 iB6Di7Dkr3+ZprDgnnaP7IOCdL8H5iLI0KYuDvqi7ejHuNquYypZJLNWcn7zzQjFRbDp
 9EOsIWF0e3YruvngcE5IFbC7u9Zat1E8cou/sAZZTsbwVhGmVGpW8Ag3QhedjDqOL9jX
 HjowrYmPJ1t7Lap+0DVnlAZvdoqyhIuT+4N8dwMi/IXKcWzkU0ycvp13Rr0AH9KhCxu2
 r/oUOsxit18INI+EeKtkXuxIhCy5I7jyL4SYqHayYYFVQaBrYyfmz7eR/5DD+LRIYMeR
 MEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Acrdd8Fm08SC2Pv9DkKl+01rcq3tkQdmCCMEajfWbE=;
 b=bq8FUYWRZMjgzinLDhFX9mIqFUMUVcfjyCN22Xzi81stc30WfPGDHRRb0kRLOMbzgz
 UHFHA5tCFHad9yJ6XtuqAQuMeH55t+BIZup7JsaLU9+Rw4VtihhOU+JI76esY3lO111y
 AAWy1Hbl7w5k5Iu5VisWeMYEz8e7Cstnm8Sg/9hTYbzwaZhW1Fr7vGnwJMOTdKvIjTda
 bMBOWG0JeMdFvgUPVo7ps4BZSIdQlQ3bJyZv6G4LwuMXu93g0AIAYdO7SxzSQwSoqgf2
 GUWJWLEF+1iXRflLEeTu6w+cCAl6o7syfJl4fEdE1QLdyw9MSoo0Cb31UJ6dyV8Ho/rI
 6nkg==
X-Gm-Message-State: AOAM530NDr+A8LCsyTZGXN4Z/vYYC6WxLnSRK/CEh3+1KH+kkoPO7IKt
 68snt633cYoSidcWvo2cCZ+Bak0mgAr5WA==
X-Google-Smtp-Source: ABdhPJzt1/H9qW/LHXsix4n+/eOwuWYqtuoVVk5MQ9eeSNX5vrSEj5081LIO4kX1U2suPQ0O6I5VGA==
X-Received: by 2002:a17:903:2487:b0:159:bce:4e1a with SMTP id
 p7-20020a170903248700b001590bce4e1amr12182604plw.4.1650477984860; 
 Wed, 20 Apr 2022 11:06:24 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/39] os-posix: Use qemu_log_enabled
Date: Wed, 20 Apr 2022 11:05:44 -0700
Message-Id: <20220420180618.1183855-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not reference qemu_logfile directly;
use the predicate provided by qemu/log.h.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-6-richard.henderson@linaro.org>
---
 os-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/os-posix.c b/os-posix.c
index ee765f047d..faf6e6978b 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -291,7 +291,7 @@ void os_setup_post(void)
         dup2(fd, 0);
         dup2(fd, 1);
         /* In case -D is given do not redirect stderr to /dev/null */
-        if (!qemu_logfile) {
+        if (!qemu_log_enabled()) {
             dup2(fd, 2);
         }
 
-- 
2.34.1


