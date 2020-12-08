Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33492D3592
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:51:58 +0100 (CET)
Received: from localhost ([::1]:49100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmktp-00039V-Lf
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjkA-0004Wj-ET
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:54 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:40324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjk8-0008M2-OQ
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:37:54 -0500
Received: by mail-ed1-x543.google.com with SMTP id h16so7674915edt.7
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0z868/KbdDk2Xlh007u1U18hSib0SeCI76U0+Y0b5XM=;
 b=Mij3zzPEiWTVyRfAz1dZRhxAJAUjpc94sNwFkJc2Qbp4XCJyd6SKeZhkzLaHCRDqod
 y6hmFcY0rbghCwvaqtLaYhtFJG/8gdwGd++ma3Erb3kX5QuvtjPcaZNenxmkA2Xxvxkb
 v/xHY2dNGb46LzE5j2SNK+KusYTJ6u98rg6j/mPrn1uFHTobxB5oM3QC+pBwW8Mh1zrR
 15+52KM81Vzhraa4c/E8uvYc0QmT3g8CCuuKXT0VIShkCRf/zV7mdUUetH9p6soWNUi0
 aMq5pk4+PCcj8owrtJc8imVKJvOZ3vJwnbTptHqial+4Z+HtHw2tGv5M0Hr2ZCcVhgtq
 bmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0z868/KbdDk2Xlh007u1U18hSib0SeCI76U0+Y0b5XM=;
 b=mgBjfw15XrPMWedgJiZnqKdbmYQfTU5S61uXe7z3LHDL+AbaFlbT1KOysS4KASZkbs
 D9Fq5WPJtwkho4EfjWMBBO5sdY4ZCWswZINpIfU9ZUDn44bMr30gbiiJvZhgwfZlO9RB
 aootRAumyLe83ulHK063+uU7Cbx4OL6ijlTBAAmOZMKfuk2+1kYTK/AssExIdhaFffPU
 huHmGfBFpYT7Oo/pfr7pfwSBNvbKVBvlWgmaep14h0MZihC76iwNiI6fp5nBkTCpDwin
 Nj2eWwvf/HSuKPHmgEQ5r9ZG9rlElfIvcrtCE/rl1Z7R0p8acZktSFW8UQ4F2wo5ZMn7
 cmaQ==
X-Gm-Message-State: AOAM5328XbpKQ5HfBr+djmjnKHuy6N+pIW48uyrJbObQJdzYp9gx3OVp
 QTXfMjjIg2bd1h9U072F+qz98Bn5J6Y=
X-Google-Smtp-Source: ABdhPJwp2liU+5QJaRAuh8gM4IaP2n3LoOxP8WFuAziirwd87L9HPNkg7g3lXZa1OjYnuBuEvpC8hw==
X-Received: by 2002:a05:6402:1c8a:: with SMTP id
 cy10mr26202803edb.151.1607459868348; 
 Tue, 08 Dec 2020 12:37:48 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id v2sm9475230ejq.109.2020.12.08.12.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:37:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/13] target/mips: Convert Rel6 CACHE/PREF opcodes to
 decodetree
Date: Tue,  8 Dec 2020 21:36:59 +0100
Message-Id: <20201208203704.243704-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208203704.243704-1-f4bug@amsat.org>
References: <20201208203704.243704-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x543.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CACHE/PREF opcodes have been removed from the Release 6.
Add a single decodetree entry for the opcodes, triggering
Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() calls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/isa-mips32r6.decode | 3 +++
 target/mips/translate.c         | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/isa-mips32r6.decode b/target/mips/isa-mips32r6.decode
index 7b12a1bff25..e3b3934539a 100644
--- a/target/mips/isa-mips32r6.decode
+++ b/target/mips/isa-mips32r6.decode
@@ -19,3 +19,6 @@ LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
 REMOVED             010011 ----- ----- ----- ----- ------   # COP1X (COP3)
 
 REMOVED             011100 ----- ----- ----- ----- ------   # SPECIAL2
+
+REMOVED             101111 ----- ----- ----------------     # CACHE
+REMOVED             110011 ----- ----- ----------------     # PREF
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 81ca1d45063..ba1b2360c50 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28667,7 +28667,6 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         gen_st_cond(ctx, rt, rs, imm, MO_TESL, false);
         break;
     case OPC_CACHE:
-        check_insn_opc_removed(ctx, ISA_MIPS32R6);
         check_cp0_enabled(ctx);
         check_insn(ctx, ISA_MIPS3 | ISA_MIPS32);
         if (ctx->hflags & MIPS_HFLAG_ITC_CACHE) {
@@ -28676,7 +28675,6 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         /* Treat as NOP. */
         break;
     case OPC_PREF:
-        check_insn_opc_removed(ctx, ISA_MIPS32R6);
         if (ctx->insn_flags & INSN_R5900) {
             /* Treat as NOP. */
         } else {
-- 
2.26.2


