Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B1F508F4A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:19:15 +0200 (CEST)
Received: from localhost ([::1]:60500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhEv4-00071C-TP
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEio-0005OV-7P
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:34 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:44610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEil-0001C7-No
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:33 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 u5-20020a17090a6a8500b001d0b95031ebso2758211pjj.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DibATXdAjww5C4SYG+noyUZdVK5yQkHcWdp7MeNDn0A=;
 b=H9yPuw9UxTQMpll5riSAcmd8AixneLGQZQy7/8RHWWqdzwJ3pZQfDF6a/KcLia0DNr
 vCrQuqaGKL3yVjNJLmKGeFzXCBy1WEd83z9dxG5GeDUReHa63a5PpMRSjzY67zT4lm4+
 kftUOBRDIKhhFhl+tfKSRMJvzuFZzFwQu+UNVcWL66uJe6xKAdYMRVeWvqomWIwAlea6
 slxF70sjusVTMvC8T4iHDVkbKmQkqr7q68iUEaT9bxQxUkALSJOEZtZOslCdfb+oFIVs
 64x0SavW5pmzaAuTeEh+3+K/5yXJ84wTMjKGyPVAE1kLub4bxyRupfOkhN8FU91AvfNd
 MhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DibATXdAjww5C4SYG+noyUZdVK5yQkHcWdp7MeNDn0A=;
 b=WzeFW68R36HKVn6XB5pcJOdjedr+hkSqDicINPJwexnsQ4EtUlPBkQNLgxF+GVthT6
 mrszEZO7TLqapov2z+KRE3YxiLgrovRG5HoqgzatVUsRMvW7dGhpl9JJX4wZrL0f4wI3
 NUp4FhOUMIOuUl5ZRAwPeBl3ES81CKu46CqU1wXf6U5ElsOtB2FIv7hbYWZ0WDklrXTc
 XhHN7G1Mkykg11WjCQ/Qq5ottyoNbOr+fFfsw7s8Y6U1vJaIpYqmCm5hs9gYRQP1ZXTg
 NJjpUKT9EIxkB5ZJVajWOCOIRL1Bkln3as4/Fn5mIKZdAOjZwT10CKIT1FAb9e1glitr
 O3YQ==
X-Gm-Message-State: AOAM530K9TF/D6prtP4pqplv5ZxvVgIOU+aW/S2spEeC+fkcIMujAufw
 IYmA2RaJ31fNfwseWwE701Y76+d22pl2nQ==
X-Google-Smtp-Source: ABdhPJz/LrwDFwyc4b2Honk/eNvw06yS8rVaG/NQaRgkGTA84eJXeXEDkIbimxePMm7D/WnLlc/x3A==
X-Received: by 2002:a17:903:1c8:b0:15a:2088:848f with SMTP id
 e8-20020a17090301c800b0015a2088848fmr6636126plh.30.1650477990433; 
 Wed, 20 Apr 2022 11:06:30 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/39] util/log: Remove qemu_log_vprintf
Date: Wed, 20 Apr 2022 11:05:49 -0700
Message-Id: <20220420180618.1183855-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is no longer used.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-11-richard.henderson@linaro.org>
---
 include/qemu/log.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index d090faf22a..2d9455dc85 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -72,21 +72,6 @@ void qemu_log_unlock(FILE *fd);
 
 /* Logging functions: */
 
-/* vfprintf-like logging function
- */
-static inline void G_GNUC_PRINTF(1, 0)
-qemu_log_vprintf(const char *fmt, va_list va)
-{
-    QemuLogFile *logfile;
-
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
-    if (logfile) {
-        vfprintf(logfile->fd, fmt, va);
-    }
-    rcu_read_unlock();
-}
-
 /* log only if a bit is set on the current loglevel mask:
  * @mask: bit to check in the mask
  * @fmt: printf-style format string
-- 
2.34.1


