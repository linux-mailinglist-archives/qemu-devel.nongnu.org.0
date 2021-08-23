Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BA83F50B1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:47:55 +0200 (CEST)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEzC-0000W8-E4
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEuQ-0000IE-98
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:42:58 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:36570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIEuN-0004Qr-KB
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:42:58 -0400
Received: by mail-lj1-x231.google.com with SMTP id y7so33241964ljp.3
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mVDf2DTleQlmUk2v3RS7SjiR8DsZ3TaK7txh2qX01oc=;
 b=dgMngnpU76uf/ser95680h9kgfNo06OgF0V1opTDxMUdwO3FIKRzaVaCFWTNuqmmnp
 l9q0qdcJmLmbMlYMLlsL3WgJ3tOw9H/24d/MdPmQ3jQPpe+5sYAzC/T86HqSkH5lGD8g
 QMGULubHhnFczTgU/SUX5Aqw+PXYAEaBuQF0SJ0TU0uGwFEgzxD2vqYAJPS79CNUocot
 A250JnkAjuefRn3f0sr7V98EDYO1lhS+8LKj83vwKlYEs+bt8Mplt5HCNvYnk96LdeVU
 IlAq0UajfKRerEdDVk2qXA+5p8HnWe6vQG4g6WMkcPPb6i0Ieyogsu2kVohlmakfYs64
 wiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mVDf2DTleQlmUk2v3RS7SjiR8DsZ3TaK7txh2qX01oc=;
 b=lCBdJ9Y33EK3vqasLXv1fv6hKHpMolJlw7NYfQWkB6obQ168J1ekMJywpagJ3rNfRz
 G1CBpQun5RAY3yyhcvOAClKWTIuLr56ARV5E/WqZD5V69jUkhjBqIdm0Z1tWWzKQP4ti
 VtH0nr/URJLu37abh614+j09lfOxc97Vs8oA/Sw16hk5LHndrpnBwsSgk5ko1VHEJImC
 3pARq3SNSYk1zNIhB2CyM937eClvSGVAyXdqVDZi+wqDQqUuZ+mbKquRbmQZEJkZyuPm
 DKA4K9e6ZjSnf0diGIQsOhjgEgiUKiujXFhk3CyWQ2rAW/5ioERir9tK3WVF1Rmwaqvg
 r/PQ==
X-Gm-Message-State: AOAM532tJr93wPrBnXe85DBEVMf13ahuZPOXC1NhePMRSdvVIarnrXD4
 aIgKGg20uBDUqix4Y4PHs/YtyeQKfc4jcIwI
X-Google-Smtp-Source: ABdhPJwNqY2uiONokje7TOAHZNHSvEQOLPov46VxanymZhK9VwzZ2PEE+QKT36iqBvCnYV++pjweRg==
X-Received: by 2002:a2e:99c8:: with SMTP id l8mr29124525ljj.178.1629744173884; 
 Mon, 23 Aug 2021 11:42:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id 25sm1443794ljw.31.2021.08.23.11.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:42:53 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/14] target/riscv: slli.uw is only a valid encoding if
 shamt first in 64 bits
Date: Mon, 23 Aug 2021 20:42:37 +0200
Message-Id: <20210823184248.2209614-4-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823184248.2209614-1-philipp.tomsich@vrull.eu>
References: <20210823184248.2209614-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x231.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For RV64, the shamt field in slli.uw is 6 bits wide. While the encoding
space currently reserves a wider shamt-field (for use is a future RV128
ISA), setting the additional bit to 1 will not map to slli.uw for RV64
and needs to be treated as an illegal instruction.

Note that this encoding being reserved for a future RV128 does not imply
that no other instructions for RV64-only could be added in this encoding
space in the future.

As the implementation is separate from the gen_shifti helpers, we keep
it that way and add the check for the shamt-width here.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---

(no changes since v3)

Changes in v3:
- Instead of defining a new decoding format, we treat slli.uw as if it
  had a 7bit-wide field for shamt (the 7th bit is reserved for RV128)
  and check for validity of the encoding in C code.

 target/riscv/insn_trans/trans_rvb.c.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 3cdd70a2b9..dcc7b6893d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -430,6 +430,15 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
     REQUIRE_64BIT(ctx);
     REQUIRE_ZBA(ctx);
 
+    /*
+     * The shamt field is only 6 bits for RV64 (with the 7th bit
+     * remaining reserved for RV128).  If the reserved bit is set
+     * on RV64, the encoding is illegal.
+     */
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
     TCGv source1 = tcg_temp_new();
     gen_get_gpr(source1, a->rs1);
 
-- 
2.25.1


