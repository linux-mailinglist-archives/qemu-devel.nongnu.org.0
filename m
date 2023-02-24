Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C246A1CF4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 14:27:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVY5S-0003oD-Q4; Fri, 24 Feb 2023 08:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVY5N-0003kr-7A
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:26:05 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVY5L-0005WU-LI
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:26:04 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-17213c961dfso18892216fac.0
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 05:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nEs6ccjwVW0gg/wYcs41xs6oRr6SQ4L3Ar0gC/MnM4Q=;
 b=Au3e2lcew/ZB2ReAZVx3sbTbKbpxPtuggEK6XrowCWhs6LxhLw83QcVf2HSzabmWRh
 FrVLtfSLGQAbnsZAJYXNN7qhPnLKHI3mKNJJd+2DwJ76nun7RTvVT4KWCelfCmv5Bgsv
 hq6oSFD3NzClvbyXD2fG3a4a26dncjCc2GYcxMvwRCM3erSee3KaBzMcR5ikgIjnJEhP
 T28TGPO24Ut4yWmNWnwug+Fe4g2SPIKLFpvOlbExonPBLMS/qsBW9yZYB2K9msnsr8Zv
 Q0BFCo03kh0z1g33wd/fDawdQBCF8fqeix+noRvJj/tZplaZzwQu5X5EtR82PQVeC7j8
 vWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nEs6ccjwVW0gg/wYcs41xs6oRr6SQ4L3Ar0gC/MnM4Q=;
 b=M8B0vm2OMPLK1On031iFhxV8k4Qxe7eA/pXGf4UlMc8go4gZgwUcGetPhxLQF2BOXH
 ofVZd7cVpYfuJw9eoUJFuPCxqXKBVmniDnWol4yI7u1qUBMiYLiLDYSeahHj7gUEZSbp
 oGhuMMkK1yd+tfCxrn4/FMrm+Hw1alY1gqKmTKDjRvfsX2t/2+jYWg1t8svf2nk4Wz7K
 l3NciQMmkD2ZKflul1x980lweWan9tQ/Oekk6Wlu6aZdl2y/RRLtqBfxSlAzSFb3hg4j
 v5bB83vxDptzZOIgmCuoZ4ZgQEh2s8zbZditARtswYxQD9WtgBinFxmuxnwanG/rrt04
 jyWA==
X-Gm-Message-State: AO0yUKXF3Tf8Pta/D0A3H1Q4A/XMbPAvXDMnCk3KXv4CKuwLnPmu+Nzp
 91V0AoEI4oKJYEQ1h83pIOsDho44G+ZhwDUV
X-Google-Smtp-Source: AK7set/sndjkzRTgQQFiEVr6H8D+6ypyPYDZoV06EK2yhYbl9C8RogCr3eV0/m8/Mcj6l7oOHbSi+A==
X-Received: by 2002:a05:6870:82a0:b0:172:36be:bc45 with SMTP id
 q32-20020a05687082a000b0017236bebc45mr6627202oae.8.1677245162272; 
 Fri, 24 Feb 2023 05:26:02 -0800 (PST)
Received: from grind.. ([2804:18:18bc:fbbd:3c90:eebc:7544:73fd])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a05687061c500b001435fe636f2sm3383763oah.53.2023.02.24.05.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 05:26:01 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 4/4] target/riscv: add Zicbop cbo.prefetch{i, r,
 m} placeholder
Date: Fri, 24 Feb 2023 10:25:36 -0300
Message-Id: <20230224132536.552293-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224132536.552293-1-dbarboza@ventanamicro.com>
References: <20230224132536.552293-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Christoph Muellner <cmuellner@linux.com>

The cmo.prefetch instructions are nops for QEMU (no emulation of the
memory hierarchy, no illegal instructions, no permission faults, no
traps).

Add a comment noting where they would be decoded in case cbo.prefetch
instructions become relevant in the future.

Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Signed-off-by: Christoph Muellner <cmuellner@linux.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/insn32.decode | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3788f86528..1aebd37572 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -134,6 +134,7 @@ addi     ............     ..... 000 ..... 0010011 @i
 slti     ............     ..... 010 ..... 0010011 @i
 sltiu    ............     ..... 011 ..... 0010011 @i
 xori     ............     ..... 100 ..... 0010011 @i
+# cbo.prefetch_{i,r,m} instructions are ori with rd=x0 and not decoded.
 ori      ............     ..... 110 ..... 0010011 @i
 andi     ............     ..... 111 ..... 0010011 @i
 slli     00000. ......    ..... 001 ..... 0010011 @sh
-- 
2.39.2


