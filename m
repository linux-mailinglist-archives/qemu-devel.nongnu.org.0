Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F19731CE2B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:38:24 +0100 (CET)
Received: from localhost ([::1]:49666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3Ml-0004ob-CC
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32x-0008MR-8y
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:55 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:53114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32J-0002S6-FC
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:54 -0500
Received: by mail-wm1-x335.google.com with SMTP id l17so9579098wmq.2
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UlcX36l+UoGhghkEb4MsmEOls0sHOtriGCkjp38bShg=;
 b=uG5UhkLlR6GOWM2yTL1SCAFzKW9489baz9/1luIKIuO42M7wMzUszR1RED+0F3yMiv
 13qvUdD9anKEHcwxk9fkPUbGK/Z1BZBJLWEPN4chwH8LDnGfTgTygNwfX6KEweGAflII
 42rpMAicO2cjK6wdDoK+OQfa/rbLMnSY0aLdmBjkxeQrZQ8bJJZeKGnHPMJKA05gJ/Ze
 yKCkV1yyPfkzbNEnwAN6OT0uwJhFEi+1ZFJ6RPxaftlMccQURGn7zjniJVW5mFnLlxSS
 6kjm7GRFTPwJgCKPZKQth789a5AwctbhR7v+cIyg9lMWXrxvgIodkoSVo67wuEERg/X7
 jKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UlcX36l+UoGhghkEb4MsmEOls0sHOtriGCkjp38bShg=;
 b=j5O07mpSU91yab9nDV5dng9bLUiGS5mnBEXgDrherGbq/iXx1l9xrbk0nnPAVE1sgM
 Yy9YQRb+EgK8c29VNmJTOjOtKCuiT2QE5N/GwCNyGI41QjGZPQsH6btqWSp7hnmAuiO5
 owuhdaRefweaFOuL+dnBRtvn4sj9CFDumdamEJhRQp+/YLQbaLMXwm/mlNcuMU+CVdBt
 aqEdRsCuETKlYGhECG5gHOvRt4UbO3cPgF3KaFvEKR6tCbJ6fjUqRMfNVJnWBTloqlcG
 ODQjSO5gkDlRO3mikmJuqq+narsuW/BMBUcOpj+JhkAsrbFAYPH70VKnL56TWMs6a13P
 ONqA==
X-Gm-Message-State: AOAM531Ez4YFaoOyvfCNJZImmyN2dweqR8kM3Ck4fyJmYnUF+KMSKbKE
 JHPfak8FzOAzc4Hrzwcjc3WMT6Zl3TJg9g==
X-Google-Smtp-Source: ABdhPJzGW66RNtInjYWOJaj5WGJyC3OKmckOLZUi0IDNrZYRsEJ66A47B5HZsju1zBC/Rm18z/CkYA==
X-Received: by 2002:a7b:c206:: with SMTP id x6mr4067714wmi.48.1613492234075;
 Tue, 16 Feb 2021 08:17:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/40] linux-user: Handle tags in lock_user/unlock_user
Date: Tue, 16 Feb 2021 16:16:37 +0000
Message-Id: <20210216161658.29881-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Resolve the untagged address once, using thread_cpu.
Tidy the DEBUG_REMAP code using glib routines.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210212184902.1251044-20-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/uaccess.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index 76af6a92b11..c6969130163 100644
--- a/linux-user/uaccess.c
+++ b/linux-user/uaccess.c
@@ -6,36 +6,37 @@
 
 void *lock_user(int type, abi_ulong guest_addr, size_t len, bool copy)
 {
+    void *host_addr;
+
+    guest_addr = cpu_untagged_addr(thread_cpu, guest_addr);
     if (!access_ok_untagged(type, guest_addr, len)) {
         return NULL;
     }
+    host_addr = g2h_untagged(guest_addr);
 #ifdef DEBUG_REMAP
-    {
-        void *addr;
-        addr = g_malloc(len);
-        if (copy) {
-            memcpy(addr, g2h(guest_addr), len);
-        } else {
-            memset(addr, 0, len);
-        }
-        return addr;
+    if (copy) {
+        host_addr = g_memdup(host_addr, len);
+    } else {
+        host_addr = g_malloc0(len);
     }
-#else
-    return g2h_untagged(guest_addr);
 #endif
+    return host_addr;
 }
 
 #ifdef DEBUG_REMAP
 void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len);
 {
+    void *host_ptr_conv;
+
     if (!host_ptr) {
         return;
     }
-    if (host_ptr == g2h_untagged(guest_addr)) {
+    host_ptr_conv = g2h(thread_cpu, guest_addr);
+    if (host_ptr == host_ptr_conv) {
         return;
     }
     if (len != 0) {
-        memcpy(g2h_untagged(guest_addr), host_ptr, len);
+        memcpy(host_ptr_conv, host_ptr, len);
     }
     g_free(host_ptr);
 }
-- 
2.20.1


