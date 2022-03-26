Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546044E814A
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:03:13 +0100 (CET)
Received: from localhost ([::1]:49174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY70a-0005m8-DJ
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:03:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qw-0007VV-J4
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:24 -0400
Received: from [2001:4860:4864:20::2c] (port=45853
 helo=mail-oa1-x2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qt-0005VM-0N
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:22 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-d6ca46da48so10699303fac.12
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aDLKHovI8bxO2d9YjJwk21iI6jYdGi7gzankaymnjFw=;
 b=iJP4RDwEAHqJze+/ngkwoyGpNYqp9ae9Fq4hoWkXqnpIpHSZcUMrxAdKD9FTDHWRU8
 s9NyOYP9LXk6AlIz8VZycYZvLtzbqKb4gW2M2yQsm0vbqtex141DxvRnZdJcSimClcBo
 THkfIeCnvo0AtpQRSOImXr2tJUo3PxjsGctk8yFzUoNYon+FJRNo0AHCCb//ZXO5ydiN
 zRhb/07rF2+f0dKT9m5BbY6ic2/s2S9Dvhx9wlODId8hS+O6SeR5UtM9Hv7uIse2IzfL
 r9RJ4ja7ThXCFQqjQgrl8Xk+v0mKCD2+gVlQ4lhy4O1A6j6/sg5AGMTN12qi8SZ933DJ
 nJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aDLKHovI8bxO2d9YjJwk21iI6jYdGi7gzankaymnjFw=;
 b=O0IhjoA0goWHA4oQofncdxdYixXDUVxi2u7p161dQf0U7rzthZ8gVnoKSDEcthtaSs
 fpuBT1wxI0uHOAuCeYH3G3a88rZ2pWfQgG112HS3s+SLDCx4OsGq9scBOaUMzkrgUpJx
 1AK5lJtcNwbR6DEihl1wcABaTvwvv0kAs14qymgLDZne4OM67GoPl/hWum+zPW/CCQ0Y
 gBhnICgijG6qMOVpNfQXoImrK4tnVWaV7yaqT5VvLZe1YzFBiSxGvBLDBMAqyVRxoBi8
 g/1HUCxgyFlfHJY2BNNoIX5RNOqOW7I4ILvoQwCU/JBsvmi3kGaABR6ZfE2Ig5FxG/Qz
 QdeA==
X-Gm-Message-State: AOAM532lVikDdgPbvpV1jbG32pLr0rxjdwR/SuzCaAvkfiaTk2hJMxwU
 9MtucnMe7fU9YsTXc9UcoJTuyPYHV46xnqHa
X-Google-Smtp-Source: ABdhPJyllrpK756Cshvv5df9dHdTJ8O+Kzwd6amZ7IHcw+tVziofnnmA+hD7OCWxzD0G+Q2qZH4RCg==
X-Received: by 2002:a05:6870:4341:b0:d3:1412:8ecb with SMTP id
 x1-20020a056870434100b000d314128ecbmr7282678oah.36.1648301175855; 
 Sat, 26 Mar 2022 06:26:15 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/39] util/log: Use qemu_log_trylock/unlock in qemu_log
Date: Sat, 26 Mar 2022 07:25:11 -0600
Message-Id: <20220326132534.543738-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2c
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Avoid using QemuLogFile and RCU directly.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/util/log.c b/util/log.c
index 6b7b358573..090bc3bc39 100644
--- a/util/log.c
+++ b/util/log.c
@@ -62,23 +62,22 @@ void qemu_log_unlock(FILE *fd)
 /* Return the number of characters emitted.  */
 int qemu_log(const char *fmt, ...)
 {
+    FILE *f = qemu_log_trylock();
     int ret = 0;
-    QemuLogFile *logfile;
 
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
-    if (logfile) {
+    if (f) {
         va_list ap;
+
         va_start(ap, fmt);
-        ret = vfprintf(logfile->fd, fmt, ap);
+        ret = vfprintf(f, fmt, ap);
         va_end(ap);
+        qemu_log_unlock(f);
 
         /* Don't pass back error results.  */
         if (ret < 0) {
             ret = 0;
         }
     }
-    rcu_read_unlock();
     return ret;
 }
 
-- 
2.25.1


