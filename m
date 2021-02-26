Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4C4325BF4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:29:28 +0100 (CET)
Received: from localhost ([::1]:36480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFTol-0006Gn-0R
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:29:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTf6-0005YI-Vj
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:19:29 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTf5-0000S0-CW
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:19:28 -0500
Received: by mail-pg1-x52f.google.com with SMTP id t25so5403012pga.2
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bmrQQ5mDYjBADfn4f4ipzmNX78oHq3CXThhzJoHA7E8=;
 b=jFaCntHh9K86lGQ6XO0bhAE2/ldoJK2FSFhliLrgldX2d+TKeE0hBgJizMuWCi/4oU
 MvV2oYrwhVAEIeb4R1EtovFmKkUa4bP5JTSXi8pWFymNGgz8UdvUxHqpLEJ0x2WO9Zyo
 fatEP3pqUxxN53htsHKSwP8tB3vp8kM/Q0MjMhR74crZ/omVX+3YmNrhV7dgCDAnMXr5
 xJ39xs+kb6aedznTacT+Y6ssRt+zsK6NPoBgqP7QXMtn91Vn3br5JT+GPkH+yhhr1vzd
 dqvmMcBOtSj0xFP2jeQcH44PUxCzZq2Rj6wJQYBA2mIJ796W/x5IPaLRahhdgOSP2Xq0
 Rmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bmrQQ5mDYjBADfn4f4ipzmNX78oHq3CXThhzJoHA7E8=;
 b=KmAXIWwLGEHz9e1KSf1oXdgcPZPGyHdcXfB8ucfqqQ4uYscr0Vt71mhI/xsqd2QAQd
 VcOloEkZO4KOkvhMNVEZpFCNHCLGakGJ8rV5tS5QxqaNwZsGYrEbYGlrIbnlppD6sEvz
 krtPHfZGJY9PKe8qBAQPIVq2lb0ksG789eKGYyBLpOr9wcClvSwloYuZQfvq1lzqD3OB
 8xh7/jhNcR4f5YbN8I7EXMRXttMqSYOO7lCU13YV2WxFIBxfVJz7kUrkjo6ZXvxZSJEM
 3sp+DlVlQI/LOabqJ+Rm3zqwSPrL/z5R0cFlDmIFFzCodaIEe2gcZ09OBYsYCIHgi6Dp
 YshA==
X-Gm-Message-State: AOAM533lG0V1mCM4QFEYCHOgeNwoRf64Zuu7gPlbZy9EDcKo5/RAq2Ch
 zCOGIPLLSSXtGK+sUvUXb59jL5EYiJW4wA==
X-Google-Smtp-Source: ABdhPJx8+jSjBuMcVuWN+adGcOmkKbEFCDhgle3IHYqOBIb2pHwWMKGrei+izqhs8+JLURP8Ht48qQ==
X-Received: by 2002:aa7:8c0f:0:b029:1ed:4d05:218c with SMTP id
 c15-20020aa78c0f0000b02901ed4d05218cmr978017pfd.21.1614309565713; 
 Thu, 25 Feb 2021 19:19:25 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:19:25 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 05/75] target/riscv: rvv-1.0: introduce writable misa.v
 field
Date: Fri, 26 Feb 2021 11:17:49 +0800
Message-Id: <20210226031902.23656-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Implementations may have a writable misa.v field. Analogous to the way
in which the floating-point unit is handled, the mstatus.vs field may
exist even if misa.v is clear.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 098de1abacb..89867a93643 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -571,7 +571,7 @@ static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
     val &= env->misa_mask;
 
     /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
 
     /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
     if ((val & RVD) && !(val & RVF)) {
-- 
2.17.1


