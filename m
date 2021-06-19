Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7003ADB54
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:30:04 +0200 (CEST)
Received: from localhost ([::1]:47860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufjH-00073Q-Ru
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:30:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUo-0000oZ-Fu
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:07 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:44879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUk-0002IB-Nt
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:06 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so5690981pjo.3
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vE1OJEIR9F5uVVqwRhGWH88diro5kD/GK3hhxvFNkQ4=;
 b=kDeSHUILd304QDyxew7USDq3jiZv6+vvdx0qEx9xnbcLTBmGaNW25fov6SuzpPZwDB
 QtpdEnL+JJigxr2D61FaT4e3CIwg18eFmZGez7r8BoODxtQsfvceV9sdEotmoeB0zxyw
 Mbx8aSSUeD5UqiYl3YT02Z59VLwiHKTHbGFsDvYZ03tFDs+0mrGfrn4Ad6gzEpZB8tL1
 HeqD2H3DGzrTnYnQZOnnZqOUcEpJxzIwHtPiqbtXiDm3AN/oUflzcd8TF9xHgRe8oYsH
 7ZZC7G9lyAnnY26VbzUrVWPGfhPwCtHRDmTCk4ifXXs2o+Ko3u/KCnmbHAJIL/HHKWI0
 QdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vE1OJEIR9F5uVVqwRhGWH88diro5kD/GK3hhxvFNkQ4=;
 b=dN8LU+gNaQFx9+HWjnpZYVZJXqDk+R1YhB0QhTGXx+ap5gHpWpEBR4EBEgr/+qGAqV
 9C+AXZNU5bTs0xGEI40GSE7j696FNTKsdg+EBr+1jS9+JH0phlPYGxmbzY/HmT/qrL79
 Eh58qyIlzg6EpqUP2l2AXlVN5c9X0y4ofyQIiH+OetzwDf5Naou7JMu/l9++aloQZi0i
 xyfbaWs7RDNKGAPT8KAJpCYFZ5dqMbq/zzxZhl6p3MyQ0xqgIozaEc0rjZSsND6JSomQ
 c8Ri54pPfNlYChvBW3RQdZc1K8vAT+G8lJFNSe5p1GLG9oEBGGthVxsumuHkh3rPh02C
 H6Rg==
X-Gm-Message-State: AOAM530D+llEEQX6qs9L3UYuDuWlhJ6ux7FfIpICDFV3PoV5By88u/ou
 Fl42FiklRg3nml1TlmG3cy8a+fiAIoC2jw==
X-Google-Smtp-Source: ABdhPJxlq4D6fYv1pY0kv3f6bY306fKEFwOaYyG1O0CIYFwy5kUUT1G7RcNH2yktk4RibseZya3blg==
X-Received: by 2002:a17:90b:78e:: with SMTP id
 l14mr16365527pjz.4.1624126501498; 
 Sat, 19 Jun 2021 11:15:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/33] tcg/tci: Remove tci_write_reg
Date: Sat, 19 Jun 2021 11:14:33 -0700
Message-Id: <20210619181452.877683-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inline it into its one caller, tci_write_reg64.
Drop the asserts that are redundant with tcg_read_r.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index dfaa9c0fa0..613b94997c 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -38,20 +38,11 @@
 
 __thread uintptr_t tci_tb_ptr;
 
-static void
-tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
-{
-    tci_assert(index < TCG_TARGET_NB_REGS);
-    tci_assert(index != TCG_AREG0);
-    tci_assert(index != TCG_REG_CALL_STACK);
-    regs[index] = value;
-}
-
 static void tci_write_reg64(tcg_target_ulong *regs, uint32_t high_index,
                             uint32_t low_index, uint64_t value)
 {
-    tci_write_reg(regs, low_index, value);
-    tci_write_reg(regs, high_index, value >> 32);
+    regs[low_index] = value;
+    regs[high_index] = value >> 32;
 }
 
 /* Create a 64 bit value from two 32 bit values. */
-- 
2.25.1


