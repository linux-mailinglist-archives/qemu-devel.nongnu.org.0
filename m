Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC5A6C13D4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:43:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFml-0006vd-Tv; Mon, 20 Mar 2023 09:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFmk-0006re-F5
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:42:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peFmi-0001wE-TT
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:42:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id i9so10403338wrp.3
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 06:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679319767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4R55UzzwJbIFt/nZZoBFKmO5Aye9nghmbpLFsyQ7dw=;
 b=MkAEBo7XBPIN3WB1Okk11aFvpIMh7HXkYTZ++sbfZTtiBg533ac1IG/SAqTmKCl8Dr
 jyDF9TO2qHfgszZ9CVXirBHvxXB/84bB8S1LLuGlksk7yOEwHdNCeBPY5OVIE94354hR
 Xb7VgXtebEtO4W2v4L2CcNZCwv30JViD35HkYTCD94gA42ASl3xRo9LvsfKYgwLMMabo
 zWCRLRByWAEV62XIiMKeoUP41qrQoqMFMZZ69tn4nsw37AiPK3ILx3VWGWrNFplQgmH3
 sr+xQA7akW3WpbCjzjnZrjvvKO6YbjZEVYp0Jc5HAlr5PKVgcn/P0oNdwDiXlPghAyFb
 f5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679319767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z4R55UzzwJbIFt/nZZoBFKmO5Aye9nghmbpLFsyQ7dw=;
 b=TQXvs/aFlqJZYVy6cCZJSRqnrUYYeeU1BYiavT3Q9xQkA5YhmwWfdoFdjhrUA7l5Jk
 EyeZuLaHCULg65bI4siFJhFhpCEWf/sFOTo8E+8d+L0/xGj4X/X77ft5gQ2yJ6VVPgtz
 xL2rRj+cPfMLAXEEhxuTw/pQvGlwi/2k/DD1S4Lex/vXasQ/zb0KjaIH2HVHsElZdQtY
 vnnkm4TRoqfaFHqZtR9TZrm0aqgazt80cbk93tqIQt6hAz4QHJV74vKDSyBC2cN4yedw
 yrn/tYQjdrtox+YCCVLwsJ05SRHn6iq20s3t0FX/UxdTbSc3/OaIft7BXnZqaBl5LHe1
 nCXw==
X-Gm-Message-State: AO0yUKUsfbRaRD4gxErwaHQtNA6/jTrXvylzg5Pg2af3JD/WHcvi6OGn
 DZ1sX4DORtZpUQK9mrJpjx4VMngIeHOzYadc2zjLCw==
X-Google-Smtp-Source: AK7set89mm3fnNv9+RbhV8wmmd+chVl7ACcQYzjEIKg1618K4pEdYleJXqRtu2NenRI1kLX8DkUlvw==
X-Received: by 2002:adf:e407:0:b0:2d1:f705:a602 with SMTP id
 g7-20020adfe407000000b002d1f705a602mr9668033wrm.22.1679319767378; 
 Mon, 20 Mar 2023 06:42:47 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i7-20020adffc07000000b002c5706f7c6dsm8935371wrr.94.2023.03.20.06.42.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Mar 2023 06:42:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH-for-8.1 5/5] bulk: Replace __attribute__((noreturn)) ->
 G_NORETURN
Date: Mon, 20 Mar 2023 14:42:19 +0100
Message-Id: <20230320134219.22489-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230320134219.22489-1-philmd@linaro.org>
References: <20230320134219.22489-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Under MSYS2, G_NORETURN is expanded to '[[noreturn]]'.
Simpler to use the same definition everywhere, unifying
the code style.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/os-win32.h | 2 +-
 tests/migration/stress.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 0c00890a5e..0b9cae13e4 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -67,7 +67,7 @@ extern "C" {
  * which gets linked automatically.
  */
 int __mingw_setjmp(jmp_buf);
-void __attribute__((noreturn)) __mingw_longjmp(jmp_buf, int);
+G_NORETURN void __mingw_longjmp(jmp_buf, int);
 #define setjmp(env) __mingw_setjmp(env)
 #define longjmp(env, val) __mingw_longjmp(env, val)
 #elif defined(_WIN64)
diff --git a/tests/migration/stress.c b/tests/migration/stress.c
index 88acf8dc25..54a95c07f1 100644
--- a/tests/migration/stress.c
+++ b/tests/migration/stress.c
@@ -36,7 +36,7 @@ static int gettid(void)
 }
 #endif
 
-static __attribute__((noreturn)) void exit_failure(void)
+static G_NORETURN void exit_failure(void)
 {
     if (getpid() == 1) {
         sync();
-- 
2.38.1


