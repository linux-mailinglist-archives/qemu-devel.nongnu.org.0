Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AC530E368
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:40:48 +0100 (CET)
Received: from localhost ([::1]:45838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7O18-00064Q-AP
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOr-0007UO-RU
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:13 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOY-0001lA-Gb
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:07 -0500
Received: by mail-pj1-x102f.google.com with SMTP id e9so249390pjj.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fn8MU8GbKbZO5LXUa5nQVZBY0gRxILng7WcRszBxkV4=;
 b=ssit2A2aO7H376GkOS/W4kNL27OyYD6h1Q6pHa+9svjaNYnLYIqB+cwP2Iyn4DrCbR
 OKlH7nwnpyWG4l8oQUW5DbNc77P4Fu+teS02HxC1vxsIGAxw/19QxtVpd+dHTTDV7jRq
 d+b0V5PVJutHbsZMzC6TkNjG66gYtZrUex0U6SU7CwOVWB7ITL7IlXCoPEGdbRsH0Ylk
 874dBg+1uho/Yg7S58JET7HLLnlufqMWbZx5GdYCj5n6zddKCPJcKrdeUL1gUuLpO/Iq
 rZs7ke22CfryIu/pQRVKpBVGFVgC7lMO4WXBagWA0O2hf3zKMRQBBDvrGHwvb69tmc+d
 xIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fn8MU8GbKbZO5LXUa5nQVZBY0gRxILng7WcRszBxkV4=;
 b=hx84rX+Z/oNtcnj8u0AVP0JQj5a89c9fO3rUYPF8Q6lulKRUd5dOhpjPtAomThqNED
 fZ3ZYjAi1J4b33wlRo+cQIkiyHudN3HeHELNWR32FFldRTbQLijlQCS+te+D3v2AIp5k
 y3fU3ifUFzTciCiWutiXrAHGV8sVH/NVPJXshpGeHDJta/GYOsoU6I7miXxESrw0wzw8
 JVNiv+0gv4exS1upAtRA08NPzDXoXwHJkBjimx2TC+G1tbi5rl/QzQKWrWaDGWgv0XSg
 l4LIX17+Igf2KmiRQ4UUOKqmg4FIMml57AUpicxy6MX8TNTmV8fiTyCP9BjUzivmcHSr
 WZ+g==
X-Gm-Message-State: AOAM533OaqvXhB+CiPfpwID8ho9DXARDCxGANrrdF1iKDMrIsgGoHB6+
 HXnxIecO3T5CPmgdu6wCgHvqxI0iHeWJKSFC
X-Google-Smtp-Source: ABdhPJz02prGZlbonB8xWDgOmJNMe37iPNpyzAhx1nGXzX5AkRXGxRY8/oUS/QcvKi/q/PVPdfjqzg==
X-Received: by 2002:a17:902:102:b029:e1:2a4c:61ed with SMTP id
 2-20020a1709020102b02900e12a4c61edmr4499565plb.61.1612378853164; 
 Wed, 03 Feb 2021 11:00:53 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/31] linux-user: Handle tags in lock_user/unlock_user
Date: Wed,  3 Feb 2021 08:59:58 -1000
Message-Id: <20210203190010.759771-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resolve the untagged address once, using thread_cpu.
Tidy the DEBUG_REMAP code using glib routines.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/uaccess.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index 30d01f8b30..c696913016 100644
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
-    if (len > 0) {
-        memcpy(g2h_untagged(guest_addr), host_ptr, len);
+    if (len != 0) {
+        memcpy(host_ptr_conv, host_ptr, len);
     }
     g_free(host_ptr);
 }
-- 
2.25.1


