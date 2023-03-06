Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D286AD118
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:06:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIwb-0006Sp-EP; Mon, 06 Mar 2023 17:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwZ-0006R9-2z
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:31 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwW-0006oH-Co
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:30 -0500
Received: by mail-pj1-x1029.google.com with SMTP id y2so11289860pjg.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140267;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=od8NCbufkDb5gUqPx2kp94RSNhCnehuQbOwnqQsEv5c=;
 b=dNHEcIrcpv20IqHbf70FgXLFMcGeYA+JY/7Wv5JwbYg0CWgUoNHA0+5tOMcWZRwZJp
 cSlJNmNliaEFjUC5itm0utbXLuLwEOj3nM0VqpsdHYLw/BzrPa7nCSNgahZ8oBS7DtPU
 aVt6K897tXkuiWOgINXpFZ2YtBz8A5hy2eZj3avriVP0MNdZMn7uafCtm/LHSGCIF2pv
 jr2m404+a+g/AhwPzJuNqr0Jwx47hMa/SUd+L8fBCBEkqI82TjLSDjHoMzGShgN31MrS
 ZN+m/mcESjDQgpzyLU83KpXVs879pKkAtgQS8mogpUfBiF/HeoCLm+pf2/QzKV0DzrYS
 z7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140267;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=od8NCbufkDb5gUqPx2kp94RSNhCnehuQbOwnqQsEv5c=;
 b=cKza+bx6j6oC/pTKsWFywvw41u1whV/RJRli7D5YxPwUVfXVuJ1prEHvx4Cji56yvW
 X8d0eiud9Ur0JVpUIsj8R668lEIV05Dij2qHrAVx1g5OEjKbGM4hdN/p+VxAOxKAV5+O
 jNdrby67AN5sy4CSZgtCJTfIATWg3LzlSNJfkp38g5Bipu8/qdJHyEvG/pEICSs11L3D
 DKzAqji4xkSeMQa/IjiVBmu7Ye8AoyDusDVdPJqjzU6sSMIn6+lhpe7tP5C1EpR7/u/o
 PrzzQWg+ydDY4ZCndnQDMBlzrYBBn5VWREe779xLtDI9PamzydIWdU4RSpn8x1fiCEhA
 Vfjw==
X-Gm-Message-State: AO0yUKWzLQFX/ifgzkqSrFcXvVQYAHpr+3pC/E+i55E/MG99wxvj7aHa
 vVJskZ/rNfTaCKU4Uw1sMeMIow==
X-Google-Smtp-Source: AK7set+QgAnraCJACFnueJZsEjK2HU7JR9QMn6lzDxiVB1DAMmcEz4XZLBg17zSrcTGqiwmcJvm3vw==
X-Received: by 2002:a17:902:dac8:b0:19a:9833:6f8 with SMTP id
 q8-20020a170902dac800b0019a983306f8mr15538080plx.35.1678140266871; 
 Mon, 06 Mar 2023 14:04:26 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 p4-20020a170902780400b00192b23b8451sm7101574pll.108.2023.03.06.14.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:26 -0800 (PST)
Subject: [PULL 03/22] target/riscv: add Zicbop cbo.prefetch{i, r,
 m} placeholder
Date: Mon,  6 Mar 2023 14:02:40 -0800
Message-Id: <20230306220259.7748-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Message-ID: <20230224132536.552293-5-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/insn32.decode | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 282e41aa3e..73d5d1b045 100644
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


