Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814843F0D57
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:32:12 +0200 (CEST)
Received: from localhost ([::1]:44950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTAR-0008KD-Gj
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7e-0005lD-Li
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:18 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7d-0005gq-6y
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:18 -0400
Received: by mail-pg1-x529.google.com with SMTP id w8so3707432pgf.5
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kt/mDazQAKYKsXxjbdT0yp22oT0Ru63VroJp5mmRuZU=;
 b=F7lCMpxuZQGAdUkgnxUhEvAKaKKBFpsMY7hUsBZyh8z0l/KpLcrQ25ohULxuW8CVoU
 dWguFkovqPDysBBmPI5nQsMP6fBFsTbgOHY2J02IWfohdQWB7DvYQvNXG2bBarfiwnRB
 DIe888AIkLj+qJvpAurmeTVzia3Wh45+iKAqgwbS+qa1np7tm/TghA5qEyFjb/F8NXIZ
 zd7ltdB9KplwHlFEjQQNI7cOknt8jTCHIvUh2Qwn9Ib5H8Z7/SEcA3t5DevVI34LX2MX
 gQkVnX4deuWTb42Okj50SFKKSc+7KEP1FTRgM+5isrYUlvURp7eVxWDoBb+8I43YFL9s
 lI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kt/mDazQAKYKsXxjbdT0yp22oT0Ru63VroJp5mmRuZU=;
 b=YgYUdGVWwCNuxfjLBWt0JjJDm4xU4OR9AHmBni0fIdOf5itzFDWjETnJoq/47Grikh
 Z54i0WAxcwZ0yByq8NsKyUq7229PgDnOFeWDK+enPOjHCP/IdSkqf24eLZQRPVpKGCUh
 DAuOIPCzzoRBSWh4OxQiv8M7Mx1Owy1q6F5zVhMDQuvWUO+Xc00XiQqXXI7i/Jbyyy28
 LG0y3y8hSqpscpXlM4TF4J3kz0dyJ0Md21onF4IWEUdOTFzezBIxiFGSzIG1392YyIOn
 9SI1kC/KMNwEtUzN9A5VMJyw+k0dP0hpY/ySPGDxS/AF7q/aTqIOV4BCQ/durQezER4p
 W0Eg==
X-Gm-Message-State: AOAM531aubQMttlPWrlgYRMmM224aQJqBZIIYPJwyQxfBpLins0CF/Bs
 nKlBxo+FABr7l7JbitbNtef5hmrL3P37YQ==
X-Google-Smtp-Source: ABdhPJz0gArGUcu43v2qtg9oEMkMvzLxsfhdsVyit/u9DMJm9OXDhpHDa0N5OKSbz6BCS0BcrWOjXw==
X-Received: by 2002:a65:68d1:: with SMTP id k17mr11078434pgt.285.1629322155508; 
 Wed, 18 Aug 2021 14:29:15 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y19sm751965pfe.71.2021.08.18.14.29.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:29:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/14] tcg/arm: Remove fallback definition of __ARM_ARCH
Date: Wed, 18 Aug 2021 11:28:59 -1000
Message-Id: <20210818212912.396794-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818212912.396794-1-richard.henderson@linaro.org>
References: <20210818212912.396794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

GCC since 4.8 provides the definition and we now require 7.5.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index d113b7f8db..18bb16c784 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -26,25 +26,6 @@
 #ifndef ARM_TCG_TARGET_H
 #define ARM_TCG_TARGET_H
 
-/* The __ARM_ARCH define is provided by gcc 4.8.  Construct it otherwise.  */
-#ifndef __ARM_ARCH
-# if defined(__ARM_ARCH_7__) || defined(__ARM_ARCH_7A__) \
-     || defined(__ARM_ARCH_7R__) || defined(__ARM_ARCH_7M__) \
-     || defined(__ARM_ARCH_7EM__)
-#  define __ARM_ARCH 7
-# elif defined(__ARM_ARCH_6__) || defined(__ARM_ARCH_6J__) \
-       || defined(__ARM_ARCH_6Z__) || defined(__ARM_ARCH_6ZK__) \
-       || defined(__ARM_ARCH_6K__) || defined(__ARM_ARCH_6T2__)
-#  define __ARM_ARCH 6
-# elif defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5E__) \
-       || defined(__ARM_ARCH_5T__) || defined(__ARM_ARCH_5TE__) \
-       || defined(__ARM_ARCH_5TEJ__)
-#  define __ARM_ARCH 5
-# else
-#  define __ARM_ARCH 4
-# endif
-#endif
-
 extern int arm_arch;
 
 #if defined(__ARM_ARCH_5T__) \
-- 
2.25.1


