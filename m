Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AE761E003
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 03:39:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orVXq-0000Cn-TA; Sat, 05 Nov 2022 22:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orVXp-0000C3-Ko
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 22:37:57 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orVXn-0003KK-Oz
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 22:37:57 -0400
Received: by mail-pg1-x52b.google.com with SMTP id v3so7607080pgh.4
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 19:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dpGJViuDySHrQ5ECzH4yPy8F2cBMov2h53f2wnD62c0=;
 b=Ns0FRD63XW7TAiOShxbT0OysYMLH/q5OvN6eTnx0E1orLttPG0N+fxniLMegbAAskk
 ENarESS9uQ+HEyCrq2ISmOCQxae7Ex+YDI86KYKnPWLAS7e9EgvN7tLbwrbBaWNvAY9w
 j96Oa+3o+oR+/xOpaeu+logNwYvCEkPDK2WVdj1xE0WqFLSa7+ckPX3bsTdHwNxlsRDH
 bn+symyoqx3FOCYSuX+W+u/8lcxmmR7D9uE1crjPKX/H4nBIdgmpE9HyNmekW+EA5Pza
 +kxpE0TqyB2hPkDdw6sbBfeARw16XVuiT5sYJjtIBXNuPXrS2kilYJjg953TMtREwA3q
 jGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dpGJViuDySHrQ5ECzH4yPy8F2cBMov2h53f2wnD62c0=;
 b=rZHDzOWDvg0MiUDba9h2R+36BbW3SmzG6lyChOln1q+KuSzIFmePlBnD5RU+3ZW/uA
 n8k15w/oCGSEvLBSfMFfCDubQNMjpdoicV/STd92UEPKUMGYERcs2wvY7YxtfZTT1x+o
 3kviZ8s5HLfIPPR+9D6AFlfJzESW/N1yWR/bbs40sffdGmlMUQ2gY/9PpKWAjgrsxcKP
 EhzEbJ7RY7x8W6KPzfTYSirkAkHJ/fYDRMaouyl+9KInL1P5SuU3drrBhyPIljEOqZP1
 6YVh96fg1KdwyBvPpEmCGfk+DBdOV0mX+Nv7q+IrjCeUtsmgSw9RB03Qj/P6LsTu+Mod
 MqPA==
X-Gm-Message-State: ACrzQf19TF3bAF5/ZhsGbXRCjpgB9wakS57gQrqINX1mNhsFE5TvY3S0
 xWSCkZnnOaeKw+qnO4frBLFfPaHAzXwt/4yj
X-Google-Smtp-Source: AMsMyM6M/nSnBdEzAfxYfBXRHX98/9dYIJ93UNep7GW6WBUrcFLxGRtbqZrj6C43a1t/Dfkowr5wMg==
X-Received: by 2002:a05:6a02:202:b0:42b:d711:f27c with SMTP id
 bh2-20020a056a02020200b0042bd711f27cmr36596350pgb.246.1667702274122; 
 Sat, 05 Nov 2022 19:37:54 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:d918:7a00:e617:679e:af7:63d])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a170902d19500b0018862bb3976sm2259457plb.308.2022.11.05.19.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 19:37:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	sw@weilnetz.de
Subject: [RESEND PATCH 4/6] disas/nanomips: Tidy read for 48-bit opcodes
Date: Sun,  6 Nov 2022 13:37:33 +1100
Message-Id: <20221106023735.5277-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106023735.5277-1-richard.henderson@linaro.org>
References: <20221106023735.5277-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There is no point in looking for a 48-bit opcode if we've
not read the second word for a 32-bit opcode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index 52c7537379..092ea0ca0c 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -21965,14 +21965,14 @@ int print_insn_nanomips(bfd_vma memaddr, struct disassemble_info *info)
             return -1;
         }
         length = 4;
-    }
 
-    /* Handle 48-bit opcodes.  */
-    if ((words[0] >> 10) == 0x18) {
-        if (!read_u16(&words[1], memaddr + 4, info)) {
-            return -1;
+        /* Handle 48-bit opcodes.  */
+        if ((words[0] >> 10) == 0x18) {
+            if (!read_u16(&words[1], memaddr + 4, info)) {
+                return -1;
+            }
+            length = 6;
         }
-        length = 6;
     }
 
     for (int i = 0; i < 6; i += 2) {
-- 
2.34.1


