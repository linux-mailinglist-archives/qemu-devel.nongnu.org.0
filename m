Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132232EE990
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 00:07:25 +0100 (CET)
Received: from localhost ([::1]:46680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeNI-0000fY-4T
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 18:07:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdlP-0005Qi-Vo
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:16 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdlL-0006c5-Mz
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:14 -0500
Received: by mail-wr1-x429.google.com with SMTP id m5so7114575wrx.9
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jlfAUa3yzIuzGTG6Nw//8ZjnEqUFLfQ9i/y2dfj6avA=;
 b=NyodmDecPOGhzzmkDVaoq/JjSTYPPVIBfksj1Br9WTnPBXGPZyhJ5iLWjMZKKHtYQP
 z13kr8wLAzYahuf3gn4wmt/WlnpWwIYxr+rmt7ZO5XpCIWQhXcQMmqS6V785bD09gVlx
 LGlUSCOQIHEkIheNYuSSGsj2VQrmeDlRRiXll6d2Gmn2IGsF6OFJVEcS+KsJ+AhCNA4+
 hidp2Py9Xrdk/P3eOJ9xcUBTo+AvW/8g60D+PDn300ERGn/u/Jvk38u39gfoPubMO4Ql
 DNx+XG/7my7jL5StC0YkkhGgmO4ccwzg8QaZRQyMi7Qw39P4iMg2ZiQWo9vOVP7b7Gcw
 Zjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jlfAUa3yzIuzGTG6Nw//8ZjnEqUFLfQ9i/y2dfj6avA=;
 b=CwydNcWkPJwN4aj2kbiBcn4nMRiGJBBYd4boXiw8LXTa5kZV0ZG220zobEYPsgOtU0
 293bVf6lWWTbstCyO3BLBw9vpF+395n/grBUN9Ax9MirJexLNi8V6BUjNiVBs9pCrura
 AWFDdQAyH/OlCAGMLIRfny+ScwkvPbdyohZd2spNySz7Wzg1+vth5nv7mnqrlu6a5Akz
 HgcG8VJe8Nhveuki5dsKCEBayE84G4/FEaVKNfmqbW3QUR1bmsCciPgHIAX5zKOPgBFF
 iVYgy0pT5p3OH5CG9zvKpQupu87Y41QUDbfxBcLzE10UTJmAZ50IGKkG17j9zz5yCrFC
 1lcQ==
X-Gm-Message-State: AOAM5329q/L04Z47ZamoDwkDmoA/6le8PO78XPzBI9zn4w8RY04O5xee
 eWCtP79iKcwayxvcUxkZCoCUqJkMNu8=
X-Google-Smtp-Source: ABdhPJxQ2uYbbyM0jNrN7Wau7cpOMcgEfAdSDonzO/lX6iY/F9AduoIVoTwOtu2AvYXchXHB30BTvw==
X-Received: by 2002:adf:9d82:: with SMTP id p2mr691905wre.330.1610058490365;
 Thu, 07 Jan 2021 14:28:10 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id d191sm9498068wmd.24.2021.01.07.14.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:28:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 61/66] target/mips: Convert Rel6 LWL/LWR/SWL/SWR opcodes to
 decodetree
Date: Thu,  7 Jan 2021 23:22:48 +0100
Message-Id: <20210107222253.20382-62-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LWL/LWR/SWL/SWR opcodes have been removed from the Release 6.

Add a single decodetree entry for the opcodes, triggering
Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() calls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201208203704.243704-10-f4bug@amsat.org>
---
 target/mips/mips32r6.decode | 5 +++++
 target/mips/translate.c     | 5 +----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/mips/mips32r6.decode b/target/mips/mips32r6.decode
index e3b3934539a..89a0085fafd 100644
--- a/target/mips/mips32r6.decode
+++ b/target/mips/mips32r6.decode
@@ -20,5 +20,10 @@ REMOVED             010011 ----- ----- ----- ----- ------   # COP1X (COP3)
 
 REMOVED             011100 ----- ----- ----- ----- ------   # SPECIAL2
 
+REMOVED             100010 ----- ----- ----------------     # LWL
+REMOVED             100110 ----- ----- ----------------     # LWR
+REMOVED             101010 ----- ----- ----------------     # SWL
+REMOVED             101110 ----- ----- ----------------     # SWR
+
 REMOVED             101111 ----- ----- ----------------     # CACHE
 REMOVED             110011 ----- ----- ----------------     # PREF
diff --git a/target/mips/translate.c b/target/mips/translate.c
index e8389738c57..0d729293f6b 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28589,11 +28589,10 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         if (ctx->insn_flags & INSN_R5900) {
             check_insn_opc_user_only(ctx, INSN_R5900);
         }
+        check_insn_opc_removed(ctx, ISA_MIPS_R6);
         /* Fallthrough */
     case OPC_LWL:
     case OPC_LWR:
-        check_insn_opc_removed(ctx, ISA_MIPS_R6);
-         /* Fallthrough */
     case OPC_LB:
     case OPC_LH:
     case OPC_LW:
@@ -28604,8 +28603,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
          break;
     case OPC_SWL:
     case OPC_SWR:
-        check_insn_opc_removed(ctx, ISA_MIPS_R6);
-        /* fall through */
     case OPC_SB:
     case OPC_SH:
     case OPC_SW:
-- 
2.26.2


