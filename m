Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F99D2F88C8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 23:50:06 +0100 (CET)
Received: from localhost ([::1]:55264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Xuv-0005qw-GF
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 17:50:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsF-0003eD-U2
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:19 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:47043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs3-0005Fq-RX
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:19 -0500
Received: by mail-pg1-x52b.google.com with SMTP id c22so6905819pgg.13
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XRNC7TN62/mhJ44h4TxsBn3p8qzX1+L1EKv8lKpxGuM=;
 b=O2doYa6yIz8jL6bI9AmMpYnadrmnXydclmOZtN9DK6QEVkOIFkl3snvVLj+rahu4LK
 2dBT+zZvU5YuREnews9thuQFqdaM7u1Omeg1HpX92QUlm+RcQIehy4h/wsz0GPcglfva
 WPCqgy/7zuM7Oro7b0+kC0e0QaMx65b6jb4zXGuEjLBnfmR5sgQDoCw0EIYqGiWgO+wo
 vv51QNabKkqYElsendHDnly9fr7PsHs55rfPRFv4Doij21xLjcZ4cI8MEtE7Txux+R7A
 0wpJa25sxhmCCTiWs/dofzZmktmertxL6nCucrfApOjxvhbJJRQQgKzlvMaXcDXrY18Z
 DE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XRNC7TN62/mhJ44h4TxsBn3p8qzX1+L1EKv8lKpxGuM=;
 b=iD8gLr8F8aOEi1z6wHeT5+x4QPOXYR49Mpj0p2/l0lHs8zv4t94eGenqltFPjdWATA
 oCt5G2fwW12wmaBzx9/iu83AkcUAKYYQKrRxhy2eSkZDXKUgbMsD8S1xGRdjRHQXVhy3
 ibe8nQj1Dwy6AiYOWQeFP1hCR/wLMw7cvs4RHMbnWUMF25vcBdWdcoc+e+cl9zrvyLNO
 PXxXS+LnEFLGM6LD156TLIBFR1Yq076Lpx6Q4eTZ9ItIsEfW/Udj547bl3Mv0tXbkm4Q
 BstMHZ3HZWLnzeT899M+jKxgdbpKRxyAuBKaS4fEi46a28Lb7eMO0VKHPfElzE7ZJnx5
 v7Ag==
X-Gm-Message-State: AOAM530L/1dXO2ajH3wWBTypWqUawocy27MpwiJbBBWYcB0S15oHQ0uT
 k5cm17QgBkXNdftCyMT20VhXHKu5bb6A99oB
X-Google-Smtp-Source: ABdhPJxrhROru5/oDYFEUmXYHLDX2YylAEj61YMUt1A/l8K7e84OD6oh5jy2yaKo0YamASNyhQbLPA==
X-Received: by 2002:a63:130b:: with SMTP id i11mr14736622pgl.300.1610750824862; 
 Fri, 15 Jan 2021 14:47:04 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:47:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/21] linux-user: Fix guest_addr_valid vs reserved_va
Date: Fri, 15 Jan 2021 12:46:34 -1000
Message-Id: <20210115224645.1196742-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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


