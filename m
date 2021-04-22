Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7756E367BD5
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 10:12:46 +0200 (CEST)
Received: from localhost ([::1]:35542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZUS5-0001mp-JI
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 04:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZUQQ-0000o4-Jn
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 04:11:02 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZUQP-0004K6-0D
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 04:11:02 -0400
Received: by mail-wr1-x429.google.com with SMTP id j5so42849861wrn.4
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 01:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RdMlHJgGJAWagoGz40VTpAt/du38noBlWx3VH5FrRXc=;
 b=DsnShpxxAcR14/4BRxZAKgwJCYIjecN9XdDPkaQMgiuo1peKbhb8zgOohwlfUTAuAL
 4RBbiPy7110TZG+N+pqmEZe18FrIHlxSOhZbbsCGoWjanGfbqIK69CpNMM2fquAfrkL+
 3TkkqP+B61WIxDlFDHodVn9hFVqRpgBI0CnVAggxn2YdKFq5mGyXFfAd2JwBraQYCrHH
 R+fwvhIM7rWwYTevf3f26JJFAsYi9RM/el0dk8kgFRnpcJykJIASqVqWU5PjqaZ7kxHz
 6BoimKD4B+RRwBjRD9fJuYiOQA/+Ufy825RyKWU/Gf1bj2UoUXirkLX+vEn5BMkAh8CD
 YhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=RdMlHJgGJAWagoGz40VTpAt/du38noBlWx3VH5FrRXc=;
 b=bP28Cvwb1BdU3U2titA0xCxx3H1XFOMDlAjWBYtNY62U7SYlQuX10g56zB84/3Ngwi
 6fMqC0xuv4cuVWe3e7//ryblk50MTY9u7v+/7S7Fr8NDRfBZR+E6jvYpquQVbPank4/l
 qGsS/EviuHlNueFVu7YicvzMhAqyvdTb6IskT8VWECg472KCEZSyBvzXnteOWKZEpNcV
 U7sthPcy8Dkr9+qCG5FltJA98DPLmyyqj5GH+wClGdcb93But10ZXuawNp1032o8VfnS
 aKaMk7ep5+1wmLwsIGPbevpXjBMvPSEEzV1g6cvKVA/ux67JZ0hiTLTWMi9XBVHY/XCp
 cHUw==
X-Gm-Message-State: AOAM533Z4JS+qwNrSePOwCAOKzB1IkvMZoKA/ik2Rp//kPSWGpPHAqmQ
 umfZvzx5ApMlFm59VhY4DZIkS8ofKteldQ==
X-Google-Smtp-Source: ABdhPJx9tNWgSRfX5Fzd+M1RDgxDEG8K1Hs55Ybl41D1MkIBAbLvTEpWLAGD7ettrb4XbSYJCHFBEw==
X-Received: by 2002:adf:e8c2:: with SMTP id k2mr2567531wrn.311.1619079057812; 
 Thu, 22 Apr 2021 01:10:57 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id h9sm2076801wmb.35.2021.04.22.01.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 01:10:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Remove spurious LOG_UNIMP of MTHC0 opcode
Date: Thu, 22 Apr 2021 10:10:55 +0200
Message-Id: <20210422081055.2349216-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running with '-d unimp' all MTHC0 opcode executed
are logged as unimplemented... Add the proper 'return'
statement missed from commit 5204ea79ea7.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 71fa5ec1973..269bdba400f 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -5945,6 +5945,7 @@ static void gen_mthc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         goto cp0_unimplemented;
     }
     trace_mips_translate_c0("mthc0", register_name, reg, sel);
+    return;
 
 cp0_unimplemented:
     qemu_log_mask(LOG_UNIMP, "mthc0 %s (reg %d sel %d)\n",
-- 
2.26.3


