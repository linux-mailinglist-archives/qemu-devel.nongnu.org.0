Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E999242C18C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 15:37:05 +0200 (CEST)
Received: from localhost ([::1]:34082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maeRM-0005xS-SX
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 09:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vpalatin@rivosinc.com>)
 id 1maahe-0004ex-A6
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:37:38 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:41653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vpalatin@rivosinc.com>)
 id 1maahc-00017H-CG
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:37:38 -0400
Received: by mail-pl1-x62b.google.com with SMTP id x8so1405279plv.8
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=udTBgfMvafWFF2HM9qzUy4cePKbwUTJPgZCDbusCP8U=;
 b=UIyaj3L+baYDm99H/GroqwM0nslGqnCqXFPFATwF0O6rRw/M8/7q7I9QPtxs3eTUvx
 F5pqZAFq9jJG3cR36r0M4JRaISOS6JFySX6MLSmjHUxFQaxpUxR6l+4Uyxko1nXCL78L
 BwizPRT8UlF39aon+G5LEFjRrOg6nLQELUyCM1h2AaRj0GnP1DWoSxL67K++3jebsqEa
 h4uH9NMGnnNc+/zCXKwXa4vVqTwTHrJ8qzPR/q+RZn5tzCeD5NZLAPO51jcP8j/kr60m
 Q2AcSJABwzFPUJhFkpCnWBH9LVElaJr7y9OQyYgV2YedSFXqsTifHJHpswAMb6XoxrU8
 tG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=udTBgfMvafWFF2HM9qzUy4cePKbwUTJPgZCDbusCP8U=;
 b=Bg2CtPG6WStEm8Ee2TvTj9atAS96LaHKDyScc9eYkXqU0Mf0vVCBMQlWj6xbGnlOUV
 a2a5HwlqfkzSOYvGaxJv98yvO6NQMV0lHrehGFipde4sJMgZ6LQv1cNp98he8A6QsD/Q
 BR5AKiK+g6XoeNGUUaAZZ2QAmDS1audT9N/qJZEo/RN8v5NRKPGEmN8IHtyMJiUpDEvi
 pAGSZxoJa7BTrhjGuVepfXwhVju/p/3VyaOGmrbLCs9MxRIwqOb5tAt5LDAyuU3bzrew
 hy5vnkhGjqQwbWDE+LPAKlwoOmTFIX9NxTD9G1uSpBZ7EJ/t8vtoy8SW35S5SZ0N1fci
 ePvg==
X-Gm-Message-State: AOAM532lcSAVt1e7CzIArAyC8Wj6GyrK2K2aLX2DaSKWfFL/QoW7psrx
 YTtNhYOPFyxdM/ApJzRPIKWlNQ==
X-Google-Smtp-Source: ABdhPJwaa95Kn/xrswpQdYQX5pzCG8BIM49uyOlnXK2zo3HTvrGRdxDvr5F665aVCEBT3ZlCQHO+2g==
X-Received: by 2002:a17:90a:29a4:: with SMTP id
 h33mr12294332pjd.88.1634117854756; 
 Wed, 13 Oct 2021 02:37:34 -0700 (PDT)
Received: from rivos.ba.rivosinc.com (rivos.palats.com. [51.210.216.21])
 by smtp.gmail.com with ESMTPSA id c9sm13668208pgq.58.2021.10.13.02.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:37:34 -0700 (PDT)
From: Vincent Palatin <vpalatin@rivosinc.com>
To: philipp.tomsich@vrull.eu,
	qemu-devel@nongnu.org
Subject: [PATCH v1A] target/riscv: fix orc.b instruction in the Zbb extension
Date: Wed, 13 Oct 2021 11:37:21 +0200
Message-Id: <20211013093721.1182727-1-vpalatin@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CANVmJF=2awVA+6CZ1D1BrdZQG=OyXdYZk63ZnDOVEBooEGzE8g@mail.gmail.com>
References: <CANVmJF=2awVA+6CZ1D1BrdZQG=OyXdYZk63ZnDOVEBooEGzE8g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=vpalatin@rivosinc.com; helo=mail-pl1-x62b.google.com
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

Try to keep the carry from propagating and triggering the incorrect
results.

Signed-off-by: Vincent Palatin <vpalatin@rivosinc.com>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 185c3e9a60..b9fc272789 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -249,11 +249,17 @@ static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
 static void gen_orc_b(TCGv ret, TCGv source1)
 {
     TCGv  tmp = tcg_temp_new();
+    TCGv  tmp2 = tcg_temp_new();
     TCGv  ones = tcg_constant_tl(dup_const_tl(MO_8, 0x01));
 
+    /* avoid carry propagation */
+    tcg_gen_shli_tl(tmp, source1, 1);
+    tcg_gen_or_tl(tmp, source1, tmp);
+    tcg_gen_andc_tl(tmp2, tmp, ones);
+
     /* Set lsb in each byte if the byte was zero. */
-    tcg_gen_sub_tl(tmp, source1, ones);
-    tcg_gen_andc_tl(tmp, tmp, source1);
+    tcg_gen_sub_tl(tmp, tmp2, ones);
+    tcg_gen_andc_tl(tmp, tmp, tmp2);
     tcg_gen_shri_tl(tmp, tmp, 7);
     tcg_gen_andc_tl(tmp, ones, tmp);
 
@@ -261,6 +267,7 @@ static void gen_orc_b(TCGv ret, TCGv source1)
     tcg_gen_muli_tl(ret, tmp, 0xff);
 
     tcg_temp_free(tmp);
+    tcg_temp_free(tmp2);
 }
 
 static bool trans_orc_b(DisasContext *ctx, arg_orc_b *a)
-- 
2.25.1


