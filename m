Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D67D67C9F7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:32:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0La-0003F1-C2; Thu, 26 Jan 2023 06:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LQ-0002Yn-DY
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:04 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LN-0003t6-Iu
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:04 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so915885wmq.0
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5jrg3BCHzkEEvgvsCu9pnvQ76HLYPlXnAsGxfTUecSw=;
 b=x2FPYywrJhUCdrSwcEWiF782PV18BCk2bpZOLXwsoj3RZtLuW0GV2WKkMGTPqxpTpi
 UPQuH8lj8srKT2AQ8M9mzQc2+9aYQuKmp4FUtwMtqvWz7CFZvSDKzs+sR39fJKSAhfeR
 QqMYkPPIX2Tv1JOwoJhGi1x+E6wtWyhBWPc+HOicHjDNG0kS+GtVMwlR01p2bUo7T+ZL
 XJVrF0O7srM3phbem1cbSuva6xIsJNiNF6YSMp0FRUsqBoZYCF6VG75gu6FQ4ioM9GuO
 6c1SdxBBCDguUaUrkR/jSByKfMvFBmed5YlxNpnQ5NrjUjDUVP35sgpay0V6JrEjm7Ti
 ZbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5jrg3BCHzkEEvgvsCu9pnvQ76HLYPlXnAsGxfTUecSw=;
 b=s/x08p9MjacMdrB9/BVBHJWJlEnXeIuLVMPFMXXMfgoUV71N7mrV5LJ03UrRecqxpt
 NeAbiKiBDSdSOZ9RRzDZKyyco9BLekbBkijHcoFFNiXWHn6Tw3lF3xBoY0DfMAD1kDiL
 leXA8jB+pI3AXK60n45IuSIIsg7nBY0qMikYMcFiQFHobwNz3E6tZMBaTcWKU3v42S0D
 swJFffu5BJFnTjqYXPZYY4VnlNggYZQz8k8Kn65GtANSc4yBHmQn0sMbMjQhr25/wAuV
 Le/d9SFVeMS73E+TfTrbYcXOeqK6QuxLFxtfEvgS/NcPs70q1RUmja8fdMc77gPuylyc
 yPiA==
X-Gm-Message-State: AFqh2koEZDfzZ9e4GZ+9PxkuEHv2aHxP53B7vHPenp9t9okPrHYDCusw
 xG2tI+dvQPZ3Hx+NPmGbo1nRmw==
X-Google-Smtp-Source: AMrXdXut2IU8DPu7Ory0q3gRBC+2/UsfxZLIUSs5RcGenR6zmuESEQBfRqDJ1hKtAvFPhIMxjiBk5g==
X-Received: by 2002:a05:600c:5116:b0:3da:212d:9dc0 with SMTP id
 o22-20020a05600c511600b003da212d9dc0mr35406295wms.14.1674732179850; 
 Thu, 26 Jan 2023 03:22:59 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a05600c19cb00b003d9fb04f658sm4801290wmq.4.2023.01.26.03.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A042D1FFC1;
 Thu, 26 Jan 2023 11:22:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 16/35] tests/tcg: Use SIGKILL for timeout
Date: Thu, 26 Jan 2023 11:22:31 +0000
Message-Id: <20230126112250.2584701-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

linux-user blocks all signals while attempting to handle guest
signals (e.g. ABRT), which means that the default TERM sent by timeout
has no effect -- KILL instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230117035701.168514-2-richard.henderson@linaro.org>
[AJB: expanded commit message from cover letter]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230124180127.1881110-17-alex.bennee@linaro.org>

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 14bc013181..a3b0aaf8af 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -54,10 +54,10 @@ cc-option = if $(call cc-test, $1); then \
 
 # $1 = test name, $2 = cmd, $3 = desc
 ifeq ($(filter %-softmmu, $(TARGET)),)
-run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2 > $1.out, \
+run-test = $(call quiet-command, timeout -s KILL --foreground $(TIMEOUT) $2 > $1.out, \
 	TEST,$(or $3, $*, $<) on $(TARGET_NAME))
 else
-run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2, \
+run-test = $(call quiet-command, timeout -s KILL --foreground $(TIMEOUT) $2, \
         TEST,$(or $3, $*, $<) on $(TARGET_NAME))
 endif
 
-- 
2.34.1


