Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2692B6A13A3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:19:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKrB-00007B-3U; Thu, 23 Feb 2023 18:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKr6-00006h-1k
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:18:28 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKr4-0000VJ-Jk
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:18:27 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 iv11-20020a05600c548b00b003dc52fed235so640341wmb.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/SzNes+PKphnz/4Kg6fNH0K4F/X2m+UTPTjILWJZzx8=;
 b=tUvZxM0XEzoCE0vAdl/M0nfQSMZD/Sx3q0J1YkuKkF/dIgo5e072Bq1W932SuCQijM
 bgzSxflSR0LPZ3KVBRwkTFrgbVslOpYIys/MwsJ8iM/iR0aOtNuBtcPhFHD/tl41f68F
 ExqdhGmhROzmiRkbkAu5ohWytEa7E7xVM90K1ZNsOnMNL794aamWdTtBtF8vi7Acu1px
 ki210O3qBec84UUHeHSzmBZNiwxjEgXNjVsBwClYr/lfQTb6Fo7bPStrQ21dy6jpp6sQ
 q3KSNZOn1KWpEsEuIH+H9LbGkqQS0CCybEOqCn7kfY7WPEK+BfUtj/Czwjnq6OAL/9/r
 J3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/SzNes+PKphnz/4Kg6fNH0K4F/X2m+UTPTjILWJZzx8=;
 b=DCjUODN4os7pKw95Ne3p6lyCNKY84PgKI8RE2Dhwjc6NxW58INnLUxjuy44Nwp8/ej
 WjF0cCFHA4IAbyd+Ac10fahZWmbVcJWsrBRxD4Nwl9BGiWc5obzxACx3vz9ruxfIcPPG
 +/eabzkOI29ej6FH/9n91NHSXrEFHrwf7CH45VmuOd+K765TjLXoGfPanSoOkHWS5SPz
 zY+PFnW691JWnVl4bKfGAMcHgySLVVfiUK5lL7rR1FH6a+6jaVqHXQjYtOst0LE5UJ28
 96uc/g5ekjjw4do5zkSjFeS9jtGccUxjfhSRIq8EmtEIyUhQ3z/4xiM6+08ZB7rsL4sF
 fmoA==
X-Gm-Message-State: AO0yUKXdS0vHWxh0vEURO5XTgcvlxaCz/3Vx2fCylDWAxOPA+j+OPHOx
 VWnVyEuR7eqNCqaEOtW4W8bI0cWM/pxU4N1h
X-Google-Smtp-Source: AK7set+HpwT0f92FKCVpekQzk9/yek/k4/Al4Ev36SJdMdzd5tmJLdEghB6zGogLqawPf6jO6CStKQ==
X-Received: by 2002:a05:600c:3420:b0:3e2:c67:1c7f with SMTP id
 y32-20020a05600c342000b003e20c671c7fmr10389765wmp.10.1677194304933; 
 Thu, 23 Feb 2023 15:18:24 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 az11-20020a05600c600b00b003e1202744f2sm753577wmb.31.2023.02.23.15.18.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 15:18:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 5/7] dump: Introduce create_win_dump()
Date: Fri, 24 Feb 2023 00:17:53 +0100
Message-Id: <20230223231755.81633-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223231755.81633-1-philmd@linaro.org>
References: <20230223231755.81633-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Remove another TARGET_X86_64 #ifdef'ry by introducing
a create_win_dump() stub. We'll extract it to a stub
file for non-x86 targets in the next commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 dump/dump.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index c356a88be1..b33a613d45 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -39,6 +39,11 @@ bool win_dump_available(Error **errp)
 
     return false;
 }
+
+void create_win_dump(DumpState *s, Error **errp)
+{
+    win_dump_available(errp);
+}
 #endif
 
 #include <zlib.h>
@@ -2031,9 +2036,7 @@ static void dump_process(DumpState *s, Error **errp)
     DumpQueryResult *result = NULL;
 
     if (s->has_format && s->format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {
-#ifdef TARGET_X86_64
         create_win_dump(s, errp);
-#endif
     } else if (s->has_format && s->format != DUMP_GUEST_MEMORY_FORMAT_ELF) {
         create_kdump_vmcore(s, errp);
     } else {
-- 
2.38.1


