Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C4250B721
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:19:11 +0200 (CEST)
Received: from localhost ([::1]:55842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsFi-00051M-LC
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhrhV-0004SW-G8
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:43:49 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhrhT-0003cQ-UK
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:43:49 -0400
Received: by mail-pl1-x635.google.com with SMTP id s14so10266022plk.8
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KCZLGHTO3+wecIXI8Og9PtvFRG2EcOF2NtWwLZpjaHg=;
 b=aXU7QSXNLaYR1dcegq3rSRnqdGvGJxZOhH5qK4vx3PCsTAVtB+K1KboyZ5G6XvOtNg
 CQy+hNFHAhL9FZoGwNhzb09jqA0YvG7ykW/sL6F90rZZ5pkVvrUj8R8Iuw7IcDAbSbS/
 htUyZtaYcPxxFx3TU1Wwsu0fIAMUeX+yVOiFneS4X7C3re32Xs0CxK8ukt1Y86mTkkNW
 R83yduMlXjmFetFhZGr68yGgUx7A3vHKYKF1F8WJxW5TBEN2+ckXHh/GVg/QpGI3goCP
 f06lT83vGekgBP4FFuD/FAJHKL5dcCosZMX/cLFhJ1/nogHO29Q8bNPXDXslJHnktNYJ
 UZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KCZLGHTO3+wecIXI8Og9PtvFRG2EcOF2NtWwLZpjaHg=;
 b=cPmMreq2Yw03tlhxUQ8hUJseTrKx9LzXHPfNmLKEOcVv3Qgr7jztBJvyVUeWb7fixI
 9ReKo6fQXyOVWND7JKwQU7laZPN8DQwbbD+hgvJgl49GPr3JL7+gEh5l9V3xjCJcjRlg
 UmI6NsUfvtZiCn7pOuKchN4vm8Tkh9enrRvRBKH2gmdDQKRVdRr+Zcj0UHoIA5uSeVPe
 aGGJGGER8Ea3EcvaFGtjUfBYJyNnFBfngDx7xuFQEh41+HgyPff8C9zEYHXgJ4Yvxdrn
 XeooRlVdaRe262ECyHKNq93p5+T3G+a60brsQ6upe2WWjaCNJeJfYzljF0UuRkM4R7xo
 g88A==
X-Gm-Message-State: AOAM533bo9Dd+7C0gkPCPMQP1JRRdhRuGu7hICU4MwmOCaesT5mU7WEC
 6wUQoIq0ZcUT3xlD9YAH9N2AvT1xGU8=
X-Google-Smtp-Source: ABdhPJx8vWVOtI9cJtABtpTKpPU7mvnDFNEFqtQE1ACaoY9drxUsluAGtrbL3EThgAxqT+jnqjXOgQ==
X-Received: by 2002:a17:90b:1a8b:b0:1d1:a447:7419 with SMTP id
 ng11-20020a17090b1a8b00b001d1a4477419mr4888008pjb.169.1650627826260; 
 Fri, 22 Apr 2022 04:43:46 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:4c40:4238:b597:4c1a])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f7728a4346sm2706519pfj.79.2022.04.22.04.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 04:43:45 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] target/xtensa: fix missing tcg_temp_free in
 gen_window_check
Date: Fri, 22 Apr 2022 04:43:26 -0700
Message-Id: <20220422114332.374472-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422114332.374472-1-jcmvbkbc@gmail.com>
References: <20220422114332.374472-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pc and w are allocated with tcg_const_i32 but not freed in
gen_window_check. Use tcg_constant_i32 for them both.

Fixes: 2db59a76c421 ("target-xtensa: record available window in TB flags")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- also use tcg_constant_* for PC

 target/xtensa/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index b1491ed625e5..9ecbbf172114 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -571,8 +571,8 @@ static bool gen_window_check(DisasContext *dc, uint32_t mask)
     unsigned r = 31 - clz32(mask);
 
     if (r / 4 > dc->window) {
-        TCGv_i32 pc = tcg_const_i32(dc->pc);
-        TCGv_i32 w = tcg_const_i32(r / 4);
+        TCGv_i32 pc = tcg_constant_i32(dc->pc);
+        TCGv_i32 w = tcg_constant_i32(r / 4);
 
         gen_helper_window_check(cpu_env, pc, w);
         dc->base.is_jmp = DISAS_NORETURN;
-- 
2.30.2


