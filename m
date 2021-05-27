Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0713925FA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 06:16:19 +0200 (CEST)
Received: from localhost ([::1]:40840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm7RS-0004QP-5G
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 00:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PU-0001Zv-E6
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:16 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm7PQ-0007DP-FN
 for qemu-devel@nongnu.org; Thu, 27 May 2021 00:14:16 -0400
Received: by mail-pf1-x42a.google.com with SMTP id d16so2627851pfn.12
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 21:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iIf4CiQjBFO3jZShlRi5AmbhMlsdhUxW6Q2TeLIQ1Ds=;
 b=SdGxfJ9mHrdaJcGb3fDdpugU3AiXIpjnT8j8XCRo0ysw0zlgSdsj5zGTyJYK27OKTF
 iwgY1bqpSuHjZ6jFyrN/jRKixKrmolIR3BDKRxIVAnhV7hDLEEFzxpSW/ssRQTybNqB8
 qwBcCJBIXdIpt9hPSsUSPKF3GR0pFlZlufQ3u8KpC21SQk2C1EUkZMZ7fB3iGebQjUiN
 o/z38qAHR2+A7Sqh0GDPGq0R/YxDTeOBgs/RfFDrXuAzKXmJZJSkP3UHvyncY08jxNCK
 Z2sKkmjheEXilPe9Pw5jrioFXlP7W8Zij6XCfpbNcLR0Wh1fddLetzsXGVWUPkM6orkH
 rz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iIf4CiQjBFO3jZShlRi5AmbhMlsdhUxW6Q2TeLIQ1Ds=;
 b=dYwL+4SKpbX0ogpoLoBFuFgXU4dieFmAijOuzJzQavWR2qGr15hnNgpWsPngIcZBxh
 4EmOmIK6Df6J4GBRvXLzcKtJrXJiPHR+ec2VzmzWuJGpwqIvoDyLZ9Mcj8fJZbzMd8s1
 SP1CTpdNUSFcHQDIZBKkZ5hlagWyDzkcn6dsmAh2RQqU/ROlsHdkJULfJk7ayebXQa6x
 b28HrD8BEhMNnZRiiN8Idda6s3r84NQ3RjonE5T/W2iz9zQqZQ35bfbGYk9LnWGS4gKq
 6uve4WGgdM9DiLzMPBSs/p5WnoIrJSy4vlGt0AGeIZcfSt88baYi4ZWpEUjdErcBhJB4
 fAsQ==
X-Gm-Message-State: AOAM532PnMrZWrwl8/9k4BVfZ5mgSLnZbMIcxtHt88R+2GD0LqjoHCjI
 9jXPMLOvIw44+0Y30Bxvui7cMZjBHGNOEg==
X-Google-Smtp-Source: ABdhPJycv4PqYuImvbu8oZ0PZh1F/folpCF1arPC6sOTJKfCRmN0P1ytgGoD0pgwBD+02R2X0FO1DQ==
X-Received: by 2002:a62:1e42:0:b029:2df:dd12:1608 with SMTP id
 e63-20020a621e420000b02902dfdd121608mr1849044pfe.11.1622088851174; 
 Wed, 26 May 2021 21:14:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id s1sm605959pfc.6.2021.05.26.21.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 21:14:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] target/rx: Fix setting of FPSW.CE
Date: Wed, 26 May 2021 21:14:02 -0700
Message-Id: <20210527041405.391567-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527041405.391567-1-richard.henderson@linaro.org>
References: <20210527041405.391567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: alex.bennee@linaro.org, mmorrell@tachyum.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The existing check was completely wrong, confused about the
definition of the (previous) float_flag_{input,output}_denormal
flags, then making sure that DN, the flush-to-zero bit, was off.

Update for the introduction of float_flag_inorm_denormal and
float_flag_result_denormal, taking into account that DN now sets
the softfloat flush-to-zero bits.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/op_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index b1772e9538..c2e4f9a5e3 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -97,9 +97,11 @@ static void update_fpsw(CPURXState *env, float32 ret, uintptr_t retaddr)
         if (xcpt & float_flag_inexact) {
             SET_FPSW(X);
         }
-        if ((xcpt & (float_flag_iflush_denormal
-                     | float_flag_oflush_denormal))
-            && !FIELD_EX32(env->fpsw, FPSW, DN)) {
+        /*
+         * If any input or output denormals, not flushed to zero, raise CE:
+         * unimplemented processing has been encountered.
+         */
+        if (xcpt & (float_flag_inorm_denormal | float_flag_result_denormal)) {
             env->fpsw = FIELD_DP32(env->fpsw, FPSW, CE, 1);
         }
 
-- 
2.25.1


