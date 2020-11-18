Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BD92B78D2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:34:46 +0100 (CET)
Received: from localhost ([::1]:40160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfIvN-0003uj-GQ
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfIt0-0000g2-1J
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:32:18 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfIsw-0004kQ-3q
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:32:16 -0500
Received: by mail-pf1-x436.google.com with SMTP id q10so972803pfn.0
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ktef2G1hloaFJ74luJAhsa7tWq/dsDp9+ZryFFHcnak=;
 b=GW1htmq1p9egfR0N1sPBOJbw8+mcSKpA5sqOur+EptcSN5hspDVYmb1P28Hf+Kv0Ck
 9ag2o0kx4aS7e8xDgAdmQ2/9s/hzR+JXObX2wYl5ZQ2+iqoliktM48u60+B5y76zkyYR
 uZvJ0foyss8SuIVKuauQM4M0+x9NyYuImiqG2baN86NS2hOSxRh1tz0yrck15BY18PUb
 ecq9v6ACjAd7lzZmtDCsIzsl/GCdV7qfJBt0GNSpVUKJ3h1hdG3r1dBpITWq/WRPGI6I
 7MeNWGwU4zmNzZTvGgTKI+o6tjd4F4YPSs9R9XW9io87O7f4XqG2ZljsIexANb/6soVL
 O+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ktef2G1hloaFJ74luJAhsa7tWq/dsDp9+ZryFFHcnak=;
 b=GmsyDVhbrbq1ZH/+YRdcrHJdnRAaBRbN12nZe91a68Sj53JDKfBxuOKFAw8IXwmf/H
 iFLfe4IukiCp5f+qnFHxbCqBMD8TuEqo+uBKppJa8mDDkhBni+1r+9Rc8OvLWKm6EQMa
 pt9HopUm9pnhUQZdxKnyQ04b2aVjWvDiO5pfubOhVdQ4BIaivarxTMBC4N021H+4uDV3
 o/yGwyiKlYKxJistCdDWvWKtI80WzVAizILji84pt1aifKWEYzWwR9XXZvh2I0O9Xutf
 6keqDlzumPkPTacuwycU+tEC/3n59omxJHGWzx8sM09yUO0wtkCkvW+wGKbiYetTw6G1
 RGgQ==
X-Gm-Message-State: AOAM5306Ll54CqW6z2s6kg8DEi+jpG5LN5ITA4qG0SKxVcu6F5O6Fjmh
 cUzymPd/v/THsUbGdfSaABbluSeVdDGuGaoI20o=
X-Google-Smtp-Source: ABdhPJwg76ysYD+muShHBUd3zyT1U2iYP1vIQHf0TptU631GvjX8LELLY++AlRQGJsSnxR1JDzBCfw==
X-Received: by 2002:aa7:9888:0:b029:18b:a9e2:dc7a with SMTP id
 r8-20020aa798880000b029018ba9e2dc7amr3612288pfl.67.1605688332281; 
 Wed, 18 Nov 2020 00:32:12 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:32:11 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC 01/15] target/riscv: reformat @sh format encoding for B-extension
Date: Wed, 18 Nov 2020 16:29:39 +0800
Message-Id: <20201118083044.13992-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x436.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
---
 target/riscv/insn32.decode | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 84080dd18ca..190ce469faf 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -22,7 +22,7 @@
 %rs1       15:5
 %rd        7:5
 
-%sh10    20:10
+%sh6    20:6
 %csr    20:12
 %rm     12:3
 %nf     29:3                     !function=ex_plus_1
@@ -58,7 +58,7 @@
 @u       ....................      ..... ....... &u      imm=%imm_u          %rd
 @j       ....................      ..... ....... &j      imm=%imm_j          %rd
 
-@sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
+@sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh6     %rs1 %rd
 @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
 
 @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
@@ -122,9 +122,9 @@ sltiu    ............     ..... 011 ..... 0010011 @i
 xori     ............     ..... 100 ..... 0010011 @i
 ori      ............     ..... 110 ..... 0010011 @i
 andi     ............     ..... 111 ..... 0010011 @i
-slli     00.... ......    ..... 001 ..... 0010011 @sh
-srli     00.... ......    ..... 101 ..... 0010011 @sh
-srai     01.... ......    ..... 101 ..... 0010011 @sh
+slli     000000 ......    ..... 001 ..... 0010011 @sh
+srli     000000 ......    ..... 101 ..... 0010011 @sh
+srai     010000 ......    ..... 101 ..... 0010011 @sh
 add      0000000 .....    ..... 000 ..... 0110011 @r
 sub      0100000 .....    ..... 000 ..... 0110011 @r
 sll      0000000 .....    ..... 001 ..... 0110011 @r
-- 
2.17.1


