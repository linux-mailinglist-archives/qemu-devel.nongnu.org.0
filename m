Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87502585736
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 01:12:14 +0200 (CEST)
Received: from localhost ([::1]:49500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHZ9R-0005ey-Jt
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 19:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHZ41-0003PX-Rn
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:06:37 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:38442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHZ3w-0001sq-4v
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:06:37 -0400
Received: by mail-pl1-x62a.google.com with SMTP id o3so5812108ple.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 16:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=675f6o+9+HX/m5+vXfpzLjKZNc+MOKTIadu1Dz7TZmg=;
 b=TyLtWTaJ9zqkX1/mIZPoCZsQMfs696KhW4LJNYCHPJ09q8XfQdjpM7Ld/pTlFT2x+G
 LrTqSkLDVp1nVgLAFxns2DiTmm6NdJjaYC94J7TnkE4pSfmy/QZILuKwX4R63qm5JBMp
 IjVT0pGfYTzvoyQy7sZBHH6KYC1qQeCJI3VR8DpKv/YJpwCdd+CwuNDbWFAdG3tcbHyl
 8J2bibrbv78EDDOlpQwPoOAYDnRShCtcESVAOIeq41oh/0gC32sVtX4tkFjUhLdvRr9+
 pVyrcZgdOJWhGWmIFz3TGds08w9zmF9HNEfJcedeOKqFwJaG9OjIF7t/eNLc29Sq/lPw
 Yq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=675f6o+9+HX/m5+vXfpzLjKZNc+MOKTIadu1Dz7TZmg=;
 b=HJQparEYQXdwAWUBaMHTgmi0EeF50B3PVpFCihR/vP/LJo2zUuqQz+eCKiGLtXeApq
 Lw59Rlq1Ds3X70WrMrm/pJuU696KR4OTGWNgu2FoWaxS3S1u20SLtrxgsbv/Coim03nc
 5firpeF1mlw44uGSeoJnHP3U8EbuVzSWg7pX87ZqXkjybpKcIvdH/PtQZvOpj+V578ed
 e5C0I/Olan893JU17zKE/vagNl1uU93YtEsrQ4qswYVjcx83unH1Tv5vXZZX1AU6C/bl
 i7XI9/IzPqEBN21U87l7sfgShs1nDIecmYAbrvO7ZSkRIIzYD5fGrkYGdSOS9YLX13u3
 o7tA==
X-Gm-Message-State: ACgBeo2ka3LtrpR4ZF1/hog+0C0jP1HCbvg2QScznwf8xmpMWIrOuV3O
 hikWnDRrQrJnxcp0/HjXZMazMplVuU5Gdw==
X-Google-Smtp-Source: AA6agR7Sf7jMkQWJC8pRFddCK1n3AQAfX33tUM7mEG1UwFLydd9mx9OM0xpxFKGRfnSN3Z7zQJEDzQ==
X-Received: by 2002:a17:902:c713:b0:16e:cbe3:29da with SMTP id
 p19-20020a170902c71300b0016ecbe329damr843978plp.61.1659135990367; 
 Fri, 29 Jul 2022 16:06:30 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 nl8-20020a17090b384800b001f3e643ebbfsm960410pjb.0.2022.07.29.16.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 16:06:30 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH v3 07/11] target/openrisc: Add interrupted CPU to log
Date: Sat, 30 Jul 2022 08:01:13 +0900
Message-Id: <20220729230117.3768312-8-shorne@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220729230117.3768312-1-shorne@gmail.com>
References: <20220729230117.3768312-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

When we are tracing it's helpful to know which CPU's are getting
interrupted, add that detail to the log line.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
Since v2:
 - Added Reviewed-by

 target/openrisc/interrupt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
index e5724f5371..c31c6f12c4 100644
--- a/target/openrisc/interrupt.c
+++ b/target/openrisc/interrupt.c
@@ -83,7 +83,9 @@ void openrisc_cpu_do_interrupt(CPUState *cs)
             [EXCP_TRAP]     = "TRAP",
         };
 
-        qemu_log_mask(CPU_LOG_INT, "INT: %s\n", int_name[exception]);
+        qemu_log_mask(CPU_LOG_INT, "CPU: %d INT: %s\n",
+                      cs->cpu_index,
+                      int_name[exception]);
 
         hwaddr vect_pc = exception << 8;
         if (env->cpucfgr & CPUCFGR_EVBARP) {
-- 
2.37.1


