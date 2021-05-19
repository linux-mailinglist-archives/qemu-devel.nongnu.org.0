Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFD3389634
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:09:13 +0200 (CEST)
Received: from localhost ([::1]:36866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRZA-0006XK-UE
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1l-000313-CY
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:41 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a]:40456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1i-0007R9-KB
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:41 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 j26-20020a4adf5a0000b029020eac899f76so1436997oou.7
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EuZn+pX4L8/1GsX4Y2iVsbbPTiTW2IOoX08dYPiqnSg=;
 b=boPUwZtU51qkXfTX/M8wXnEORo2Qg39XWkht8gVV2rvzmhDBaDEmqKOrcVNRq5wqKT
 HmY7174f5aGAYW747Ov6Q3z55gaO1/Z+ffs+bvt+oJFkxa+6dlmJeto82VduNHWclPbW
 5ZcP5g5urKRp7mtlGuulzG4dYJMzs/Vao3TC6DvNkawop3oBFnhVfnhsr8LfhfUMKfgh
 xxYAjKDaSl6T4DWs/gdFM42ZMwraUUP6dWH/T5Ge8mZyF/JSGnPZ9nDQwfpGfBPl2hH3
 VcIFMY0FVfqAqlfHHtPunCjfaG6Jx2quI9Zr/pN2xSbiog5V86C8u1YmKrEKt376v/aU
 k6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EuZn+pX4L8/1GsX4Y2iVsbbPTiTW2IOoX08dYPiqnSg=;
 b=OKrZl9oezNeYfK2X6S/3Kbu8yZyko8EJ3velnqafujl5k2LSGYiqg0m0dAai5D7/5g
 /wMmg9VJA4KtQATf6eUJ9/M6g3DxiHt7xtVgvNhCr0tOP5agnYEIGAKUU+VfT5ZzdbOk
 aVH4QhH3JYwglic0aakNk2XihN+JIjw5W4o5Sd9T1v8eiiXdl2lEnhzn5DyNicdjj0RK
 Sp4BtuoUjxox4d4GoujQ/R1TgP2DmoK+pbrdlN+JSeZyOPDUqBDQXhQk2iCoh70CRAwv
 u+lOiMQJ2VLavW2srywgOYxe1hccvmWX1vkZ09weLMvSLFhmv8wg9Bj81pIwwQ2XVY33
 wrlA==
X-Gm-Message-State: AOAM531xk2QUZLyGWwRW1apANAvQb3aYJNgJUQv8/kRMFnyoQWC0tV9d
 P6yf6oHoK/a31g87hr6Ef41b+m5GmyOmySD+
X-Google-Smtp-Source: ABdhPJwuJpTVc8ZVdO4iMtL57kYbiy/nkZqFXIG9pXycu/PTRyIwsWNu3Pcy8TWSU8HtVgGjqDBS9w==
X-Received: by 2002:a4a:dc4e:: with SMTP id q14mr551120oov.43.1621449277511;
 Wed, 19 May 2021 11:34:37 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id i9sm38642oog.17.2021.05.19.11.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:34:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 45/50] target/i386: Exit tb after wrmsr
Date: Wed, 19 May 2021 13:30:45 -0500
Message-Id: <20210519183050.875453-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-stable@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At minimum, wrmsr can change efer, which affects HF_LMA.

Cc: qemu-stable@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-46-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 9501089861..ef0ba822e1 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -7260,6 +7260,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 gen_helper_rdmsr(cpu_env);
             } else {
                 gen_helper_wrmsr(cpu_env);
+                gen_jmp_im(s, s->pc - s->cs_base);
+                gen_eob(s);
             }
         }
         break;
-- 
2.25.1


