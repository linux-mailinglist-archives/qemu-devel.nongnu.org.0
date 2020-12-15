Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110842DB70F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:19:06 +0100 (CET)
Received: from localhost ([::1]:57778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJax-00079J-Ky
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJIk-0006PT-CN
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:00:14 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:36965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJIe-0004Ah-B6
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:00:10 -0500
Received: by mail-ed1-x52a.google.com with SMTP id cm17so22843643edb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qhCr51gZzmCyhfb9yAybvFXb3H9tr37qgZdUgiwOt1k=;
 b=DU0zSBFj/RMVXWs8OhS0o+DuJ6AcJiRFIB8npmjbOIkvcNs3XsVXLPX1qOB/uVGfLT
 ZW38qaWpj7Xs0kAkp81wUSK7F+PF88TlKDKF1A5wmUiTCE+Uu+aWba0eT1nyvonOi11u
 iMpCecYUP6ZbZGuKJwvQe+5QJt91nRUUGf09Z5zT5HWsDTfm7jbjwNws6ZUa5bEWjYuy
 DHExeNr6sHkQJFwVCLD7V9drOYr6O4KpF5DxUDW8vdlZAyuwALeTuzCBkFAkFkuPQEwN
 kbhKYAs6zlQnQitEi0j/OULmfJWmsEFSrDx26MrVl3621TQDCLp2/x8JKEpMh+9gicqS
 N+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qhCr51gZzmCyhfb9yAybvFXb3H9tr37qgZdUgiwOt1k=;
 b=ngzcUgURDuhihNcK5wzpdZAaxTUPSGLeDBuUjiZyBIC6dOfO8bXCW6cUeuu46+V7lt
 JrVTdpW/bHEtfbiv1sXQdVrlC8omBc4GiQ1oYEpyoHVd1Cj4W1l5zT8HsrB6KtHlGGD9
 Zmi/WQ+z0UT8RUM+BmqWwq3yTm0FnClmGsl7UzgJy3B324DHDA5CQexN4lY7ZVafg/Ad
 1pbAk9EUlIAtUh905tAgW/dKVSXc6gm7ETqMRLXJ4a6rIJ3rXCh6OuHmxtUWZpOCM+Ki
 MApViq1tAb1j9+Tp/fMjNnt3gF9lzf9Vur/ekztjaEBpZy51OnV2q30ac0KtRzrpyNL0
 EVSg==
X-Gm-Message-State: AOAM531V7ByFHo75jho0biqfA1AhI92qjGYU36QhzNgCW5loPtLtSjut
 UVw5AWxeD19OKsFPS19lJ2Q=
X-Google-Smtp-Source: ABdhPJwAw/3qzdrXTqpeeUEUWGq0bTt6nV1n5heKOXy582bqGD3WN1pilgWUPaMuIGw9eYMAorR4Aw==
X-Received: by 2002:aa7:d94e:: with SMTP id l14mr4310053eds.98.1608073203992; 
 Tue, 15 Dec 2020 15:00:03 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id v16sm19120925eds.64.2020.12.15.15.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 15:00:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 22/24] target/mips: Introduce decodetree helpers for MSA
 LSA/DLSA opcodes
Date: Tue, 15 Dec 2020 23:57:55 +0100
Message-Id: <20201215225757.764263-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the LSA opcode to the MSA32 decodetree config, add DLSA
to a new config for the MSA64 ASE, and call decode_msa64()
in the main decode_opc() loop.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mod-msa32.decode    |  4 ++++
 target/mips/mod-msa64.decode    | 17 +++++++++++++++++
 target/mips/mod-msa_translate.c | 14 ++++++++++++++
 target/mips/meson.build         |  2 ++
 4 files changed, 37 insertions(+)
 create mode 100644 target/mips/mod-msa64.decode

diff --git a/target/mips/mod-msa32.decode b/target/mips/mod-msa32.decode
index d69675132b8..0b2f0863251 100644
--- a/target/mips/mod-msa32.decode
+++ b/target/mips/mod-msa32.decode
@@ -10,11 +10,15 @@
 #       (Document Number: MD00866-2B-MSA32-AFP-01.12)
 #
 
+&lsa                rd rt rs sa
 &msa_bz             df wt s16
 
+@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &lsa
 @bz                 ...... ... ..   wt:5 s16:16             &msa_bz df=3
 @bz_df              ...... ... df:2 wt:5 s16:16             &msa_bz
 
+LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
+
 BZ_V                010001 01011  ..... ................    @bz
 BNZ_V               010001 01111  ..... ................    @bz
 
diff --git a/target/mips/mod-msa64.decode b/target/mips/mod-msa64.decode
new file mode 100644
index 00000000000..8dcbbcd8538
--- /dev/null
+++ b/target/mips/mod-msa64.decode
@@ -0,0 +1,17 @@
+# MIPS SIMD Architecture Module instruction set
+#
+# Copyright (C) 2020  Philippe Mathieu-Daudé
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# Reference:
+#       MIPS Architecture for Programmers Volume IV-j
+#       The MIPS64 SIMD Architecture Module, Revision 1.12
+#       (Document Number: MD00868-1D-MSA64-AFP-01.12)
+#
+
+&lsa                rd rt rs sa !extern
+
+@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &lsa
+
+DLSA                 000000 ..... ..... ..... 000 .. 010101 @lsa
diff --git a/target/mips/mod-msa_translate.c b/target/mips/mod-msa_translate.c
index d1a8a95e62e..f139ba784dc 100644
--- a/target/mips/mod-msa_translate.c
+++ b/target/mips/mod-msa_translate.c
@@ -19,6 +19,7 @@
 
 /* Include the auto-generated decoder.  */
 #include "decode-mod-msa32.c.inc"
+#include "decode-mod-msa64.c.inc"
 
 #define OPC_MSA (0x1E << 26)
 
@@ -2268,7 +2269,20 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     return true;
 }
 
+static bool trans_LSA(DisasContext *ctx, arg_LSA *a)
+{
+    return gen_LSA(ctx, a->rd, a->rt, a->rs, a->sa);
+}
+
+static bool trans_DLSA(DisasContext *ctx, arg_LSA *a)
+{
+    return gen_DLSA(ctx, a->rd, a->rt, a->rs, a->sa);
+}
+
 bool decode_ase_msa(DisasContext *ctx, uint32_t insn)
 {
+    if (TARGET_LONG_BITS == 64 && decode_msa64(ctx, insn)) {
+        return true;
+    }
     return decode_msa32(ctx, insn);
 }
diff --git a/target/mips/meson.build b/target/mips/meson.build
index dce0ca96527..8e2e5fa40b8 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -1,5 +1,6 @@
 gen = [
   decodetree.process('mod-msa32.decode', extra_args: [ '--static-decode=decode_msa32' ]),
+  decodetree.process('mod-msa64.decode', extra_args: [ '--static-decode=decode_msa64' ]),
 ]
 
 mips_ss = ss.source_set()
@@ -19,6 +20,7 @@
   'translate_addr_const.c',
   'mod-msa_translate.c',
 ))
+
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 
 mips_softmmu_ss = ss.source_set()
-- 
2.26.2


