Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4790F6B2E68
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:17:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMa9-00040n-5L; Thu, 09 Mar 2023 15:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa4-0003ll-1S
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:40 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa2-0001XB-2s
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:39 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so2995434pja.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zsykzHvJKOL14G+/x9ql8lmUT04cw8LNSrkLYwj4C0U=;
 b=xHQoza5pnVCBkkCO/VHKmI10aXr1O0ruWbQPdxPbsI5rV1b5axStPUBFAqVv+35tSo
 ZbVSBhwl5NCrwbaZOt+7GjzxQ3Tg2x/ylI2uMx505r+3hvDJ6HEyoNgX2b5Udi8RIPtJ
 8S1dq8z9aCHDu0+3us4WNWNCm9dZ9giHqriHXYVMG40nZ/JvyAtiEtfbKVa4MdGsrdQx
 wmIw/aGwClqw2vln2mKsoNM1Qz/9EFHQZyr/JSrSJXQM4YyX7ferrHwT+2/yauawTLXD
 YA/j/UwqOr+lN38h6F0XDulzzlA8veydHuUZfiIpE/k+9nacQ5cTAHtnATltfy1/XQbx
 yuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zsykzHvJKOL14G+/x9ql8lmUT04cw8LNSrkLYwj4C0U=;
 b=hYlmzr7e6gyJ91IA3MQoOHCxg4WPvzF7HvaxwklG/M9v5eXjK754NUqPW+d9Jk9kwt
 TdKVxcihZUFwVdsniRJ+5bL0nETO+cMaywik2JzosNxjMc+BpSSQUpj9kv00U03gWbVu
 h7rynkZV9836BnBJEQlhTLUfRGwUIQh1FX947/qywZYjV/eV1WVnnYoA21+PBgd46QDF
 9iTAT9JhMctAyxE/6ieLWbYISTLy9TmnQyX/oQltt1AI5Ow+POKhKzglG570CzjeKp65
 M9F03zNoY6SMFneUtRzyAi4owIlau1tsDym/ZW6pC2kwmTDRwVeVvq0ULU+6317HHBBC
 T7qg==
X-Gm-Message-State: AO0yUKXLyDsfXaO2mY6B0HzCIn1mD9qpE8EKnwDTZCyNsPK6/P4R+Ch9
 vzzssC0zTmcdDgCkj5DiHvkqikUjJYD7QMY3NMs=
X-Google-Smtp-Source: AK7set+toiGDgsPlUqfbsiG8gIr2kvTpHcADToSt2otqDJTWcSutgU5m+0xghdLerPclrHGBo5z0Sw==
X-Received: by 2002:a17:902:7007:b0:19d:47b:67c8 with SMTP id
 y7-20020a170902700700b0019d047b67c8mr18585591plk.48.1678392576778; 
 Thu, 09 Mar 2023 12:09:36 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 50/91] target/mips: Avoid tcg_const_tl in gen_r6_ld
Date: Thu,  9 Mar 2023 12:05:09 -0800
Message-Id: <20230309200550.3878088-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Allocate a separate temp for modification.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 7018c427be..bbc2212660 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -2964,8 +2964,8 @@ static void gen_HILO(DisasContext *ctx, uint32_t opc, int acc, int reg)
 static inline void gen_r6_ld(target_long addr, int reg, int memidx,
                              MemOp memop)
 {
-    TCGv t0 = tcg_const_tl(addr);
-    tcg_gen_qemu_ld_tl(t0, t0, memidx, memop);
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_qemu_ld_tl(t0, tcg_constant_tl(addr), memidx, memop);
     gen_store_gpr(t0, reg);
 }
 
-- 
2.34.1


