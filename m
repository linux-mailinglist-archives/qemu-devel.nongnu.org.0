Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD6D6A9435
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:33:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zj-0000AK-VL; Fri, 03 Mar 2023 03:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zX-0008OX-Ji
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:16 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zW-0007t6-48
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:15 -0500
Received: by mail-pj1-x1033.google.com with SMTP id y2so1791639pjg.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832933;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NwSaqIljDGqRHOmYCGFY9iTgR6Kz3jS20l1Meea2Ofo=;
 b=Ivlee9R/JpZSB0ANxueb5frIRClksxLPymUxXTqpGu4k71xz/wYqcnBzw0g4afb9uk
 YcQ74QFWAu0IepXy3aWRo6415a5UkDLJXvgKxLToYWLcZCaB3cS50N0n1MgZIm5oAKGb
 JRA3IVSwUS6cugZpTSUv9R+6B1oLT2rUs1/5OI0EMew95L3ugxRBViVZKuXlw5sLbWk6
 HIHHl6ZG+AnMLwmIA7REafb/rzIMkPbqs8zyhRr73ENFerY8z/iKXqXS8zYznIcrtJaT
 hxDDdaIHPK9cB07ZpL/ty0ngXSjAJzTxAZDhULHy34l4/b2ibCfAa9ILN1i65wTcXScG
 NmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832933;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NwSaqIljDGqRHOmYCGFY9iTgR6Kz3jS20l1Meea2Ofo=;
 b=pqnsShzfNL++zKsNbEEnimISrO9K/aEyWta6DQRcCOwdN2slWpx8bJrYlGBNxIoA5o
 pkr26JTxnQFNu0LF4XK6N3RuA8L/xIIRV/skg4n0PzmnsIiPstYMEHOGbZ+Ht0HgckOF
 PxaonTfmTcVW0vYLQ6BriL7zGF+qNW6QfE3PR7DpaTgJHXNJ4Ll9W88GPF54u1FApq6n
 pEBP4Y3iC8uC+fi79fpFcfhQAjy/2ie7lAAxo2Xi1GCNYVGG0iVMYXMij+A7qJaECHsH
 tnsE4bMPeBLcfZ5mO6Vv3f+XwJm8seuCeaOAMUpaGmWgyPACQ+kXCMyfGex+GeF5K5uF
 MUcg==
X-Gm-Message-State: AO0yUKX4RLUVDy/tBcmOAwekIW/WQvonrdlMpul91PTZSJmJ+U/WIw11
 54vooEkPdTEyiNnM5aGA/YhUMA==
X-Google-Smtp-Source: AK7set87CisatLFGQv8au15xAgHz3rwBLV6fSFMPK4TtAj9/u2kQpNjuUgbWWZYFy5Z2CbwTNtWr3A==
X-Received: by 2002:a17:902:eb8b:b0:19e:6afd:86eb with SMTP id
 q11-20020a170902eb8b00b0019e6afd86ebmr1065861plg.56.1677832932706; 
 Fri, 03 Mar 2023 00:42:12 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 ky8-20020a170902f98800b0019337bf957dsm947794plb.296.2023.03.03.00.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:12 -0800 (PST)
Subject: [PULL 41/59] target/riscv: Drop priv level check in mseccfg
 predicate()
Date: Fri,  3 Mar 2023 00:37:22 -0800
Message-Id: <20230303083740.12817-42-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1033.google.com
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

riscv_csrrw_check() already does the generic privilege level check
hence there is no need to do the specific M-mode access check in
the mseccfg predicate().

With this change debugger can access the mseccfg CSR anytime.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <20230228104035.1879882-18-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 020c3f524f..785f6f4d45 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -451,7 +451,7 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
 
 static RISCVException epmp(CPURISCVState *env, int csrno)
 {
-    if (env->priv == PRV_M && riscv_cpu_cfg(env)->epmp) {
+    if (riscv_cpu_cfg(env)->epmp) {
         return RISCV_EXCP_NONE;
     }
 
-- 
2.39.2


