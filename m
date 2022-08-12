Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0911591591
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:42:30 +0200 (CEST)
Received: from localhost ([::1]:38010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZc4-0005Js-NO
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ5D-0003dr-5y
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:31 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ5B-0006Yy-EU
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:30 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r69so1420431pgr.2
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=JZq1kh3/m/x8QsHt/1ellu9XpF1B8rCKef3DoEDaYYo=;
 b=ZIkyQGwUgdcDOF9XIbViRwf5IFMxzpiR6+PngpzqPJxmecVD1QGFJ7DHfaHkw5+Bct
 DnU48ywTFQU8u1jzfMUA6FKVZPQiQJEjQmAGVtATky7lVcIhPEB3gidHdzLthAMXRN+O
 DfEi+YJG4CnNgKU/SPyQ3pY3bABydf+SYZ+HyHd28iBPEJqj5D1a/sHYPTyi5b4goM6U
 2XgTvav7niBSl3bE9NE5Moo2RJ+JqwaGq+Hu1rn2f/jM8rSy2NEHaEDO5qup197K5LuL
 FJL0lE4x4Cn7+chRadh5VWhRpcChdAW0arkJLCeSNkO04QHXLcWo8n8G2T16LPd8RKV4
 wVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=JZq1kh3/m/x8QsHt/1ellu9XpF1B8rCKef3DoEDaYYo=;
 b=nJJyYFo3fTUQnvu7siFDi8Q3hjztyEytkkkKJFhzbOpbu/3h70uGIgoFpl1Z5xjC/L
 LS8mr4g1gn86m/Cubanf9Hzx9299r4ZItZKYersXfTdaUXhCOY9kRFgU208yg6t3uxJi
 q38ubSXtVPfW72YOOlzyAQPJhWCfI0OkQbRXFHXYVi1mFURmucHv6BlnFzKZuDAZ+eig
 l+r/5MHKMw1pk4KqDHegyLegmxWDbFoEsjzCg/W6s5rNTRmo1IT6H7ZGmTEhDcZE1QnA
 /fBeIWe2q/BuO3V8I/nr7NLGF1R7eFjwxqR4aZQmNbTG3/IW/GyfI06L/EeiLaMNDfPr
 yAxQ==
X-Gm-Message-State: ACgBeo0HBIyACikMblYbxCzIA1UVQZTrkobN233KWj7e5OUIMG8lhYJ3
 t609wxMTRgsW/J4sUfudTURprMEXd1N5eQ==
X-Google-Smtp-Source: AA6agR6lN7oVWIet/UwpTv2fgi6uF4SEV/b+kcv0ttAgP28lHVpbxtT+q9wFGvORUH48eoE0L4mCUQ==
X-Received: by 2002:a05:6a00:1588:b0:52f:a5bb:b992 with SMTP id
 u8-20020a056a00158800b0052fa5bbb992mr4683251pfk.38.1660327708180; 
 Fri, 12 Aug 2022 11:08:28 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 16/21] accel/tcg: Raise PROT_EXEC exception early
Date: Fri, 12 Aug 2022 11:08:01 -0700
Message-Id: <20220812180806.2128593-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

We currently ignore PROT_EXEC on the initial lookup, and
defer raising the exception until cpu_ld*_code().
It makes more sense to raise the exception early.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5278d1837b..6a3ca8224f 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -376,7 +376,7 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
         cpu_loop_exit(cpu);
     }
 
-    phys_pc = get_page_addr_code(env, pc);
+    phys_pc = get_page_addr_code_hostp(env, pc, false, NULL);
     if (phys_pc == -1) {
         return tcg_code_gen_epilogue;
     }
@@ -509,7 +509,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
          */
 
         mmap_lock();
-        phys_pc = get_page_addr_code_hostp(env, pc, true, &host_pc);
+        phys_pc = get_page_addr_code_hostp(env, pc, false, &host_pc);
         if (phys_pc == -1) {
             tb = NULL;
         } else {
@@ -983,7 +983,7 @@ int cpu_exec(CPUState *cpu)
 
             mmap_lock();
             phys_pc = get_page_addr_code_hostp(cpu->env_ptr, pc,
-                                               true, &host_pc);
+                                               false, &host_pc);
             if (phys_pc == -1) {
                 tb = NULL;
             } else {
-- 
2.34.1


