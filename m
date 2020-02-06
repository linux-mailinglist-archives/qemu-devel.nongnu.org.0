Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2244415426D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 11:56:43 +0100 (CET)
Received: from localhost ([::1]:35664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izepu-0004om-5w
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 05:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49559)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1izeo9-0002m3-AF
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 05:54:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1izeo8-0005uU-6H
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 05:54:53 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52699)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1izeo7-0005jU-Tg
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 05:54:52 -0500
Received: by mail-wm1-x341.google.com with SMTP id p9so5799676wmc.2
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 02:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JfaSOC1cqYB9KTOChPDgnWajkmpfKUIcyHjXCsMXOrM=;
 b=Z8M87d0O4U5Gyt1oyBNUrmb9Y31H4fJzhAY5UxhppzluMwtiNEJGzTIg92d2fW8rYD
 CAh7K90KozJUffmmFFSt08aA8+lffiReY0YSLJgzJvSqZUO4YtWxR2roFmbU7PXL2mH2
 ddd/MeDV4c4Cv+84ssrngLqOhk+BTUQOfrK7ZOGQMnn1eZEU0XMQg0A0xqKvY8LJgn29
 EBCh9goj4Zbr59F3Je+OptkXREefzrUdT/GatQl3erz30yheLusNodxENqt3M/96YNbi
 S4QZtvUNHR/gA7dJfMdmVW8sGiSLSOFm1uu6K9WM8LNKc78pK7VXC2YPxBJLkLdkXBx8
 h4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JfaSOC1cqYB9KTOChPDgnWajkmpfKUIcyHjXCsMXOrM=;
 b=O+cWYuwkhIFX6BxcfGKRJWcFXJpS+OY9OIbZk9LH/xNPRGCRgqDnPgfzkY5c5N6JJz
 v93ilZHNQHR/NVdaJOcN2L0CENyvvdyMHe5Vd5yVI51svL4DQE6bNBAUeK92k8BYOtoY
 8y2Xb/pMsDSnryIw2xEa9p2E0FiPx+uZ+U3/l4nF/HnkS3k1qzAIqse4hRwSy9mGEaA0
 Y4k5VsBb5ou2qVuT32kCnSvNEK5WRkgnkvSQeFox8D3CnMZAWBGgkSQDpDYhPRJXu3/w
 iXPwmhGhimurSVgGl167JiB9BxnEBYL0HXNnXUNqHme+AnpvYFx9VKnmXfuq2itw9+se
 Gqrg==
X-Gm-Message-State: APjAAAU0iVt3hyUJWTusiXIHBnA8ls8n5414CZQc4n3Af4a8QcF5q3Cd
 50bCkNDFP6DZf5Ma0A3doOB3KktshVXo6A==
X-Google-Smtp-Source: APXvYqx7HAkov8dFrVs9bS2DG2S48IyCHU5jX+ah/5l3o7h4SPAPQeFkgLNP3NqxmvRT2LcNO2+4TA==
X-Received: by 2002:a1c:791a:: with SMTP id l26mr3979217wme.58.1580986490152; 
 Thu, 06 Feb 2020 02:54:50 -0800 (PST)
Received: from cloudburst.c.hoisthospitality.com ([135.196.99.211])
 by smtp.gmail.com with ESMTPSA id m21sm3364995wmi.27.2020.02.06.02.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 02:54:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/41] target/arm: Define isar_feature_aa64_vh
Date: Thu,  6 Feb 2020 10:54:08 +0000
Message-Id: <20200206105448.4726-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200206105448.4726-1-richard.henderson@linaro.org>
References: <20200206105448.4726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 608fcbd0b7..2a53f5d09b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3685,6 +3685,11 @@ static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
 }
 
+static inline bool isar_feature_aa64_vh(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, VH) != 0;
+}
+
 static inline bool isar_feature_aa64_lor(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, LO) != 0;
-- 
2.20.1


