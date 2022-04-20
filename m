Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED36508F48
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:18:05 +0200 (CEST)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhEtw-0002pO-91
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEit-0005Zn-0c
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:39 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEir-0001EH-HO
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:38 -0400
Received: by mail-pj1-x1032.google.com with SMTP id md4so2659298pjb.4
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=esKzBdANexAUJ4Ped1Zb42JAumSJtJDyJYcrCyyvHX4=;
 b=ZKomJVMj8BgYVpRyt1Rt9WsCKZz1IJCXLskaJ9AhN0rJ0uGnFnMPbfeFZ6MndKNjSp
 YdujrSaWVhPwFF8dxSFZ3mnNh4YVFH0BTizXIJVzKBEHC9JTAo0SdUX7/edKslnycaha
 10fkUmetQzeCq+9gcBipxtKs48+7Mr/gzB3Aa9pJGoIM9Bfis8SDMur7YTAUwPlF+Q5+
 A6joYilTFgH7eURlNGfyjPMX333fZ2HFpduwpRfzc7ZHzTuSIuhmPwzqp6XFhNrV3ZOD
 xrcKae91FF6C2vhHgSU0RX8j1G36ZgNUhY+GLKopUN3JZ38moVk3w1SHe+WM5zrcrs1o
 5yXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=esKzBdANexAUJ4Ped1Zb42JAumSJtJDyJYcrCyyvHX4=;
 b=TGjkx4bIkFlHhr8VQwH2XDbwQkJgdauv1MpQHXTP9B1FafgCkRycrAkfLSwIvuQZec
 pUgqs+vTbGfHqF3fF0XYGp+QbbY7th2ca4RQB7hPTaJziDfnleF9w3yYbHGQAox51IFg
 8dak6dSUSURqk/JCEhDt4+DM6zpoBsh21I4WCfgETZ/mzGZSfKfhJ0ops1TpRHnUHtJp
 A9bPlwzHCiCORoXT4WKHTWLxsDmgIriJpa7KZFTIg1oQS/9d5ACtvWo6o6QJhU5j1Gd6
 xAq7iZNuVg4gqAyBXrHkqQ8YlfFPvWrWevl4nNSd7AgxvbOoVc6PJSBM/C+GR182xe06
 eh9g==
X-Gm-Message-State: AOAM532DyPuGipPi9sZBdZEligt8HJUGpqKsOnaizUDHyDdUxa/N1L8M
 ijkIjg08iI0VjX3AtlFCY/QsIUQq/0rg+A==
X-Google-Smtp-Source: ABdhPJyQqF1v6jrSsgJEHYr9ouSfQ4sIw6DXuIj6qCzQ9oXcWom2zV22d6gkk4bexUuf9Qki+tkZ/g==
X-Received: by 2002:a17:90a:5902:b0:1cb:a0eb:8f8c with SMTP id
 k2-20020a17090a590200b001cba0eb8f8cmr5803770pji.17.1650477996297; 
 Wed, 20 Apr 2022 11:06:36 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/39] target/nios2: Remove log_cpu_state from reset
Date: Wed, 20 Apr 2022 11:05:54 -0700
Message-Id: <20220420180618.1183855-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is redundant with the logging done in cpu_common_reset.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-16-richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 6975ae4bdb..b0877cb39e 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -46,11 +46,6 @@ static void nios2_cpu_reset(DeviceState *dev)
     Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(cpu);
     CPUNios2State *env = &cpu->env;
 
-    if (qemu_loglevel_mask(CPU_LOG_RESET)) {
-        qemu_log("CPU Reset (CPU %d)\n", cs->cpu_index);
-        log_cpu_state(cs, 0);
-    }
-
     ncc->parent_reset(dev);
 
     memset(env->regs, 0, sizeof(uint32_t) * NUM_CORE_REGS);
-- 
2.34.1


