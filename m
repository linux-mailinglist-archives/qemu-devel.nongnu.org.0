Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC78E33F409
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:42:12 +0100 (CET)
Received: from localhost ([::1]:45106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYJH-0002aE-Td
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCL-00051I-CU
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:01 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:43433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCE-00076L-A7
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:01 -0400
Received: by mail-oi1-x230.google.com with SMTP id y7so2813366oih.10
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lSwlVqv+bYwCmjyRbzooomYXoWGY1C+FBIkfgRk17YM=;
 b=ZUc1jutqJTJEw51HjKMHPnzFZZCw9JdjeiTzOq1MuY/9r5BEPIfE/0ne+vb7+voqG3
 FquRIrgSnjEbgphAGNF/KKpbwXuymL31Db+miMW4PEvksCqrpiwzAHChg5eMfH5My+Tf
 F8h2MOH5Mby9oW+X4XPQ5sCXt2k818WT1GvNArKOWv/QXT4hQbJaFyoCabxiq/1/SzWJ
 feBArb2UHCPX/d3GoMxIHHI7y+v61rjA0T3ENQK2utnBbdFakW5bAnErVCYY+Nee6W1T
 PHsiV9b2OYBhNkE56iLc7BGQTQ1Rb6El9vmwF4VwssToOQabJPXP5LHQk0aju+DCPyec
 kBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lSwlVqv+bYwCmjyRbzooomYXoWGY1C+FBIkfgRk17YM=;
 b=M+AsdeIKbNx38yPwoiNCqaq7K/kG952ngdI5SOolnsCX7+r4NrwNhbqk3Rb8ciIAH2
 /URdN2n0gDmCirsGCZ/LmEL2KF7ZEPEUrzZ3HotOIoI3sUYKQBZAbbYfv6YlBk/p81KG
 nQzTr4ZK3kbwsDPGgfy5txSmt4EUJKq9m1w30Sf2WCXpI/ewJKjJivUR9zK2Sp75iXdj
 p0arYEU/zfpBpUsFYSTcEvpcBHu13NqYv59sW0dgOtc64OXWKbYSyXyBKzhMBBqVXKMi
 7oQmITLzqkU1Iu0ZSW50AcNfcg5CW2lfQu2WI8g2Eh03+IPX+3Y5IpwGNv1Y6VRjJFQq
 k90A==
X-Gm-Message-State: AOAM530YN+3E7NRKbekcLbbdgyBZf5BSAy8PXX0xkL4V8lrlT3XqM769
 lYRa73A2qL1+Kx1rnlixPmoyW9+DnUDAxhje
X-Google-Smtp-Source: ABdhPJydmcI8SKwZR3QUycvnS4h7rJnOVGeKkle1G1mPRtNul141HSNPjkWJgxdlpnrCtY76I5mVQQ==
X-Received: by 2002:a05:6808:904:: with SMTP id w4mr3125133oih.1.1615995293131; 
 Wed, 17 Mar 2021 08:34:53 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:34:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/38] tcg/tci: Split out tci_args_l
Date: Wed, 17 Mar 2021 09:34:13 -0600
Message-Id: <20210317153444.310566-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index dd9bcd74f3..e323351b75 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -181,10 +181,16 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  * where arguments is a sequence of
  *
  *   c = condition (TCGCond)
+ *   l = label or pointer
  *   r = register
  *   s = signed ldst offset
  */
 
+static void tci_args_l(const uint8_t **tb_ptr, void **l0)
+{
+    *l0 = (void *)tci_read_label(tb_ptr);
+}
+
 static void tci_args_rr(const uint8_t **tb_ptr,
                         TCGReg *r0, TCGReg *r1)
 {
@@ -418,9 +424,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
             break;
         case INDEX_op_br:
-            label = tci_read_label(&tb_ptr);
+            tci_args_l(&tb_ptr, &ptr);
             tci_assert(tb_ptr == old_code_ptr + op_size);
-            tb_ptr = (uint8_t *)label;
+            tb_ptr = ptr;
             continue;
         case INDEX_op_setcond_i32:
             tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &condition);
-- 
2.25.1


