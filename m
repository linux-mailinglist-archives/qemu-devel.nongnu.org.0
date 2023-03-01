Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375D36A6617
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:01:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCf3-0001R1-Ks; Tue, 28 Feb 2023 21:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCen-0000ym-WD
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:30 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCem-00033e-Bu
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:29 -0500
Received: by mail-pl1-x636.google.com with SMTP id u5so9163592plq.7
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pev3HlA4TjnFMH1XzD5ACqNnlxKIz9B0EG7wVEpD4Xg=;
 b=RuGcI1VW2D62HeMww7WpZ3D/lCP7CaFk+PhadupZU94LRiQz87XAZF2Coa8BBAYKRo
 nLocnCmlGm1rw5r9pS72rr1j4bb1hbF5aP2t+Li+6za99jnEmI49/gnSkhbvIZIfJD2g
 5UHPT4tVHpX/5OQ+NdejXhlNrXALC75i71CwWHP2G6u0MczB+nr7jAcPy0ebQlVoiVTZ
 5eMqClrRizX7iLR4d88Qhn4txpm6t4xJR+p9WYZbUMwymhx3ojIhzcLxNuPlmfn9Wi0v
 b04RWstMXQHV6E8Tpu1jD1eKm6qHTsB4OIs+kVGorwmLZmhN72YY7kaRza1AQV/WPnQy
 6fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pev3HlA4TjnFMH1XzD5ACqNnlxKIz9B0EG7wVEpD4Xg=;
 b=ETjniHMsrWwDvn2gRDey3wfTTRg8pFu7AKPlm1fgkIR1UxGrf+9qWclNPvwW/HlUpQ
 82oKenKMtTzitu9x9k6Q+Mt/W7aIhchlj4wGtUrNZFDp/Ou36u2LjFC3Kg0wSn50O0Wp
 WHjP/a22miKgPhvsLsuM0FsDy2d9hpOF8sw3+24szVC9xOoqCct/+MfowPdBNhzCXz3d
 lnIgyof5KmgKtSjR7ej+8G138y8sSPhWKB72BIhS9Nli+2yW9c/zDSF8XtIdRDLv8nxt
 hRnTjVE+Jq+wpoMBVN5iRjszQbTWRUe3rqTMaczPXOYKUzjxOeChXqDc8+QClxEQLAt9
 eyfQ==
X-Gm-Message-State: AO0yUKU8xpmfRWV6aa6IEJSzqRgOeU1jL56XCkS7EEr3UlRqlnlpbX+6
 a9Nz3CXF3Xf2lbCIPf2aGxGE5zlqbMaqED6XitE=
X-Google-Smtp-Source: AK7set/aJF2Q0PU4mo+fhlay/l5OwglNAONQ+nkUYe+DVv2NzSo8yh5VLhlheIN6ge+pHvHyr31A2g==
X-Received: by 2002:a17:902:d507:b0:19a:96ea:3850 with SMTP id
 b7-20020a170902d50700b0019a96ea3850mr5864320plg.17.1677639447599; 
 Tue, 28 Feb 2023 18:57:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 24/62] target/microblaze: Replace `tb_pc()` with `tb->pc`
Date: Tue, 28 Feb 2023 16:56:05 -1000
Message-Id: <20230301025643.1227244-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-21-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index a2d2f5c340..03c2c4db1f 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -30,6 +30,7 @@
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "fpu/softfloat-helpers.h"
+#include "tcg/tcg.h"
 
 static const struct {
     const char *name;
@@ -97,7 +98,8 @@ static void mb_cpu_synchronize_from_tb(CPUState *cs,
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
 
-    cpu->env.pc = tb_pc(tb);
+    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+    cpu->env.pc = tb->pc;
     cpu->env.iflags = tb->flags & IFLAGS_TB_MASK;
 }
 
-- 
2.34.1


