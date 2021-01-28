Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FD5308177
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:52:56 +0100 (CET)
Received: from localhost ([::1]:39340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5G9n-0007I4-Cv
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzF-0005Sb-Ql
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:01 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzC-00086r-6D
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:01 -0500
Received: by mail-pf1-x436.google.com with SMTP id 11so4972017pfu.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VyGOgXRVYXE4KsV9afYsCBAI5eV0Qm7bovPtD8hErTQ=;
 b=y+nqzgfUpxP+MBupTlO6Fw47r3A/VRUS1Nz3V+loikx3SMBMSIQ5WtaxoIjvuLee3F
 Mc4qqSWpEegKlFbVWdE7hp7bw0f4QmUrvfWlMYYmR9VuJGt4iTREmBMNY4yGwExdp8UM
 JzDv1mBc/jMCW/oK7IEmd0h81kGOSTi3FhQpDSWgMNGoBbfnic/JvHOjZDnqb3XLgAIj
 /wg4QD61CZR5FgPb+7Ru48qaGUhtwLgz2qEqKRVNur8DMZHJ8wkWQ/tA6ggsNFZL2Oq5
 ZO8EGFPjdL2luPkW8cv8Q70HyTsFu1KDOQnb0FSe+jwvkuOiGnXgtf1NuJqgojrkGs2m
 NiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VyGOgXRVYXE4KsV9afYsCBAI5eV0Qm7bovPtD8hErTQ=;
 b=Jv/XEP5vSSit0xRDMY1N75HfCM6bJTJlahgdNrCRYToJb5zE7H0rpyA1ttkeOa1AkT
 YAaYeeylVaR+5/y94XY4Wg7Yo3+bx3jifoGFFX8Zqb3VYTblVkCDhkgFu1PhTSM4whIf
 DHKXe2/UeGfiuqGNykta3AqV2YmWgVNIbdn5orWVn1Kpz4ukg5Msu0H4sQnhuJ3ifeYb
 qiijmxXT2S6FFYesJ+LqF49xdnWk++ljZtauU/NeDf/QZItwmIBcFYqB78vjdtXzyORh
 kSM5+en3C59klK0TVD2Ma0OURdPLHxBNEiybmgq5nlJuetABY8QH2clas+YmjHoQPLHD
 BxXQ==
X-Gm-Message-State: AOAM531aaRAnZ0yED3bhcHJT1EKCdWN7yg9YVK/k7LVhI/pUKwzAHGDk
 y2O2o8mgSy0+8LM7I3xnPsyMRSabA2QjbqBT
X-Google-Smtp-Source: ABdhPJzb7Oto9jfFEkwxXRarlbsg1pyQ/Dqr68V/bpDJZg4OQ7rZaPykW0/si/7klCAGw3+yYKWOug==
X-Received: by 2002:a63:9811:: with SMTP id q17mr1640543pgd.238.1611873716255; 
 Thu, 28 Jan 2021 14:41:56 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/23] linux-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Thu, 28 Jan 2021 12:41:25 -1000
Message-Id: <20210128224141.638790-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 441ba6a78b..9251337daf 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -488,8 +488,8 @@ extern unsigned long guest_stack_size;
 
 /* user access */
 
-#define VERIFY_READ 0
-#define VERIFY_WRITE 1 /* implies read access */
+#define VERIFY_READ  PAGE_READ
+#define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
 static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
@@ -501,9 +501,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
          !guest_addr_valid(addr + size - 1))) {
         return false;
     }
-    return page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ :
-                            (PAGE_READ | PAGE_WRITE)) == 0;
+    return page_check_range((target_ulong)addr, size, type) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access.
-- 
2.25.1


