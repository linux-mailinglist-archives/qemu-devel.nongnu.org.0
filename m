Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09686522C3
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:36:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dik-0003iu-IY; Tue, 20 Dec 2022 09:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dig-0003gW-5Z
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:35:50 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7did-0000vF-Ga
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:35:49 -0500
Received: by mail-wm1-x333.google.com with SMTP id m19so8874088wms.5
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhQROkoTF/kPUU9r78mLwXXxUZ3Qm+COeH3BT1STH1I=;
 b=U4bdbUmaKC05ztUaihxcBo5oVklE8EtQIIjgLEAW6aUtd2R4tZP13fs1igeMLdZ0Hy
 tceVk0pTuZr20byqEM0GGFlRSzOXizqZBTlig538uuZDAptvbU5ka0pVylklZCOY5QXE
 OucNrefj0aiplupBUujPXxDn1WQE7nqHEnEqN3EWHQV5MI9mjwYo1iYstCELMzpReEMQ
 bFt2im80GhDxHiE8NGJ6SOI+Djzl2912/B2c4eykby18ExJ/Ys5/ppLx5QpxkYYYWZtH
 EYpqIxdDbqn94d0X5CeTZRsSB8ZzYtv77MO+Bh4gFMh2EbmEJsFQi3n8v4wAwIyHKQdl
 7J8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HhQROkoTF/kPUU9r78mLwXXxUZ3Qm+COeH3BT1STH1I=;
 b=UfCvPHHiQGGtqKiHjA8V1wyFwkd1K1FBjzXY0E4bY40vLzycl/9k7D2OkUECaDx3Lt
 BSPZ9CjJsRcxfbQsGSmlRRp7nw+EATjQ6nkwuJd9TzuT6ozpXBpKuHfNgVqBe/H2iInT
 WQsZVv9S5BFEEsXiB06tQl/uydTCZL/lYeQZhinszLdAq0otKoxDy7u2zw6Y+gULZ+6j
 jcDmAc+Sev5B8Le0+LHLumkoEoxOtWlRx/GRH6CktpMSf1bGwbGcZ/YaufnLexhL2qnT
 3d0h1E6/LoPGzpHyIL0a8P3UmgLWVSvcUKz++i3eViiwezpj5djyAUv8XVoVxLgyJZcx
 GyTA==
X-Gm-Message-State: ANoB5pmjB7Vg71E13t0gwo1U994G+5Qa/ZJRmRzXIl5LdBsT386gZtMw
 REZ+HtakOnJYoxqUVFUtEwCApHXQwds1cyD3Joc=
X-Google-Smtp-Source: AA0mqf792O3BK2uXTYfgvov08uy+kZdnUa+nGrxbZsstHA2YWoojeqCbLBegPYPDG9UvgMVcaO5XEw==
X-Received: by 2002:a05:600c:310e:b0:3cf:b07a:cd2f with SMTP id
 g14-20020a05600c310e00b003cfb07acd2fmr34553438wmo.37.1671546945726; 
 Tue, 20 Dec 2022 06:35:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m34-20020a05600c3b2200b003d208eb17ecsm17185197wms.26.2022.12.20.06.35.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:35:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/3] accel/kvm: Silent -Wmissing-field-initializers warning
Date: Tue, 20 Dec 2022 15:35:31 +0100
Message-Id: <20221220143532.24958-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220143532.24958-1-philmd@linaro.org>
References: <20221220143532.24958-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Silent when compiling with -Wextra:

  ../accel/kvm/kvm-all.c:2291:17: warning: missing field 'num' initializer [-Wmissing-field-initializers]
        { NULL, }
                ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/kvm/kvm-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e86c33e0e6..acf1ef84f7 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2282,13 +2282,13 @@ static int kvm_init(MachineState *ms)
     static const char upgrade_note[] =
         "Please upgrade to at least kernel 2.6.29 or recent kvm-kmod\n"
         "(see http://sourceforge.net/projects/kvm).\n";
-    struct {
+    const struct {
         const char *name;
         int num;
     } num_cpus[] = {
         { "SMP",          ms->smp.cpus },
         { "hotpluggable", ms->smp.max_cpus },
-        { NULL, }
+        { /* end of list */ }
     }, *nc = num_cpus;
     int soft_vcpus_limit, hard_vcpus_limit;
     KVMState *s;
-- 
2.38.1


