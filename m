Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9F66A65F5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:59:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCel-0000hC-FD; Tue, 28 Feb 2023 21:57:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCed-0008Vy-TK
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:20 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeb-00031u-Ii
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:19 -0500
Received: by mail-pj1-x102d.google.com with SMTP id y2so11898323pjg.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mOi2dZWOde9c7ZDVnk7YacZ1zzYK1AJKpJYah+w7IsA=;
 b=qHPpHxMtt0DNyTW2DRoD+Owia7RqeQpqo5MTXdzZqdA2pR8Q8OQ5gVHK1766Al6MJK
 SW6gKsglS30ep/IQ4GhTNWWYy4TC1tqu65Bs7ZP6rvBi/kiR62d5QNGKQ4glCP8t2piS
 RfHCKFan5sq745fkvwBaGkww0yd1bvmIbwpRvAX9VKvb/iJM8xUTEAlMNJinyKjsGDAV
 q/blhdF6qNtlKzS/7m5rICBJbXYCEahBhE18tugnaivirMylNprZgSpP7rgIAlrB5tOf
 hnZX67jon44Fa1NB/q0htj3mJCtqZ7OTWil7TmdLNic9gmE+lhDzlHOt+HVHWElVHo/1
 Mffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mOi2dZWOde9c7ZDVnk7YacZ1zzYK1AJKpJYah+w7IsA=;
 b=X31m7p9ASEc7uSPEWEvYIlsjLRpL1Ls0RD4t51wVUtgKhJ34qe/n6kKh72b3fk5Z1W
 QVobEjM6lnrks/5mUqVo4sj/h3Z5DvG3M2Xrw5rWB2WyAzYSgBCAlsXcoliQQKk19Frd
 0XKO2xa9n41wISyxEcFukBLVUdCc48D8o7oS58iBBvDAbW/UYO3CUeZck1d22pf4SWXM
 ZzgHc3NhHo7wGZ0q77hWUcKjst35Hq+JL5Afl5hasgwg7vRlcBqdGmwHEapqAbUSPHTJ
 6/+ItOCOFqPW0BBVvxDGHHDhAFR7zoydZYiRlaXCB5WYTawjF3Cr5nFh+dYngZIYaSSs
 otIw==
X-Gm-Message-State: AO0yUKXtLSVtMwansvpWDzAkabjpqgmGMiNljSONHHUN80iuUUwiwr5M
 QBmEWZWYUR/FcTNVGsSYmvMBWnIG9TFYGNINGko=
X-Google-Smtp-Source: AK7set88/iPUI48B3vSKr01k8SJ6JNj4XXd5qbPOoN6oV8VowoWLeJG5Soke6HjrGxkuSho8j9kodQ==
X-Received: by 2002:a17:902:e883:b0:19c:a9b8:58eb with SMTP id
 w3-20020a170902e88300b0019ca9b858ebmr6091022plg.12.1677639436726; 
 Tue, 28 Feb 2023 18:57:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 18/62] target/sparc: Replace `tb_pc()` with `tb->pc`
Date: Tue, 28 Feb 2023 16:55:59 -1000
Message-Id: <20230301025643.1227244-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Message-Id: <20230227135202.9710-15-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 1734ef8dc6..e329a7aece 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -25,6 +25,7 @@
 #include "exec/exec-all.h"
 #include "hw/qdev-properties.h"
 #include "qapi/visitor.h"
+#include "tcg/tcg.h"
 
 //#define DEBUG_FEATURES
 
@@ -707,7 +708,8 @@ static void sparc_cpu_synchronize_from_tb(CPUState *cs,
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
 
-    cpu->env.pc = tb_pc(tb);
+    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+    cpu->env.pc = tb->pc;
     cpu->env.npc = tb->cs_base;
 }
 
-- 
2.34.1


