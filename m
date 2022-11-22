Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799866348DA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 21:59:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxaKy-0007I0-6Y; Tue, 22 Nov 2022 15:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxaKw-0007Fv-EA
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:57:46 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxaKu-0003T9-UV
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:57:46 -0500
Received: by mail-pj1-x1032.google.com with SMTP id t17so13558392pjo.3
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 12:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=inptdBB5bfU6n6sZF4IxEdTaQ5K/wEiaiS+O8bljutE=;
 b=SrPQz2C4tokJp0Kcs7tRI81TqlliCEkzhj7h3JyaqxmLvhY3toCZZP0OL6yeUiJSB2
 jKBU1IrPhGzEZuqW4+QCFiDOQ/70oArQ+HrXpea/2+kfl/1Pc03xYbb7++iP6lPBuoEX
 cmHMgyE5RFPrdXBEEi0WNSyuZjNHfpnCAkrrJNCqiP+02FQ0DDbZlW10mVzXjz07SCbI
 g0yNHK90gq7dEQVt6FGHUHb5APQFfB6YDl4IM1DBBAqami8/2bvzZxTaayIbL4HPIzsb
 pe0d+dMMEJGxV2DkWpsXksT3wkvG4Bv1CnpVa+IFOs5FY3y0Tj7eEPLBp+NSAYhzpDfT
 OSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=inptdBB5bfU6n6sZF4IxEdTaQ5K/wEiaiS+O8bljutE=;
 b=GOyfRebJjuQRGzrxf/e8nAJkUaxUPLdrRSxqGA3nNnPh0c0MMNJEePfqJzo09TGkKI
 wvtO2jbT2bCuPO6F+wN9VY1yGyzUDH5c9JYhetmlD1VGFWGtPS65fYSlHk+vkA3fLtj9
 AqqPxLX63s1YXFwwXp0AAF1GMHp7Kr0LQeEDmZqo4PQofPQ+SZKvkm0IbX3BZscmQU54
 8MT52bHTU2ffqOhik1Q19utv4ABKV54nTaXacbaUdduc0QKcU+1aZdP4OU0tSmzGgE/q
 4BQuRsXgQO3GsfyCR2Aveu5IAeKpcSqfN64lWSuVn+AOJFTgsC+kvxWbFgHqY7yCQ3eZ
 QVFA==
X-Gm-Message-State: ANoB5pklZzJ8Ey2VnQz/T0RECoI4m/XBhQNolBcTIoDN+buwZ2EMXo7X
 mPsEhQi/74tZ7cTCNpYWQF14whPjWS+H7Q==
X-Google-Smtp-Source: AA0mqf4AFQv1t/jXa6MCkhLuCcKFxa7XKOKAhePmGCDs0XSJT3qv63+57CxdyerihKS8l++qh4/6Vg==
X-Received: by 2002:a17:903:1ce:b0:186:a2ef:7a69 with SMTP id
 e14-20020a17090301ce00b00186a2ef7a69mr6020609plh.77.1669150662553; 
 Tue, 22 Nov 2022 12:57:42 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90f5:6f8b:e78a:4a0])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a170903209300b00186fa988a13sm12383807plc.166.2022.11.22.12.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 12:57:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 1/7] qemu/main-loop: Introduce QEMU_IOTHREAD_LOCK_GUARD,
 WITH_QEMU_IOTHREAD_LOCK
Date: Tue, 22 Nov 2022 12:57:33 -0800
Message-Id: <20221122205739.603510-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122205739.603510-1-richard.henderson@linaro.org>
References: <20221122205739.603510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Create a couple of wrappers for locking/unlocking the iothread lock.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/main-loop.h | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 3c9a9a982d..73c60a9af4 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -343,6 +343,45 @@ void qemu_mutex_lock_iothread_impl(const char *file, int line);
  */
 void qemu_mutex_unlock_iothread(void);
 
+/**
+ * QEMU_IOTHREAD_LOCK_GUARD
+ * WITH_QEMU_IOTHREAD_LOCK
+ *
+ * Wrap a block of code in a conditional qemu_mutex_{lock,unlock}_iothread.
+ */
+typedef struct IOThreadLockAuto {
+    bool locked;
+    bool iterate;
+} IOThreadLockAuto;
+
+static inline IOThreadLockAuto qemu_iothread_auto_lock(const char *file,
+                                                       int line)
+{
+    bool need = !qemu_mutex_iothread_locked();
+    if (need) {
+        qemu_mutex_lock_iothread_impl(file, line);
+    }
+    return (IOThreadLockAuto){ .locked = need, .iterate = true };
+}
+
+static inline void qemu_iothread_auto_unlock(IOThreadLockAuto *l)
+{
+    if (l->locked) {
+        qemu_mutex_unlock_iothread();
+    }
+}
+
+G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(IOThreadLockAuto, qemu_iothread_auto_unlock)
+
+#define QEMU_IOTHREAD_LOCK_GUARD()                              \
+    g_auto(IOThreadLockAuto) _iothread_lock_auto                \
+        = qemu_iothread_auto_lock(__FILE__, __LINE__)           \
+
+#define WITH_QEMU_IOTHREAD_LOCK()                               \
+    for (QEMU_IOTHREAD_LOCK_GUARD();                            \
+         _iothread_lock_auto.iterate;                           \
+         _iothread_lock_auto.iterate = false)
+
 /*
  * qemu_cond_wait_iothread: Wait on condition for the main loop mutex
  *
-- 
2.34.1


