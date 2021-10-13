Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B83A42C8F4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:44:21 +0200 (CEST)
Received: from localhost ([::1]:55244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1majEi-0005ok-Cn
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1majCQ-000474-FE
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:41:58 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:45043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1majCO-0000xE-6E
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:41:58 -0400
Received: by mail-lf1-x12c.google.com with SMTP id y26so15936644lfa.11
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jVEww1lzp0MjFUAYOIjx49odZWcfEctNMccayO6Ru3s=;
 b=DXZeAE/Jum7NFs11Eiqke40nX0dVUBNRm1Xr4o9xMzyVgYZGyOlzsoEpFWcZMYY4G1
 QcrHL2vpCrqzmuRl74ZMqGMjtQgCfZHrqAb8c+KOFp9QNaOlca55QtHbmcBRdvDi3wsn
 bNdEb5zbSCJeWJrwAYM38pJNaenJw9VpGyhWiVkZqVniAUr1npGgFQZs/v/JWCDJuB6G
 QEIBLEliZHVR2gbr5v9fs7ts5zIJ2By9S1tz2g2Kl1isE9QeFAxSETZdXemJEjKyCCMC
 CP28MXvcKwEXXEsVu8hNbV88hLblbKsl6AcHAOfPjQzmhOzd+dN9+Ixt9PKjpKznt4sh
 0sUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jVEww1lzp0MjFUAYOIjx49odZWcfEctNMccayO6Ru3s=;
 b=13qm+73w5QloEsokvi45O+nPytT3ae1pBQYCo88yCeAjpztS+OU8CsvyVynx9Go7H/
 fL4BtUgrRolfIz9gyEwXcw5s7N9NoAwSdkvrgmtu2pzowZz522rr20WjwEhbHNUnEBWU
 zjVKbN+4BZoVMD1YiQk2aZ+UWYtL1/QwAAYqWOJi3vysdkXzEVNf/+hPYHPstdVH6YYP
 LrETfTzLciJR7Oj4wRsCHUbu+e2/giN43T5kv0lnOQ1h3sKUWEUFF7Y6Or+oU1GbKLgE
 Yx5VewNmLprNcs58aeI84b0H5ERIsWj0OaygFCfGGhbUmali73PUkdTtCOtKw7PZYkHh
 ATOg==
X-Gm-Message-State: AOAM5317WKj46wcHK+ajy/3wtMuGwRazkYrTiJKZ3Y8M1CWFsBeIfQv2
 tqfz+tc3oCz7ZaiSYXjW2ZAYAm4Zyj/7PQ==
X-Google-Smtp-Source: ABdhPJwcBYn/BHNNics1n0i0zTrvjgj2yzn+U5LUskZvHasQemaiRw8EnCPbxvlhIhvISqQEirH9JA==
X-Received: by 2002:a05:651c:617:: with SMTP id
 k23mr1114672lje.402.1634150511104; 
 Wed, 13 Oct 2021 11:41:51 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id j18sm22095lfg.255.2021.10.13.11.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:41:50 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/riscv: Fix orc.b implementation
Date: Wed, 13 Oct 2021 20:41:25 +0200
Message-Id: <20211013184125.2010897-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Vincent Palatin <vpalatin@rivosinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The earlier implementation fell into a corner case for bytes that were
0x01, giving a wrong result (but not affecting our application test
cases for strings, as an ASCII value 0x01 is rare in those...).

This changes the algorithm to:
 1. Mask out the high-bit of each bytes (so that each byte is <= 127).
 2. Add 127 to each byte (i.e. if the low 7 bits are not 0, this will overflow
    into the highest bit of each byte).
 3. Bitwise-or the original value back in (to cover those cases where the
    source byte was exactly 128) to saturate the high-bit.
 4. Shift-and-mask (implemented as a mask-and-shift) to extract the MSB of
    each byte into its LSB.
 5. Multiply with 0xff to fan out the LSB to all bits of each byte.

Fixes: d7a4fcb034 ("target/riscv: Add orc.b instruction for Zbb, removing gorc/gorci")

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reported-by: Vincent Palatin <vpalatin@rivosinc.com>

---

 target/riscv/insn_trans/trans_rvb.c.inc | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 185c3e9a60..3095624f32 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -249,13 +249,16 @@ static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
 static void gen_orc_b(TCGv ret, TCGv source1)
 {
     TCGv  tmp = tcg_temp_new();
-    TCGv  ones = tcg_constant_tl(dup_const_tl(MO_8, 0x01));
+    TCGv  low7 = tcg_constant_tl(dup_const_tl(MO_8, 0x7f));
 
-    /* Set lsb in each byte if the byte was zero. */
-    tcg_gen_sub_tl(tmp, source1, ones);
-    tcg_gen_andc_tl(tmp, tmp, source1);
+    /* Set msb in each byte if the byte was non-zero. */
+    tcg_gen_and_tl(tmp, source1, low7);
+    tcg_gen_add_tl(tmp, tmp, low7);
+    tcg_gen_or_tl(tmp, tmp, source1);
+
+    /* Extract the msb to the lsb in each byte */
+    tcg_gen_andc_tl(tmp, tmp, low7);
     tcg_gen_shri_tl(tmp, tmp, 7);
-    tcg_gen_andc_tl(tmp, ones, tmp);
 
     /* Replicate the lsb of each byte across the byte. */
     tcg_gen_muli_tl(ret, tmp, 0xff);
-- 
2.25.1


