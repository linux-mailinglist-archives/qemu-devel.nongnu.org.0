Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1502A6F7A71
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:13:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujvX-0000uz-3G; Thu, 04 May 2023 21:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvI-0000nh-HD
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:48 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvG-00084z-7G
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:48 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-24e16918323so883642a91.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248864; x=1685840864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ho41lpjeATC7N1pQUPpGcon/1Mo2ide/rqHX/jMW8jQ=;
 b=NO03irhhD8sXqVu/I+GddYoDrn8/cd4c+L4U9p3WWwTuLih4W6kcd+Ud3mxTyXYbAv
 Vj5XVf3SW9XrvWUIYzQ6KARHBKyy0jzxlSwW7hchtcsYWm9kx3qGqXzGT+3+YUWdFlEh
 6wrRrN7/EFWxz7eyp2EyLFv5B88TktKNHER+z8cZlWg5MgfpfaRd0gz476+SSIT8paPF
 pgUJJv+Rggirf2eTDj3epoQE5NfLazIgWevWy8YKK3Xrl0zJNZaLF+QQ2yPDkT40vjwp
 pfn+2jJNzLmXW6KBUopdIXCBcpiRCeENV69C3xvxz3xikJa3AG/FN4dlCWTp69vQkNxU
 +Wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248864; x=1685840864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ho41lpjeATC7N1pQUPpGcon/1Mo2ide/rqHX/jMW8jQ=;
 b=h+yri8a4CfyiEzBTCu/AUnwF9icZwnMsfngbDaLrwAX59ffTdnFJpqgcGKtLdksKfZ
 E0qmVkRxn3fOazD+DNicmk1LAupbsVAWUS7xTkeh3vD2I25luQj8MdegSef5SnGH+2Y8
 0X8lxnEAUuDOy00hlmsnlKB00bCsn7FvFBjO4Jz3AZsPqZtKJpRgUkU4+tn5CI0XbyeN
 60TSAsAeAOBIKFfC/HSMzEda7DyqquRf0YoH+5t4jwpxqXp4v6xkTpzkUFKme0leesKS
 z9siqu8hQf/0JpEO74ZVEVds04RxjuxzyYc70vun+uRigUnlQJ1JxTIksvLTMAy8RY6A
 AM3g==
X-Gm-Message-State: AC+VfDzNeUcX8B6dMXtYGqn6ci8DT1vQ1CHwmnBbHz6oFeG7IjQSqEKZ
 lHk0p71wxtw2ypV7Rdk65Fr/ya1+N01u5w==
X-Google-Smtp-Source: ACHHUZ7sC1MzFxFEdEvAXV9+qTOHcl5zsOoaCNti8Gk/el0vLarAhPg+q0kaAf322V2gw9zazC+RLg==
X-Received: by 2002:a17:90b:811:b0:24e:56e4:9718 with SMTP id
 bk17-20020a17090b081100b0024e56e49718mr4094559pjb.15.1683248864541; 
 Thu, 04 May 2023 18:07:44 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:44 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 77/89] target/riscv: Suppress pte update with is_debug
Date: Fri,  5 May 2023 11:02:29 +1000
Message-Id: <20230505010241.21812-78-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

The debugger should not modify PTE_A or PTE_D.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-22-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-22-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index c2d083f029..6dc3fdf594 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1001,7 +1001,7 @@ restart:
                 (access_type == MMU_DATA_STORE ? PTE_D : 0);
 
     /* Page table updates need to be atomic with MTTCG enabled */
-    if (updated_pte != pte) {
+    if (updated_pte != pte && !is_debug) {
         if (!hade) {
             return TRANSLATE_FAIL;
         }
-- 
2.40.0


