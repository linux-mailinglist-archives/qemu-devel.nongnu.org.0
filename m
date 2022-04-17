Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E797504926
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:04:07 +0200 (CEST)
Received: from localhost ([::1]:53810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngABq-0007Sy-AD
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fM-0000QY-Ti
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:37 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fH-0001jy-0E
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:30 -0400
Received: by mail-pg1-x52c.google.com with SMTP id k62so9001544pgd.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=alXSIX3aVlQbR+ahH+ZLhiXZst3M9kUZiv2iZp+a95Y=;
 b=t+97GYMQuw5wfIYOQokE3DeJYIhkWWiTUftbdoG7MjXq9/fYT0yVaMUD8ioETAcyBM
 2T4WwQ42ndXTIg5+rPz7wn56Ag36zMi2n1UbXay/XKVDCUq5NqPIfqg7keFeUdEBD61s
 1fABpaBfz43fgi4Zwiqp8+CRkD9J/sg1klJmfB5cLJXvDDSord7uGV+mjmZNKBfAgG/G
 XXXCw6QsQ16kErbbtDe9qQls03KTcwbyZfOIteH6KXZmtvEUsrv89IXDwAR6bAFEMUBS
 BwWcU5ySLN5g6k8Tao15jFBAU6vSvpV9nx4Vs1rn+bPE6ct+qZeH8nmGFWa0vg5ubSAo
 QqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=alXSIX3aVlQbR+ahH+ZLhiXZst3M9kUZiv2iZp+a95Y=;
 b=xt00KaKcV1uHv+KNBrBRNTOm6S8h92YMoYY3ADYMhDzAE3XRIGhNhcGS9Acy1abfXL
 G9Bdn2Aj/5vEUARuXAWHdRhF6Ka/dmn4v4ZVUMUbJcPI5L4Y6R2CzY3aEMyIEe/YZl1F
 BKNw7M1PLpmyS3LO1yyi+LN9UA8dm/BudPl0EKNJ9Li7MkJor98uypc//oq18YWMycoR
 TUYlXZRgUG05w0loPYY2v7I4zQJbieGMI5rRcyL5qGprvvQvAHEykkmrO2/Wuakr8OSg
 nzWNNU3YyST65ze07vjtZAg6rqbBTt8Rxs3QnkYSWf7S0FKI/sfmaV91kTd2Q1Z0Pa17
 gDmg==
X-Gm-Message-State: AOAM5338KkUrleBDuF7P/Ctb71srVBZMVgw+oNtws74DEgqHPhkOHM4P
 u+2UogNMXFsjDlbrloYSZH6USyseh2xmBg==
X-Google-Smtp-Source: ABdhPJyxErrqUNIbl3ufl63YmhrgMBj22F5NgK82LrSYR9RWfuUItADq+fOBpq2YFCJauOx2Er1iyA==
X-Received: by 2002:aa7:9041:0:b0:507:9219:ce61 with SMTP id
 n1-20020aa79041000000b005079219ce61mr8545536pfo.30.1650220224642; 
 Sun, 17 Apr 2022 11:30:24 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/39] os-posix: Use qemu_log_enabled
Date: Sun, 17 Apr 2022 11:29:45 -0700
Message-Id: <20220417183019.755276-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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


