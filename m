Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2598F515E16
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 16:15:56 +0200 (CEST)
Received: from localhost ([::1]:34892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknt5-0003wk-87
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 10:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknDp-0003Nr-SS
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:33:18 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:44644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknDo-0006tr-Ao
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:33:17 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 m14-20020a17090a34ce00b001d5fe250e23so9460696pjf.3
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u2pM0xy41z8bwTr6w8WctOV/RUlItotfYG7rgV7aiRQ=;
 b=jBJs/XANkUP64bue39bEqQ5SUGi9rf6vxzwezGUh01B7QoReOk4opKzHX6akv8Zr9O
 xw2s1t2EG+5CluMr2ZnBAiOIJ/QQhJf1l5FVTfsqKqFAAQgSvwwHWRO7dxady/nEfTs2
 82dcY/TwCi4McqsBwKoAWIrjkQ13/eTu9LkWX8gaRRTDsuwxw+5ASqstTgvFJZlGJyrj
 /Ykyk4spb3KTNr3mHMm4n6YJEtrUMhDOAbdJZISw+yXzqS21eClVYg3/r/lBodhq5pgD
 KFMEtp7uBkFnUFNXv1kqP+mzCLJr26jIzpVeMOJvBdehJNfP2MElpvDyALuPEnn8vdOM
 dXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u2pM0xy41z8bwTr6w8WctOV/RUlItotfYG7rgV7aiRQ=;
 b=nQS4ovb1KtA1bFHQBABnWnwQ5GoZxlKlaYNPRt7X4+XJs5PQhGhW0I4rXYkwczdV4L
 ilm6X8AQjKpcrGzoVhvbX4dxmyXTBfAL6AZG4tMa/hGJWmJAWjelktgcEbzHw8cj6lMx
 sMlF3DToGdWnAAqn2NTU8tWQdMHkKKfIHVnJSLBciE3BGjOeEpz+/DF1CSrwhEglAtCV
 UfP6xNMNtJfNKGvxPv5a1IbGnYpFHIbwNGmu4d100UJEr0t60noDtzU7GlHlOkw4uVYg
 wZD8G94aID9ZX4hR0urNGYFREj+AgkBd6WvWm7UG3078T+B3p12V4PrP/ohoeNyXF369
 wQ2w==
X-Gm-Message-State: AOAM5336vfhPv5VtE4cCOnm2iuOOLZQYZ5ZTYOa25yzhgBA1zyX4EmSv
 77+qxUz0sAACY3j05FMAIwE0uMlgm9wI0Q==
X-Google-Smtp-Source: ABdhPJxASLESuVMDOfuPu1MX60xlwKjwBLWvjP7HXYNrSyEQxQ/vwtTujCB9bYkp+0UU+WxhlAPqgg==
X-Received: by 2002:a17:902:ab55:b0:15c:ecb:81ad with SMTP id
 ij21-20020a170902ab5500b0015c0ecb81admr4064898plb.50.1651325594554; 
 Sat, 30 Apr 2022 06:33:14 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c136-20020a63358e000000b003c14af5063bsm8517840pga.83.2022.04.30.06.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:33:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 41/43] target/nios2: Move nios2-semi.c to nios2_softmmu_ss
Date: Sat, 30 Apr 2022 06:29:30 -0700
Message-Id: <20220430132932.324018-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Semihosting is not enabled for nios2-linux-user.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/nios2/meson.build b/target/nios2/meson.build
index 2bd60ba306..c6e2243cc3 100644
--- a/target/nios2/meson.build
+++ b/target/nios2/meson.build
@@ -1,7 +1,6 @@
 nios2_ss = ss.source_set()
 nios2_ss.add(files(
   'cpu.c',
-  'nios2-semi.c',
   'op_helper.c',
   'translate.c',
 ))
@@ -10,7 +9,8 @@ nios2_softmmu_ss = ss.source_set()
 nios2_softmmu_ss.add(files(
   'helper.c',
   'monitor.c',
-  'mmu.c'
+  'mmu.c',
+  'nios2-semi.c',
 ))
 
 target_arch += {'nios2': nios2_ss}
-- 
2.34.1


