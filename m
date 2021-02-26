Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA8B325C14
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:43:29 +0100 (CET)
Received: from localhost ([::1]:43494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFU2K-0004LY-8j
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFThO-0000C9-2F
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:21:51 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFThL-0001Wr-Vf
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:21:49 -0500
Received: by mail-pj1-x102c.google.com with SMTP id o22so6014739pjs.1
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nBxulCLj6wK6EFwSZxRAK3BYKLDFEL/ER7u1s8pD13M=;
 b=hVdpXeOdmq96aCzUAo3fEiXEDgVr1ZoLisoOWfDhBXYul7zZywQ/DO9/SE2vi111nQ
 NSvn7QWSafRvBi0FYl3UJf/dAsMZxxI1L9Ez+chahDL7atrnYqsxJgS1qMJIiu8CP5W4
 yiEPPKZyZg46l9Uugarx2sl8dsYcVtcS12rTL2omuq6VYUFqPeUJ0/3jlcx5mhf4gzsM
 +B0Vs/xEr0eyH7r0/m+aI6P9CQQXTJ8NW7IgBdVvge2ynIG6xJA8GSguwiZV8eHEuE2v
 RTwHdTgD10NCAAsfOZEGmKucCsD/Y8IYw4vacHZQ95DlFGmiC+/L4o9hysVZA/nc/482
 rEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nBxulCLj6wK6EFwSZxRAK3BYKLDFEL/ER7u1s8pD13M=;
 b=Z2EozdyDiA9LDDkN316oSvwONx2o/iko++UIAr4c36jpT87bGox48z1IG+IMCRAMfT
 ZnbuNfXgfDhyuAE+q1WiWacNWYNpan4o/IZDkbU2CR/vD1CXD0Y0p2yjamqtK0tSuGn1
 sRwb9LfH6zzu/MeEw/3b9v6japTzijPLNf8tg0wZdsnoPOnG0fcJWde/MNf0bwTo5vvB
 mAhsKndDRzD5D08cAoVY+MToduqL8V+UG4m9HMMP3rkqbI4pIh1Mm1WbkOKbyohFumAI
 Pk6e8ahBG7YcaLLfhWZw3b0wDgYXi5+3m90Y7JXdospcs830/KCXh0TfaT8UjFszVMYL
 3+RQ==
X-Gm-Message-State: AOAM532GFf7v9eT0sPpvoRZyVe8sFizQRehkGPb+vnetM3ZGIRTpFJAd
 P4VZW108GAXh8u3GojiA9Uh136fkZEs0vQ==
X-Google-Smtp-Source: ABdhPJx8KU9j3sHYYuZ4IcxsidNY8GOQtt4r5x+amMb8TOC+jVftMyQQqfOWMXBHucJhaDNGo7U9vA==
X-Received: by 2002:a17:90a:fd89:: with SMTP id
 cx9mr598904pjb.93.1614309706563; 
 Thu, 25 Feb 2021 19:21:46 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:21:46 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 27/75] target/riscv: rvv-1.0: floating-point classify
 instructions
Date: Fri, 26 Feb 2021 11:18:11 +0800
Message-Id: <20210226031902.23656-28-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102c.google.com
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

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c0053cfb828..a0a47dbceb3 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -561,7 +561,7 @@ vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
 vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
-vfclass_v       100011 . ..... 10000 001 ..... 1010111 @r2_vm
+vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
 vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
-- 
2.17.1


