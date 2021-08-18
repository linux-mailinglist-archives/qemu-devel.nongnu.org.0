Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240BC3F0BB7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:24:28 +0200 (CEST)
Received: from localhost ([::1]:48130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRAp-0000hQ-4l
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6E-0000PH-MY
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:42 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:40677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6D-0008Ul-Av
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:42 -0400
Received: by mail-pg1-x532.google.com with SMTP id y23so3299733pgi.7
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KU5GqqnHBwJE2oQY4NvVS8KLTvZHsylgeTI1DbvIUb8=;
 b=XJzJOJ5i7POCCWnTghvc7n/d1yACvi25Qm5k5YHF8sypTt3SPFKxocr0MO9H6Fx6lA
 JD8njcXcvG1lSQ4Lg4hCAjA/lEkerpAbgpP4QpYuNeDjQI1vmTQEc0pvpGeRTlsdZvTg
 01huFulTTPPriyR7vAYc9JTqf92/iWawrvPybR7az7KRtQ9f9BJQhZxby1cfIvTdRl52
 Ntg3su7zFHwHIooIWowgEihtoPXKtWE3tydxXBPRIP7FWG06spofs6ZeyvyvH6bfodX8
 oAq2W+Vk4RrhmC5nbCL0mf6XlQktyFiJ//BMNwBrh9qhQHU6bSjX626wq+x6MmmPgWXw
 +vDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KU5GqqnHBwJE2oQY4NvVS8KLTvZHsylgeTI1DbvIUb8=;
 b=dCHNAsl2IFHGAmCqbuzlLF5AR8gL05PLE1Fmr6JE/l3XvcrxVgamnyOpsc9gvcKxLE
 PEttG7u9yLHOepfWrPyafPTQsnUQmT5iC/4Oahk99KoOoYTX1LSg7UF6UGcwem9JkL4P
 iRejC1cxRD8I+yuwbeAUJBVTzYT7NjawABeT79h16jkI17LHcPSrPtCusGJn5Ks24P62
 oSg+mInI9O0MBUS20Sr0YbeW5hg2cLbkJhplIVZBQRy52Aarx/T0salu+J/PzioziqiH
 PNFAvO12k+EHPvq0M01VGUGCKnPTfjpFZQcRtHecd593EuGIPw0gJohAi2JKctqd6xjM
 UJlA==
X-Gm-Message-State: AOAM531e5ESnrQNcQtnnuXIkRJuRTTKkLlnzxIdSZuWrOdY/ZAuXx4qz
 fekLsKv4ChKFgjOrCnBRvpwIcNa/RDNisw==
X-Google-Smtp-Source: ABdhPJwYhCNPXwuxWDKNxeUPpcbZ7tsGKluTxRC6jpa3vCyr0jm4m5swBcUqJA27OwfvKLEsI77gUA==
X-Received: by 2002:a05:6a00:805:b0:3e2:f682:1b32 with SMTP id
 m5-20020a056a00080500b003e2f6821b32mr3655916pfk.60.1629314380126; 
 Wed, 18 Aug 2021 12:19:40 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/66] target/sh4: Set fault address in
 superh_cpu_do_unaligned_access
Date: Wed, 18 Aug 2021 09:18:28 -1000
Message-Id: <20210818191920.390759-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/op_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index c0cbb95382..d6d70c339f 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -29,6 +29,9 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                     MMUAccessType access_type,
                                     int mmu_idx, uintptr_t retaddr)
 {
+    CPUSH4State *env = cs->env_ptr;
+
+    env->tea = addr;
     switch (access_type) {
     case MMU_INST_FETCH:
     case MMU_DATA_LOAD:
@@ -37,6 +40,8 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     case MMU_DATA_STORE:
         cs->exception_index = 0x100;
         break;
+    default:
+        g_assert_not_reached();
     }
     cpu_loop_exit_restore(cs, retaddr);
 }
-- 
2.25.1


