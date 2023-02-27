Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C8D6A439D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:02:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe5G-0003Dn-P7; Mon, 27 Feb 2023 09:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4L-0000lV-O7
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:34 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4K-0007Wi-5O
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:33 -0500
Received: by mail-wr1-x431.google.com with SMTP id v16so3529422wrn.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=z84JjE7d4GepJQVg5IhunfehKuie9dRvNDWsB4oPk4A=;
 b=mDSOKS6gDhesGLyZ8MVmdMLDmIamMbZWl4NAmBXaAMckuZgKFF4nVfudbffA3dem9V
 Gbh3jXB0z9yQAch5rAoImWI7AuynCFW6Wma1yYyYKSuh567iCIJNGzNvD9k0zTs7b9s/
 Jc0mbVxh2PK+yFfSM7kI7K30G7rglxV7Dvux4oYXjyCWTsWZ/HZQcspZuV1dKexH82Uq
 eYZGVXftdKW0howb66ypPRI9X2J08OhmHw6MBgGxiAFNtFLLX3WfmAl0HtrZGtO5aLJs
 5lnJBGDjsyXISIt9yyNO2qDcVUwzIl8QVLFfhnJdkgItM2nrAp71rkLLuXeIDS3HBC3e
 TjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z84JjE7d4GepJQVg5IhunfehKuie9dRvNDWsB4oPk4A=;
 b=xyaQHoAxAZK8i7enoaDUPeW8xj5ibw28kIRKzsVOZpos0dfaRwTMjjHi3jSeXxloR0
 40Dl/ff4e8RuMFf2fw8mu0vh8I3LfTXmC8ttJQOHNTvDbsYsqmBFSFIGR9MqUsoJ4LYz
 mxe8ZkI7CkqMmNZep5K/daxmspHknRctHGgbSfoxryssy22MPyBLVdGcVTkmeWbAkjUR
 7ZbABRHB80ADRKHacmZVFFlnOvh+FSksqXnyMcSKQVOG48+xD/2EkHKyQ9ovtnfwMG37
 cGXPhAhJSNXIVz/efSYDizlz9lkuC5gILjWGjsWh6X2hEzMpYQHKLivFw5DPnM/PaMR1
 0gAw==
X-Gm-Message-State: AO0yUKVrG97Hw7s/Ki7gubsr+2X0ClspjjpABrljGzfAI0kLZFzrpd40
 yngcR5ma8oQl2FIwrNVQ2W1/8rGxEnHIlO9C
X-Google-Smtp-Source: AK7set+Hv5c9qrdTo/5EuC10v/f0TtspSw/BejWw2ZE0NDfk08HIkb3J34S3dCr7Db169MdzRsh5hA==
X-Received: by 2002:a5d:6406:0:b0:2c7:ae2:56df with SMTP id
 z6-20020a5d6406000000b002c70ae256dfmr15748272wru.70.1677506490876; 
 Mon, 27 Feb 2023 06:01:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/25] hw/timer/cmsdk-apb-timer: Remove unused
 'qdev-properties.h' header
Date: Mon, 27 Feb 2023 14:00:56 +0000
Message-Id: <20230227140102.3712344-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20230220115114.25237-8-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/cmsdk-apb-timer.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
index c4c7eae8499..2dd615d1be9 100644
--- a/include/hw/timer/cmsdk-apb-timer.h
+++ b/include/hw/timer/cmsdk-apb-timer.h
@@ -12,7 +12,6 @@
 #ifndef CMSDK_APB_TIMER_H
 #define CMSDK_APB_TIMER_H
 
-#include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
 #include "hw/clock.h"
-- 
2.34.1


