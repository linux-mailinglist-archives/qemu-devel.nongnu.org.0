Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13661FD71E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 23:25:20 +0200 (CEST)
Received: from localhost ([::1]:58436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlfYd-0005Ir-NS
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 17:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jlfES-00042s-Sq
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 17:04:28 -0400
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43]:43611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jlfER-0000LW-2B
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 17:04:28 -0400
Received: by mail-qv1-xf43.google.com with SMTP id dp10so1743591qvb.10
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 14:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=leGMjXpK2HH4jKgWKo9xRsuJr3HkPgiK0233yCfpGgs=;
 b=oudhz65TfyHpYuLR9i4rIICUzB0r5nPw7a9UiTrsDIbg+PrX1eHmJ9g2FxhATNfFXq
 1l0oiP4J4+NJYjM/niXRgp3M1TDttJ0zA1iy3uoVls2Vr+ZfE2p7+fIlY9Luq6z6EW1h
 09mFs1yuIMJ5CUCy/HnQz1NmgoNKXqFVKE9d4K9FSJKbX6Fm1P77ls4jACovft/oz0/2
 TfI3ahHzDeTEMqhCfthIWak7OXZpHKzsFXQdp1LqUb6QoQY61ph3hJGxmH43H1x/pgky
 QVzlTCA41LVzHIVOhk41BkYTp/if87Z5DJSlt3elJSwUGjKZgSi/c0WcupUwNX/BLJjx
 TOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=leGMjXpK2HH4jKgWKo9xRsuJr3HkPgiK0233yCfpGgs=;
 b=K7qiQ32SPaUHofLeqgqpIdt9rD+9/DGWQnpCaWOrVzWMFVd18cZyEyFHxqVuxCJT7X
 gYngDmtIbGkNS2F4qHFjn/OnExWJ6/B37EyNU14W/G+0o72sMx4ZHyAxOPWEbcacark5
 5sJ6SRrsPoSC+XRKXXwSBTIZmXSChzQq7RGQPITm7mBTHc7qx2hOm8OtPxIpm9BpVbSj
 aAIDVo20cghmb26x+81TbSrhILO45UUdJTHqGxUrNX4HFnx3M8oYuIt3csOukSb/Gf8Q
 2ofCtof/yLPoLeD62anr4fnD+EEnQO+iI5EWDtMJPcCs23wcfT7kUFOwrOuhc6pOPesc
 CPAA==
X-Gm-Message-State: AOAM533k76+nd8y3I50KnmwpAA3clpdKPRw/qsNBPC+MekObHUn5U6N2
 PbQcGVXgrzK0mqYgrPg9ayvtMQohY0nYQg==
X-Google-Smtp-Source: ABdhPJxYdhHldkV+KneTM2kP408KlgsTDwq806haZN2BjdIK0DF7a9PdFGhWpCKamWyYdgDh+a0fxQ==
X-Received: by 2002:a05:6214:713:: with SMTP id
 b19mr536025qvz.199.1592427865845; 
 Wed, 17 Jun 2020 14:04:25 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:fc79:714c:9711:2e9c])
 by smtp.gmail.com with ESMTPSA id w13sm997245qkb.91.2020.06.17.14.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 14:04:25 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 48/73] lm32: convert to cpu_interrupt_request
Date: Wed, 17 Jun 2020 17:02:06 -0400
Message-Id: <20200617210231.4393-49-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200617210231.4393-1-robert.foley@linaro.org>
References: <20200617210231.4393-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f43;
 envelope-from=robert.foley@linaro.org; helo=mail-qv1-xf43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.puhov@linaro.org, Michael Walle <michael@walle.cc>, cota@braap.org,
 alex.bennee@linaro.org, robert.foley@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Cc: Michael Walle <michael@walle.cc>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/lm32/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index c50ad5fa15..9e7d8ca929 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -96,7 +96,7 @@ static void lm32_cpu_init_cfg_reg(LM32CPU *cpu)
 
 static bool lm32_cpu_has_work(CPUState *cs)
 {
-    return cs->interrupt_request & CPU_INTERRUPT_HARD;
+    return cpu_interrupt_request(cs) & CPU_INTERRUPT_HARD;
 }
 
 static void lm32_cpu_reset(DeviceState *dev)
-- 
2.17.1


