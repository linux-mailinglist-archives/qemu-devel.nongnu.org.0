Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FA96A6602
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:59:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCei-0000NK-Fm; Tue, 28 Feb 2023 21:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeb-0008Ph-4b
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:17 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeV-00035u-EE
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:14 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 k21-20020a17090aaa1500b002376652e160so11655004pjq.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4VQktDbOqSG80kC+PXJHu0YqEFQhbrRQi4nuFRIYoVQ=;
 b=enVwheiuSJ09rT9xLnWnPQWz+VoJHRsCsbHJ6L2puIsYbW+vOoa7WZUQvbCprUNWXX
 mfrAzz5tmYNjqjUzJnu1l+MK6zSjHo+PYwf4cOocWEu+3ItrWQ9hJUOy3wJYOTORrGwM
 zfUjUX+XI2m8tVOms9T3XUtTX6odVRe48RlX59A9hN6tixZblW95nzO9XZppwqeGH3iK
 J10xTqzxZtcV1nryZZyOZCzhgTm0IwWzcq0pAFVc/Bwo6XMs09jLaFTBgbfaCmyOG3b9
 k66yubq58Vy5f3vyUfM/hQlfbtGxLUAd5CHi+qtZ9xeJ9AN4kVSAZfbHGXLn19Cc5TYM
 Arcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4VQktDbOqSG80kC+PXJHu0YqEFQhbrRQi4nuFRIYoVQ=;
 b=FPUOhbqwRD1vmTLsdQjHppOC3yatLPDotn9+uvs7kPhaI8ZNkNmG22+C1FeufHJROr
 045bp4Ii3CMu7YyNUexg9QgbDK06NLlg040qy955utFGQfgNptQHUTyrQk4nPm5ZWTA7
 TnL1i2BbltGcDKpxWHc6fcfiMFXkHKL5HTpnEkc7wYSnnR4hwq+LQXZr5AO79wRfyYfI
 iTYwNE7cPY3vIQlbWCQ2Jb5KxNEAJsETNp+eS3ALeag+r6OErr6f4WUl5welMNXrJx+o
 fF9aKPMOHKODz/rs/3IVIKl6UgC6Ho9ZcsSP0DOOSeySYnbj/0VhzUGlJ4zmC6RR8hzK
 L/4A==
X-Gm-Message-State: AO0yUKUQ7fE/QR82qgeZGdfSCpzssqY5PYGjIXR7sDFZjDcCuWoV1xNB
 vpNzXIb1LP3RX5eYPxhWhDy5uIgE7bXCdbP3PMs=
X-Google-Smtp-Source: AK7set/mDimhJz2v6ewbE3ZHBSwVyEBMqaTLFkiNSJJmbzPpW4lYJxQlxUuR5C4A8n1cdYOGI1lQAw==
X-Received: by 2002:a17:903:2341:b0:19b:2332:18cb with SMTP id
 c1-20020a170903234100b0019b233218cbmr5582911plh.1.1677639427099; 
 Tue, 28 Feb 2023 18:57:07 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 12/62] include/exec: Remove `TARGET_TB_PCREL` define
Date: Tue, 28 Feb 2023 16:55:53 -1000
Message-Id: <20230301025643.1227244-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-9-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index d5a4f30717..be920d4208 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -54,9 +54,6 @@
 #  error TARGET_PAGE_BITS must be defined in cpu-param.h
 # endif
 #endif
-#ifndef TARGET_TB_PCREL
-# define TARGET_TB_PCREL 0
-#endif
 
 #define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
 
-- 
2.34.1


