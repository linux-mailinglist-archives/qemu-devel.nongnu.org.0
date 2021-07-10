Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028423C3557
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:50:16 +0200 (CEST)
Received: from localhost ([::1]:51932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FF9-0002t4-21
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exf-00069m-ER
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:11 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:45649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2Exb-0002S4-NM
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:11 -0400
Received: by mail-pg1-x534.google.com with SMTP id y17so13140533pgf.12
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jlb9t26eUmvNmKvxgmiWrSkxF75bfUaFnwmdpAxQL3Q=;
 b=gJ9ffspHBwaXZpkdmN59XMxVThYTTTAGaVsp9mKiIDf+XNOA+xMpGoL4lf1zMvVqtP
 0eeMlKk3duISt3OVZ14V+FqVnD7UHNd5Zxb5p4CzNdfyKwU5fVO00Kc4ZI6mhrSOP+CL
 x/OiAu/z7L9nZO+/K2Rs0G2occkSr6F5ugKrse8znUh753cPdPVcyRuPccF0Yr7DMIgF
 8O3rBBS+l+GiTg2OdvBDPC6Rlk0ROGBWzX5dBFXszI5lZqyYoq98D6Qs7fa2H4f/BfRY
 FaMJ/SeqJ+TdICIbnwTMScskNdVVa1IEwkmagbsGNUVT9m4QAsN7GVQVurWKrcZ2KH4L
 QT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jlb9t26eUmvNmKvxgmiWrSkxF75bfUaFnwmdpAxQL3Q=;
 b=GwKzeHfNE3WehKlWM61RbUSKdPFkW6ib6KxKHysr6vLtU03U0R9h2wzsRkuCDU1cOg
 nuS8WEVrw9eO7xOqOSiQ8U77DLhdRD6yFiTlha4sg+u2CXwEKXu3D0WdHHKyGHhq4w80
 WDyCm6qtvTkXP1n7eWpw1kvVZ2GLm1JQg4eRsZbtTSV7kXQbLudjAFB4rw/8dAUR5e8N
 34JU17SyZ+v7+U6ABvUA5cIjq1BWM5LGXMGdn35eJ3vM8xOUoJcH2ancYy9YiL+gozv6
 oG6TMFZKx1j2UX/8J0tA4gF/ZnLPQPoNEDbZCNFjpdM2jOQmbJUIakujLaVbLZZ2xawY
 mo8g==
X-Gm-Message-State: AOAM533JbTAFeFM6TqjXbjBUwvTIj60sIPB/5EoRmc0JW/whngUY9WPJ
 t9NYhg96PgpsnocNk/hXvGACKHg0abbKkg==
X-Google-Smtp-Source: ABdhPJxi7EEa73EdAlK+rbkxhhRMofPDZEPmx56jtRC1LhHm2ujyNhTq0wLuePn9NBbvXGB00ACo3A==
X-Received: by 2002:a63:450e:: with SMTP id s14mr34955763pga.312.1625931126503; 
 Sat, 10 Jul 2021 08:32:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 32/41] target/tricore: Use tcg_gen_lookup_and_goto_ptr
Date: Sat, 10 Jul 2021 08:31:34 -0700
Message-Id: <20210710153143.1320521-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The non-single-step case of gen_goto_tb may use
tcg_gen_lookup_and_goto_ptr to indirectly chain.

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 09465ea013..865020754d 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -3243,8 +3243,9 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         gen_save_pc(dest);
         if (ctx->base.singlestep_enabled) {
             generate_qemu_excp(ctx, EXCP_DEBUG);
+        } else {
+            tcg_gen_lookup_and_goto_ptr();
         }
-        tcg_gen_exit_tb(NULL, 0);
     }
 }
 
-- 
2.25.1


