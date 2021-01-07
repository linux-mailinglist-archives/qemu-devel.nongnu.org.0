Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C02EE993
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 00:08:31 +0100 (CET)
Received: from localhost ([::1]:49174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeOM-0001jO-W7
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 18:08:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdlh-0005vS-KA
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:33 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdlg-0006hJ-3c
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:33 -0500
Received: by mail-wr1-x42e.google.com with SMTP id q18so7162419wrn.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d4Gj//OkD5jKhI/4P4VQprZ7+6fnm/3amg1m9obP+eI=;
 b=btSc1YFi2LkwM2+EAdgZ56w6Qe52rwg/g+fmeS/hD3F68F2fEFYUhlDqUxB33dh1gj
 xOYJ4UZ8CN/NTQcanjgvNXqtwdaLTVhDW8Sav3kCpJ7B0+ZIUqVWlQBhH0fEe8wc9OEV
 kK1dVmMJcIBi1TumZ7MxLX9shUchuLu0bnXJ4yeimJeC4gFUQK6rqLNVvsRForqedVnL
 0d0CHDhdUFMjAaOtrL6QL2447KxIpU6h+WvZ6NdCoSVPcGrZK1u/EAqPzOJK8OHe4CWU
 woZXW1JsNZG8HEY2OaN964q8Y0N1/EIGnEX2OyllI3J+E99MYPhjmAi3xHJwUnt5A7mB
 8Fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d4Gj//OkD5jKhI/4P4VQprZ7+6fnm/3amg1m9obP+eI=;
 b=t/ua1KzbKw9Kaz5quPU02YC/11QhecrTL5/7Hf08wZA+2yDJ291y0iGnkchDt53JE9
 xJH9B4t9JB65tDCbJlpZ9p7To5WseaiK2IYiGLwRZiyhh6wveIT9hU4XglBGt7eXZYZY
 tfVBbBDvsue3Pi3KAvkcwry8yzEGF/J2nGAviGEscXv3tkuiEybRQT/38eSboqqA2Yzk
 N4PX9jBxGhKdXPDNNOVkrDsLX/E/AIYc0LrB4AdBaW1V/WD+naTmR7GHGRMPfymYjg/R
 ljy348HIYzBBvbqBENEYiA+phqsDXJA9iMZDoqyq5vScXCimWu7ThTTGz79R93Ua0Amj
 Y9kg==
X-Gm-Message-State: AOAM53374NHnlprWVKtintU6KLkelkrXWEUeA2yDV/Wbi82IIb7Z6/+V
 psQCEmUImvhdnYVuP6sUGdASqZA4czg=
X-Google-Smtp-Source: ABdhPJyeb/1d59aZ9MSRmZedPlgjNOORpFfUrYpwLVOmJ2MAgpomcFip6GYr8+4/7KkvOopf0mTobA==
X-Received: by 2002:a5d:5385:: with SMTP id d5mr677700wrv.384.1610058510668;
 Thu, 07 Jan 2021 14:28:30 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id c6sm10851358wrh.7.2021.01.07.14.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:28:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 65/66] target/mips: Convert Rel6 LL/SC opcodes to decodetree
Date: Thu,  7 Jan 2021 23:22:52 +0100
Message-Id: <20210107222253.20382-66-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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

LL/SC opcodes have been removed from the Release 6.

Add a single decodetree entry for the opcodes, triggering
Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() calls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201208203704.243704-14-f4bug@amsat.org>
---
 target/mips/mips32r6.decode | 2 ++
 target/mips/translate.c     | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/mips32r6.decode b/target/mips/mips32r6.decode
index 3ec50704cf2..489c20aa4e9 100644
--- a/target/mips/mips32r6.decode
+++ b/target/mips/mips32r6.decode
@@ -31,4 +31,6 @@ REMOVED             101010 ----- ----- ----------------     # SWL
 REMOVED             101110 ----- ----- ----------------     # SWR
 
 REMOVED             101111 ----- ----- ----------------     # CACHE
+REMOVED             110000 ----- ----- ----------------     # LL
 REMOVED             110011 ----- ----- ----------------     # PREF
+REMOVED             111000 ----- ----- ----------------     # SC
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9f717aab287..b5b7706a7c2 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28585,7 +28585,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         if (ctx->insn_flags & INSN_R5900) {
             check_insn_opc_user_only(ctx, INSN_R5900);
         }
-        check_insn_opc_removed(ctx, ISA_MIPS_R6);
         /* Fallthrough */
     case OPC_LWL:
     case OPC_LWR:
@@ -28606,7 +28605,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
          break;
     case OPC_SC:
         check_insn(ctx, ISA_MIPS2);
-         check_insn_opc_removed(ctx, ISA_MIPS_R6);
         if (ctx->insn_flags & INSN_R5900) {
             check_insn_opc_user_only(ctx, INSN_R5900);
         }
-- 
2.26.2


