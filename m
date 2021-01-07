Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BCE2EE997
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 00:09:43 +0100 (CET)
Received: from localhost ([::1]:52718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxePW-0003LH-PR
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 18:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdlS-0005SO-9l
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:19 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdlQ-0006d4-Tp
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:18 -0500
Received: by mail-wm1-x334.google.com with SMTP id v14so6369390wml.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yq3mxfTZKdf/fjKj8fFk3v2tF8q6uI5ug94fHU9oH8s=;
 b=Gd82pxS4+zzvVBDBN4HENJ44Mz7QxhZU8UloC1P6jP13F72cJ1g34MUWYAWomwmLeN
 2/A/ouAET0qQIZ38QJbEmi1RMN3rf1WPjaSCpzvlBzTVdPI3Z4/TbI3S1LLx54yFTwFp
 5ti2dy+nF9HmEr8DCSO4RtzQmHPOEF8iby5YeukNi9AlSJqS+3pKPdqGHnVpHNKOzOus
 P9QwZVrNPwz2VNdmmyINVxIEiQIyHv/dewREky1tgJyp3NaCaXh89mYxWSEAXQIAFnVw
 JQ2WyK9sDprS+omnTUjYMY3S0BevUtsCalHviNOwMRPGdurcSm8BPgTOGQzRhHiE/HLO
 P0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Yq3mxfTZKdf/fjKj8fFk3v2tF8q6uI5ug94fHU9oH8s=;
 b=m3/k01JmTT9JUWae8qWwI4SsEx7C3x1wt/YrtZt032yDnm0xBxhWRI2cTg8eEhbO+c
 BDT760hnpd2cd64Fa2ayKiSURHGLWZpfykHIk17MZPPOfpNo51fCFT2V6g6GaVteNKeW
 yBNQhXpFAESDdNfn39fNVbsr/Q+xDpzczNqEf1Pwnqj6kz9xtZ0mU+gVpnnZw3tPXjAZ
 5aajL8BS7ziHrkUbkmsUQ25SjP6dOZ+t2wbgIQoDQ8c+3WWs+4bZWqAq3KVhHQfWxZS4
 WNeizgZN/lSaL4Np77wC6hvvGvcFg2RZ+bvR6CXfqxhrR424XACl8Q1bTJzBbej0Yx01
 GNqw==
X-Gm-Message-State: AOAM530GRI2Qv76OP7QUQ1qghP7FpH3s85Xpma8PNBN1JmdBB9o/t6K0
 vkpgNOEJRFcZH7DRFgPSJrRLHaDi20k=
X-Google-Smtp-Source: ABdhPJxD8yDTAfSjw1MvU0PUYHwY/6OzpFw719ayDQklkKKFRhWW9uo0SP6oCkINV8b+kAq1EiW3TA==
X-Received: by 2002:a7b:c184:: with SMTP id y4mr534072wmi.92.1610058495363;
 Thu, 07 Jan 2021 14:28:15 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id m14sm10311543wrh.94.2021.01.07.14.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:28:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 62/66] target/mips: Convert Rel6 LWLE/LWRE/SWLE/SWRE opcodes to
 decodetree
Date: Thu,  7 Jan 2021 23:22:49 +0100
Message-Id: <20210107222253.20382-63-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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

LWLE/LWRE/SWLE/SWRE (EVA) opcodes have been removed from
the Release 6. Add a single decodetree entry for the opcodes,
triggering Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() calls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201208203704.243704-11-f4bug@amsat.org>
---
 target/mips/mips32r6.decode | 5 +++++
 target/mips/translate.c     | 4 ----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/mips/mips32r6.decode b/target/mips/mips32r6.decode
index 89a0085fafd..3ec50704cf2 100644
--- a/target/mips/mips32r6.decode
+++ b/target/mips/mips32r6.decode
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
index 0d729293f6b..73efbd24585 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28122,8 +28122,6 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
         switch (op1) {
         case OPC_LWLE:
         case OPC_LWRE:
-            check_insn_opc_removed(ctx, ISA_MIPS_R6);
-            /* fall through */
         case OPC_LBUE:
         case OPC_LHUE:
         case OPC_LBE:
@@ -28135,8 +28133,6 @@ static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
             return;
         case OPC_SWLE:
         case OPC_SWRE:
-            check_insn_opc_removed(ctx, ISA_MIPS_R6);
-            /* fall through */
         case OPC_SBE:
         case OPC_SHE:
         case OPC_SWE:
-- 
2.26.2


