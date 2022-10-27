Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E9D6100BE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:53:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7mU-0002Oa-Ko; Thu, 27 Oct 2022 14:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kH-0001Mf-8t
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:50 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kF-0003Le-91
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:48 -0400
Received: by mail-wr1-x42e.google.com with SMTP id bp11so3670594wrb.9
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2E3Sx1MFwkAkShWDh4ro7HDDrVqIf4xAYuZL7Z9YHGw=;
 b=fbbf0SnwcDGnN1rhzBRAk+qc6TUOfr+gNBcucuX3V3EWpVmh1yFMW5uErLkrRkWr6J
 H0FskIm/rv+voyO7axY4UR4hT3qIymKbIhtaNF3j1QWvMZjrZ1nuknvmb0nrcoO9dtce
 4AvYl7lPSKxFn6+16m4Y6A4WZZz/3/XrgP0QXqxZDPHQj1s3HumWOWsTX14Z18x/I++O
 jmPMbkv9WrnECA27XV8WH9kp/gr5BSqhv8RaofJ2cF4Z4zkYs0XZKSMzpV48J5iTrBQm
 vcgtZZNUNmQWAW9k6o6nLY+ZKvA793cFubj2ItZJRrFx7qz8rO3ugONSq1W/ewz3jQO2
 pInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2E3Sx1MFwkAkShWDh4ro7HDDrVqIf4xAYuZL7Z9YHGw=;
 b=vZNauXRwjyGm+7MsiIrtZ5NwyLZarQ4avMvT0Tny+iyUt0b9r+76hY0u8h+gOKKUiZ
 LX1gxN/+981p3Jx92av1KdtqXcBe7KhfAc00NFCKgBtK9w47xDOAmHckfdXb8jAVuxS1
 7sM0dOxarFINPnpGd0O08Xl/SLawVqDQwWZtfF5GTr7dBW6MxdzclcjoKOI/7RHKqzie
 Nz+lx3zc/bKfESzsS+PmaRCf3rttTHY0XIlUQ5/ZIYLzKCSNvVdBd7VI4Zf4sn4aziuq
 0YgLBqw5tnUqbeHdN/DjRw4B5kJUyPuQCf9ls7HctjVUVU6NBLQexWH6mMefZcDPmsjW
 sOhA==
X-Gm-Message-State: ACrzQf2ydQ3IQBxq7gKFl+lDQbdLUh0aXqkeugW+Ewh3W8lNmZTkRplb
 PZGlazHQtRuA0s9DaVT1BKTHmg==
X-Google-Smtp-Source: AMsMyM7W1lKYS6Gb0g1yTnjFektJov0po1nhAdlrzUI2spbkN9Up/5YGcW/r4vVJ35jy8MspyTEmaQ==
X-Received: by 2002:adf:c582:0:b0:22b:3c72:6b81 with SMTP id
 m2-20020adfc582000000b0022b3c726b81mr33257106wrg.320.1666895805786; 
 Thu, 27 Oct 2022 11:36:45 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bs1-20020a056000070100b002345cb2723esm1903064wrb.17.2022.10.27.11.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:36:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4C0111FFB7;
 Thu, 27 Oct 2022 19:36:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 10/30] semihosting/arm-compat-semi: Avoid using hardcoded
 /tmp
Date: Thu, 27 Oct 2022 19:36:16 +0100
Message-Id: <20221027183637.2772968-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

Use g_get_tmp_dir() to get the directory to use for temporary files.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221006151927.2079583-2-bmeng.cn@gmail.com>
---
 semihosting/arm-compat-semi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index bfea9e9337..62d8bae97f 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -503,7 +503,8 @@ void do_common_semihosting(CPUState *cs)
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        len = asprintf(&s, "/tmp/qemu-%x%02x", getpid(), (int)arg1 & 0xff);
+        len = asprintf(&s, "%s/qemu-%x%02x", g_get_tmp_dir(),
+                       getpid(), (int)arg1 & 0xff);
         if (len < 0) {
             common_semi_set_ret(cs, -1);
             break;
-- 
2.34.1


