Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A2631E0EE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:00:03 +0100 (CET)
Received: from localhost ([::1]:52356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTvW-000396-Gx
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:00:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMY-0001FZ-Rx
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:54 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:54570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMX-0007dO-AQ
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:54 -0500
Received: by mail-pj1-x1033.google.com with SMTP id gb24so2146611pjb.4
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QUs6bZlAERttu34ccVgcqABRUHJrBFMHH0LXLYX1oZo=;
 b=AA1pobb5bFbb2phclP0tBB2QrQufWVMFldl5/UqRPK2UUCmdW1rLq1CLoVSIejGq+N
 E/PIPiDWAo0IXx3OkcM4wRbsQz+DvAF/IV52nyWCinkbPYrq2DVUMCHCqVEmbi2/W/ko
 iIO9SFLzi8kv6RtmIY3uQE2e/NGzOu722s7bNnj8H5JLtCCYpMZFLznLobD2OEc3hhKv
 dM/6cO+spiV+iEWy9ssPq162KIY5cwpjNd1/TZl3egARwCczUQnPWOsZUfi+YhqoF/Rt
 vf8EMmPiiyQAyXe4pkD5QYqprONHRTj7Mg1wgV0AhLTQWJq58qDT1JxGIWlsQVozn1DB
 kpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QUs6bZlAERttu34ccVgcqABRUHJrBFMHH0LXLYX1oZo=;
 b=CnfDwYHKNJN9KMB/nSnpytal4uGziiHU6WzA1kMgZsqZaIBZir1rnYEJIPb2YvNu8H
 tA/JZ19Eymoxa3KHVMzhzVdoOR+k2hr5UYrt6XCuGnsMJGTiRIlLBKjCxE02JpNzLGjo
 Ws7N2cNbxBV9BGuPDWk6XYhq/3EmyDqmw4SQzhFiSe9SO2Tx0WOeUhtkjvRuFJQNtnHG
 bnIIWB/Iupe958SGsma8JmL9i4WEig8rWhm9Mudak5CUS4UN3JZ7tPmbjwE1sDIVyww8
 iw1Fr0uHeWnAXWBcjvD0b1iXIkQ3KjImg8EVR25W0vAGOY3QA0mMI+KgLeIHhRyB0oSe
 mAEw==
X-Gm-Message-State: AOAM533u7mCYjd3h7t28p9+wFQrr148M6uux6odmd4D/RQ1IbXQ0hB0v
 L9xS59LiZfQIPUja6JNEW6VSOSUl7Ekgbw==
X-Google-Smtp-Source: ABdhPJxGShJR8yNAYzI5SSl/eWSreuU8d7J7x5keWDg3wOBziZKTF1w2a2+LsiM/Qf1XZCkQe61IXA==
X-Received: by 2002:a17:903:1042:b029:e3:4bdf:6e2a with SMTP id
 f2-20020a1709031042b02900e34bdf6e2amr740076plc.53.1613593431968; 
 Wed, 17 Feb 2021 12:23:51 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 47/71] tcg/tci: Split out tcg_out_op_rrrc
Date: Wed, 17 Feb 2021 12:20:12 -0800
Message-Id: <20210217202036.1724901-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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


