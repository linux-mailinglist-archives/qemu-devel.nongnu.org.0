Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80F4508F38
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:15:59 +0200 (CEST)
Received: from localhost ([::1]:49978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhEru-0006Xi-Vz
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEiv-0005f5-5Y
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:41 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:38404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEit-0001Es-Dk
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:40 -0400
Received: by mail-pl1-x62c.google.com with SMTP id n18so2516162plg.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9kNrYJBefDhwrAwQum1YSp9+GWqiN1kEakCqoDTb2v0=;
 b=JTDAHtHVs3LxKpd04ZztjV8WW/iYOnPZSszGwFgVX9xjjdMWWExqyqqYOQjaKhCNoE
 leEBbFjF7VTmhaJFe4TC1RPJl0YoJ/LUOsrSzlWEqeDbjhuyklAP57FeCMxVZKATjO6l
 mO8gumgleMSED3SzDSMeWjqQDHVvcrhCv1VmlF9VpN4gNgqu/NF/b6PDQH9IKy9JPA6I
 4ODnDvO04X+Cv+a9lbPe9kBShImzT2vAYzmmhsRbWMMm852+Zv4viqpAe+6gMRHxMdXN
 OMG849O5iGIyyQujlJmy9yP2A28ZAtfXsNQJd2ebpdmxir/OJQoIaXTIsnomy171aW/M
 l4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9kNrYJBefDhwrAwQum1YSp9+GWqiN1kEakCqoDTb2v0=;
 b=DISnA4a+Fv79tZKckRawYRBalRHESybe7hyEIO25QBKDdhM4aCCmmq2/tTWp0xw19/
 tKCnuWbEfxJOOhM3ie6ISgVmxftoOz5Ye6lra+JFv6/G8VcQUZ4RP621D3jLGfWTfYuc
 OQ/FdjHH0gzwtlz2tV9LwCNuPx0njxczMk24hlefVunBPEzdJUNGS27BdulJBGPtS1rU
 YpmaVieguDwr+GpvLj7Ar/gHeryvHgxvbgPuw9/bOBj1Mjc+6Fpukde30WKKyEZdyWct
 EfM64WZZgbgNUq40mq+Esx/tVAj6DTIiEzpQhyBy1DU9QZ8DICqesBE/xXJaLuooHAJW
 uzmw==
X-Gm-Message-State: AOAM532Izr8Evh+a/KknHi+2GAr3YYChAWMOzeKtRIt/DJ0L3cNtn/Jx
 0ba+qfuwo1hGOgHw+zTySssi0uPlN8jYhQ==
X-Google-Smtp-Source: ABdhPJz9u1jQdDhJ0rTy8OvQjYu7EObDwRMesRPtlnVHGcuR9wC57J2ATYxIArTWSIoYGi7SjHwGnw==
X-Received: by 2002:a17:902:c941:b0:158:f9ca:7769 with SMTP id
 i1-20020a170902c94100b00158f9ca7769mr16257031pla.161.1650477998172; 
 Wed, 20 Apr 2022 11:06:38 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/39] util/log: Drop return value from qemu_log
Date: Wed, 20 Apr 2022 11:05:56 -0700
Message-Id: <20220420180618.1183855-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

The only user of this feature, tcg_dump_ops, has been
converted to use fprintf directly.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-18-richard.henderson@linaro.org>
---
 include/qemu/log-for-trace.h |  2 +-
 util/log.c                   | 13 ++-----------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/include/qemu/log-for-trace.h b/include/qemu/log-for-trace.h
index 5e41517227..d47c9cd446 100644
--- a/include/qemu/log-for-trace.h
+++ b/include/qemu/log-for-trace.h
@@ -30,6 +30,6 @@ static inline bool qemu_loglevel_mask(int mask)
 }
 
 /* main logging function */
-int G_GNUC_PRINTF(1, 2) qemu_log(const char *fmt, ...);
+void G_GNUC_PRINTF(1, 2) qemu_log(const char *fmt, ...);
 
 #endif
diff --git a/util/log.c b/util/log.c
index 090bc3bc39..2bd4dfba1b 100644
--- a/util/log.c
+++ b/util/log.c
@@ -59,26 +59,17 @@ void qemu_log_unlock(FILE *fd)
     }
 }
 
-/* Return the number of characters emitted.  */
-int qemu_log(const char *fmt, ...)
+void qemu_log(const char *fmt, ...)
 {
     FILE *f = qemu_log_trylock();
-    int ret = 0;
-
     if (f) {
         va_list ap;
 
         va_start(ap, fmt);
-        ret = vfprintf(f, fmt, ap);
+        vfprintf(f, fmt, ap);
         va_end(ap);
         qemu_log_unlock(f);
-
-        /* Don't pass back error results.  */
-        if (ret < 0) {
-            ret = 0;
-        }
     }
-    return ret;
 }
 
 static void __attribute__((__constructor__)) qemu_logfile_init(void)
-- 
2.34.1


