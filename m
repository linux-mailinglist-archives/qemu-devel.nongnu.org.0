Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D844E811C
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:36:05 +0100 (CET)
Received: from localhost ([::1]:54574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6aK-0004Qg-UK
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:36:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QU-0006ww-Uf
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:54 -0400
Received: from [2607:f8b0:4864:20::22b] (port=45002
 helo=mail-oi1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QS-0005Ld-6D
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:54 -0400
Received: by mail-oi1-x22b.google.com with SMTP id t21so6202061oie.11
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=alXSIX3aVlQbR+ahH+ZLhiXZst3M9kUZiv2iZp+a95Y=;
 b=lCu0jtZ/X8jjLDdXgF35fC5uZeCKlSelXqx6UIHSvBMtox7fpxccKvkLtezfM+/4e3
 Pmzd1kNZ9ieiuSjUhNCsLOINWIQwfUHb4EAT6WdJIzrWvs51b9OuJeCNjytSFxr+bHxA
 eA71zmYsETBdkTO5TpUsJ+rj2yqxsEILZ++6L+euUIXpiSxvak0xAR/ZBa4lo0caUZda
 9xfmnktfibYds2BYr0XJK2vIQBDleQBmBXXK/9YU6ZVH6AgUSxDf8fzK1Kq3A5KF5iFl
 u+r+SHx0lib2iJf9ycB6sf1sU00Y/N3o9o1wMu56KuFIklFD6RIdPsJh/ugPmOLDV8iH
 CWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=alXSIX3aVlQbR+ahH+ZLhiXZst3M9kUZiv2iZp+a95Y=;
 b=X2aDjj1740ryMVItVfBvYg8PcGD944rFqWcbXrtBcFWpJpzP/SvPMXXHHNp1iLb+pC
 lj+ktW2VvfaHmx+fClXkkmpjxvtPjXQoXvOqEZw9RBMmFFRpE+k9H1v7WnGDMzWUcsPr
 mUAkS0AujTW9vpWP0co9LtPK1wpGQ0GRnwf1gfyqXyMEqM9uBdpvhXqBg+aEjmd19QS7
 s8ylbRX3BLtaX/THPQ5skQk1ROhTJU/KJRki34aINrvSKvhRKHGoioBPJkcNGqx2NoVD
 qIe+5YNgxZueXXWeih+66FUr9f6N9WE9zzTYcqbeEOUzfI8XS6nqrpJzXQL3w9oV7ixb
 HpTA==
X-Gm-Message-State: AOAM531hv5s6IRXJlRVgXRzMDbfPDFdfT0rSDrZF+R7AdlTqkdykwc0s
 znajXdCagekmjWfx/46ticAz8oHfUYHgjR6s
X-Google-Smtp-Source: ABdhPJxQpffzyI1/IX60wHm+N5fqJ0RLEsYo6RQuXAa8Svy7MgjbJGnfCozLGOQQHXxRS/yVQLQXzw==
X-Received: by 2002:a05:6808:23cc:b0:2d9:dc76:1f36 with SMTP id
 bq12-20020a05680823cc00b002d9dc761f36mr8093205oib.292.1648301151155; 
 Sat, 26 Mar 2022 06:25:51 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/39] os-posix: Use qemu_log_enabled
Date: Sat, 26 Mar 2022 07:24:57 -0600
Message-Id: <20220326132534.543738-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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

Do not reference qemu_logfile directly;
use the predicate provided by qemu/log.h.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 os-posix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/os-posix.c b/os-posix.c
index 24692c8593..20d31fc518 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -292,7 +292,7 @@ void os_setup_post(void)
         dup2(fd, 0);
         dup2(fd, 1);
         /* In case -D is given do not redirect stderr to /dev/null */
-        if (!qemu_logfile) {
+        if (!qemu_log_enabled()) {
             dup2(fd, 2);
         }
 
-- 
2.25.1


