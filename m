Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD8D4E8127
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:48:07 +0100 (CET)
Received: from localhost ([::1]:52084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6ly-00050z-KE
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:48:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qb-0007IY-Do
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:01 -0400
Received: from [2607:f8b0:4864:20::c29] (port=43539
 helo=mail-oo1-xc29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QZ-0005NJ-RH
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:01 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 h3-20020a4ae8c3000000b00324b9ae6ff2so1678953ooe.10
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b49/gyL3nhPHdkIknNEuvRr52AV4Z59e2KtiOdvbnJc=;
 b=wyX6TeSYvtGM1rk5hB+bge/MFQWhSY5m6HuQi/ePZjxqdp33XB7nFUYvA3/UVJMELV
 uE2ZIc6W5En+OZDAAAoAmq1QBCCRWv0/Nc3BjKy7ym7Gc5fm8Pti1FaFxL6bgtIk+V0N
 4EEpwwpTXxf34YGVzqqf8Kzq1XZPbzbn+PG0xlXqfnnaiUEsiaYUG6VogPYwRXkcM8vN
 1DKdrQ2HQ3KKypG3jRnuaT5A1PVWXyL50Z1z/1ncFHPVrE8P5w4qPSfaxQbWm3QHI7Vb
 eWDV7L9YEGzaGbfrOzWRWUdI/znGZeuuJ3MCWxadwh6vhw0MpLSCEyYsKJ5z9GSB1NEl
 Voqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b49/gyL3nhPHdkIknNEuvRr52AV4Z59e2KtiOdvbnJc=;
 b=XSDO1GRMMAmdJ+wRaSjlEF+rM2GRNh5BbLQN7T7jI5iO1f0DWfQmyXUGWtAiAbV/DP
 GDMqw3H8TrhT3Y8KbvPx0rmK84w0CaS2nx+8y19iN56r1mEWJ0j+AQYhiUsoi2Mnys9F
 zSRUCs3tQvun20SOOaN9yw1RJvHTwXkpfe9JujYbVE+ENBAWdyPBHoX0jqY/Jhdc6cn7
 JKChg8mtkcDO7God/hKu/GFRqPh5rt42m8A7bRdkhyXBUDB5K9y1uZPEHlMmbI+5tnNM
 b0NkUND7IFfZdztgm8sPXv7OBACOn+Ji6h2FiYF/ZGlVMPuhHzL1Ikh6113B/c6yaY/d
 LtMQ==
X-Gm-Message-State: AOAM533I8OsWgUxhhjUVxTtwKehCLyByrGQ4O2ldRVqM+y2QHBkSJbYb
 jwW1TPD0IKzhQcsI+AEq8cE/m5nzlRsW7zDq
X-Google-Smtp-Source: ABdhPJzhF2kr/AgUAVeBeqvMlOGMLVzdu6iboPO64EJ4G5R1ZFdaI9XNBQaN35NuJeN/R9qGQHUOKg==
X-Received: by 2002:a4a:bb91:0:b0:321:1c31:ae98 with SMTP id
 h17-20020a4abb91000000b003211c31ae98mr5700087oop.48.1648301158681; 
 Sat, 26 Mar 2022 06:25:58 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] tests/tcg/nios2: Re-enable linux-user tests
Date: Sat, 26 Mar 2022 07:25:03 -0600
Message-Id: <20220326132534.543738-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc29.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that signal handling has been fixed, re-enable tests.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/nios2/Makefile.target | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 tests/tcg/nios2/Makefile.target

diff --git a/tests/tcg/nios2/Makefile.target b/tests/tcg/nios2/Makefile.target
deleted file mode 100644
index b38e2352b7..0000000000
--- a/tests/tcg/nios2/Makefile.target
+++ /dev/null
@@ -1,11 +0,0 @@
-# nios2 specific test tweaks
-
-# Currently nios2 signal handling is broken
-run-signals: signals
-	$(call skip-test, $<, "BROKEN")
-run-plugin-signals-with-%:
-	$(call skip-test, $<, "BROKEN")
-run-linux-test: linux-test
-	$(call skip-test, $<, "BROKEN")
-run-plugin-linux-test-with-%:
-	$(call skip-test, $<, "BROKEN")
-- 
2.25.1


