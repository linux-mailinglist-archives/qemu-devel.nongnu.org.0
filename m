Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC2F42041C
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 23:45:37 +0200 (CEST)
Received: from localhost ([::1]:59898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX9Ie-00016A-9U
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 17:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mX9G1-0007OF-Nd
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 17:42:53 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:41955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mX9Fy-0000FM-QM
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 17:42:53 -0400
Received: by mail-lf1-x12d.google.com with SMTP id j5so58516760lfg.8
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 14:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xak2sEAwzGEUNDut8cfkpYCfvFdv2LJdzkKEfqvDZWs=;
 b=Db5oe03GBXUuZ/J8JONWW7azcDNBbVjlm2+geN4LNFiUdz4ahETAtfB/vfmmdkC1Jz
 wRxfFzm8i7rypF/+0up04YNahqrIB+slML189eL6k70ZEpa8ONYFE+vil/hgEkmZwhDR
 vT/fXYvVzf1c/8sahX/RNFYsv9C4VBdJwgDDT3vLPgLEo9YRC0IPoU95jCHDP6h87PTn
 vtd8+riwSrD0Y5x6THcdsYJ3xUNko1SRHk5ki+r4utzCzOaGU228yvlL0pgt3WyrlFYU
 ETn1JVKi6Ny70C/TZO/xIs/UZW6DVC8iVovXvVvZnpjoq492qpm4g2sAYbR7/mYBo2ar
 DlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xak2sEAwzGEUNDut8cfkpYCfvFdv2LJdzkKEfqvDZWs=;
 b=ExLvqxe8lfg471VjvPu1G/m8A7ti9NfCW9JFmCBMxX9TxJ1XSRyTzOabPzXY0jeEYQ
 yGNg6GYMTk9B+QUgOb4GmBkJOHVDpxlKA+PFSAVZg0Q88apuqaq0jTU9kv62MxFALmWh
 N1wi3+1uvEwtL4pT0cEs2CA+qpq3l4Nlq7bBwbfKxh8IFDFSWrkerqXQWVJ+ggAkLhhL
 TJGQqhXE3/3ROY/DKNwxyPnFHn8YTCm5nH+o9fXDZ2CSjMlL8mKRyUsaUEP24hEdiRop
 eofmy6hX+86xkiETgja420KCgwgb0ZOZBb9CUf0lutVnmHKfcrVqJXBwl2ULjxASwPWO
 5jcA==
X-Gm-Message-State: AOAM5327cx8E8Ysxsdc3tf7VWeae352m/SoRYWSNlReMTt08cnzere0I
 2GxAQ7R+cjH0aHiS4FjVydBA4ShULCe3b0jS
X-Google-Smtp-Source: ABdhPJzMYIv0utqgSYbgziy2hRtw84aiq7pugcETrco37Lp8+NzZszI4w9LFb9I7wbcMUt/iLUk3qA==
X-Received: by 2002:a2e:a591:: with SMTP id m17mr11752621ljp.5.1633297367672; 
 Sun, 03 Oct 2021 14:42:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id l14sm191772lfe.124.2021.10.03.14.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 14:42:47 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] target/riscv: Use dup_const_tl in orc.b to legalise
 truncation of constant
Date: Sun,  3 Oct 2021 23:42:43 +0200
Message-Id: <20211003214243.3813425-2-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211003214243.3813425-1-philipp.tomsich@vrull.eu>
References: <20211003214243.3813425-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12d.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need to use the newly introduced dup_const_tl in orc.b to legalise
the truncation (to target_long) of the constant generated with dup_const.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---

(no changes since v1)

 target/riscv/insn_trans/trans_rvb.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 2927353d9b..185c3e9a60 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -249,7 +249,7 @@ static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
 static void gen_orc_b(TCGv ret, TCGv source1)
 {
     TCGv  tmp = tcg_temp_new();
-    TCGv  ones = tcg_constant_tl(dup_const(MO_8, 0x01));
+    TCGv  ones = tcg_constant_tl(dup_const_tl(MO_8, 0x01));
 
     /* Set lsb in each byte if the byte was zero. */
     tcg_gen_sub_tl(tmp, source1, ones);
-- 
2.25.1


