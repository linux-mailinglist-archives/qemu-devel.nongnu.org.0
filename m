Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23D8315ABC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:12:29 +0100 (CET)
Received: from localhost ([::1]:36982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9d7M-0003um-NJ
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:12:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cy6-0003nj-Ru
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:55 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxp-000807-JL
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:54 -0500
Received: by mail-pl1-x62d.google.com with SMTP id k22so209155pll.6
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bAoMyMlDDlghVnqeNID447NiBs2PzgjWNFYjdCi+4Lo=;
 b=K3ofKWjWLdp/m9OxSoCUbAao3inlth94j2jr9apUj95Sczf/7Wy/y8k+GzDQz1dF1F
 ohO4XWFwMHwITKYo4ikypx8z6HQhHoytlUpnSWMtkc3efSw9r75Vsj98udb6+rJfDNb2
 NgMPiV1PzwvnMMn4hwwgemDPY0uH+0uxS6ED2pLwN5I9gqdzzgxv8y6ORFWJLq1kEK5h
 +ndVzxgYEO4hI5o+fR4hA+929x1F3JD7tgUwPSZG0+zLp6FJ9cW+APzgeVzz0qJHNxZx
 nUa7lljCcvHz5FggOXimYsnSt11tit7F/0iLuxBu3BR14vvNKzduiWpiQzZ0LGu6btyc
 cNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bAoMyMlDDlghVnqeNID447NiBs2PzgjWNFYjdCi+4Lo=;
 b=UYQwcYNXUEDVASbH6TuerqAb/BrY7CZ4RbHnT7+UOVrvtj/UOKniHtA+yWY4kGsnbK
 PDGmNmuFglCAOZGUJIn5PiEC9CSuxBB8LRiOnU54QujjhdGtudtBE7ZnjhUE2oHxm4gT
 Jbx+lkFd0QeSXdMCiIY/F26GALSbr9Ac7UtGGgaynSRnoZ1xVl6tobKFoBCBQ2H/4MId
 cv2qMvVz0K9nmS3OgUNVm/uzK7bDAPoRsczVNYDsU9Z+UHOUvdJqa1OcJnuCCOc/ONGF
 9GjBTA08h2mR9OrcrqFetqtJE5sA39cCMT2UpiHzsifiDmd0EnLTXqnygR3M6amX+wBY
 QvdA==
X-Gm-Message-State: AOAM532DFrKetktZ5LE/4CHuxq5r5XYhkHnmwpOUTgRHrxQH8bf7+Nex
 XG7deBkbTb7ysKP9sN8Zdh2c9JevUVpkZg==
X-Google-Smtp-Source: ABdhPJzuiOUzpy9FwmBu978cA+yJ4jNqCUoYVM3wvD8+Fe7GVgrnjwS5VmZ97YLiaAFpF6+whzJluw==
X-Received: by 2002:a17:90a:1f86:: with SMTP id
 x6mr341906pja.135.1612915356343; 
 Tue, 09 Feb 2021 16:02:36 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 09/31] linux-user: Do not use guest_addr_valid for h2g_valid
Date: Tue,  9 Feb 2021 16:02:01 -0800
Message-Id: <20210210000223.884088-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

This is the only use of guest_addr_valid that does not begin
with a guest address, but a host address being transformed to
a guest address.

We will shortly adjust guest_addr_valid to handle guest memory
tags, and the host address should not be subjected to that.

Move h2g_valid adjacent to the other h2g macros.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 5e8878ee9b..4e6ef3d542 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -77,13 +77,16 @@ typedef uint64_t abi_ptr;
 #else
 #define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
 #endif
-#define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
 static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
 
+#define h2g_valid(x) \
+    (HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS || \
+     (uintptr_t)(x) - guest_base <= GUEST_ADDR_MAX)
+
 #define h2g_nocheck(x) ({ \
     uintptr_t __ret = (uintptr_t)(x) - guest_base; \
     (abi_ptr)__ret; \
-- 
2.25.1


