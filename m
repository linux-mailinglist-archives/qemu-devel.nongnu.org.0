Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5173B2DC8DA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 23:16:03 +0100 (CET)
Received: from localhost ([::1]:57584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpf5W-0004kf-Ao
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 17:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpf2Y-00038N-8X
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 17:13:00 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:38543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpf2R-0006C9-BP
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 17:12:55 -0500
Received: by mail-oi1-x235.google.com with SMTP id x13so20610901oic.5
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 14:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=noNjayxQpF75JFubAK4FYqR5qvvPQGfOv7NJS/0Yp1o=;
 b=UP1UpU1LkL4tekwz/J2OpH5fg5GtN/J8RhPGwMNs34nsLn/etGJaR4vV967vBdpm4R
 quhL+PNxN5diPQNmgo60AR52llWhjTjwQ/FPYd5Dsjx2WTRC3Aeuaek3R5MznJM032oN
 2VKbGrA6EOaFQmjHmTGEm5FTqXiA/Yq4F1fFCjpBlAtVZTZsggLYnsXS0cfwuT7ut/DB
 dHUNgppQsgq22Xkuz7IOhNubV+QkQoNoAiIVgTAhILcogITws1xpk0WuEu9C1Fq7sNwT
 PtEAxOCKqrsnwctEE8DW+7d87k8UuaP0BxgmQClAdKEuYCrxyID4wCddfJFIvMSqcc3m
 FwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=noNjayxQpF75JFubAK4FYqR5qvvPQGfOv7NJS/0Yp1o=;
 b=lHaUWEq9OoL/tltFOcnVQMVJ93vw12xdjU5Tslw6u8iCgkVapo71Upym/8bwyRgmP+
 F99U9OOBvVOlrn6Ai2UN4cgls8+5ujz8efAYVnV+tWGqVYgPR9mb/9rur93DSJfLh0IX
 yWdWAKL4qFbP7EXK/e2ou+Kaho3oqHlOFlRKpTrpW4DRIHQztwiBw7fRf0dnkEx3hFiN
 KhwoqPPmiRA5lqifmnxIZ98ESf7gDFqD7Njy5bZHFvMncdUavsZCrxP8aKw48+a3sYhg
 Pm1z7qhJivMQ6AfA00Iv/8jMjvEQTEHcll5yWRE+12kjXl0yFonbIK9nVhJL5hijm7Wu
 5aBw==
X-Gm-Message-State: AOAM531NwylhZo06h+meTgRtdfCYdlKeBekbWkSlomt59S7n3H1bLp+A
 R1stllo6teio3WCGSSbMOG2cD9hRpa84KqoW
X-Google-Smtp-Source: ABdhPJw7c4plkXWuennU/an/aVzbPSuk+hPlYMtq1OM737TP3luQsw8Bc5aryifva7iZJUEE4RirZw==
X-Received: by 2002:aca:af4d:: with SMTP id y74mr3027908oie.105.1608156769534; 
 Wed, 16 Dec 2020 14:12:49 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z9sm758965ote.13.2020.12.16.14.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 14:12:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] target/arm: Implement an IMPDEF pauth algorithm
Date: Wed, 16 Dec 2020 16:12:44 -0600
Message-Id: <20201216221247.522686-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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

The architected pauth algorithm is quite slow without
hardware support, and boot times for kernels that enable
use of the feature have been significantly impacted.

Version 1 blurb at
  https://lists.nongnu.org/archive/html/qemu-devel/2020-08/msg02172.html
which contains larger study of the tradeoffs.

Version 2 changes:
  * Use boolean properties, for qmp_query_cpu_model_expansion (drjones).
  * Move XXH64 implementation to xxhash.h (ajb).
  * Include a small cleanup to parsing the "sve" property
    that I noticed along the way.

Version 3 changes:
  * Swap order of patches (drjones).
  * Add properties test case (drjones).

Version 4 changes:
  * Rebase.


r~


Richard Henderson (3):
  target/arm: Implement an IMPDEF pauth algorithm
  target/arm: Add cpu properties to control pauth
  target/arm: Use object_property_add_bool for "sve" property

 include/qemu/xxhash.h          | 82 ++++++++++++++++++++++++++++++++++
 target/arm/cpu.h               | 25 +++++++++--
 target/arm/cpu.c               | 13 ++++++
 target/arm/cpu64.c             | 64 ++++++++++++++++++--------
 target/arm/monitor.c           |  3 +-
 target/arm/pauth_helper.c      | 41 ++++++++++++++---
 tests/qtest/arm-cpu-features.c | 13 ++++++
 7 files changed, 213 insertions(+), 28 deletions(-)

-- 
2.25.1


