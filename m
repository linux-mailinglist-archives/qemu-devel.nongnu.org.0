Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A396410F51C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 03:45:19 +0100 (CET)
Received: from localhost ([::1]:47356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibyBi-0003it-Hr
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 21:45:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60455)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ibxxB-0003HH-3W
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 21:30:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ibxwz-0008HR-QO
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 21:30:08 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:33294)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ibxwu-0008Cs-ME
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 21:30:01 -0500
Received: by mail-pj1-x1044.google.com with SMTP id r67so833027pjb.0
 for <qemu-devel@nongnu.org>; Mon, 02 Dec 2019 18:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C5bF3i8DWT2f5RYnZflxU7iVnJmRJeE7IGuazbjeOWk=;
 b=fEud/aFLjXvpezvj1+nNR1bPr50j9b2EZrSJQOBkBtuRrWn0jVEYGKgqhJDck2dryb
 fQZuG4bbOX/Bx5Y6sYnCVK5Imb+pc4SaeS+S3Jy8hqhG9ihXaep5BUHYpFCJu8C0CBXF
 y/hss2b6tlpbQSvRjcCL28cf1pIBuBcsDcyYeRY6xg1Xy8YvY6bGvnkMReKglt8eUxKE
 6ENkxnGk8ruknFYWqsNO6GFmu2tt155HLJ9sOQ9e1maByI639APyAEo25SqGalHYZt/U
 h9cQU6bZeTdTyGjj4wwcjpmh/VYuRpLZRD4hdN3Wp5JxIiRGO810ceKsSu7Q0ch0s9Vz
 SwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=C5bF3i8DWT2f5RYnZflxU7iVnJmRJeE7IGuazbjeOWk=;
 b=amm0c2t3ZbJVLt7o4t5ZH7TvZbh0kWFSKAjhrVq2COigs6t7K0SDna3tHzxkSjuKrQ
 tsUUQm95DhBgmdkoXcNxSnKY58+He0TzlH/xSBeK/tYO2tb1fulrcJ4u4ayTWZzZCOcs
 uo2HeKVYKCYO0PwUn7R6PJIdtiO+dJyA3hZjlD2IEDa/FYfsH1yvRuaE/N/4sMDp+x7G
 KIvijbSdLTaD3SlY2tQ72A4A+PtZnRFklYh+u+YCK9gVFNua+fXBq2JBW5EqqPycExco
 J3RRZ2FaW84/ts3w8jfViHXgU282rIcjZYChzA/CwFhCWCUcVNm3roxykJ/0jqc2G4dL
 m1Lg==
X-Gm-Message-State: APjAAAVWPJ+NoRt1+sPuUec3YsvQP+uLN1N68SO+h/17OfqRtp++gATP
 AiVTvw2su9D0qb9wpxPpJ5/7PXIiofY=
X-Google-Smtp-Source: APXvYqxQtr6DoUTtWrEuG244TmXbXnGT319VUhUwZUrIO8kkEjfjR3Ixw7/7hciLFuZvIcQfa72cYQ==
X-Received: by 2002:a17:902:b68c:: with SMTP id
 c12mr2652690pls.126.1575340198790; 
 Mon, 02 Dec 2019 18:29:58 -0800 (PST)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id q22sm873695pfg.170.2019.12.02.18.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 18:29:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/40] target/arm: Expand TBFLAG_ANY.MMUIDX to 4 bits
Date: Mon,  2 Dec 2019 18:29:12 -0800
Message-Id: <20191203022937.1474-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203022937.1474-1-richard.henderson@linaro.org>
References: <20191203022937.1474-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are about to expand the number of mmuidx to 10, and so need 4 bits.
For the benefit of reading the number out of -d exec, align it to the
penultimate nibble.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ae9fc1ded3..5f295c7e60 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3176,17 +3176,17 @@ typedef ARMCPU ArchCPU;
  * Unless otherwise noted, these bits are cached in env->hflags.
  */
 FIELD(TBFLAG_ANY, AARCH64_STATE, 31, 1)
-FIELD(TBFLAG_ANY, MMUIDX, 28, 3)
-FIELD(TBFLAG_ANY, SS_ACTIVE, 27, 1)
-FIELD(TBFLAG_ANY, PSTATE_SS, 26, 1)     /* Not cached. */
+FIELD(TBFLAG_ANY, SS_ACTIVE, 30, 1)
+FIELD(TBFLAG_ANY, PSTATE_SS, 29, 1)     /* Not cached. */
+FIELD(TBFLAG_ANY, BE_DATA, 28, 1)
+FIELD(TBFLAG_ANY, MMUIDX, 24, 4)
 /* Target EL if we take a floating-point-disabled exception */
-FIELD(TBFLAG_ANY, FPEXC_EL, 24, 2)
-FIELD(TBFLAG_ANY, BE_DATA, 23, 1)
+FIELD(TBFLAG_ANY, FPEXC_EL, 22, 2)
 /*
  * For A-profile only, target EL for debug exceptions.
  * Note that this overlaps with the M-profile-only HANDLER and STACKCHECK bits.
  */
-FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 21, 2)
+FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 20, 2)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
-- 
2.17.1


