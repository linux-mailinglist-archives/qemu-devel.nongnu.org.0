Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131FC510711
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:32:31 +0200 (CEST)
Received: from localhost ([::1]:43214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njPzC-0004wf-6L
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmW-0002Ug-6m
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:24 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:37741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmR-0004LO-PO
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:23 -0400
Received: by mail-pg1-x536.google.com with SMTP id 15so8369223pgf.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CrNW1rK4WiXSB4GD2xVRHyjJx/JGJkz3Qq1JReZmp+g=;
 b=bIzzNw5Lwb0+/ywL2qw18YBHpp4l/HfnPxPn+HVcvyyoQ5LvETLZ22VPy+atjqDVZ0
 DrSUHZ6ETi1meTE5NK26kaJ8bM402Lo/X3HbPxxoM5W8TtuNNlU+WHzgawiaFmLSk/rf
 d5wHDwQs4HHymLEx0PCNOZCB3IStJr38/VRtYKSr27sNQnRfmvUATNi8UzGkz5xF1cSR
 BGaqjD5w4jE8dsP54Z0a8w4ymBrR62UuNlEroYITnwLsQl61jM+XLDxKqfh6ZM7JVAwT
 4djX/w5kEidWvvMA0E+0waE7hD221z/lQpQAGNriC9Q+yTQtUxEzT3T8W/Be0xxPE4nu
 F+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CrNW1rK4WiXSB4GD2xVRHyjJx/JGJkz3Qq1JReZmp+g=;
 b=e3FfMHVrHvht6j168VYEMkjML+qA0fKOb1/zYLFCzkyS0dfpYgJ58L5FlKuOXxYugl
 jnhL9PE/1y5XGdLHgAuFOuwgZhlrJFmQKI+BZ8oINpwAUvjgCJ7DbMR9AroIgRN6wTBD
 F2h4oilk/AdUYm9aWK904cX1ov1Qcz0rJLTdktHBV9QnE33ue5jmAnPODz8OlIUCsntq
 4+jqTsEKlibY536RsHRDP3+QOf4B7Ra5i7r1r9b7/o9VQrTUOa25o5HhJ+Eka6S8Inni
 DwViAtr8CsocmWKvHdxaKwrEzDpGY6ZV1R2vLEyANdt7ekLmJN1Sy60Q0mc6MMH1EWRr
 5TPA==
X-Gm-Message-State: AOAM531Yc3A06p3EFk7TUSYS3xeXUuZEal04UAjQDHfsNppC5rLOhmm1
 P+oFdlZd2ccGo9xF+4LjaksHZhJEBwe8zg==
X-Google-Smtp-Source: ABdhPJyCzWWo49YFISbdJj0cBkkMxBXJHl9qyac1CoK6Usdi4y9U/fRaj4U0W4x3WelgRM4RO1Sl6w==
X-Received: by 2002:a05:6a00:23c3:b0:50a:7ee6:b369 with SMTP id
 g3-20020a056a0023c300b0050a7ee6b369mr25478993pfc.76.1650997155684; 
 Tue, 26 Apr 2022 11:19:15 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/68] tests/tcg/nios2: Re-enable linux-user tests
Date: Tue, 26 Apr 2022 11:18:07 -0700
Message-Id: <20220426181907.103691-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that threads and signals have been fixed, re-enable tests.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-9-richard.henderson@linaro.org>
---
 tests/tcg/nios2/Makefile.target | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 tests/tcg/nios2/Makefile.target

diff --git a/tests/tcg/nios2/Makefile.target b/tests/tcg/nios2/Makefile.target
deleted file mode 100644
index b38e2352b7..0000000000
--- a/tests/tcg/nios2/Makefile.target
+++ /dev/null
@@ -1,11 +0,0 @@
-# nios2 specific test tweaks
-
-# Currently nios2 signal handling is broken
-run-signals: signals
-	$(call skip-test, $<, "BROKEN")
-run-plugin-signals-with-%:
-	$(call skip-test, $<, "BROKEN")
-run-linux-test: linux-test
-	$(call skip-test, $<, "BROKEN")
-run-plugin-linux-test-with-%:
-	$(call skip-test, $<, "BROKEN")
-- 
2.34.1


