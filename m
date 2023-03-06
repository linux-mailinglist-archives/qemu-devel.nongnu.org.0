Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631876AB3F5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:50:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyJ-00044o-67; Sun, 05 Mar 2023 19:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxc-0002bc-OU
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:16 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxZ-0007Hp-V3
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:16 -0500
Received: by mail-pg1-x530.google.com with SMTP id s17so4554168pgv.4
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=niO44Co69efms0IVc6R/k9jlve0XAcHkzZjYqfu6blc=;
 b=RDX1kVnxQ1axmh3miOhlsRLFKktARuQ9yVZHEzH9sZXKbO+LZyPJve+YrAfz4agkO/
 eVoloIraVoz7QzcGT+uFvNEs5tkIdZU1GeFIBnY3YSjQFytXKLanihFhNPX8/jIjvguG
 BQfqeVee6wDhBzTOQ9QEGJlsA1ri4Dav8bJzjMpyY6XnC46Qkjeo93zUdVm0EYKx0XPU
 Y1rEeHbtzEIPjdTZC39v5680cU05RJyF5rlQcYrBXDAEvXAb8z4EEE0Y3a9t3QmT54cG
 HkGdnOO7diWaSi/bDAG+gTth7nlAQN2jr9jk/gN6psztKxVq8rMVuvs4OnbX0aF1jx+S
 OJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=niO44Co69efms0IVc6R/k9jlve0XAcHkzZjYqfu6blc=;
 b=FiJOUAGcn01FkHwRoSrqig1PvM/XviC7ukNrTIka05Mi907FptoSAn+AxaicKuutXG
 AEmgQAqWyn3v+8fcJjlAIojdM80cfw9RmDvrtVLHpIlq/rrZIDJRdBgBJNAn8Ajt1uQ8
 9JrfSTGAongMJ6nwsYCHTAD0giUvyvMvj28Lxn+9bHqiX9AO96lody+OcwDKQrlq2535
 iAtFGIkZKSXox9G6KRvub970TIuJnIG8K6+v2102LkdXloxEhW/zSDgQY63a186inz8g
 tXQ9BTj46S7MTB8qBLJvRhec6XA6mcA7EAZjfJOtcMGjAfOkJ6reB349xp9O+CeHKm/3
 j6Ew==
X-Gm-Message-State: AO0yUKVohNXliC+bJnPXRAfhN29hlAoODHMSfQzkrgu0Yk2GK1WaSIQu
 wX/23ZCWvuRMezbCofTL1qfih8FGv2LwcUwXkuau+g==
X-Google-Smtp-Source: AK7set9jWc/biuKELjWZGM3sun1db/aFHgcSYFlSGumzsAhlpnZu2nATfQXwD8sBxG+CyAK6eOlfXA==
X-Received: by 2002:a62:1a46:0:b0:598:b178:a3a9 with SMTP id
 a67-20020a621a46000000b00598b178a3a9mr7923327pfa.6.1678063453103; 
 Sun, 05 Mar 2023 16:44:13 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:44:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 64/84] target/mips: Fix trans_mult_acc return
Date: Sun,  5 Mar 2023 16:39:34 -0800
Message-Id: <20230306003954.1866998-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Success from trans_* subroutines should be true.

Fixes: 5fa38eedbd ("target/mips: Convert Vr54xx MACC* opcodes to decodetree")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/vr54xx_translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index 3e2c98f2c6..a7d241e4e7 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -53,7 +53,7 @@ static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 
-    return false;
+    return true;
 }
 
 TRANS(MACC,     trans_mult_acc, gen_helper_macc);
-- 
2.34.1


