Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E0859114A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 15:21:29 +0200 (CEST)
Received: from localhost ([::1]:42822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMUbQ-0001aX-SE
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 09:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1oMUTU-0002ot-I4
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 09:13:16 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:46067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1oMUTP-0001gE-Fq
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 09:13:12 -0400
Received: by mail-lf1-x130.google.com with SMTP id a9so1269793lfm.12
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 06:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=G2ccjmIp6atruoW2ZvRqasw1JxhdqSA37dPC/fmGkN8=;
 b=a0SC+Tkzw6gNnQCK2W5t0qt67iIowkEg4RSKvCXaFuOUWwlM/3as+3KRJhMbapnQmg
 /RglGYWXbse6kT5nPojulievlUXVJXpwwyqsrvEZFsK1+wOHDS/4XBhAxmaaiKDdiF8V
 rLKbt6efPpP/x6AzKBCA7SjB4nmyqtNt6CFNgQEQHt1YY2xbW3PdHMCIg6dKYL7AaUpT
 TPuhq3k/+JHRZoXlx8u9VOhzYfrcuoMg+gLKOEzSIXNIN5f3kYt8DVReIVLiK2+5Nh9M
 yIsnPZ+wDkaXQAEbqaS7EkXPM2UJcDioIgkek5PbjWf2Yg//DGsBmXR3TiZeLncXZ8V9
 kwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=G2ccjmIp6atruoW2ZvRqasw1JxhdqSA37dPC/fmGkN8=;
 b=eTv/5DJUeXGGNZC+ymOMNB7JGpXE7RZOILHcB8MU7oHIG+11TBlBEUWPghdqvVDEfh
 w1IG1C9SO1OH/6UpyZVUrG9czVz+WiuDDr48tVzJdac+fPqfgb4p0BzCkObBT3/+h8rj
 DDEoKGTbhVAGcvEEqw8rcnCso04vDFkgRgLy73lJ85OnGOArsyvt8CbVTRw1HsGkHSq+
 FygXbwXQzm39cXjfp0muXUn2Nug3eUh4ThCsmuxYv/F9krNCMmsrMiwx8kxDbOIFIO7j
 bStCMkLaz39TN+0ouhu68eadaT7ylNVS4rg7/flCoA5a/LWRYpA6vQGCbxAgyNdHYMqw
 Q72A==
X-Gm-Message-State: ACgBeo3OL4/j2g13r2ASQk6XPg20QutbnKjJjY+iZqPhCat0w8g38THX
 SMMzQmhtTORWtIYeACuaPqSMgFIbBiePmg==
X-Google-Smtp-Source: AA6agR4Nl9J8wZ0vEbKXhyKq4P9PuIfoYEten8SNxnyJ2F+DnHHwkme4JuvBeoFgaM+MGraWEa2dUQ==
X-Received: by 2002:ac2:4f03:0:b0:481:5092:ec8f with SMTP id
 k3-20020ac24f03000000b004815092ec8fmr1343806lfr.35.1660309989218; 
 Fri, 12 Aug 2022 06:13:09 -0700 (PDT)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a2eb5a8000000b0025e72aae6bdsm356151ljn.28.2022.08.12.06.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 06:13:08 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH 1/2] target/riscv: fence.i: update decode pattern
Date: Fri, 12 Aug 2022 15:13:03 +0200
Message-Id: <20220812131304.1674484-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The RISC-V specification specifies imm12, rs1 and rd to be all-zeros,
so we can't ignore these bits when decoding into fence.i.

Update the decode pattern to reflect the specification.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
---

 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 014127d066..089128c3dc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -151,7 +151,7 @@ sra      0100000 .....    ..... 101 ..... 0110011 @r
 or       0000000 .....    ..... 110 ..... 0110011 @r
 and      0000000 .....    ..... 111 ..... 0110011 @r
 fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
-fence_i  ---- ----   ----   ----- 001 ----- 0001111
+fence_i  000000000000     00000 001 00000 0001111
 csrrw    ............     ..... 001 ..... 1110011 @csr
 csrrs    ............     ..... 010 ..... 1110011 @csr
 csrrc    ............     ..... 011 ..... 1110011 @csr
-- 
2.34.1


