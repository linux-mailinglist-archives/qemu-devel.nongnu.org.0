Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E35D1DD374
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 18:56:43 +0200 (CEST)
Received: from localhost ([::1]:49282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jboUC-0001XE-TD
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 12:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboIO-0002l9-A2
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:43:48 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:40832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboIL-0006Y0-Ck
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:43:47 -0400
Received: by mail-qt1-x843.google.com with SMTP id c24so5986612qtw.7
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 09:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KjBP9WZwlnczZ3SxEnPdyurMaB67UgSlf8Umf0tpZgo=;
 b=fWdhUQ9QDGfIDTwPNDlX0mlIPYdDBaAqTFJsRlfJaT5q/AK7gwe/FrEKQp8KiqRTal
 PSReBmdNn44dU6366N0DN5DmPy6SxGkrlC+9gMyXLFOKH3SvBISVc9Em3255AFVWQa1h
 q1tpMeKJyNPVgM8FOQGDxey99hRJPfO1Z2Gd+Ta2bQvMKZI7Ncq3oAY5b/i7imRbpz2k
 f0+Pj52QXw1iR0yuztBfP0YB44aZVi6GmTxI4WR/3gC9Er+GoSq2x5QvkMQUtC3of2u7
 IY7W8R1h4PQsc54hJ78/VDFaZ7G4mjo4e+0Evwm4vAiW/Inmwcl3xIkV7bfZUHE9JW9K
 CuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KjBP9WZwlnczZ3SxEnPdyurMaB67UgSlf8Umf0tpZgo=;
 b=EasXcB5+JN1Fcr5SQGqNMEbtmvDETbjpY66TI19viISAXXBsN1WXnQ7InRVqbfepeX
 a0HT1POqYwwGwsFuj4JodfbCiu3a8ZFvjYE6KrXDIMFq3oTBAkqKS4HmPJR5z+QJoBGO
 uQ8VqgwCZCsvkuUfSV91yk9YQEkfAbj38ngCZhO+Ugt12xrYOwawSmsyupFJw1QOZCwh
 3s9xKWIj6K10tKHHvAEIqGBvgugWuiD+sP6isPFrpiR2x43aH/svb3dEzC5k5usPzozE
 H4MNnpbJ3uuv3ZVagN2716fI4YvzYbagxd8pT7vWRfBsA9cOLyzV7vYb2vmyEOZjO+ru
 d0xA==
X-Gm-Message-State: AOAM530o0M1KG1/L5sujtgERZDk0YOgqbG9yIrPuKYgyfa3O7QJkNAdO
 1Ti29GjpMcFiap5GjT+oZHoXgocfHaQS5Q==
X-Google-Smtp-Source: ABdhPJywYeTTI0lJosOvvYPrxL5f20+z7SGx3K+ydJOJq4E/Cg9EwW0muTqENoolMaZ3Lz3SeY173w==
X-Received: by 2002:ac8:2fb9:: with SMTP id l54mr10849450qta.211.1590079424259; 
 Thu, 21 May 2020 09:43:44 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:1944:c530:655c:5583])
 by smtp.gmail.com with ESMTPSA id x24sm5923829qth.57.2020.05.21.09.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 09:43:43 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 22/74] lm32: convert to cpu_halted
Date: Thu, 21 May 2020 12:39:19 -0400
Message-Id: <20200521164011.638-23-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521164011.638-1-robert.foley@linaro.org>
References: <20200521164011.638-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::843;
 envelope-from=robert.foley@linaro.org; helo=mail-qt1-x843.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: robert.foley@linaro.org, richard.henderson@linaro.org,
 Michael Walle <michael@walle.cc>, cota@braap.org, peter.puhov@linaro.org,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Cc: Michael Walle <michael@walle.cc>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/lm32/op_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/lm32/op_helper.c b/target/lm32/op_helper.c
index e39fcd5647..8e0bd57b9d 100644
--- a/target/lm32/op_helper.c
+++ b/target/lm32/op_helper.c
@@ -32,7 +32,7 @@ void HELPER(hlt)(CPULM32State *env)
 {
     CPUState *cs = env_cpu(env);
 
-    cs->halted = 1;
+    cpu_halted_set(cs, 1);
     cs->exception_index = EXCP_HLT;
     cpu_loop_exit(cs);
 }
@@ -45,7 +45,7 @@ void HELPER(ill)(CPULM32State *env)
             "Connect a debugger or switch to the monitor console "
             "to find out more.\n");
     vm_stop(RUN_STATE_PAUSED);
-    cs->halted = 1;
+    cpu_halted_set(cs, 1);
     raise_exception(env, EXCP_HALTED);
 #endif
 }
-- 
2.17.1


