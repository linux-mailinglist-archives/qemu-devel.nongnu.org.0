Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA725308148
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:45:12 +0100 (CET)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5G2J-0007qq-Rm
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:45:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzQ-0005XU-2S
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:12 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzH-000897-Lq
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:11 -0500
Received: by mail-pj1-x102e.google.com with SMTP id kx7so4731488pjb.2
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XRNC7TN62/mhJ44h4TxsBn3p8qzX1+L1EKv8lKpxGuM=;
 b=vblZAsOEFd82DGYDOVgYbHn0mioP2LeWtRtyFGs/MRXk8Nth5Y3ZGqgUJ92pJkjLgS
 vER9jA1vigrP+IkeDmO7lndLQc5oVMQbOj7w2OSJkckTrK3PV6Rb7Dg+ARBzrgU3LMld
 de7FT484SRvm4vGGUCTFjAamPeHgsXoaf72TOE481v/kAJIRv8S7dXskl10kJmuafyeq
 Cqv+iPTHYb6WPE1W0UOBp+aLj3leOnJ4owhvpoiodhO5r6ruAzDgDsC8hU7rnHWNXQ1/
 Q+57NHLDo1GIZjSMiErfJwGpxRuuMvwEvfoV4GgFRu87P0oXsAj6XRZpW5HVDYKzCwc/
 Hthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XRNC7TN62/mhJ44h4TxsBn3p8qzX1+L1EKv8lKpxGuM=;
 b=gyQKHrWChLbdiq+ZN8VIQU89nG4iMNG8uiWiqO4ci1T/3ONg5kAv/F3LXXujTzGqpp
 vXsrjowfZIE3xq+7Kx+YvV4jb/vCPTjhCZ6Tv6uCAMLXt0EkpDOwpBEdSOKJkkEcFInM
 i4H3BHEFTX3SlhAntlMLKCSInR9HGfpqYvAMebEIqebTlXWXKYr9bU70xk0xpsIjkR6W
 uZp37DYAP0O9PQndTBIs7na2hL7O/Iu+Db5Eo0eiM9IEZZ5BLsXoiiKi4QWO2vm6htIS
 w7geDCJX3Frb/BgMLnuzwg7p9ILL/XqeXC1MT5NEpxxKHSgBZU0kfwcFk6x2AYZ7hvq6
 FCbg==
X-Gm-Message-State: AOAM531sFtXtOHppJHkMVKqpHeLbZYiTsy2KWvS2Pyn4xdmNAtsE8DPp
 WalYZmktTj8LE8LY+QQWSYG7BWLZwb5sdOP2
X-Google-Smtp-Source: ABdhPJyxedohV9pkYYBJldole0kJTRHzkVUkCrydk1cK9jVB4La+8zw5cXIyPCv53IzsjVT+N9uADQ==
X-Received: by 2002:a17:90a:7e2:: with SMTP id m89mr1522901pjm.2.1611873721204; 
 Thu, 28 Jan 2021 14:42:01 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/23] linux-user: Fix guest_addr_valid vs reserved_va
Date: Thu, 28 Jan 2021 12:41:28 -1000
Message-Id: <20210128224141.638790-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We must always use GUEST_ADDR_MAX, because even 32-bit hosts can
use -R <reserved_va> to restrict the memory address of the guest.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 4e6ef3d542..e62f4fba00 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -72,11 +72,10 @@ typedef uint64_t abi_ptr;
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
 #define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
 
-#if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
-#define guest_addr_valid(x) (1)
-#else
-#define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
-#endif
+static inline bool guest_addr_valid(abi_ulong x)
+{
+    return x <= GUEST_ADDR_MAX;
+}
 
 static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
-- 
2.25.1


