Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A623FD7FA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:49:20 +0200 (CEST)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNnz-0001P6-7k
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcF-00071F-Lp
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:13 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcA-0005iC-Vz
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:11 -0400
Received: by mail-wr1-x431.google.com with SMTP id q14so3762879wrp.3
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DvhXlYYlfomJDUJCbAefggwT30WTKJdIb0Q3AVXh8mM=;
 b=wKr2lax2EPFSWl/D4FRw94e5QxwF4TQLedfhHdYlEVkmJ8xmP2lCNpfgHDtT2l7fX6
 UtpZby4CmRkSn84InKZcTV/YBc/DR5RB8pqlkVqPQxAQ7CgpQmFYLcAYDERBMqhpnwwK
 RYW3GZ7vk9q1GrxBVn+Ucc61bCtQDWM9cG2NKiXhLojW+LW51Drlpy0FKWMmdppef49S
 wLjRzSqDm9NTYjHRQpcpGrUvJUxJBpaPfEd4wdxGUXgf2nt1LD960uSyQ7pIUy7IQwai
 so46L7k89CEIWo6LdKDGuu1qYKgSdgoHPeqEJZ+64MBnwXBy70Dz6r8DWcXEU5rW8800
 2LWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DvhXlYYlfomJDUJCbAefggwT30WTKJdIb0Q3AVXh8mM=;
 b=oECz8zNcDoHMFeWa+aH03Jo7+kBHKcWGqaV7mUTnBKOSV586wVJGGhD5XxYHc7R0yg
 I6MUtUobGL7S/Qs0gFvS4TAyHqUsGidxAAztCCqpDqLN5gY5NEboAU7cR8Rf7MiZVczZ
 jLivopQ8JAPS4DXZMQLzs1eptdspxVomKIIioIHzMgR6hLFtZivuLQoorQXFNAd44um5
 gKHFu8qzGKFeAGUljlizHkHXuHL3voCbjrKi9eFZ6aB1Gt40nDmnNP4Whu6wXzXregtJ
 9BslhQMElxWArHVS/u3L+AQO56z1VA3ecWD/MevdXAgXc2J1lWIa90GQMxNrDZdjjf7M
 DdUQ==
X-Gm-Message-State: AOAM531sKGQ3/V6Xem57vE323oF4J/KIB0MhGAxkUefrcJb+VeyBp1M/
 Hv3exiQ1GdqYVhZ+qWhZ2J9Yrulcew6zzw==
X-Google-Smtp-Source: ABdhPJyZV0KhTg0n8jZgc2Po4fLbG/edqYTNCKxuCJKFRdXn/P4paFV/4UfwxHtCLKXs4w5llXDbfg==
X-Received: by 2002:adf:82a8:: with SMTP id 37mr37514525wrc.123.1630492625578; 
 Wed, 01 Sep 2021 03:37:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/51] softfloat: Remove assertion preventing silencing of NaN
 in default-NaN mode
Date: Wed,  1 Sep 2021 11:36:16 +0100
Message-Id: <20210901103653.13435-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

In commit a777d6033447a we added an assertion to parts_silence_nan() that
prohibits calling float*_silence_nan() when in default-NaN mode.
This ties together a property of the output ("do we generate a default
NaN when the result is a NaN?") with an operation on an input ("silence
this input NaN").

It's true that most of the time when in default-NaN mode you won't
need to silence an input NaN, because you can just produce the
default NaN as the result instead.  But some functions like
float*_maxnum() are defined to be able to work with quiet NaNs, so
silencing an input SNaN is still reasonable.  In particular, the
upcoming implementation of MVE VMAXNMV would fall over this assertion
if we didn't delete it.

Delete the assertion.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-specialize.c.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 12467bb9bba..f2ad0f335e6 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -198,7 +198,6 @@ static void parts128_default_nan(FloatParts128 *p, float_status *status)
 static uint64_t parts_silence_nan_frac(uint64_t frac, float_status *status)
 {
     g_assert(!no_signaling_nans(status));
-    g_assert(!status->default_nan_mode);
 
     /* The only snan_bit_is_one target without default_nan_mode is HPPA. */
     if (snan_bit_is_one(status)) {
-- 
2.20.1


