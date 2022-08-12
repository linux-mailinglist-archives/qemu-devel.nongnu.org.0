Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3FA591587
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:36:01 +0200 (CEST)
Received: from localhost ([::1]:55796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZVp-0005v0-13
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ59-0003YH-7H
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:27 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:34792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZ57-0006YG-O1
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:08:26 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 c19-20020a17090ae11300b001f2f94ed5c6so7692990pjz.1
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=QXLpAjJXegix3QVFN+7kzoRnl/FjKjdKo4SccL0l5jk=;
 b=TKAxrqSbHneCyWeyld1lyN3OgYx5r9+bReHQDkbVQH3OSubWdwsgSAJmBUPSn1fn+t
 1PE1Ub0//CwVV0sQX8javNYzRHdFbYIudNQrX6OIufqayRRKjShnziwYqPh6A3d3VhOC
 eRXDoSnnXKkTLiZM3X8ZRsyuFPnuIeQEPEYWE8JK4PrHZdpGQX7HrHQyBWbQJXLkt27y
 1QXAC+OWyB9NIsDIPB61izLxPazejzAzxoREqOA+7AuKgyg0Bt1Afh9hfTryr7ZKjX+N
 SdFJkHqXt02G1tezajEeBJ46h9R47mMqcJKtESmpWteA25cHcfiWb3obFmr7v1cUR1Jz
 g6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=QXLpAjJXegix3QVFN+7kzoRnl/FjKjdKo4SccL0l5jk=;
 b=FTmW1+IBcOz4NecgWIQQbAq9xEz1K74WiwTxfHs4gQXbzCxZX54OqOw0A6ahT+Ic7U
 VUmR4XuKLwo1lBCSrjXLlfZHHzQp7fXhkNSqtsviIg7NGog1getHIWA8ahI3+Cx0z7Q1
 PQ3ewjwynKoHv+6Mij5/WclaPtQOaQ2eH2bU8AaXbkoiLpAUE7MVsKJiTAmpIMgiha6A
 a21r6+VlK3wixfDWW7KSknruc47guI+Du5ZGEdOTDwIrTvN8NMPVj9X+PpGCsB8c3i6I
 MqupqDGa1HJNoMViTotpQ+YuZbrIlM4wQqlyCQWNUwuvBhdgKNp4ii7n7zHdY4C3VRtI
 3upg==
X-Gm-Message-State: ACgBeo1UVcYcnGH80jseV9C6xpjX77WGg/8+3JQtm+Lf0YKJlzsi+WlN
 JnUjjWOqSHzcvEW3oM2JC9gh/lhQyOHE0A==
X-Google-Smtp-Source: AA6agR78wd7h0UkjaWb3T1Ii30slVXTU8FhEjFpadepjgrPftzFL6X7Nbz+phTKYcL9jnrB4CakFsQ==
X-Received: by 2002:a17:90b:1c90:b0:1f8:42dd:9eba with SMTP id
 oo16-20020a17090b1c9000b001f842dd9ebamr14192436pjb.160.1660327704572; 
 Fri, 12 Aug 2022 11:08:24 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056a00000900b0052dee21fecdsm1914761pfk.77.2022.08.12.11.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 11:08:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	iii@linux.ibm.com,
	alex.bennee@linaro.org
Subject: [PATCH for-7.2 13/21] accel/tcg: Unlock mmap_lock after longjmp
Date: Fri, 12 Aug 2022 11:07:58 -0700
Message-Id: <20220812180806.2128593-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812180806.2128593-1-richard.henderson@linaro.org>
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

The mmap_lock is held around tb_gen_code.  While the comment
is correct that the lock is dropped when tb_gen_code runs out
of memory, the lock is *not* dropped when an exception is
raised reading code for translation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index f6c0c0aff6..a9b7053274 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -517,13 +517,11 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cpu_tb_exec(cpu, tb, &tb_exit);
         cpu_exec_exit(cpu);
     } else {
-        /*
-         * The mmap_lock is dropped by tb_gen_code if it runs out of
-         * memory.
-         */
 #ifndef CONFIG_SOFTMMU
         clear_helper_retaddr();
-        tcg_debug_assert(!have_mmap_lock());
+        if (have_mmap_lock()) {
+            mmap_unlock();
+        }
 #endif
         if (qemu_mutex_iothread_locked()) {
             qemu_mutex_unlock_iothread();
@@ -930,7 +928,9 @@ int cpu_exec(CPUState *cpu)
 
 #ifndef CONFIG_SOFTMMU
         clear_helper_retaddr();
-        tcg_debug_assert(!have_mmap_lock());
+        if (have_mmap_lock()) {
+            mmap_unlock();
+        }
 #endif
         if (qemu_mutex_iothread_locked()) {
             qemu_mutex_unlock_iothread();
-- 
2.34.1


