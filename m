Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D4391ECB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:14:03 +0200 (CEST)
Received: from localhost ([::1]:52832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lly2c-0000vy-Ff
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1llxnO-0002fp-7X; Wed, 26 May 2021 13:58:18 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1llxnM-0006yc-Ei; Wed, 26 May 2021 13:58:18 -0400
Received: by mail-ej1-x635.google.com with SMTP id k14so3861680eji.2;
 Wed, 26 May 2021 10:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/2slS83H/aRsUNXYyk0GZQ476x3p1VMv3SQLoPSvmvQ=;
 b=e9cetxDT3L7X6m9fkLb2t2Zv2Ei5c+7COVLX6iTwVleu7oIhDlRGM7tuZT9mg03kbj
 vWCvXfY5i+gmeY0b5U+55EPWsZfsSLTiIKaEvbEphSY7wSHp5R2HjVGMbDNC9qeM7bBZ
 NAjc3UMK8sj7v1HwhziG80v/k8wWFTgrkDibg3LePgLOyS6Ctc9gfekxcL08OwBvEzTy
 MlKRcYddb4NEKyIAPHGIZJtxusoL63oewJFmjaTyAuuj1moPZPj8kLw/OGrVqv0zAsvP
 ACK3u9l9LOpEmNcH5Js2AdFMpO/IWe/ccBDovKm92syW+I79JJQNhQJKMBIkI8KFDol/
 B2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/2slS83H/aRsUNXYyk0GZQ476x3p1VMv3SQLoPSvmvQ=;
 b=gUsCWTlsEnkUGJb/djF2KMvnvR9K5fb5dmIAhsDodHOg7WyR7m+TTstmGjlvpNSnI2
 y6igRi/r5F0+bYqr4AjJh/EyE5a97yAnbjcHBQ/UHADgXiFAsliDUQ/2YZpXJIdxKW27
 Yp3WubSuVEYocmjKmKcnf/9p04k41p3YzH3xFlG34chOlwcXHZk5xR85jr/KA8Id5pvZ
 iWElM0KY11pVyzf9TZls6P2gWkuNeBH2cdg2qicU1O033tuWqV+zJpCYqUvRdnTCfc9T
 5GY2WxTyq00TV6PJ4a/B0ThFqfcOiWWcvQVMwePikLrl1cKP/EfazW/QWDyLz81/6YVM
 4abg==
X-Gm-Message-State: AOAM5304arM9bJGd2Kkqotc4stL4obKLGsq8b/ZfpfqhFZPtN8KiwuYv
 FotSGmWazJpUzOOaVpVhNZw=
X-Google-Smtp-Source: ABdhPJywYWT97er0w0PgPK0PhMUSc9Q9DeWJ7k8rDERn6d40afZEQs5+T/WHt5OZp3kMB+rd3Sz1Fw==
X-Received: by 2002:a17:906:80ce:: with SMTP id
 a14mr9696934ejx.311.1622051893961; 
 Wed, 26 May 2021 10:58:13 -0700 (PDT)
Received: from neptune.lab ([81.200.23.112])
 by smtp.googlemail.com with ESMTPSA id hp1sm10407449ejc.96.2021.05.26.10.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:58:13 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Subject: [PATCH v9 1/6] [RISCV_PM] Add J-extension into RISC-V
Date: Wed, 26 May 2021 20:57:43 +0300
Message-Id: <20210526175749.25709-2-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210526175749.25709-1-space.monkey.delivers@gmail.com>
References: <20210526175749.25709-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: baturo.alexey@gmail.com, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, Bin Meng <bin.meng@windriver.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 space.monkey.delivers@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 kupokupokupopo@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7e879fb9ca..1673872223 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -67,6 +67,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVJ RV('J')
 
 /* S extension denotes that Supervisor mode exists, however it is possible
    to have a core that support S mode but does not have an MMU and there
@@ -286,6 +287,7 @@ struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_h;
+        bool ext_j;
         bool ext_v;
         bool ext_counters;
         bool ext_ifencei;
-- 
2.20.1


