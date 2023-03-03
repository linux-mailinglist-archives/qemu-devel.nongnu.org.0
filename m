Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238106A92CF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:43:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zi-00006l-VF; Fri, 03 Mar 2023 03:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zS-0008Kb-Ku
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:11 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zR-0007yS-5n
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:10 -0500
Received: by mail-pl1-x629.google.com with SMTP id p20so1938264plw.13
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832928;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FJ3kazGOVFLnf4MghwTEirDnBq83iazSIg0TJyibaMc=;
 b=hnKMQUuVoWneCpN53EdiLiUuq+qqkbkG+lYAy8NtU1mGV8pQm62oN1JJMP9JvKBTLl
 loPPCn7QbfyIXy9zi2UKbFlHGQlATi+ShifJlzETPyVqb/KaDfCh7HioTUylblkqvg84
 Yn8wTkSO7zsRLbTatKDDuA32/UWZo+AFGnbd916MIflMB4G4ZNCER58zwB50kmk7G3gn
 yOioWd8wNRvFR00FBnTZr8sMj21Zgx2c7Pijf8HnvQ2BRYge1TVR3bfZPAC+GlIvpTZb
 mdUd2kb06CDcdOcMvPxrlU+mI1LaFHZrAlVRlq5S1wXo7PXuNAIBZb+1i5//toT/KQWi
 6VHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832928;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FJ3kazGOVFLnf4MghwTEirDnBq83iazSIg0TJyibaMc=;
 b=ElWUwCzDuHxPCMovPBEgqjoqfCgfhCV8J/H/rHBS+bSNDnyLih0H5VUZeUhGZn6Lrx
 WLlCmlnip03fnuVeUDfhfTRJkl6LY+/apSkFPtIWS12W2Muuu1CGgA/fkfwTac03y+xG
 onks6st84tJAhvSckMCvRX5+PFGutuMW+0qNo8ixxGLaagNI2MgoJJz/UfkzT+QEa4xI
 Yiln4rbPzlFfDreq0inkFtycdtOQRd5stXcEQaorPNw2FH9O8rzUUWuprFqmydKld22R
 AN1drPeSzkkZDSsrM1aGChdxvQGb/dIajGhNn84gbANWSa2J4q8ZwdpeoDlYRZw35YqV
 yuqg==
X-Gm-Message-State: AO0yUKWqRBdNrwZBMef0ZlIsvHAb85tBqMbr0pIJIlFQX+FMlaIpQXQ7
 HFqNvdzwudCb6WVCMZRLHw5E0w==
X-Google-Smtp-Source: AK7set+b00eHBhEdehWuyWQvxlIt6cisRGFxsZUgBNsLei8ii2CuahMvOU/EfitfhBIWxj+WB74CFw==
X-Received: by 2002:a17:90b:4acd:b0:236:a3c2:168a with SMTP id
 mh13-20020a17090b4acd00b00236a3c2168amr888247pjb.33.1677832928439; 
 Fri, 03 Mar 2023 00:42:08 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 w19-20020a17090aaf9300b00229bc852468sm2934170pjq.0.2023.03.03.00.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:08 -0800 (PST)
Subject: [PULL 38/59] target/riscv: Allow debugger to access seed CSR
Date: Fri,  3 Mar 2023 00:37:19 -0800
Message-Id: <20230303083740.12817-39-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Bin Meng <bmeng@tinylab.org>

At present seed CSR is not reported in the CSR XML hence gdb cannot
access it.

Fix it by adding a debugger check in its predicate() routine.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230228104035.1879882-15-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 10ae5df5e6..15b23b9b5a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -459,6 +459,10 @@ static RISCVException seed(CPURISCVState *env, int csrno)
     }
 
 #if !defined(CONFIG_USER_ONLY)
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
     /*
      * With a CSR read-write instruction:
      * 1) The seed CSR is always available in machine mode as normal.
-- 
2.39.2


