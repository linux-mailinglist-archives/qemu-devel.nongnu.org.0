Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80724508F56
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:25:00 +0200 (CEST)
Received: from localhost ([::1]:49340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhF0d-00030Y-KA
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEir-0005WU-Sm
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:37 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEiq-0001D2-Cf
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:37 -0400
Received: by mail-pl1-x631.google.com with SMTP id c23so2554846plo.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jh8l0ggXdEtDEXJ/qJx0UWqwH+qQZo23UKh5hwekfRk=;
 b=RrtAGNk33qUEAXRwaMh7poGWOQpPtpvOqT2WFj+k9atO4TWhtr++Kt1Q4uhjALoIkK
 vqM8UMA6NLFZ9NoEeggT8KPgAYndEK0sVhSVXa2aPDh0+yElj4RjQfMX70nlhJj8PNpJ
 dm4U3ZoRJzkDQxS7t46oArMqK2vUaZCGMxCgKxdVkMYWLHoIJIsXR2lMiZmJpeP1ueH9
 mOym8ZVfHH1EWM+A0w92fjQGxW05lLvgcCvG1JHd21xtTSf+t0U6RCFJdrUWiH/++1U4
 H+7EapBMSUCJOeJMwQcRxnihSSGiJkUwP1y+LLQ6Pn6c1B/mFdfIWt4LGIfVT5zGp0wg
 xoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jh8l0ggXdEtDEXJ/qJx0UWqwH+qQZo23UKh5hwekfRk=;
 b=bmDEulBww5RqDhShMZ287xpDxAS7zzjRPdfFZWal2601cvBa4Embzy6RCulj2kpTs5
 JSYbnl2Rmxun4dC0vORGjGi9SoIULLEH9OFabQ7IW1uTg4ITNGG/w5rweUZzC7HsO3FD
 IHRQev9qKzobbxmg96o+pUUmEoEfeH9w5RqIivEiR1rquIZXqAajn85u3GwWY9+MpeVs
 GGjL04clS2YAAL5MVIKaMJXp9ql7IWs0tTgclps16KeM1UavtrE1jTrlK7vHon3f2p4P
 KTW/J9b/tKA41L+HRsj6OES/z2yb/Q0WZD2HVC8QVML2GGdr1Pb28HQyNqedKHXt3X9y
 eurw==
X-Gm-Message-State: AOAM532yqcK22EEakJ3fk+eh9OA5rRZUs3irVBjG/oOp5aNwCMPB4iAO
 zvzE3itl3lnYrV3nxXKUrTIIMU/+kMZbiA==
X-Google-Smtp-Source: ABdhPJzxpVTaZy6Vl2bCDCv7sqWGDhpF/X2f8xS916JcXjdPVXJCxmYbz51ORt16iHzHMlBgroCezg==
X-Received: by 2002:a17:902:7442:b0:158:a253:b4d5 with SMTP id
 e2-20020a170902744200b00158a253b4d5mr21731277plt.94.1650477995160; 
 Wed, 20 Apr 2022 11:06:35 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/39] accel/tcg: Use cpu_dump_state between
 qemu_log_trylock/unlock
Date: Wed, 20 Apr 2022 11:05:53 -0700
Message-Id: <20220420180618.1183855-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Inside log_cpu_state, we perform qemu_log_trylock/unlock, which need
not be done if we have already performed the lock beforehand.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-15-richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8b7f9a3065..635aeecc0a 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -224,7 +224,7 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
 #if defined(TARGET_I386)
                 flags |= CPU_DUMP_CCOP;
 #endif
-                log_cpu_state(cpu, flags);
+                cpu_dump_state(cpu, logfile, flags);
                 qemu_log_unlock(logfile);
             }
         }
-- 
2.34.1


