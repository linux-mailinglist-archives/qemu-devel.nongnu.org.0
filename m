Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1643D9B08
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:22:59 +0200 (CEST)
Received: from localhost ([::1]:35516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8ulG-0006CD-PL
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCs-0004j2-BC
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:26 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:50863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCq-0002jX-M9
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:26 -0400
Received: by mail-pj1-x102d.google.com with SMTP id l19so7862883pjz.0
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vsmgHBg4n+7CFHLlurhpD4be1hWiIQq/b2tVjRwTP/Q=;
 b=bdL8GwGcg7nFtovUUWy0ggJv7sMhpqM+5Zg1P0bHK+pkdIZmU55ZChsQl55znoA4iR
 AwoHDRxzMMueivXQaIUEVrJ2uWlRpDwBJRCUAYPQ2gK9N1vn9m2ui5YbmS/z+P0FSgwF
 2VazYBOGJu1OuGUk34dES31oeD27nQAMcPPdExwP5wrLSVaYPD5kImVxprE1XCntuEGj
 1plFFb8jmTutEQl9tFnvZdygpw+hTQo0Ar2q89e0uJRYg2GCyAVrwBp968oBudk6rbJM
 0+JEy7Xnlr+2Z8nkKY8mAFqzj7oz8T6wc+TpIp2pgI8vOH2ENzwFkF+GtAeS2l/GX7yx
 +W6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vsmgHBg4n+7CFHLlurhpD4be1hWiIQq/b2tVjRwTP/Q=;
 b=Ol9vj31csJXRzmrvj2eJ/XqjOG4wHx7e2jG2i/Wa2r58o3HdfHR+CfSsOFXl0S2k+U
 ZB+1EQdk6irU6RMLblgP2q5sLxAXuJ7+Ypt1a/5f7v3XR9yOrWmGXWH2E5DWwpnGOdd0
 aSMNP0Pu9dqJKn+Ftdlh2ombBVO/LvPdExmBVepgCcJ3QB30W3licpPfNlQ5ALz/tbRp
 /QgtwuYBGFMVAtQizocYz7i8/WiEfyfH08yWqK/zVW+7lC9OaSEpWsg5+5LEb/00IYEf
 7HFwXhieXJaZAjiyH2TR8Ri8i3Q8DBl/jmgCi/UVZ8F8lBGt1+qUjhXIVVnfEcCrWDbq
 vi/w==
X-Gm-Message-State: AOAM5319D2vgSvxkxFsC4RUpzMCUDdM3ZtOdJ1xsaYUXvkIVPj1QZtgy
 EYtwsnzeIvky9YHMgkWyfr5k9XiLpO/hNA==
X-Google-Smtp-Source: ABdhPJzOeGQGuRuX+GoDrGk5ChKZjjSF/SYrWXH9HqbJlKZOEhJtzMSimDObjeGuspU3yRKgTtNUsw==
X-Received: by 2002:a17:902:d645:b029:12c:2759:ce2b with SMTP id
 y5-20020a170902d645b029012c2759ce2bmr2122469plh.58.1627519643417; 
 Wed, 28 Jul 2021 17:47:23 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 28/43] target/i386: Use MO_128 for 16 byte atomics
Date: Wed, 28 Jul 2021 14:46:32 -1000
Message-Id: <20210729004647.282017-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/mem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
index 0fd696f9c1..a207e624cb 100644
--- a/target/i386/tcg/mem_helper.c
+++ b/target/i386/tcg/mem_helper.c
@@ -136,7 +136,7 @@ void helper_cmpxchg16b(CPUX86State *env, target_ulong a0)
         Int128 newv = int128_make128(env->regs[R_EBX], env->regs[R_ECX]);
 
         int mem_idx = cpu_mmu_index(env, false);
-        MemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
+        MemOpIdx oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
         Int128 oldv = cpu_atomic_cmpxchgo_le_mmu(env, a0, cmpv, newv, oi, ra);
 
         if (int128_eq(oldv, cmpv)) {
-- 
2.25.1


