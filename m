Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F4A6D9CEA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 18:00:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkS1h-0002ll-Jl; Thu, 06 Apr 2023 11:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkS1e-0002lI-VH
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:59:50 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkS1d-0003R6-5K
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:59:50 -0400
Received: by mail-wm1-x32a.google.com with SMTP id o32so22836098wms.1
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 08:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680796787; x=1683388787;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ghy81EekBAOnqDStLjJy01CkdBOBv7GWVAE81d+KVFE=;
 b=K/K4nSGP7NG73a3AXNhCeeYmGZ2tvcDs9f3lQVM+4J70HoP7RKEqsZ70wT4W3E12BD
 sR3VLqnzX3IzcfN/z3f1feADNahSAmZMMEXZ6sjsya47w5aKKWiXIeRwpFCdXyPYGHsu
 RalGiJoZwZkCVsk2rKJgzLASkQzZTF3+1MfdEDecjV+BnhKmWy3ifp0+ZfqERA+rMjSs
 EbiMF4K4AmzhkBzQUStuuMn/Fuc/bMAoWOlTBmbWjG4H/4p9WeCsA0qp/DmpMmHTL/rw
 g23HX6DSIt9K8IeLiHeeW7JkZQwuS/kxlJyxMYrAQ5Fzh8oJL5c2LZtniWk5ecn5mAya
 qrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680796787; x=1683388787;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ghy81EekBAOnqDStLjJy01CkdBOBv7GWVAE81d+KVFE=;
 b=RyNVQTN0QxlbRvVgE0QsaqJr2C58jxmh/weIY5Pa2j8y7azUQsrx7oxRF3TnWMUxB1
 ks29A0lkCofUAygAzatEvCaIUOoQayXfYTNjnZHXcDy4TkQntpiv0ysrnuvAZRhfGFC6
 KSMueegbel2ileyl5tKXRmrHv7ZbdW9uCmtAzjgIxw8UQDcAmwKWAz8wJ7wEPGJYuanb
 Ui/VkcLza4s5x7GNLkQFQKLTESEelseuddZ7Q0oELIbDkeR6ntij7cyidHU1VF7Sv8O3
 buwvWbugpDDTXL5XDHA9+90usJhKAQVN2GORIp2oublEG97ugPnFmqkFOmoLEb6cwoHE
 Q5hA==
X-Gm-Message-State: AAQBX9cCqvstY75KQz8ZJgHn5YBwHGE9TwLuHbAdqo++/MUbrlSvk8F9
 PRBL42vNxRCn6rGvsBxaM7ss9wozlf7i4V12Ct4=
X-Google-Smtp-Source: AKy350bq9idVVNELVXVn+O/E+HV/5U/+mBilg81L1yzSHAdjJmdYLa35eok3rOZ7W7Lhlfcxl0cYCg==
X-Received: by 2002:a7b:cb97:0:b0:3ed:5d41:f9a7 with SMTP id
 m23-20020a7bcb97000000b003ed5d41f9a7mr8210661wmi.2.1680796787397; 
 Thu, 06 Apr 2023 08:59:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a05600c511600b003ef5bb63f13sm5773390wms.10.2023.04.06.08.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 08:59:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH] target/i386: Avoid unreachable variable declaration in
 mmu_translate()
Date: Thu,  6 Apr 2023 16:59:46 +0100
Message-Id: <20230406155946.3362077-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Coverity complains (CID 1507880) that the declaration "int error_code;"
in mmu_translate() is unreachable code. Since this is only a declaration,
this isn't actually a bug, but:
 * it's a bear-trap for future changes, because if it was changed to
   include an initialization 'int error_code = foo;' then the
   initialization wouldn't actually happen (being dead code)
 * it's against our coding style, which wants declarations to be
   at the start of blocks
 * it means that anybody reading the code has to go and look up
   exactly what the C rules are for skipping over variable declarations
   using a goto

Move the declaration to the top of the function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/i386/tcg/sysemu/excp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index e87f90dbe3c..b5f0abffa3d 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -147,6 +147,7 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
     hwaddr pte_addr, paddr;
     uint32_t pkr;
     int page_size;
+    int error_code;
 
  restart_all:
     rsvd_mask = ~MAKE_64BIT_MASK(0, env_archcpu(env)->phys_bits);
@@ -467,7 +468,6 @@ do_check_protect_pse36:
     out->page_size = page_size;
     return true;
 
-    int error_code;
  do_fault_rsvd:
     error_code = PG_ERROR_RSVD_MASK;
     goto do_fault_cont;
-- 
2.34.1


