Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8EC154292
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 12:04:29 +0100 (CET)
Received: from localhost ([::1]:35902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izexQ-0002Dw-VW
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 06:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1izeoP-00035X-OZ
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 05:55:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1izeoO-0007GS-4i
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 05:55:09 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52180)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1izeoM-00077V-I3
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 05:55:07 -0500
Received: by mail-wm1-x344.google.com with SMTP id t23so5808569wmi.1
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 02:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5yzZc503rPeFl27xGectI9n2/yV3xCJ4JGIEujvRapk=;
 b=znbk1KsfAYh/W1RzNOnnYzeGezj1WMh1l+J90ExSLacofXz+rs5bJRmT0C8vtkcN7/
 DnCGyykx5SpXs9XxH3T67cg+G0BkObOlDsTbmn+iJQUA0fvsEgiYXGVYzQgJCqtsDWfH
 2ch02VwI8YhayWlePN9zf9iWOxmIKGjAShfbqY8kx6hgaNr4T8CVDjZiN9eH2pXfEXfG
 WUknelQbZJTi+90GWMwrYkWS4xUU/hkP26in5T5v+RhDnC+j8yVOyRzh7xuq2bJ8uRfR
 am+l7qpXljOJ/u1mJq2auy3uPAO9ifZGR8W/LsGixZ4s44C0jnKJHQaseK/BVy+RodN0
 Zw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5yzZc503rPeFl27xGectI9n2/yV3xCJ4JGIEujvRapk=;
 b=KDCghk43iAUP901w9ugIbHtzHSjgTSigGDS9sVpQl7cd9gt+4y6mb5E8VeDsgCQRZh
 Fy/wMwWbHOl9bXz+PfDUF/K5OmQVEkwgvoJFCcq8fvg9H6qsj4vQ4lReiI63SkmYr97C
 dCInaoWF7lN+N1KJJFgBVGCS0PezlAjfJtU12QLYHOzwv9bC+RUsuYQEYCjvmnE+afpG
 BiK0JZFqgru0wn/GFqWFdvu8WwK0foiR0E4h5YTbbPrU6kxIQNIQGRh66QcLKVI2caay
 77Oj8tKlHKDvZbhiJVy3l60pkTQIzxzUYMsCnVdZqy1JEHDhvmEXBys0Ti+kp4GZ0yoQ
 KEPg==
X-Gm-Message-State: APjAAAXPv+gLhG6i2xFHZNV0zfG382nzPGaCO7bLkKklPRAvKyMvgDO6
 J9zuSJ33zYIPlgKfdMYhFkdNgTkKCD0DaA==
X-Google-Smtp-Source: APXvYqzcJZs7krl9jVSIipx7Y7RZClVuu5gz0D03d3URbNHLt5Jdfr4bXl+/8Oq3E/GGxsyTvHeaDA==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr4139078wmj.117.1580986505324; 
 Thu, 06 Feb 2020 02:55:05 -0800 (PST)
Received: from cloudburst.c.hoisthospitality.com ([135.196.99.211])
 by smtp.gmail.com with ESMTPSA id m21sm3364995wmi.27.2020.02.06.02.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 02:55:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 18/41] target/arm: Tidy ARMMMUIdx m-profile definitions
Date: Thu,  6 Feb 2020 10:54:25 +0000
Message-Id: <20200206105448.4726-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200206105448.4726-1-richard.henderson@linaro.org>
References: <20200206105448.4726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the magic numbers with the relevant ARM_MMU_IDX_M_* constants.
Keep the definitions short by referencing previous symbols.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index aa121cd9d0..ad92873943 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2912,14 +2912,14 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_SE10_0 = 4 | ARM_MMU_IDX_A,
     ARMMMUIdx_SE10_1 = 5 | ARM_MMU_IDX_A,
     ARMMMUIdx_Stage2 = 6 | ARM_MMU_IDX_A,
-    ARMMMUIdx_MUser = 0 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MPriv = 1 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MUserNegPri = 2 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MPrivNegPri = 3 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MSUser = 4 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MSPriv = 5 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MSUserNegPri = 6 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MSPrivNegPri = 7 | ARM_MMU_IDX_M,
+    ARMMMUIdx_MUser = ARM_MMU_IDX_M,
+    ARMMMUIdx_MPriv = ARM_MMU_IDX_M | ARM_MMU_IDX_M_PRIV,
+    ARMMMUIdx_MUserNegPri = ARMMMUIdx_MUser | ARM_MMU_IDX_M_NEGPRI,
+    ARMMMUIdx_MPrivNegPri = ARMMMUIdx_MPriv | ARM_MMU_IDX_M_NEGPRI,
+    ARMMMUIdx_MSUser = ARMMMUIdx_MUser | ARM_MMU_IDX_M_S,
+    ARMMMUIdx_MSPriv = ARMMMUIdx_MPriv | ARM_MMU_IDX_M_S,
+    ARMMMUIdx_MSUserNegPri = ARMMMUIdx_MUserNegPri | ARM_MMU_IDX_M_S,
+    ARMMMUIdx_MSPrivNegPri = ARMMMUIdx_MPrivNegPri | ARM_MMU_IDX_M_S,
     /* Indexes below here don't have TLBs and are used only for AT system
      * instructions or for the first stage of an S12 page table walk.
      */
-- 
2.20.1


