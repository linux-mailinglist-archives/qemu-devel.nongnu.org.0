Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DD242C199
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 15:41:07 +0200 (CEST)
Received: from localhost ([::1]:41554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maeVG-0002zA-9k
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 09:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vpalatin@rivosinc.com>)
 id 1maaiM-0006o2-TB
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:38:24 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:43887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vpalatin@rivosinc.com>)
 id 1maaiK-0001fu-P4
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:38:22 -0400
Received: by mail-pl1-x635.google.com with SMTP id y1so1402828plk.10
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MiLKDIsEn1i73Hs8D9hiPoUJJXT0M2G5T8dvQaYEhaI=;
 b=k+SE/ykZW5CHMBJUOvCE3HNqJiqbuWcdY5aZv16kaBT6OYv2WnHvIpWO1aTWXN9QaO
 5GqpfUTJvx7IpQpJDfTjhMRadIZGsO+OK3ky3YaO7n5yzsaYKA+qDsLbhskWucJ2izdY
 y5FVuYfbwr4p29IXNgfvWt0D4HddpvPWVuvNd/Kq8Vu3LfwBs3PT2kCL6hr+5aHBcS9m
 Uo547PWOJbyKe6IBX37s2f70fEeGEoHkpfnhpUoJpGicFRDmYpUbNCQUijSk+7g3Nc+J
 q51imqbzK56nYnDuJ8LOG2fKVRLG0iLcN704rl8c4Owzw5vFXkuXsDag7fx+KZS8vstE
 vT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MiLKDIsEn1i73Hs8D9hiPoUJJXT0M2G5T8dvQaYEhaI=;
 b=njlZDGx3SQZsETzhHaNGsP/i96AA6Jop45K8fUPPtQkuHHbNCHCJDp5kZceio1Fqmw
 MFSLVgsH8jVFtDnJ2WNsR63XGgMHfoXoQGPxcYFUVTstue2Te1/QkxwbqmByZUZ+Qyf9
 uTtdG01ROKTjs3SRa8+mWRXG7qwjP+AipwyUTnyhFHg29iXF7LmQQtZiE3lDtyDvo6/Z
 YZ3xqsr+EKye1QrFHQ3QTnTLWXAH2B1Jz4NBTmXLZH612BGRE0JvvhCcufou8XTlBH3R
 FG+ZiZIftsJZ9xsoBnTD9JX/kw7G25KNCOR/toqIYbqsjtDtrpan1EWb+WHv3oKFk+BI
 4ANA==
X-Gm-Message-State: AOAM531o1F7GE2wHyniPTC37vegN0VPWMrWFETOXL7fSIiqw779232iT
 P5Dq7FRPX6R1DGnpMm5TaOkB5g==
X-Google-Smtp-Source: ABdhPJyAInwl47kmCBeY55GOlN7svVlx6AvN+UlA7HCSmfyjawxIGTqpiqs7aGfYXVIeicwy3xAEGQ==
X-Received: by 2002:a17:902:c104:b0:13f:59f9:db92 with SMTP id
 4-20020a170902c10400b0013f59f9db92mr6574636pli.75.1634117899342; 
 Wed, 13 Oct 2021 02:38:19 -0700 (PDT)
Received: from rivos.ba.rivosinc.com (rivos.palats.com. [51.210.216.21])
 by smtp.gmail.com with ESMTPSA id l207sm13647578pfd.199.2021.10.13.02.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:38:18 -0700 (PDT)
From: Vincent Palatin <vpalatin@rivosinc.com>
To: philipp.tomsich@vrull.eu,
	qemu-devel@nongnu.org
Subject: [PATCH v1B] target/riscv: fix orc.b instruction in the Zbb extension
Date: Wed, 13 Oct 2021 11:38:12 +0200
Message-Id: <20211013093812.1182855-1-vpalatin@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CANVmJF=2awVA+6CZ1D1BrdZQG=OyXdYZk63ZnDOVEBooEGzE8g@mail.gmail.com>
References: <CANVmJF=2awVA+6CZ1D1BrdZQG=OyXdYZk63ZnDOVEBooEGzE8g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=vpalatin@rivosinc.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 09:30:50 -0400
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
Cc: alistair23@gmail.com, richard.henderson@linaro.org,
 alistair.francis@opensource.wdc.com, vpalatin@rivosinc.com,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The implementation was failing for the following 7 hexadecimal patterns
which return one wrong byte (0x00 instead of 0xff):
orc.b(0x............01..) = 0x............00.. (instead of 0x............ff..)
orc.b(0x..........01....) = 0x..........00.... (instead of 0x..........ff....)
orc.b(0x........01......) = 0x........00...... (instead of 0x........ff......)
orc.b(0x......01........) = 0x......00........ (instead of 0x......ff........)
orc.b(0x....01..........) = 0x....00.......... (instead of 0x....ff..........)
orc.b(0x..01............) = 0x..00............ (instead of 0x..ff............)
orc.b(0x01..............) = 0x00.............. (instead of 0xff..............)

Implement a simpler but less astute/optimized 'divide and conquer' method
where bits are or'ed by pairs, then the pairs are or'ed by pair ...

Signed-off-by: Vincent Palatin <vpalatin@rivosinc.com>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 185c3e9a60..04f795652d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -249,18 +249,26 @@ static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
 static void gen_orc_b(TCGv ret, TCGv source1)
 {
     TCGv  tmp = tcg_temp_new();
+    TCGv  shifted = tcg_temp_new();
     TCGv  ones = tcg_constant_tl(dup_const_tl(MO_8, 0x01));
 
-    /* Set lsb in each byte if the byte was zero. */
-    tcg_gen_sub_tl(tmp, source1, ones);
-    tcg_gen_andc_tl(tmp, tmp, source1);
-    tcg_gen_shri_tl(tmp, tmp, 7);
-    tcg_gen_andc_tl(tmp, ones, tmp);
+    /*
+     * Divide and conquer: show one byte of the word in the comments,
+     * with U meaning Useful or'ed bit, X Junk content bit, . don't care.
+     */
+    tcg_gen_shri_tl(shifted, source1, 1);
+    tcg_gen_or_tl(tmp, source1, shifted); /* tmp[15:8] = XU.U.U.U */
+    tcg_gen_shri_tl(shifted, tmp, 2);
+    tcg_gen_or_tl(tmp, shifted, tmp);     /* tmp[15:8] = XXXU...U */
+    tcg_gen_shri_tl(shifted, tmp, 4);
+    tcg_gen_or_tl(tmp, shifted, tmp);     /* tmp[15:8] = XXXXXXXU */
+    tcg_gen_and_tl(tmp, ones, tmp);       /* tmp[15:8] = 0000000U */
 
     /* Replicate the lsb of each byte across the byte. */
     tcg_gen_muli_tl(ret, tmp, 0xff);
 
     tcg_temp_free(tmp);
+    tcg_temp_free(shifted);
 }
 
 static bool trans_orc_b(DisasContext *ctx, arg_orc_b *a)
-- 
2.25.1


