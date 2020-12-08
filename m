Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EB82D3593
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:52:12 +0100 (CET)
Received: from localhost ([::1]:50398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmku3-0003h1-V1
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjkI-0004ho-9v
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:38:03 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:43553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmjkG-0008OE-9s
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 15:38:01 -0500
Received: by mail-ej1-x644.google.com with SMTP id jx16so26511598ejb.10
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 12:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pIE6QL/3ZrCWRHDkFodb06bhSEToQGsTaRc21NwMK7M=;
 b=YKVzhYcZrzYLYVLQEu4+x3AoTpb6FtAWVcdCCseuaSoWMHW4FU8FGJsQzTzzRRCl12
 3pLiVOOVqIuk17JcsZorwQ5A/xtrJcBFYlpRJ1v6ytMQ84fa+dj//2YSr3q8uSJIZCNP
 1jEWILdyITh1eb88cKN1guJJi71g/GNbOUReUel8JdGYeRrvqW8jNbxZrIsxdVKQ7jFX
 qGRb6SBygBkyqzmaGK4beDY52rF28wOpNk0nd38vkYN6g0Lp08ZenIp0pqYJ90JakEC5
 zWvBfgVnQ5UYy99CSeSGniQypBgEQq2Umu5IY5yGtbAGwTjyFcK55L549wyefIFnniUf
 YhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pIE6QL/3ZrCWRHDkFodb06bhSEToQGsTaRc21NwMK7M=;
 b=S1exoh2qzXsprBin/mgBenYhDA4Y7glQBgliiw61/oooip6VSwJ4/JQME4lPya+gYs
 NZr5cw3Y89gtDAUT1g7oQeDPMrE1ohZII7bS/v14XH6FhIksve+vUwGRkAtcQYY80Wxd
 fwdsehUAuZFHSUvumIKONtucdLEDfiYL/cj/zdbdmfEaj1APDpRAMHJaTxOWNwwJ63ej
 GDKe1+fMSM+S0CQOfax1LZhsekOs+FWFYzbKNHei52GidXOvO8c9BHLYhR9t6MShCVFg
 /t+XFveQmGyfJMte7jet6B1oCmkaLXHGGSo3DyWWa56EE+TTNdBbYD91NhS1LiyMiaKw
 4yXA==
X-Gm-Message-State: AOAM530iJva7jZAPFq3cfnrE4gwM9IiZiBt1oFG5bissCcXEBIUT+hq9
 USO0Mqx7lTX2eJYuekyMmJ/c/dyBea4=
X-Google-Smtp-Source: ABdhPJyRDnog8ai539uCRXwjdkUqNGuXdi6aUrfgv+r+6mh+sbq8d7/JXip38lLzq+CEV3HIvHezVQ==
X-Received: by 2002:a17:906:d9cf:: with SMTP id
 qk15mr25678405ejb.453.1607459878825; 
 Tue, 08 Dec 2020 12:37:58 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id v16sm17979144eds.64.2020.12.08.12.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 12:37:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/13] target/mips: Convert Rel6 LWLE/LWRE/SWLE/SWRE opcodes
 to decodetree
Date: Tue,  8 Dec 2020 21:37:01 +0100
Message-Id: <20201208203704.243704-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208203704.243704-1-f4bug@amsat.org>
References: <20201208203704.243704-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
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

LWLE/LWRE/SWLE/SWRE (EVA) opcodes have been removed from
the Release 6. Add a single decodetree entry for the opcodes,
triggering Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() calls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/isa-mips32r6.decode | 5 +++++
 target/mips/translate.c         | 4 ----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/mips/isa-mips32r6.decode b/target/mips/isa-mips32r6.decode
index 89a0085fafd..3ec50704cf2 100644
--- a/target/mips/isa-mips32r6.decode
+++ b/target/mips/isa-mips32r6.decode
@@ -20,6 +20,11 @@ REMOVED             010011 ----- ----- ----- ----- ------   # COP1X (COP3)
 
 REMOVED             011100 ----- ----- ----- ----- ------   # SPECIAL2
 
+REMOVED             011111 ----- ----- ----------  011001   # LWLE
+REMOVED             011111 ----- ----- ----------  011010   # LWRE
+REMOVED             011111 ----- ----- ----------  100001   # SWLE
+REMOVED             011111 ----- ----- ----------  100010   # SWRE
+
 REMOVED             100010 ----- ----- ----------------     # LWL
 REMOVED             100110 ----- ----- ----------------     # LWR
 REMOVED             101010 ----- ----- ----------------     # SWL
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 3d627d049bd..962522b0e02 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28130,8 +28130,6 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
         switch (op1) {
         case OPC_LWLE:
         case OPC_LWRE:
-            check_insn_opc_removed(ctx, ISA_MIPS32R6);
-            /* fall through */
         case OPC_LBUE:
         case OPC_LHUE:
         case OPC_LBE:
@@ -28143,8 +28141,6 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
             return;
         case OPC_SWLE:
         case OPC_SWRE:
-            check_insn_opc_removed(ctx, ISA_MIPS32R6);
-            /* fall through */
         case OPC_SBE:
         case OPC_SHE:
         case OPC_SWE:
-- 
2.26.2


