Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6770F294796
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 06:56:43 +0200 (CEST)
Received: from localhost ([::1]:41888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kV6B0-0005QA-Cw
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 00:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kV66Q-0000Hx-Af
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 00:51:58 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kV66N-0005ef-ND
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 00:51:58 -0400
Received: by mail-pg1-x529.google.com with SMTP id h6so744191pgk.4
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 21:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SA3N9GjtT4s1i7Kkd0zjmkxMwalccYhRusWSb9/Mo4A=;
 b=UyXacvEIfGiGTYWB1Gs7h73GmhwgiooKo1SOoNy4SdESCJ1SRuYAXfaQInnNqW5iJy
 xRzDqfrnmigOX0rCxu5QhAA9bVQXYcQ+ZRJymBZ2Dw0AFYOvQ6CwNKvEH4UpXhURs5TS
 1TD4gev4WdJDGB5jAlGz3MZGRfX4eKLOkFAeY1K7l0/r/IedoVnWgyOfbOqCUbURWoh2
 GIJiOHTh7UYupVr9RlM7o3WLWkvjs58DwVkz2IN0KaA3TQY8+849kGjKju2LK+/jr5Bv
 SyRTMdQJyMaR+rPIljmERLPC5YGVtEr31bYTK+HDZlAgRQMggyOnLKIhrII2qyUxwDB7
 y23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SA3N9GjtT4s1i7Kkd0zjmkxMwalccYhRusWSb9/Mo4A=;
 b=neyb6w43Cu0ydlvms7D0lOYdDjZ4obBs9SbO7raxqlv3WSo0K4jaHRxAFNRWDzADfl
 dNT2ryckYR6DbQof+b6ywG23jdUAm4lRMlloy6H5QkDcEkeiAj2CpXWbdqZlX//wvKYG
 P0n21s7L58y0vlfqsh4oP194eo0/p+xUb/yfKMx9qtRK+43iEt9pMQPkYZZZs3pUU4R6
 klt5bmgk0EeJJBGNR4bwwAJaQ+TlRCZJ7D2UCnEXKN3QBJwJhkz6dT9pZe1769+V+Z0r
 Zh7BxgE/CYoI27n4fyOJyqrTSTlJ5QSjB+mNz45eEppVIKO4VciPVYo7m9PuNUFVugRR
 UDfg==
X-Gm-Message-State: AOAM532+x2dIXwo4yMvhxJYr0t12a0YWXQoxQoj/ub+FFrn7GuNgRg2v
 VXHycplrTPHmKEvKidlh4odp0GfD8c1xtA==
X-Google-Smtp-Source: ABdhPJxaKtKnJMgL1t3RqdysS28donQORIY6c6CnOCBsMPi6J2jSMu6aIwxcSj8iM7f07EDdJ7DEpg==
X-Received: by 2002:a63:ca45:: with SMTP id o5mr1645828pgi.447.1603255914138; 
 Tue, 20 Oct 2020 21:51:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j11sm620070pfh.143.2020.10.20.21.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 21:51:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 02/15] qemu/int128: Add int128_clz, int128_ctz
Date: Tue, 20 Oct 2020 21:51:36 -0700
Message-Id: <20201021045149.1582203-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201021045149.1582203-1-richard.henderson@linaro.org>
References: <20201021045149.1582203-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/int128.h | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 52fc238421..055f202d08 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -1,9 +1,9 @@
 #ifndef INT128_H
 #define INT128_H
 
-#ifdef CONFIG_INT128
-#include "qemu/bswap.h"
+#include "qemu/host-utils.h"
 
+#ifdef CONFIG_INT128
 typedef __int128_t Int128;
 
 static inline Int128 int128_make64(uint64_t a)
@@ -328,4 +328,17 @@ static inline void int128_subfrom(Int128 *a, Int128 b)
 }
 
 #endif /* CONFIG_INT128 */
+
+static inline int int128_clz(Int128 a)
+{
+    uint64_t h = int128_gethi(a);
+    return h ? clz64(h) : 64 + clz64(int128_getlo(a));
+}
+
+static inline int int128_ctz(Int128 a)
+{
+    uint64_t l = int128_getlo(a);
+    return l ? ctz64(l) : 64 + ctz64(int128_gethi(a));
+}
+
 #endif /* INT128_H */
-- 
2.25.1


