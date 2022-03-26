Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11C34E814C
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:04:05 +0100 (CET)
Received: from localhost ([::1]:52930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY71Q-0008P2-OB
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:04:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qw-0007VW-Im
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:24 -0400
Received: from [2607:f8b0:4864:20::230] (port=33751
 helo=mail-oi1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qt-0005VS-RX
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:22 -0400
Received: by mail-oi1-x230.google.com with SMTP id k10so11116612oia.0
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+xjD1qAJWzXfAAWXnNvtlNLURWCMMJVP8eMsZZN2BUQ=;
 b=qj0TLghBoERWaS6lk9Z96whqdlYNurZOH9bzyGmBHP4YCaIKWRYlV5mVKzosuzBbdo
 rE3EdoX/PKoACqoi5j+KUlQfXAioQr0ulMntiaTBEe1K5Zba/CH0mmJ5ZWkCv2+YISmj
 JlDeB/EBV1mlHSS2N+kKrrvf+fyZaJyeoNuq+mwMr+qrSZgTIbMDQryUElBQFfV/Q3xv
 ibMeVEbZcsrITCwFz7pRkn2AS8fkpP4jon5xv9zCEBlTBoPV4vCTPmSJmbMAumixXRwk
 5HPxXq865oq8Xbh5v5GblymRLHJ9SETw3/5HvTdZMDyD6a23AU5xYiijdt9jR0+tKCM4
 qBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+xjD1qAJWzXfAAWXnNvtlNLURWCMMJVP8eMsZZN2BUQ=;
 b=DHi5l84PKaE+vx8ac1bbFiKrvIUDN/TMF1qQrs1FoCUFNuFpiwu/72DM+TmzXg+etX
 kpDUgNXhxtWsMzWQ1eJoW4JJhana2LtYDxmdA30fSJyIq6b5zSUOPfcn01BvSPUfb+Ch
 y2+VQIFcVqaKvUlR0apWL9IOIRD5Sw0lIosLkfKd2xNviVDinIYDFZJbAcxQERuewDZV
 OVz/trBng5KhzSdVRRQdpgE//BVCWLWylzStZfq2hLHCyQ50kLRHzcDZEMJEBwhSeI6K
 Oj7tAzcbLOaAdt7sDDSazMPS49L58ncLv5Osd5g63544P7ipjXrtNLPLqZBGcG/HLPJu
 T8MA==
X-Gm-Message-State: AOAM530Lw/NI+8CFE/4k6LcqvDoHpD7fgMiF6WbrC8VXqcYeS/I+Mf0P
 jCSpGth/bkaP1fBzfatxVvF+umSGoTLEj/KL
X-Google-Smtp-Source: ABdhPJyAyLd6v1RyBtkf3fxys7CaqZkq2R3Dko4mlwHgW12gRl/bV6FUbR0jK0fU+qCjX9b0qZRR5w==
X-Received: by 2002:a05:6808:164e:b0:2ef:8736:8eab with SMTP id
 az14-20020a056808164e00b002ef87368eabmr7735829oib.208.1648301177088; 
 Sat, 26 Mar 2022 06:26:17 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/39] util/log: Drop return value from qemu_log
Date: Sat, 26 Mar 2022 07:25:12 -0600
Message-Id: <20220326132534.543738-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::230
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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

The only user of this feature, tcg_dump_ops, has been
converted to use fprintf directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
2.25.1


