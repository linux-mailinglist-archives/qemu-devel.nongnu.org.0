Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE3E4E8126
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:44:41 +0100 (CET)
Received: from localhost ([::1]:47198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6id-0001cf-Vu
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:44:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qe-0007Me-24
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:05 -0400
Received: from [2607:f8b0:4864:20::c2a] (port=38733
 helo=mail-oo1-xc2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qc-0005Ni-Lf
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:03 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 v19-20020a056820101300b0032488bb70f5so1783278oor.5
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KQ2Hs1fcPO+xNkXsj5Tr5G1f8x8slUJxiO5yDeUu3l4=;
 b=ofby79uCP/bmBC59WvrK2z2MWJPkO4+HYsTugTZVeQXakzc6dlyN+d0MskEFFpew5N
 RHVIH1dASecnf7PPF27jGOf7DEzlIW6VADNCfqrL8CQZ4sTivhjD/rHH08K0K4aRm7JL
 n9ckgS7Mn3MqNxI86K3f1omVT9FyjApjo3ACsPNU3B9c06U9xcf5vO/Vqos8W7/ckneN
 EqFveCIF4X8SQ831L8CcSdKLrEfsXHIPEgAJRQhzgySgt91i6tG2CQsz32itnvZCo2w1
 CUZbJsHXLhJ4XoxQzdrk6ZFIyXfwQcx6RqRuWG5DFFco9MqrUTzLCXeQAcsr+1CirwGf
 ZQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KQ2Hs1fcPO+xNkXsj5Tr5G1f8x8slUJxiO5yDeUu3l4=;
 b=PXC24XqsDFzGsLBNZ/JutSXBgRG9Q6AzVyWelkOxaZIJkdM2tTmx4Rnrn1VJsOnDQ2
 FHFQTN+6+JiN/ANIBZ8hHnO66Qr6SYdtXItU9OGp2v8UGteRuYz/NjMrf3TzUh57mB0L
 P2dzODLjPOwctdKAVoyYwhJK9420mMCmyGMOmJBTS1lN7tkxp6OozZYsFEh/oXy/ZqXf
 qTjd/IJKhwfbJJIhD7TQqY0l3Cb4cawBVwxNcy336TOYiGj5M+jFIxvGn5ZG3wu9duCP
 hYf6lw1jncoHXn5+SWBxhPZPjfe6Pte8B1t6ateSOOfECSyYY4PvSEgfSRMv05ACdz4a
 H0qg==
X-Gm-Message-State: AOAM531FHSTyntbP7/3FBdwV4J7tyhvmIEfevMpQd+n2y+vQRqzlAAIG
 4mNtV8b/XpVz+JrmUVsIzMh2KpOjT8nlanAL
X-Google-Smtp-Source: ABdhPJx37KXKPbZvJMgvtcbPOdWd+U9MXJ82DXEIL/kMYplIr3zBBDnR+mn//93+XlYmKZj9MHBL1Q==
X-Received: by 2002:a05:6820:350:b0:320:be2b:4fb8 with SMTP id
 m16-20020a056820035000b00320be2b4fb8mr5719283ooe.2.1648301161579; 
 Sat, 26 Mar 2022 06:26:01 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/39] util/log: Remove qemu_log_vprintf
Date: Sat, 26 Mar 2022 07:25:05 -0600
Message-Id: <20220326132534.543738-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2a.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is no longer used.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
2.25.1


