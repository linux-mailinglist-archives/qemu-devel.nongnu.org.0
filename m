Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F90952F6CA
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:28:17 +0200 (CEST)
Received: from localhost ([::1]:51902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCyd-00041n-5N
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCex-000369-TN
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:58 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:44698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCev-0004Za-Vq
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:55 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 pq9-20020a17090b3d8900b001df622bf81dso9048010pjb.3
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z1XEM4ETfmeGaHs0P/KqaWrAu876hNlLRNnzFnqql6I=;
 b=vkMX3CZywVx5e+lYBJ62iPDc03yfKZklpLruhWQ1T0QRKZzi5JO8XtyfX+tsl/saYj
 1AZhXSiYDmNvySR1JFbvpJT6aKKptgUlighQNGcqJZTXHA4sFi6ams74/s8ohV9uYFSE
 xxpHiM6JFfgwT2cexfISHrWdBM4+7nE5pUnDwkuewAiG8ONy3IqbyeMMajS9AYNP+Dts
 cEUIxcnRz0d7sHwuihmgs8QPA0yd08EL9u/BX4AAqDBheY1LHmnWFa+Bwnh63hwdaU9c
 8CVBhDXif72H2RPs8tD6rDEqhuOt0yXoRnvszXuOO46EYYLD8+W9s0o5e1mY37dWDbS1
 xdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z1XEM4ETfmeGaHs0P/KqaWrAu876hNlLRNnzFnqql6I=;
 b=WkvzxvnnlPvzlr3gL9hCvsYc2yf4NZmkFgDVSyzifLMt/YchOlrc3mBWQzDpIzY+Wp
 fAtjc0qBZzyO5LACE3nT6541yNXvdP6Jfm+S4S4YtZB56qB1Q/0OZbQg0GeOYyC/Pcgs
 ixAXg/AV1ZicDprwNgBH0KuzSS0HtueJZmdv/8gBt0WMbSc8VNe/mYicLR/bwdjw9HVU
 y8ad4kYyIRElBZi1L/WZspbQg2wQmRtSgmqHJfbieGxqa247x1DClt/jxXpbXqgNQcNB
 3ieriaUngDLByLJqDVJ4TvAcaxCIB3jZP1Klz9H6p8K506QyX4icXhm8JineI7lDrm0P
 R1GQ==
X-Gm-Message-State: AOAM5326CTODJm/G8YHTn/xOC6Ca0R9jffZuDOLnxnvhJquEopq21AqI
 Wh9v5kEl2dynpWbEcoAO20ClTtxBkg82wA==
X-Google-Smtp-Source: ABdhPJxYUyM6O7FpGYWrVZpLtj8LQ9UVIe5o9WthwpXB+gLuu1c4o+Kbk3TBDNmTSaI/amsYJmMrDQ==
X-Received: by 2002:a17:902:70c9:b0:15f:a78:fd15 with SMTP id
 l9-20020a17090270c900b0015f0a78fd15mr12099261plt.12.1653091672613; 
 Fri, 20 May 2022 17:07:52 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 1-20020a17090a0cc100b001d2bff34228sm2517703pjt.9.2022.05.20.17.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:07:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 45/49] semihosting: Use console_out_gf for SYS_WRITEC
Date: Fri, 20 May 2022 17:03:56 -0700
Message-Id: <20220521000400.454525-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 9230c69ff2..e24e9284c2 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -228,6 +228,15 @@ static void common_semi_cb(CPUState *cs, uint64_t ret, int err)
     common_semi_set_ret(cs, ret);
 }
 
+/*
+ * Use 0xdeadbeef as the return value when there isn't a defined
+ * return value for the call.
+ */
+static void common_semi_dead_cb(CPUState *cs, uint64_t ret, int err)
+{
+    common_semi_set_ret(cs, 0xdeadbeef);
+}
+
 /*
  * SYS_READ and SYS_WRITE always return the number of bytes not read/written.
  * There is no error condition, other than returning the original length.
@@ -329,8 +338,7 @@ static const uint8_t featurefile_data[] = {
  * The specification always says that the "return register" either
  * returns a specific value or is corrupted, so we don't need to
  * report to our caller whether we are returning a value or trying to
- * leave the register unchanged. We use 0xdeadbeef as the return value
- * when there isn't a defined return value for the call.
+ * leave the register unchanged.
  */
 void do_common_semihosting(CPUState *cs)
 {
@@ -407,8 +415,12 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_WRITEC:
-        qemu_semihosting_console_outc(env, args);
-        common_semi_set_ret(cs, 0xdeadbeef);
+        /*
+         * FIXME: the byte to be written is in a target_ulong slot,
+         * which means this is wrong for a big-endian guest.
+         */
+        semihost_sys_write_gf(cs, common_semi_dead_cb,
+                              &console_out_gf, args, 1);
         break;
 
     case TARGET_SYS_WRITE0:
-- 
2.34.1


