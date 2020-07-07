Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D892172CF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 17:46:15 +0200 (CEST)
Received: from localhost ([::1]:57010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jspnS-0004Fd-HB
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 11:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lazyparser@gmail.com>)
 id 1jspm8-0003DH-3K
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 11:44:52 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:39017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lazyparser@gmail.com>)
 id 1jspm6-0002E5-JH
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 11:44:51 -0400
Received: by mail-pl1-x644.google.com with SMTP id s14so16896825plq.6
 for <qemu-devel@nongnu.org>; Tue, 07 Jul 2020 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=jHHv9dVHF/nEIC7GBp1y71kO9G/RElLP1W9vDMx/89o=;
 b=TPo7tXxCtVe9kO37XCNnWa6omVWJSUJgCa+//4q2CAd89TtDaBES6HxRVOLpeeUN4U
 ubqnIhvEGzTv750IBgg1XdePR+1t8XVm8aThlUXAPbnFGSHjIMsyxBe5l8newE5rN0qj
 dSJg0cjNK7YlyXQpistjAwjO8dqa3UckpMYtYZEOPD+CeC1Ml8RkqEmhLuanrRDOaIMf
 A7UxkEvKgMXzUUT77LSSuDZFJcU2KyApA+TZFj3bDfEq2CKFRZxg15J4kmICOa+TKUb2
 2yNfoZ/6rFkNMPMhM1EoNMqTRCMswAWsywQlPgtvg51SMZ36Pv8zN3lxNv3D2j13/LCa
 ASTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jHHv9dVHF/nEIC7GBp1y71kO9G/RElLP1W9vDMx/89o=;
 b=MBJchVzBsk987g8qEdpQgwEKStva0Oo64tqvR/c1c5wTrlkdJPPwIvLQgW3HqqSBF+
 +A3UUNRUMarJhJqLnKuraEUXjT5XgPefzAIc2XFReL5dlJ4QlqCrQorWW273NoR3ZCVq
 iEpHpYSYJRp1mRacEMGnYyvFF6H43qh4LzOrrJAlv1t3ZnVtb/8RESsCqVrs2gpcncjD
 TBc+n4Iw/qrEQ5rSvyrv5xTKZfwvyY+MyejZ0nTMovc+gdEQnHwSdt+Bnb5F8j+jx+uY
 uN+gklcBIEla4Yi2TcQp1NV0kSwzAtabC0HtvnSV86NX47TmCldUTkvcGSx8mDeX2RCo
 Vymw==
X-Gm-Message-State: AOAM5319LEpvTLwcC6nPm9tnoHiY4tGv0CeFNnfBsm5giEqvNhkBs67g
 /uZOKVi0wnPgclTPieWpdAdUBp1s/jWFxA==
X-Google-Smtp-Source: ABdhPJw2XBxR4K2cpHED21BWT/SO/Q9feSxLVLCnLM9v3NgrrfrY7+55dXUqm27+tLW6Yuvnn2Lv5A==
X-Received: by 2002:a17:902:bb85:: with SMTP id
 m5mr47047486pls.267.1594136688819; 
 Tue, 07 Jul 2020 08:44:48 -0700 (PDT)
Received: from localhost.localdomain ([39.98.209.129])
 by smtp.googlemail.com with ESMTPSA id k2sm1343841pgm.11.2020.07.07.08.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 08:44:48 -0700 (PDT)
From: Wei Wu <lazyparser@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] disas/riscv: Fix incorrect disassembly for `imm20` operand.
Date: Tue,  7 Jul 2020 23:43:36 +0800
Message-Id: <20200707154336.4963-1-lazyparser@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=lazyparser@gmail.com; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, Wei Wu <lazyparser@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

`imm20` operand type is used in LUI/AUIPC and other instructions.
The value should not be left shifted 12bits for disassembly output.

Signed-off-by: Wei Wu <lazyparser@gmail.com>
---
 disas/riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 278d9be924..a2b6472bd8 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2083,7 +2083,7 @@ static int32_t operand_imm12(rv_inst inst)
 
 static int32_t operand_imm20(rv_inst inst)
 {
-    return (((int64_t)inst << 32) >> 44) << 12;
+    return ((int64_t)inst << 32) >> 44;
 }
 
 static int32_t operand_jimm20(rv_inst inst)
-- 
2.17.1


