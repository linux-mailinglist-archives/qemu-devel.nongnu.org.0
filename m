Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F1F508F61
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:28:15 +0200 (CEST)
Received: from localhost ([::1]:57706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhF3m-0000PV-LB
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEiv-0005he-Tz
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:41 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:53045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEiu-0001FT-Gt
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:41 -0400
Received: by mail-pj1-x102d.google.com with SMTP id 2so2682921pjw.2
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nV9NUHGE3OwdaVnxN1+80eLd/X0Cf+bcd/I1jEloa/Y=;
 b=r+VbEOcrHJi7H0lgJHSg9Jc4AOakhitDcSF9LzkeaLqazxQMiYi7fPO+q+HDnQA1cS
 RjExJJ7iroUlKj3/Dct3KyWYuaXZCkpN3Vz8szBMJVD+YLpB8RT6fqpGGywXl075OF/M
 fVtlUVAgFSU/mj5lK/XbwvxfHPYR7+7vUr3EPO4rJhWO/DKX8wiK/fkIBSSO/ZH48okO
 R/rPhuGzx/C75pL9Zf3d0AuzmD0qAizRrI+FmGoexOKL5jZszFTESyZiJotZHcBLCrdN
 j68Htmh/cJ0bYSkWXi6R55ytLdx/UX8cbFawk6UIkZdesvhfpKj7bkgexik6OopdL7kG
 r+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nV9NUHGE3OwdaVnxN1+80eLd/X0Cf+bcd/I1jEloa/Y=;
 b=QIXMSwcIjq0GEJTPXoLADfwD0nLoFifxXYCvG/Q0Lp8NC7Apd2LypaUDmYBD2AsLhV
 CJ5IaYFrzxDgrdB1d9iZvgryi3P7ZdcB2AAsTYjiupAXykaamxHRUxG8vIPvpqIBQUtr
 ZedCFXTpbQqYjXyAjAaJKR+oZMVNtRFuq8TmQnA6jJ+Rz50YSP+mFjuHG9xxRCvR7NAT
 R4agn/898/HYWkklN+jgcvA+21NN8Lv6UTH/LjKvzAIFr+uMCaV9PSSFPBbghhjxYZpS
 bZLEpJ9xwbLd9mCeDtDTjfi3olw1V6O84a+A+x+XBlL04NZ1bHMkvGt4RUfSqs+ycODU
 9sgg==
X-Gm-Message-State: AOAM532Z1qoMtOZH4x3abB1yYbBSt40Z4sq2sgN/Odcq274t+3fkx+ZY
 0e+eW+7umDRqhyxEF72AgzpNp+o75EqyEQ==
X-Google-Smtp-Source: ABdhPJxpPF3hNd4PMEUm1x1iyIF+GK+pYwTtsOVNrF8HrhfAFxa9ElYI2auN6lIDY8fOIFTC1zey2g==
X-Received: by 2002:a17:903:4052:b0:155:fc0b:48fb with SMTP id
 n18-20020a170903405200b00155fc0b48fbmr21706776pla.27.1650477999202; 
 Wed, 20 Apr 2022 11:06:39 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/39] util/log: Mark qemu_log_trylock as
 G_GNUC_WARN_UNUSED_RESULT
Date: Wed, 20 Apr 2022 11:05:57 -0700
Message-Id: <20220420180618.1183855-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all uses have been updated, consider a missing
test of the result of qemu_log_trylock a bug and Werror.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-19-richard.henderson@linaro.org>
---
 include/qemu/log.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 2d9455dc85..3a1f3a6020 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -67,7 +67,7 @@ static inline bool qemu_log_separate(void)
 
 /* Lock/unlock output. */
 
-FILE *qemu_log_trylock(void);
+FILE *qemu_log_trylock(void) G_GNUC_WARN_UNUSED_RESULT;
 void qemu_log_unlock(FILE *fd);
 
 /* Logging functions: */
-- 
2.34.1


