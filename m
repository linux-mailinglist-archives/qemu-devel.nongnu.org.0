Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B14D6A6628
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:02:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCig-0002xo-92; Tue, 28 Feb 2023 22:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCib-0002Xt-Ey
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:25 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCiJ-0004G4-FI
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:09 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso10554757pjs.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/FsI5n4WgHRv66eevhE+xAIN7J7lkFbjUwPoPOuuXQ=;
 b=f2K50/5MuR+l0eE2Yw/wdMpCI0rQmY5KIE/3oBa522Va2OHvIxrcPi1mC/FWLVfhvm
 c8mkkSK3vQsQU3/b/UN6aYn2fQqHcf95SC1gHCldpj+ySbnViDEcRoM6QLTV1Am05+/g
 13CaRxQv43hal8b3rNCqIEnZQj5TIxwaHcgtfMEGnriLcc1DHon4AEyd2fip+0Kszix/
 IE5m7MQNt/XTNN9beoMKZPwkJR2l8bB0MUbzhk/LV5yk0I9hsAW0NpRYCuUcgy4oTeYP
 8PSAyCZHAg4CzlddQDo34pJnKznb9Opo7/rG01Dw5IzHW5T8N72uxYksIL4l6W64zoUe
 q+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c/FsI5n4WgHRv66eevhE+xAIN7J7lkFbjUwPoPOuuXQ=;
 b=I1I+jaLVDOaLtEqI4FlGqpVgIAVZJ0vWgpnHg2b+iORO/Sq8TA0ahp+wPmbdMRsiDa
 6DToo5eA8cH4pW43mTbwwAqqoprH+9P7zmp/BhmRRcOLhn1aDYKImlHgOQPc1S5I6N44
 xTdOY+mt145cpkz58E3G55QicKMW+59pIUgtvgxbA6bday2zecfmSbzsivLlBmmP4rgi
 4CitZaihGmdHu0NxFkOkCzmKN5QqjPCQUDXztfr5K/76AFf3geHfDeJ5aM6GwOUiwA8B
 P3os0d8PmLLzl0jWDE8seBG3EmK719YhSnoFeTP8Z6Md2Gg8VIwru2QSvxjvY2hCuv0O
 cMKw==
X-Gm-Message-State: AO0yUKWc9XiqSJukiE7Xeps3bZ3eE0TW//u29yLEH2CBQyr79Ejq1734
 uz8x0ou+VNS5jQTx4U/exTofA8rm46m4ZDle4Jk=
X-Google-Smtp-Source: AK7set+f4zlmtiezumumx/NbmDaXehMm4GZEbL7shtC6l3yCKANdoanZnltwoDHc396h4dx5q6nz4A==
X-Received: by 2002:a17:902:e549:b0:19a:a815:2876 with SMTP id
 n9-20020a170902e54900b0019aa8152876mr5916745plf.62.1677639666587; 
 Tue, 28 Feb 2023 19:01:06 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:01:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 47/62] accel/tcg/plugin: Tidy plugin_gen_disable_mem_helpers
Date: Tue, 28 Feb 2023 16:56:28 -1000
Message-Id: <20230301025643.1227244-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Here we are creating a temp whose value needs to be replaced,
but always storing NULL into CPUState.plugin_mem_cbs.
Use tcg_constant_ptr(0) explicitly.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 9b793ac62c..c42a436c0c 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -630,8 +630,6 @@ static void inject_mem_disable_helper(struct qemu_plugin_insn *plugin_insn,
 /* called before finishing a TB with exit_tb, goto_tb or goto_ptr */
 void plugin_gen_disable_mem_helpers(void)
 {
-    TCGv_ptr ptr;
-
     /*
      * We could emit the clearing unconditionally and be done. However, this can
      * be wasteful if for instance plugins don't track memory accesses, or if
@@ -644,10 +642,8 @@ void plugin_gen_disable_mem_helpers(void)
     if (!tcg_ctx->plugin_tb->mem_helper) {
         return;
     }
-    ptr = tcg_const_ptr(NULL);
-    tcg_gen_st_ptr(ptr, cpu_env, offsetof(CPUState, plugin_mem_cbs) -
-                                 offsetof(ArchCPU, env));
-    tcg_temp_free_ptr(ptr);
+    tcg_gen_st_ptr(tcg_constant_ptr(NULL), cpu_env,
+                   offsetof(CPUState, plugin_mem_cbs) - offsetof(ArchCPU, env));
 }
 
 static void plugin_gen_tb_udata(const struct qemu_plugin_tb *ptb,
-- 
2.34.1


