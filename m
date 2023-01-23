Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B46B677C9A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:36:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJx09-0006Ki-RB; Mon, 23 Jan 2023 08:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzc-0005xL-1A
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:15 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzY-0002PQ-VP
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:10 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso9123819wmn.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vZk1C88uw/inCNfkrhOVPoUDXVTmPwNQrJRmUIYnoUY=;
 b=DptZjk2eRGxN815sOpbFJ2EIw6ZxsFCm/5ZtSXO0npbgZwwu65Nh/duBte92Lnf3JC
 MD5NWCv5n7LgazigWlq9CwnM9zSRX0/yx7YXzuox7/v9502O0sK2OXVofJkQYrDdhEBj
 4LJqa4FNqxql/Sy+ectaRO+sNrwyNsU2AB2XnLvi3l/3+YF5XtUGtzFjAKvyXGHXyXFa
 b9s8df1WkKJHwUs+ol/UPgITDQMVOEb8bf17W8kowNichdevUHcbOMYHIdDh7nRWl2rR
 FjeLhPgUkWsXKXJ1n4l++UgQH/ryf5+8HtSAchaFlT5XNhfJLKbh7ZBzKDhxFdRopcJz
 xiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZk1C88uw/inCNfkrhOVPoUDXVTmPwNQrJRmUIYnoUY=;
 b=L2B+BhVKZ2Y/p1YY/xU3IxJUppO6R3MwKHpy5MBSN8fEzL+yoEvKjFzOYwYGMu8mH6
 8ejvXkrqny5Q4/vUV0jJOKrl0MDixILJVbIG3G5seubyMSsBnhDNpe7oEXZVHNdY4wdV
 Y1XMl8JzlsT3S06XixKOgC284EmmqEgGrrMF3ZcB2E/ikNgIzAz/SxuyyapayZjQlvDF
 G4yk6DmR4nPSX3em4jLqqEYGE9HUzDLYeZ9gqvfjhgSp/CBRy4BKwhJPlm+if+M6dV8h
 sQNYJY332rO6zLHZbJhIwM4kcPSGfv2j3S8hTTBhT5c+t/eQPvYcBtKXtY539HTwMUa5
 BEqg==
X-Gm-Message-State: AFqh2kpnkWUFBxzJ2udXXlqwRK1YqU6Iyl/qgqzdrFfPnOKWTuBXLkVf
 S0UfJLROu7dEscFXwzZsyHow+KyyyyfdyZIA
X-Google-Smtp-Source: AMrXdXtu0ODow583BF1pUpwQF88+7E73oL+gU7l+6GuR8maPGuOCbFnbpH2czWIDEkYYMMyJCYEfDA==
X-Received: by 2002:a05:600c:358b:b0:3db:2e6e:7826 with SMTP id
 p11-20020a05600c358b00b003db2e6e7826mr12685821wmq.5.1674480967527; 
 Mon, 23 Jan 2023 05:36:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/26] target/arm/sme: Reorg SME access handling in
 handle_msr_i()
Date: Mon, 23 Jan 2023 13:35:40 +0000
Message-Id: <20230123133553.2171158-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230112102436.1913-2-philmd@linaro.org
Message-Id: <20230112004322.161330-1-richard.henderson@linaro.org>
[PMD: Split patch in multiple tiny steps]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2ee171f249c..35cc851246f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1841,18 +1841,20 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
             goto do_unallocated;
         }
         if (sme_access_check(s)) {
-            bool i = crm & 1;
-            bool changed = false;
+            int old = s->pstate_sm | (s->pstate_za << 1);
+            int new = (crm & 1) * 3;
+            int msk = (crm >> 1) & 3;
 
-            if ((crm & 2) && i != s->pstate_sm) {
-                gen_helper_set_pstate_sm(cpu_env, tcg_constant_i32(i));
-                changed = true;
-            }
-            if ((crm & 4) && i != s->pstate_za) {
-                gen_helper_set_pstate_za(cpu_env, tcg_constant_i32(i));
-                changed = true;
-            }
-            if (changed) {
+            if ((old ^ new) & msk) {
+                /* At least one bit changes. */
+                bool i = crm & 1;
+
+                if ((crm & 2) && i != s->pstate_sm) {
+                    gen_helper_set_pstate_sm(cpu_env, tcg_constant_i32(i));
+                }
+                if ((crm & 4) && i != s->pstate_za) {
+                    gen_helper_set_pstate_za(cpu_env, tcg_constant_i32(i));
+                }
                 gen_rebuild_hflags(s);
             } else {
                 s->base.is_jmp = DISAS_NEXT;
-- 
2.34.1


