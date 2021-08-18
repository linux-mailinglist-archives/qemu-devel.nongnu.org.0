Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389033F0D59
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:32:15 +0200 (CEST)
Received: from localhost ([::1]:45180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTAU-0008TB-70
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7g-0005lj-4a
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:20 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:45748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7e-0005hg-PL
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:19 -0400
Received: by mail-pg1-x529.google.com with SMTP id n18so3705917pgm.12
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jLXGAbCLwSue+rsTYVcpzuuQk6hL0q5RdOPZ/L6m2sM=;
 b=GEdlg1sveHuZngaKhebNtbyxZRKU5PtermHZo8ynQB+sprF+SA5qt9NRlNTuvgwghw
 QdvxlfzxuJzpmb6+b+ta1s8yvApaL3WhS5ORY3JHgVpeJ9APb20TV9GdlSvRgfPDH70p
 ugqAW3UrfDi/VKh1aw1xFxf4dQq6rWmFympO55TcYOcB/D/0g7jcNplkQV/yhRQoBil3
 lWojFn/9lUTqsSBNUFXWL0Xs6g/XlwuTH7Z120MPHDPZP85FJaYGHMF/ZlnmhW1eJxc4
 x7JbJVVkO+PUQtG6t1t5y2yzi+67OgAwkCM02Gnu/qd0vuY9+YvMHqHOo/nTzWCCJvVh
 hwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jLXGAbCLwSue+rsTYVcpzuuQk6hL0q5RdOPZ/L6m2sM=;
 b=I8Ib45xLeTZ0+QyunePB1tMl59VIQSLFTPJPhihUhijS/0e721ArU5ENQrOCPSHV7h
 Fo+cxWR3gbVPDXaPzjrftJQbahkGgWeJdaxUfOHVKKwiaZqaSSkFqqt694xgjRM+fLUa
 TYlO9/oB9kBbDaGpQuE8KYbQq1B23W6UmFepPyxPiJAvKv5TEwXRbPzGu3EVH43AlANn
 4uZkxLDczQYtVQmSdwkKnYMGR671Lme9rxTR9nMC4Jv+IClupqTpbxARyw+pbtOHsnA7
 g3hDwV1wPG4HR+4dJZQC2sBMbJkU852Y7VaITBIzK49VHmlRCp6nfYhaTkfoXqbaLsQq
 tKgA==
X-Gm-Message-State: AOAM5317rqOWFx7dCSaWHmpALdAN4qWeNdsPZeLcLKZMC+lidIOWT0Hy
 bvU2n589HcvuTGcskbPOHCF3q2CVVy/ywA==
X-Google-Smtp-Source: ABdhPJzezOTpVPU4A5ml57RGQH561e4Q3zgFV7SkKcs7fqKVwRjBeZG6EA9zIoKeR0ANgIspQ0fiYA==
X-Received: by 2002:a62:9288:0:b0:3e1:c44f:a1b7 with SMTP id
 o130-20020a629288000000b003e1c44fa1b7mr11502539pfd.63.1629322157442; 
 Wed, 18 Aug 2021 14:29:17 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y19sm751965pfe.71.2021.08.18.14.29.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:29:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/14] tcg/arm: Simplify use_armvt5_instructions
Date: Wed, 18 Aug 2021 11:29:01 -1000
Message-Id: <20210818212912.396794-4-richard.henderson@linaro.org>
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

According to the Arm ARM DDI 0406C, section A1.3, the valid variants
are ARMv5T, ARMv5TE, ARMv5TEJ -- there is no ARMv5 without Thumb.
Therefore simplify the test from preprocessor ifdefs to base
architecture revision.  Retain the "t" in the name to minimize churn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 18bb16c784..f41b809554 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -28,13 +28,7 @@
 
 extern int arm_arch;
 
-#if defined(__ARM_ARCH_5T__) \
-    || defined(__ARM_ARCH_5TE__) || defined(__ARM_ARCH_5TEJ__)
-# define use_armv5t_instructions 1
-#else
-# define use_armv5t_instructions use_armv6_instructions
-#endif
-
+#define use_armv5t_instructions (__ARM_ARCH >= 5 || arm_arch >= 5)
 #define use_armv6_instructions  (__ARM_ARCH >= 6 || arm_arch >= 6)
 #define use_armv7_instructions  (__ARM_ARCH >= 7 || arm_arch >= 7)
 
-- 
2.25.1


