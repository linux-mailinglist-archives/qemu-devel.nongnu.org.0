Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830CE3C14E8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:13:57 +0200 (CEST)
Received: from localhost ([::1]:50360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Umq-000337-Ca
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1UkU-0000N4-H1
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:11:30 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1UkT-0002W2-3J
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:11:30 -0400
Received: by mail-wr1-x436.google.com with SMTP id f9so2048832wrq.11
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 07:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TMpl9R7BSbcYrV9zWMBsnPRqncVqlQYKmzFVEzY/Ahw=;
 b=ZaEutS8O+Id6Wa1Zw5A4K2/VRw43m8QYr1HBgjlOwpzE5VcvyUNQCswsDYPxMiB41Z
 Z2Po3ff36nMDoS2E2Wx8d9KkqJdZNbiI/8wNu/SVcyCNJORD8shfSj4C662MQpVFkM0o
 oNZOOOK6oBBYoKS06ruYxW9LQefJfUg4hKxHiVxR9NIWh7xfUvYhYf69KAKqimYg5oH5
 Ik5UU9Bp8kqaLOxt+eJIUxmSaOKxGXgujhUiroPS4nTFFRxgxiIxxHof96xCYzKfwpMx
 oeX6TVVvrvSRn7XSN5LW4C3JrXeeByX9ZUa6J/OrA8uQ3kF+7cqUoIr2s9w7fVx03wt3
 5lpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TMpl9R7BSbcYrV9zWMBsnPRqncVqlQYKmzFVEzY/Ahw=;
 b=SBrUPyGZVtsov/TsefdI2yUwOeyCYBzd9t7u4DGA4+YNB22gvd50F7k7CdT846Jn1O
 RkZtxE5WttzQLMD+JIyoGFL3b9Egn4tlhIg30Ks+HSDKri6uPm97gACpeDTkkrQUZNgs
 jVXBv9knp5APr1ahgLbq3xGpljlj0UKIDK+g+VzWPOuajSUxxXt3rqTfBP1K/bm20nVk
 R1gn5e1Pm9FRZNnyaasJAH/WNnv5944HzEJs2U+Uk3afZI9C5SVKogD1mwpE8StBUZ4/
 /0E4jQcARlGlgeCFOpEqNuS6pTS5uefA6sWpqhyK8hVSjUd40bLlGwYkLfbztjiUVUDm
 9L8A==
X-Gm-Message-State: AOAM530NwnnRdTZv7sUalDe2cYkXZOSTuY1YtwvUOcy9SQ8SgSqS5xxO
 hHFToIJ82iLnMprGd55NLQmGKtCbopc=
X-Google-Smtp-Source: ABdhPJxLriAXhf1XrHEJC+lOg5svr32RLHLjthpwNGt7j79iUQSYY+UeBBg1pQsMfffWlKSIJ0wH9Q==
X-Received: by 2002:a5d:68c2:: with SMTP id p2mr1235219wrw.27.1625753487484;
 Thu, 08 Jul 2021 07:11:27 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t16sm2448946wrp.44.2021.07.08.07.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 07:11:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] linux-user/syscall: Fix RF-kill errno (typo in ERFKILL)
Date: Thu,  8 Jul 2021 16:11:14 +0200
Message-Id: <20210708141121.1731691-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708141121.1731691-1-f4bug@amsat.org>
References: <20210708141121.1731691-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Affected targets: alpha, hppa, mips/64, sparc

Fixes: fe8ed7d5794 ("linux-user: Handle ERFKILL and EHWPOISON")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2e826206d22..4842a1987b7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -629,7 +629,7 @@ static uint16_t host_to_target_errno_table[ERRNO_TABLE_SIZE] = {
 #ifdef ENOMSG
     [ENOMSG]            = TARGET_ENOMSG,
 #endif
-#ifdef ERKFILL
+#ifdef ERFKILL
     [ERFKILL]           = TARGET_ERFKILL,
 #endif
 #ifdef EHWPOISON
-- 
2.31.1


