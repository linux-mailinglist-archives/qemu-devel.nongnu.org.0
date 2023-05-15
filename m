Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C346F70287A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:28:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUUM-0004dV-P3; Mon, 15 May 2023 05:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUG-0004bN-JB; Mon, 15 May 2023 05:27:24 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pyUUF-0002tq-3U; Mon, 15 May 2023 05:27:24 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6434e263962so9179158b3a.2; 
 Mon, 15 May 2023 02:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684142841; x=1686734841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NzoCdEXbfhZ/bRqBlmISivmhbZ7+0QvG20U3xWbXUGU=;
 b=fHXVS3KPfkp/DgmTuGThMXgwZpMS6Qw/wuVb017kQMOo0Vk9zXgProva58dS1IrD+I
 ZD3GbVQWwNExXI478qx+793uVAkzNlta4n2B1x+FXRbROkJnSY91ON6xb3nmfSwHUP0i
 urbki+a2Db6meWsfTHLAY+SlxRe6QWIBjkyFNwc/tlqsj/ZehgLRXGF3PkN4XGYv/Lzs
 TuaL2sObDSoHghNTHzd4KfGR2S9kgoRb3Oet6pOL16wmEGdUt9P+5ZdDmSu2v//X+Uuh
 QyHJB9vNTp3b6nRN8Rmu/yfl69L/VpexQDc9oi0HNjuW47XRaQNIJmFvNHA5XuDp1ipk
 Yzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684142841; x=1686734841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NzoCdEXbfhZ/bRqBlmISivmhbZ7+0QvG20U3xWbXUGU=;
 b=fAVak6Dz//mG8gG0t8QGBXgyiEiHlMd1Iq3T08ULNLC7YULOlWg3fJG/CqMJKtv8r8
 B61jhzZjbsrLD3FwiQ3fFehFN+4BJoBsq4CAAxcHp1SmGSSsiNimoITAQw/Wgdcxb30I
 5y9ktQpVF/AywUMPfESfWJRD7fipSyERl+J/466/otzFGfrEHPmv5f+1awdBXHyQcbM1
 MJgdYq2c23+pURGByK3R7FUPQDsoP0yLDNEdE0C3DwMCPyxV9W1eMwpfjDXmoBQGej8h
 F/JnjaWTcDaSMl9CWDawPmQ7bH/oW1vPn1T1EOASKfHNnsldTAOnKq3O5m4iZQedxYtw
 0ycw==
X-Gm-Message-State: AC+VfDw9RRTXQITmom4KIIY/W0ED9nB8vbMn9nVBYroGwy1gKGogcADY
 bVyjX9pgBLopWNXm/wv1isd/fdsMP0o=
X-Google-Smtp-Source: ACHHUZ4O3yjpN7I5X9syu4UneYI9JFgcH2Oe0JUGq8U44Erpizq/4sO7q+0ry0jSj/6X5UWQ5Rk1hA==
X-Received: by 2002:a05:6a00:2d0e:b0:641:699:f353 with SMTP id
 fa14-20020a056a002d0e00b006410699f353mr45612894pfb.22.1684142840898; 
 Mon, 15 May 2023 02:27:20 -0700 (PDT)
Received: from wheely.local0.net ([202.168.30.146])
 by smtp.gmail.com with ESMTPSA id
 n20-20020aa79054000000b006466f0be263sm11387818pfo.73.2023.05.15.02.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 02:27:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v3 4/9] target/ppc: Alignment faults do not set DSISR in ISA
 v3.0 onward
Date: Mon, 15 May 2023 19:26:50 +1000
Message-Id: <20230515092655.171206-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515092655.171206-1-npiggin@gmail.com>
References: <20230515092655.171206-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This optional behavior was removed from the ISA in v3.0, see
Summary of Changes preface:

  Data Storage Interrupt Status Register for Alignment Interrupt:
  Simplifies the Alignment interrupt by remov- ing the Data Storage
  Interrupt Status Register (DSISR) from the set of registers modified
  by the Alignment interrupt.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v2: no change.

 target/ppc/excp_helper.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index bc2be4a726..453750a9d6 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1449,13 +1449,16 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         break;
     }
     case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
-        /* Get rS/rD and rA from faulting opcode */
-        /*
-         * Note: the opcode fields will not be set properly for a
-         * direct store load/store, but nobody cares as nobody
-         * actually uses direct store segments.
-         */
-        env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
+        /* Optional DSISR update was removed from ISA v3.0 */
+        if (!(env->insns_flags2 & PPC2_ISA300)) {
+            /* Get rS/rD and rA from faulting opcode */
+            /*
+             * Note: the opcode fields will not be set properly for a
+             * direct store load/store, but nobody cares as nobody
+             * actually uses direct store segments.
+             */
+            env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
+        }
         break;
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
-- 
2.40.1


