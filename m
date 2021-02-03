Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC19030E343
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:31:03 +0100 (CET)
Received: from localhost ([::1]:55370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Nri-0006Ht-O8
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOU-0007NH-Ib
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:52 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOO-0001cv-BX
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:50 -0500
Received: by mail-pl1-x62d.google.com with SMTP id 8so367148plc.10
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lsa43KhLD9F5pbGprd2vnecoG5hphPKA1CxFp2hJ7uE=;
 b=e1u5ubtb7b72Muf7/Sk1uX6dZA7D6Ben8TYrupvU22XojFLr79cna3+Df02Bk8a8QK
 p/+sb0+JxHeX/oiRlSY+qui+XvpsqGBv4VnBLQtaPZZtuYlkSctN/fmAyTsKXj1EAWo1
 JBvflLROsH9sd8d62a/Wu2PJe+e5nCymSNDo5KdLpCapDLOX2besk//pDUCFWL+4Fupj
 Vqzkv6UpJWMfQHQLpr/BXV+lk8or9WJvYevSpZoIEqtJwuSdclxBhSa65buJ/4u/mrr3
 e84tCzSzODk0d0D0M1M6jIws1CcSqc1sTQwRSL+aYqmTmWEFol0pIM05neeKVDpe6wbs
 9b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lsa43KhLD9F5pbGprd2vnecoG5hphPKA1CxFp2hJ7uE=;
 b=IDT4V411FMqMFmV5gaQ6OUy4LGo508+tdaUBraR8Cd1HDO+5DzLMBRzWT4EW8kPjF9
 wkfeIyxNZ762znxe1dqCEH1EcSXjIvoaf8y9bDMVthiSI6nrDeMGZtynyb2jfjd2WRTN
 XWSpOYOYklMADO+lmLrVVdOeEowNj73XIeEFiywQTCmEw8yv1SKZZ1HFmefAJ2/uAnqq
 lAu8BNU60Nm1pVasiOLZla88dYiV04AFVJZGShhhgozlCTLZ7wp1Jp5RjWStuqBYgjYO
 f6NcGnnulGbynwb8M5kxzgl/W+l3uAspV+GZcjRJcPrJsRhWBGv27SPwagJ+lRhv0MIb
 q4LQ==
X-Gm-Message-State: AOAM533GJ7itvujiBoLKtCYNXqs6P1F42b+V/KUg09S6vbozBsYZBErh
 oDR6bSBcXMa7QLJN1+fidCEp6goZ8yRT6pEX
X-Google-Smtp-Source: ABdhPJybRE70n0ihk16ewXBEmB3DmGuZFhS5shalwaqbeEIXJ2jVAZnLMnE38EIXjsLtI9sF9GvwKw==
X-Received: by 2002:a17:902:ed84:b029:e1:1058:d7ca with SMTP id
 e4-20020a170902ed84b02900e11058d7camr4480110plj.85.1612378843071; 
 Wed, 03 Feb 2021 11:00:43 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/31] linux-user: Use guest_range_valid in access_ok
Date: Wed,  3 Feb 2021 08:59:53 -1000
Message-Id: <20210203190010.759771-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're currently open-coding the range check in access_ok;
use guest_range_valid when size != 0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 9fbc5edc4b..ba122a7903 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -493,12 +493,9 @@ extern unsigned long guest_stack_size;
 
 static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
-    if (!guest_addr_valid(addr)) {
-        return false;
-    }
-    if (size != 0 &&
-        (addr + size - 1 < addr ||
-         !guest_addr_valid(addr + size - 1))) {
+    if (size == 0
+        ? !guest_addr_valid(addr)
+        : !guest_range_valid(addr, size)) {
         return false;
     }
     return page_check_range((target_ulong)addr, size, type) == 0;
-- 
2.25.1


