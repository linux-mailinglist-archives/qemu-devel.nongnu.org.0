Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5CF4343CA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 05:20:54 +0200 (CEST)
Received: from localhost ([::1]:57668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md29t-00021P-79
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 23:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26U-0006sS-MX
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:17:22 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1md26Q-00011l-Qp
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 23:17:22 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y1so15114500plk.10
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 20:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bBSwvYrqDYoBvyXlKSM9sotJjdfK3T1QfOWZZldWl7E=;
 b=n50p56Wr/DPeCdE2xHU9kvyD4fD4SpTFnHDfOkke8NQr04Kd3bLwFci5X1q3zTRzpt
 qmIBiTcllto6mZoCe20soWOMCvenAnnG611pqYqeoC/IWW7jatfWyl6FHhyISJK4GnsZ
 3Bq2AwdmhmJdc+MtLixkWWnm/HJNPAGql2LjMT9ckY80zHShiKU7oX5LRIh09laKDDMU
 kc/uwSjsYbKZJ9KCLZ7bdD0CPJ4R42mjFTYNC3M1PjOe9Bouby575Ru5oWRwPGFAKkFD
 tiepJFRnymJ1nMaxe5RaQENxAX3eqpjxXVAF2fKf88N+tNTHDCq7dMxUAZw3FG+DUs1z
 rFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bBSwvYrqDYoBvyXlKSM9sotJjdfK3T1QfOWZZldWl7E=;
 b=EkyvNfwgOx2V7rmB0TvsUOYDUcY6ce6QQgtDRIUAZrI6/5YFw43iJ2TrUPXRc9LfYZ
 chf9C4bd731uMdztMTtJV1HFJINjj4aCP/RyCPSFP2OdGjuJrnJZmHOc/c6bEY1GJdwr
 XzlQn+Yiw42Bgp2Nd500DLPVKZRR4vuT7p6dyeVNCBmPWRUStbVGqOg515IorR8mfxsQ
 emgMQ4XGy8EfIiQzJ4x7x+5C78IJfxR3/UJs0cqAU1ZDHQGVK4DkY33hhk4DDVwol0/x
 USbkj1gwoDAvW9ywBJAnSrhhguJzUXwOVHwGvQv6I/d4MO+6Rn1iP9Xk/3eXyPnzsM1C
 /7/A==
X-Gm-Message-State: AOAM532lTHux96qUTqaD/UjSa4skKOwtvwad0wJihYSjMDK7u0Yf4pvn
 HTjGpNoOL0xnh/dahfcI0rL9ChPnvr1+cA==
X-Google-Smtp-Source: ABdhPJz/t2pKMho+fAsp91uO14bamwi1hVFHTjMLtvKMibYYFQzjgVbRAvBej9iSLp747ash+7hcpg==
X-Received: by 2002:a17:902:be0f:b0:13a:95e:a51 with SMTP id
 r15-20020a170902be0f00b0013a095e0a51mr36293876pls.44.1634699835429; 
 Tue, 19 Oct 2021 20:17:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c8sm505364pjr.38.2021.10.19.20.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 20:17:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/15] target/riscv: Use REQUIRE_64BIT in amo_check64
Date: Tue, 19 Oct 2021 20:17:00 -0700
Message-Id: <20211020031709.359469-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020031709.359469-1-richard.henderson@linaro.org>
References: <20211020031709.359469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: alistair.francis@wdc.com, qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the same REQUIRE_64BIT check that we use elsewhere,
rather than open-coding the use of is_32bit.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f730bd68d1..61fd82d41a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -743,7 +743,8 @@ static bool amo_check(DisasContext *s, arg_rwdvm* a)
 
 static bool amo_check64(DisasContext *s, arg_rwdvm* a)
 {
-    return !is_32bit(s) && amo_check(s, a);
+    REQUIRE_64BIT(s);
+    return amo_check(s, a);
 }
 
 GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
-- 
2.25.1


