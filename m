Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F444CC75B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:52:24 +0100 (CET)
Received: from localhost ([::1]:40516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsQx-0003a9-Gf
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:52:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsLc-0001em-43
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:46:52 -0500
Received: from [2607:f8b0:4864:20::102b] (port=41775
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsLY-0000xg-0R
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:46:51 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so6186030pjb.0
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DgijVqHZRbMJcToV5HUeYKBRNb+4RK7lyL5hmphZYzc=;
 b=JoFEt+d6pD0PEVsJ98GD1Wkg9yjs6dkfN4pVsHO+aHPI7C+VkyggTlCzUhrLaoB6K1
 ccg5L60/4zgDFmh+pxcwYcaNi8BorW4Irl2MDAKwfg25cJ6/aU3Ny3tqqvPfldw1z6fe
 g1NhgLGQ97vS9kC8P1AGqNgOdtiT3oQ6q8fx/E0s5mgtT1eKTi1jae+TN1bbNeC7Qky9
 Q5AsmRMzcNVH6MG5sgvHUuPOwbbfDjYT1e5+uUYdLvtaXkoeKCMOmVKjERNEupGpbo2J
 Jkf8vYxyIBAF5gfNjqRCTTsyehp9hHC36K/GuN4m85O2DNyMy6gRh0qS8jsCm49OwzN4
 H4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DgijVqHZRbMJcToV5HUeYKBRNb+4RK7lyL5hmphZYzc=;
 b=iDf9Kf3+MCqOV1OtHrJCh5rFMpCNIZNyTlDMIfcJFehnLapdsu/QYWCfDUUtl9IxM2
 lbDjr5+e+Eq17wlqirOMdP3GstsfkqTMvzYKXBNDbDqpIaUi6bRTjdGXc7+o48Jr2EH+
 Horb5dLc27cQyeXlfOVAUrBaxIkCuo7SYAaxVo6RW+B+Y4cIi5K8WfpYz3jzuZ4OTzeZ
 QWjyIWs5B77AZ7etYgJLW61ktLxfbKkuEtloAV0yuJxrGYkRf6jw5g1B4Db05aEJ8YLp
 nzlY/EoGyNDGCwShndWHViCty/aefyP0Jq4CN77ePWeFqv85SMlK+UVflEbbxcoOUzlR
 JdpQ==
X-Gm-Message-State: AOAM531cfTTwWMHJ0+NjiXUGHHS4DbDZWhpRyeeXJhjHXVmxosNKaUuI
 lWZRuNts5DOqFsUPrr9A4J4LjJ5+ISLD1Q==
X-Google-Smtp-Source: ABdhPJxu+4Bko1dr+kIBanctwVaEXpcIWIE6e+qinDrRUA76sUcIapq0MI9yhqsBT1sHY74r7PYkrQ==
X-Received: by 2002:a17:902:b488:b0:14e:fcef:7f0b with SMTP id
 y8-20020a170902b48800b0014efcef7f0bmr39154247plr.28.1646340391709; 
 Thu, 03 Mar 2022 12:46:31 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a17090ad99000b001bcbc4247a0sm2901211pjv.57.2022.03.03.12.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:46:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] target/nios2: Only build mmu.c for system mode
Date: Thu,  3 Mar 2022 10:46:20 -1000
Message-Id: <20220303204624.468786-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303204624.468786-1-richard.henderson@linaro.org>
References: <20220303204624.468786-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can thus remove an ifdef covering the entire file.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/mmu.c       | 3 ---
 target/nios2/meson.build | 3 +--
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 306370f675..437fad09b7 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -25,7 +25,6 @@
 #include "mmu.h"
 #include "trace/trace-target_nios2.h"
 
-#if !defined(CONFIG_USER_ONLY)
 
 /* rw - 0 = read, 1 = write, 2 = fetch.  */
 unsigned int mmu_translate(CPUNios2State *env,
@@ -217,5 +216,3 @@ void dump_mmu(CPUNios2State *env)
                     (entry->data & CR_TLBACC_X) ? 'X' : '-');
     }
 }
-
-#endif /* !CONFIG_USER_ONLY */
diff --git a/target/nios2/meson.build b/target/nios2/meson.build
index e643917db1..62b384702d 100644
--- a/target/nios2/meson.build
+++ b/target/nios2/meson.build
@@ -2,14 +2,13 @@ nios2_ss = ss.source_set()
 nios2_ss.add(files(
   'cpu.c',
   'helper.c',
-  'mmu.c',
   'nios2-semi.c',
   'op_helper.c',
   'translate.c',
 ))
 
 nios2_softmmu_ss = ss.source_set()
-nios2_softmmu_ss.add(files('monitor.c'))
+nios2_softmmu_ss.add(files('monitor.c', 'mmu.c'))
 
 target_arch += {'nios2': nios2_ss}
 target_softmmu_arch += {'nios2': nios2_softmmu_ss}
-- 
2.25.1


