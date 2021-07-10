Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0A93C3556
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:50:15 +0200 (CEST)
Received: from localhost ([::1]:51884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2FF8-0002rJ-Mb
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExY-0005j5-2N
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:04 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExW-0002MT-95
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:32:03 -0400
Received: by mail-pj1-x1030.google.com with SMTP id g24so7415750pji.4
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z0rbZYpLmN7OBA+o9g3ziAIPPJLFXElqgMaQw5pyuig=;
 b=AihVAPyrF8jDHZkbysV1bD4yuSHfwpcIOLJc1i3mJt8xoKLGJ7z2VeneNQlpbigOjL
 BwZLhzrZ/k0CjdYGYu/dCAhxGke9EAlc0ARhFh2LL4sFTVgocrY8UiJuWHZnmSPcXaT3
 u19yX5ngeKvxjoBbIaQld1TDtZjV+cW9ZEr/1ulyo3+jHTEbCYmz8eF3Iyqylq831I05
 Ae9cmGL0gdDZ17v8NSrRNSrRYlXZ/xZhWkuA2+QfEVrAyYcZ9SXJbg36usNDoLlJUL3J
 W6u1NUkGLMv9aIfov3mjtr2OfV8RTmjLcVuYVhEnZ9LQgQhBacC3UN2Rq1ADuUQyCJ4J
 5oMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z0rbZYpLmN7OBA+o9g3ziAIPPJLFXElqgMaQw5pyuig=;
 b=WWBfP4N21ot9Qwo5F/rHMLNEPpOeMmZ2xgByveo20v/RqscCNu6iW+wM9RGgRe9gCQ
 DQMdFN9ITBgsEiEdw+Y8rQDTlu6j0sebpr4BhwdefeXuN7HWkh2PkoRNtzl+YUZV48VL
 4g7jpFRbLraYptqZL0f1HJvZFMXgqUMrvpSUR4Mqe/Rz0+dv7/xcfvDXwRSWRIchPOfb
 ycU3rp/1sf325EbKBCca30j2V82VEA752dj/Z+JFsdNCKqXzo3BZCnb74G9mCba7pBeM
 bxR98Jf7U4vlE6iGAyxezWeeqOuFSfhz4Bft15N959IRJqVvPvTJNIwknYNlfEXAbdIg
 avyA==
X-Gm-Message-State: AOAM531u3SstK20+sBc+ape/QfZ76sIEn8tV4OnLM17UWvQuxoLVjFt6
 QGv07ud6iQt1MzsBVPzhuKctSQLrue4n1g==
X-Google-Smtp-Source: ABdhPJzDn+9rgmRu8xwbMjhPl39cBikrKH3CEGpsnMikPp6cWp79JnF/jJhPMDavatfLJgVu7sVcug==
X-Received: by 2002:a17:902:f682:b029:128:e54c:f58a with SMTP id
 l2-20020a170902f682b0290128e54cf58amr35873297plg.13.1625931120956; 
 Sat, 10 Jul 2021 08:32:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:32:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/41] target/openrisc: Use translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:25 -0700
Message-Id: <20210710153143.1320521-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: Stafford Horne <shorne@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reorder the control statements to allow using the page boundary
check from translator_use_goto_tb().

Reviewed-by: Stafford Horne <shorne@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/translate.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 5db63d7609..37c3e3e0a3 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1719,16 +1719,17 @@ static void openrisc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         /* fallthru */
 
     case DISAS_TOO_MANY:
-        if (unlikely(dc->base.singlestep_enabled)) {
-            tcg_gen_movi_tl(cpu_pc, jmp_dest);
-            gen_exception(dc, EXCP_DEBUG);
-        } else if ((dc->base.pc_first ^ jmp_dest) & TARGET_PAGE_MASK) {
-            tcg_gen_movi_tl(cpu_pc, jmp_dest);
-            tcg_gen_lookup_and_goto_ptr();
-        } else {
+        if (translator_use_goto_tb(&dc->base, jmp_dest)) {
             tcg_gen_goto_tb(0);
             tcg_gen_movi_tl(cpu_pc, jmp_dest);
             tcg_gen_exit_tb(dc->base.tb, 0);
+            break;
+        }
+        tcg_gen_movi_tl(cpu_pc, jmp_dest);
+        if (unlikely(dc->base.singlestep_enabled)) {
+            gen_exception(dc, EXCP_DEBUG);
+        } else {
+            tcg_gen_lookup_and_goto_ptr();
         }
         break;
 
-- 
2.25.1


