Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEF453B14F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:42:03 +0200 (CEST)
Received: from localhost ([::1]:33346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZqb-0002mG-HU
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZj1-0002Me-Sa
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:12 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:36613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZiy-0005ES-Ao
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:10 -0400
Received: by mail-pg1-x536.google.com with SMTP id y187so3463765pgd.3
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mCzaU+JrOI2uB5gjGXQ6lDaHwnlMpGfIPzqc07MdKqM=;
 b=eJrzavF78Dl8X1CBsr73mWkgbu4u9a93eLvEw8+IUzsqoTF31gPveXJtPx9cD2Dz71
 KbvrUrQUAeoQMGM2ymi/hV/ObONEG+j4WeX9GwVxlN7gakUNtFCbSXUF/o3JgLMb1HZ7
 hL9wSq7nKXAtbYxCnVrFXcAGOjq2C9Yy/Ahj6+Ccb48iAabOCx81l00rBohuQbc2fl/g
 8/kwmY6SgJzNNKMEqShxtmtsZ2zRiGRlUPHDfR5pXcm9o5YJQOAbD2KG2pqexpdOoAYY
 yXNDOP3qYdwHf3Nl6LyFj1ZpebcWdgkQIJd+nx+mX9PAfK8cIKCPuusDaQ9WHc09cHjz
 vggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mCzaU+JrOI2uB5gjGXQ6lDaHwnlMpGfIPzqc07MdKqM=;
 b=WjE7VUmJ7VA5HJh7Pgk38pZaoi6JmTbZMQ9Xozmz5r+FeOyAvxeWqqJJSB1iQYQlzX
 odvfubqgmnl5sVPMiY5K5bPJgUmSjmKOX/XvVjRprI4Q2r/jbg/E5qOEcpS4A99Xb0kT
 MPKoP0HmiQ5KYrBUjTk6313di9Nns8Ic+lPUGfGDkhw/W/vFzxxnQanhzxckv/MZbXgi
 ffEm0GBWp+qGGG1TnlXKpWkOmPEaIjnts3Y+uUv2NZbg/tmc3JfPnuXqxB8LqczvlQNv
 AUQ9aKIlVIMh5u/GE4heOVBo1KPfkMdflcqOwFEIth3iVF2+veDKwkabicg8/kWcm1vK
 KMdg==
X-Gm-Message-State: AOAM531pbZK8aQ0ZKzYGZuznKf839GLLcA/5579JhQQwyNH/+SQU32k5
 2y3xJf5MMyvffb4gMcJFJzz2qUIrsnaEsw==
X-Google-Smtp-Source: ABdhPJyXcpi6RY3DahD5n4Ufcr/vM9TgrMNhTUeXGbk5+e+ClXh4IlgB6WkNuvOlSBxJO+mW3tq5MQ==
X-Received: by 2002:a63:5f13:0:b0:3fc:68a8:b1c8 with SMTP id
 t19-20020a635f13000000b003fc68a8b1c8mr1919824pgb.607.1654133646741; 
 Wed, 01 Jun 2022 18:34:06 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 03/17] target/m68k: Fix coding style in m68k_interrupt_all
Date: Wed,  1 Jun 2022 18:33:47 -0700
Message-Id: <20220602013401.303699-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
References: <20220602013401.303699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add parenthesis around & vs &&.

Remove assignment to sr in function call argument -- note that
sr is unused after the call, so the assignment was never needed,
only the result of the & expression.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 2b94a6ec84..0f41c2dce3 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -408,11 +408,11 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         break;
 
     case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
-        if (is_hw && oldsr & SR_M) {
+        if (is_hw && (oldsr & SR_M)) {
             do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
             oldsr = sr;
             env->aregs[7] = sp;
-            cpu_m68k_set_sr(env, sr &= ~SR_M);
+            cpu_m68k_set_sr(env, sr & ~SR_M);
             sp = env->aregs[7];
             if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
                 sp &= ~1;
-- 
2.34.1


