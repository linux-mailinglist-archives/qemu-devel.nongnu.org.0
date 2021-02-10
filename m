Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B46315AF1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:21:18 +0100 (CET)
Received: from localhost ([::1]:54358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9dFt-0003xC-8m
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:21:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyQ-0003rO-98
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:14 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cy2-00085M-4w
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:13 -0500
Received: by mail-pj1-x1033.google.com with SMTP id z9so105190pjl.5
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PjicE7DhBsN4Sm+TSOb8KXSIz6Ok4GKYojVAov9pqKE=;
 b=CB0Kse17yz7ThVR+YYEeb/GvU8u8xBocx9tEg/4ZZzbDYrXZ7YGclu0Erj6+2bKPFs
 Omna6U0+omL3BtSOFFktP86prgXyMUO63hixeu5HZqtkNuywNphgclA7bYKGNMZzALcb
 UkNGTluL3MNBDDtSDEicRcS81EE4MLibolP1mT/DNtTvR/uUyl1jcBqfkCFHu4ErWPhH
 NluB9SKTmLvH4DDKG+tTaVCJ7EFGRn/DUDuTh2612kR5k0dbxOSMDeMXsysw3reGGhJv
 ypCVcROVc2Mza9+E43vDiFevaW6NokLdOwEkOhsNVtp0fn/KEHvIgQkz7Mtcbffe3ExL
 0Ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PjicE7DhBsN4Sm+TSOb8KXSIz6Ok4GKYojVAov9pqKE=;
 b=EgjoNQ0lUO7uVrsxhcEdAf5r4ozqW0lewTVYIoX91+dVQT0b7GT38cMQZXuVFrUrcW
 A82mnzxXCK8fOdOPW6ZTNIjdt+JZs0BaTECjffeo3SmMtIRq5B05VgRGgUnxhixYhqPR
 sw6H66iWDrrPY+O5/18Mi+b8nCWva+QJF9QbVEmEQWCBhT/8YrnzHAzwRDwXr5+UD5LJ
 XOXviAvI+EKuWbDDgztWyCkbXPNUWUyLOXUxa7wuqL/Pt6VAX5uILN8YPDfkxty7W7EO
 xcxcHIJgS7Ts9Sy0P4xMPcjQvEraFJt07xxcGpT9gOJPM+cwlt6kOLNNdTgjSRS5SSID
 bRTQ==
X-Gm-Message-State: AOAM531c3ooj7vD23juX+SaJ2wNHdThFgYHS3NQA/9ZMhxeDlM/TCWu5
 IRoTr0AyDxUdULlo2G2T4yD87p1e8BP/+w==
X-Google-Smtp-Source: ABdhPJy75dYGErJ+7lSjKTJGbDO1IaUVUoGQtF+UF1Xa7gIVNt3wlJIDfhVLcJ5d19NxKay+Kp8g4A==
X-Received: by 2002:a17:90a:ca8d:: with SMTP id
 y13mr388628pjt.76.1612915368830; 
 Tue, 09 Feb 2021 16:02:48 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 19/31] linux-user: Handle tags in lock_user/unlock_user
Date: Tue,  9 Feb 2021 16:02:11 -0800
Message-Id: <20210210000223.884088-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resolve the untagged address once, using thread_cpu.
Tidy the DEBUG_REMAP code using glib routines.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/uaccess.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index 76af6a92b1..c696913016 100644
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
2.25.1


