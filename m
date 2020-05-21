Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB8F1DD34F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 18:49:00 +0200 (CEST)
Received: from localhost ([::1]:42822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jboNP-0003Ps-J4
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 12:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboI4-0001r2-2O
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:43:28 -0400
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41]:33116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboI3-0006VA-6w
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:43:27 -0400
Received: by mail-qv1-xf41.google.com with SMTP id er16so3384491qvb.0
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 09:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wu18ytPvx1d0kVanWp/H7LPvrM4VUoBEe+P8kb9ryLo=;
 b=JKWYumNgzhW4YWWh51l2xT87Y/KrKNY/g0igIh8o1RXUyE+545PwZLb/F/v2KvFITA
 OfcQqBSgqfS/Z9C61MytBrdvjuIv2iBwtLC1ugLtlRvz1i/UfK+EONslmQ7t8NmlVuB5
 MTmGextuwll52y4oK5AT+UyUhBfBplzYbp8FbAxdVi00ZkUrA18nXRJeburhR/lGwkbj
 XVh2MNHDOT92mTPyj22/ioJMYYOs55PpxCm0O6gmsURMxXFU3kUssB8m/zIz+5uYmOuf
 0OmS/yv9bYoTv8jbqTJtX9jbk4y6x/PXHVh4CCWzi3TLHS3wE46/rehwhl/iIltuHsia
 YobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wu18ytPvx1d0kVanWp/H7LPvrM4VUoBEe+P8kb9ryLo=;
 b=ZFwTpY17lAoYp9lYEUxPk8oe65FfNG2l9vlZqIHs7AUxMjELKZzgIWdZ3Csw91j6Ri
 +8COceEB5H0uAcofDphrX7I/B3ulh9UYhZ0vvcd9e9Gt/bcw4Lih/ZTH3zTVeCPjwgg7
 lSLHhvg0HrA5eZGps6sBlEQqGyDvK8OrQGt3r2XrB41e3TjtcEb7TVMKMyzxtVFAk5g2
 MlZJt7sIKWLFHsG8hcgMi6c2a3GEVEOFrhVsoQhvGFAzizIY2mprQTned+DstydsvgNf
 9gRcZhslExgOpHtcKelmpmatCZJKhjRssJRh+BpA+BBh0+MdD1MLwvKT+dzjquLyxEqq
 GpVQ==
X-Gm-Message-State: AOAM5332NqsnDPy+KVFK1U7LYinAc/e216/HHNXaLzkUHzpFkCi9hI3g
 6nuzLhxK9U1DzgAWl0Mer6ZqAwhdrvxr+g==
X-Google-Smtp-Source: ABdhPJwdeuOLdL7WAB+JCWaeudr7GavF6Hf6qe4Wp7mf8WlN54DmMAvJeqKn0J+r84zTRBZ3m/7KLg==
X-Received: by 2002:a05:6214:6a7:: with SMTP id
 s7mr11097903qvz.142.1590079406050; 
 Thu, 21 May 2020 09:43:26 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:1944:c530:655c:5583])
 by smtp.gmail.com with ESMTPSA id x24sm5923829qth.57.2020.05.21.09.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 09:43:25 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 08/74] tcg-runtime: define helper_cpu_halted_set
Date: Thu, 21 May 2020 12:39:05 -0400
Message-Id: <20200521164011.638-9-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521164011.638-1-robert.foley@linaro.org>
References: <20200521164011.638-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f41;
 envelope-from=robert.foley@linaro.org; helo=mail-qv1-xf41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: richard.henderson@linaro.org, cota@braap.org, alex.bennee@linaro.org,
 robert.foley@linaro.org, peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 accel/tcg/tcg-runtime.c | 7 +++++++
 accel/tcg/tcg-runtime.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index 446465a09a..32ec18fe40 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -168,3 +168,10 @@ void HELPER(exit_atomic)(CPUArchState *env)
 {
     cpu_loop_exit_atomic(env_cpu(env), GETPC());
 }
+
+void HELPER(cpu_halted_set)(CPUArchState *env, uint32_t val)
+{
+    CPUState *cpu = env_cpu(env);
+
+    cpu->halted = val;
+}
diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index 4fa61b49b4..433b6bc88e 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -28,6 +28,8 @@ DEF_HELPER_FLAGS_1(lookup_tb_ptr, TCG_CALL_NO_WG_SE, ptr, env)
 
 DEF_HELPER_FLAGS_1(exit_atomic, TCG_CALL_NO_WG, noreturn, env)
 
+DEF_HELPER_FLAGS_2(cpu_halted_set, TCG_CALL_NO_RWG, void, env, i32)
+
 #ifdef CONFIG_SOFTMMU
 
 DEF_HELPER_FLAGS_5(atomic_cmpxchgb, TCG_CALL_NO_WG,
-- 
2.17.1


