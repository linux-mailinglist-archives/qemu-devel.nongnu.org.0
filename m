Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F566EC502
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:45:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqowz-0005Br-M6; Mon, 24 Apr 2023 01:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowv-00059P-Dz
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:17 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowp-0004Dx-9k
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:16 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f6401ce8f8so2308678f8f.3
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314867; x=1684906867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B1Nme4PEfXiHQBNXQfkGnrKxGcTYdXe7t9M4qvQh2U4=;
 b=POFyKC8bkGhATjB5yTP/u5UJ96PKN+NTU6yjHTIt/AlayR115/hSgDY9zqqntzHLVX
 jp1YNS5bYwH51CjCPYbcFFO1IwAYqdkYTFwrCnwOym9tisZ8abm6Me52Gi/MpOo3WWCW
 JGyOOIjfBTL2D8Sh8ExjLtSMTmeeIQwU5Lvi1v2Bme/k0acq8U4JmzLNFIvoemcFGb/l
 PV0+GZfUt1bjCNIAqs364no5ND0jLp5YdjTO1WgZCaPxL7pPeadwaWalR/gmHtKMHE8O
 a9DfAKAO4FX+QQ5QXSmKrlnLoIY57RiniE7Nbcm34ox0C3mbnzcbB1jGYGpgZlLa475I
 O8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314867; x=1684906867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B1Nme4PEfXiHQBNXQfkGnrKxGcTYdXe7t9M4qvQh2U4=;
 b=f8Tw5g5PufQllbTBbp9tiQVfc5UDjLTNwu8sO5wms7GraUD6kq4Mzd/+Kfhm0y7E0i
 vpRhlnNOCL4OCcw4nzQltcf3XUvRnARztd+H6WTmCH7FglaklaAWAKjxEHLzBkTlDP2g
 i+hIv6HSp1Jl5uUG5lTuEtzymD/rBY0ptQP5pvn+IfNbUeeCI33jnNbXCL3pU1vx9sAX
 xl73xbre27eQRlZmRDsLg/Sj6yUtREZZJr/nDmUXtKWQUKXKwgYkoK2mwT2KmOsHwNZw
 Z2OYVPyhTDruoOxXpoTdzevMSs5ajbAcNhYh7rOoNTQhY6AfaN6YgM6x2qot8DSCBpJF
 evtw==
X-Gm-Message-State: AAQBX9c01iJQVynsGP36qQ1WZfAY1FCtk8gCJsHeBQygvkPIcDMjrBSA
 7Z8mBUjXjueK++Uk1BFpsRysjRx4uRnhw0J/ZwEINg==
X-Google-Smtp-Source: AKy350ZBHev0XzwIq8aQkrhGUsIoFiWoYLwiYco2n6TIQoikpW4fyynoiXYgIAtj5Urusj2dbkd0dw==
X-Received: by 2002:a5d:40cc:0:b0:2f0:58a:db82 with SMTP id
 b12-20020a5d40cc000000b002f0058adb82mr7492931wrq.36.1682314867095; 
 Sun, 23 Apr 2023 22:41:07 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 01/57] tcg/loongarch64: Conditionalize tcg_out_exts_i32_i64
Date: Mon, 24 Apr 2023 06:40:09 +0100
Message-Id: <20230424054105.1579315-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since TCG_TYPE_I32 values are kept sign-extended in registers,
via ".w" instructions, we need not extend if the register matches.
This is already relied upon by comparisons.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 21c2fc9e98..0940788c6f 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -463,7 +463,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
 {
-    tcg_out_ext32s(s, ret, arg);
+    if (ret != arg) {
+        tcg_out_ext32s(s, ret, arg);
+    }
 }
 
 static void tcg_out_extu_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
-- 
2.34.1


