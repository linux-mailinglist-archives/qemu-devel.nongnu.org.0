Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B30F33766C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:03:58 +0100 (CET)
Received: from localhost ([::1]:33542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMqz-0003Cc-AA
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUd-0003ml-7z
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:51 -0500
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:35043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUZ-0006cx-Ss
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:51 -0500
Received: by mail-qk1-x72e.google.com with SMTP id d20so20806331qkc.2
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QUs6bZlAERttu34ccVgcqABRUHJrBFMHH0LXLYX1oZo=;
 b=cL+/kNiEGB49mzbGLi58RnhBMxPfn+1KKr5kYd62mCe9EP5UvP3xr6xZqN94o5y0xc
 7YaFhJF3MYQtAacTWLzVV7Ap5yYZDLXHuHSEelZm7bqIZW6+fRoX6y4Lv69ly12UqiRC
 OmAfOdy9WdYMexZ0hnOwxv8gAJ8HGpP6zPVIIspWBrrGdTOncWGkU8j2ZxWRIiycW0Gz
 2SGxLOmNpEY/nyW/USvXoo0RGB2QJiKgHCO6pLwU1gz3aKIYpui5j27eTBb+l73/zyox
 GEIk2vmrAasNGRbQ9fgSEcXCSr4UdyIDUEnK+k0qUv7+WFdM+TcJDLT1CbP5CEN/Wa99
 9+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QUs6bZlAERttu34ccVgcqABRUHJrBFMHH0LXLYX1oZo=;
 b=Fo/yAcIuXLRVCDoi139wPFXnFie91B+vKN7eZBu3hd+niosAbrpivS73ANXDibPH9+
 KV72FU/J8Ze5xG4ILzXWBEk/dR7vYOduyOmPwh+bkopQxoUx9KnCukdtTj7zCOKXOcpa
 GKesi7IBVy4Uxw3mCuSAfoF99peFAXlw2ehp4MvWH61tYm5uLetCWyeHEO+rdAM7rtz5
 PKMqu9+TKGtJhf/fJkDgHD/d4ayAQjASB4ae77KbXRpND3rl4kpLeYGXUydHxpl60+n3
 rUC5WBxZskvXNhQPW33P8Q/Bz6Ms+56udHJJG9gFuYX4rGu5RsUGwWvMR3b+q0Ef1eJc
 mkRw==
X-Gm-Message-State: AOAM53187ICSO7oH8E4fkIFHi8Bv8q3YsoacV5nNuR3fEJGTto6aDoDw
 4unszltKMfty2Jxqj4jlfMecyLuhvwrrKVE/
X-Google-Smtp-Source: ABdhPJxOYzP+xsLhi4k1O8wpd7xqKHHOUI64CGAmOuGlx0Vs5rIFgRsbvyHXd3jmBKldDvTxvWapDA==
X-Received: by 2002:a37:a9cf:: with SMTP id s198mr7487943qke.143.1615473645062; 
 Thu, 11 Mar 2021 06:40:45 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 32/57] tcg/tci: Split out tcg_out_op_rrrc
Date: Thu, 11 Mar 2021 08:39:33 -0600
Message-Id: <20210311143958.562625-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 546424c2bd..5848779208 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -341,6 +341,20 @@ static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
+                            TCGReg r0, TCGReg r1, TCGReg r2, TCGCond c3)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out8(s, c3);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
                        intptr_t offset)
 {
@@ -454,12 +468,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     CASE_32_64(setcond)
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out8(s, args[3]);   /* condition */
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrc(s, opc, args[0], args[1], args[2], args[3]);
         break;
 
 #if TCG_TARGET_REG_BITS == 32
-- 
2.25.1


