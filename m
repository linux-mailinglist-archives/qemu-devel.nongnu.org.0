Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF86B373F85
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:23:43 +0200 (CEST)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKJK-0006no-QS
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK2i-0005FB-QX
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:06:32 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:37624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK2g-0002EH-V3
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:06:32 -0400
Received: by mail-pf1-x430.google.com with SMTP id b15so2345375pfl.4
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7xSDBCTbLFyE5i9zgI2oQSIsR3+2h8RXfnP4ivUl+NQ=;
 b=O4+DUnZP3JtgAwlb3hzl784P5J6VePVFMIsjyF1sOl5Dw4jySknH8G7pzNPBJ3uc9L
 AvbF0cYUEKkF3AtshCKe9kQtaMDxnkQhVj/hE1YnWfvZ534/XCzJp4NRmaO6JUW/kxWx
 z0Ae0wQZ1xkPUEpIcUiaB4nWGQWNfrX+ShQMk/wRgP2plz242y6kL70fd4q3GHGJRlB/
 6WENm99+XtKmzzlzpyjd8bGJZvFKfiF697i3iqMS/h4zbxUV96/Uj8oGh0lVqveUhIjT
 bo+PHqwzxTC/Z52I1oeIao3UslmAepHrZFtZtOiLPvj2XLG/DpAhHve/o81CEWI2jq3K
 iojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7xSDBCTbLFyE5i9zgI2oQSIsR3+2h8RXfnP4ivUl+NQ=;
 b=qMS+BToaB4/NW2QoBGYG7PRIRGNVxb0uZlJfnGg9u7SkbPAPBNQwdDl9YB4cbGds55
 j4tR6T7jgmGGIhupMJdR9UkHDyWIlFB9AHVEN4Ry1xyPDxdCZ53KHlHf6tGptzBsTkJY
 CRM3LuAcFU5TGpe8N5tRGyS0PUxPA2h0V+IzMx1tdtE4Y+BJ1K7OOBj/mZQIAEaieszS
 4VYiVIByOOEG5DLT1FkP9FCKZKLuHoPIeNvfrj6AyrHLkZba/z/0giCdA0N3znFGMqhj
 6694QQXGhq1GDFn6tkGSRScy710fOdfaPucjmRDhdDz1wQqNVPquZirQ28geeIduzdYx
 f9SA==
X-Gm-Message-State: AOAM532lpq/xxHZltk/UzktcnYByHkQPv8mLqjGDHiXSgmBG2xevdPVn
 8N1Ls1PiyeLLTUp5Y/bb0uhhcFLlnuQcs5tf
X-Google-Smtp-Source: ABdhPJytB+jldQiYyxnfjokg3sSgEjHZNYI8N5asj+bSRDVp8ctdPEbucKoFVOt+F47866upT4ZxdQ==
X-Received: by 2002:aa7:814e:0:b029:20e:f3fa:2900 with SMTP id
 d14-20020aa7814e0000b029020ef3fa2900mr29923888pfn.62.1620230789198; 
 Wed, 05 May 2021 09:06:29 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:06:28 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 01/17] target/riscv: reformat @sh format encoding for
 B-extension
Date: Thu,  6 May 2021 00:06:02 +0800
Message-Id: <20210505160620.15723-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x430.google.com
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
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 8901ba1e1bf..f75642bb0d2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -23,7 +23,7 @@
 %rd        7:5
 %sh5       20:5
 
-%sh10    20:10
+%sh7    20:7
 %csr    20:12
 %rm     12:3
 %nf     29:3                     !function=ex_plus_1
@@ -59,7 +59,7 @@
 @u       ....................      ..... ....... &u      imm=%imm_u          %rd
 @j       ....................      ..... ....... &j      imm=%imm_j          %rd
 
-@sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
+@sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh7     %rs1 %rd
 @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
 
 @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
@@ -125,9 +125,9 @@ sltiu    ............     ..... 011 ..... 0010011 @i
 xori     ............     ..... 100 ..... 0010011 @i
 ori      ............     ..... 110 ..... 0010011 @i
 andi     ............     ..... 111 ..... 0010011 @i
-slli     00.... ......    ..... 001 ..... 0010011 @sh
-srli     00.... ......    ..... 101 ..... 0010011 @sh
-srai     01.... ......    ..... 101 ..... 0010011 @sh
+slli     00000. ......    ..... 001 ..... 0010011 @sh
+srli     00000. ......    ..... 101 ..... 0010011 @sh
+srai     01000. ......    ..... 101 ..... 0010011 @sh
 add      0000000 .....    ..... 000 ..... 0110011 @r
 sub      0100000 .....    ..... 000 ..... 0110011 @r
 sll      0000000 .....    ..... 001 ..... 0110011 @r
-- 
2.17.1


