Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230E46B2E54
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:13:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMaA-000438-9U; Thu, 09 Mar 2023 15:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa6-0003u5-4V
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:42 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa4-0001YC-J6
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:41 -0500
Received: by mail-pj1-x102e.google.com with SMTP id l1so3170350pjt.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=im/F4vDBZlckAbIhl2MUOPmZWNKlDivZpMR3K1n8Z88=;
 b=NREL+6x6bmFrmS/S6YGD7lvLcc/66Ic8wC8yuv03If+jizyC12v7LoVJZ5vhW4qc7w
 89iB1jI1c1vcGn0/rdkay2oyb4it8ZP14UkZ3cvRqGL1XyHns8Lisw7AQMxxuczqaq4f
 IORSN8EEAzvfMjx+x2J/t8P4iyZcXMGrtqHQtB4qP/rp4FYecK4QuYZBy+xfE/ZqzX8E
 zGhzLs5LvNMGBVQD+zCtZtcQEAn9GSksQ71XHFLdZTc5S7nJ2VY7BSW61zL+5RWeZXvV
 S/09G6cDBFwjn8UKWY1DlCQ2ZeJf8FqC9z40a7N+r4AEHao2XaaO9mm5wj8a8YF5R4GI
 Ck0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=im/F4vDBZlckAbIhl2MUOPmZWNKlDivZpMR3K1n8Z88=;
 b=r2lKTnqWpalKSvo4ZdhHqsR4AXN+oXQeWVPj4sHlh6mQGBY5Oui3NlEOfom0Ma8dW1
 /teVCcKv6FNk3ddImXOHA68+YDV20Di94j+to/TsBhfbtVklwUFYfv0GDud+l0feqz6U
 h1YWxiu9Vy6ypWRs8WKDgisnl3KX5Qwsp9MQyYhV8pcVqJawDeiZChwAtjBjOB7uqM9d
 lsB1gQUQTU1cFN2ejVkiNP3Ut3tzsctWbgx4s9Ig9bO9/bbf1RAjjfVW+xYWRLKc/P6S
 boXuJC90txG3Zsz1m66cQo5kCvIrN61EpW2TDDSKeSsfT+8nw+hDTaLf3LewG4yWc/Do
 HWNw==
X-Gm-Message-State: AO0yUKXqRTB57X/3sc7I28H7i139PUEXDY5Ax2EK88UWlcBzmQWJb2Q7
 Mys8m2nlYKDLWwga3eNMqGjyzI23/c3ad8XAO0o=
X-Google-Smtp-Source: AK7set91iaXp1493Z8tQvfSItuZUYZplD9gveRQKWHMXohCfnXTqYWjCTKQCDY8lY3AD3+80K91FOQ==
X-Received: by 2002:a17:902:da82:b0:19e:9849:1767 with SMTP id
 j2-20020a170902da8200b0019e98491767mr27704112plx.42.1678392579258; 
 Thu, 09 Mar 2023 12:09:39 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 53/91] target/ppc: Avoid tcg_const_i64 in
 do_vector_shift_quad
Date: Thu,  9 Mar 2023 12:05:12 -0800
Message-Id: <20230309200550.3878088-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/vmx-impl.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index ee656d6a44..7af6d7217d 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -906,7 +906,6 @@ static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool right,
     hi = tcg_temp_new_i64();
     lo = tcg_temp_new_i64();
     t0 = tcg_temp_new_i64();
-    t1 = tcg_const_i64(0);
 
     get_avr64(lo, a->vra, false);
     get_avr64(hi, a->vra, true);
@@ -917,7 +916,10 @@ static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool right,
     if (right) {
         tcg_gen_movcond_i64(TCG_COND_NE, lo, t0, zero, hi, lo);
         if (alg) {
+            t1 = tcg_temp_new_i64();
             tcg_gen_sari_i64(t1, lo, 63);
+        } else {
+            t1 = zero;
         }
         tcg_gen_movcond_i64(TCG_COND_NE, hi, t0, zero, t1, hi);
     } else {
-- 
2.34.1


