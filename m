Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908BC6EC55A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:51:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqp3N-0003ZT-4X; Mon, 24 Apr 2023 01:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0k-0006O1-EV
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:45:19 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0I-0005Ly-0v
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:45:11 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso6138315e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315078; x=1684907078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qWj3vIxSlO8Q0IQAph2NSAlaNgeUKOrsmzRl/9QoxjM=;
 b=yoEw3zDY0foIEusVR8XPn1czPjOqYt0FlfxOlDHu/7lLIXoCvJGMkvOOY1kPxOza3r
 vf6f7Cy5PUo9K3vcDxbUGLllgOCePFNf1ygpwUrIvS9iNIzMebgUl7KVjDC/MOuLD1uu
 clkKcLhTozayONu84y3uPCt8pl8jPifTCkoUWNDZgupGfyAcu7bMozj6ozW0Scg1ob0c
 9tqrezJtxWHaII5Fc9xZp+4881AovhSlKue2cjvyhaVVZSExZg4k6ToYmnar7IMb1R2w
 Gxdlr0/Hg9lY1HHvbiUDRtMae68PyJEVVNYweOoGm3SVVWMmUg4H3xaNL1BzHW0/orX4
 Un2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315078; x=1684907078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qWj3vIxSlO8Q0IQAph2NSAlaNgeUKOrsmzRl/9QoxjM=;
 b=UKv1ImKTwKKA1jZACcpZOS2ABwJywxyaFnCoqIJkk0KY+GR99mX4bcCmq/tCDF28yg
 wP3M5BwlemA2q2LfGZEKOuU59bCE0+oIqisTL7y+cgE9SrHi3OFycT6bxEG2SGI8XZZu
 Vb6RD3Bl4sSj+fxnK0AigqJL8ULM77cJHdJVKUj5SrBo2yrvlfqym4B4Zc2na+LPo2rJ
 N7GbNifsk777I8jHCF00bFUoVv1rP7u2f130QHmr0uswWg/hjNXqwy38+6FM6BY6KhZz
 6XI5swMplLojdix91JWWox1GJn6E39ofp8Fac4UoFdVU94cOHyd0UM63i5GRV0HhmtoZ
 zkXw==
X-Gm-Message-State: AAQBX9fUhXQzQrZHO2z1tXlVtSz8HpBAzXewNi1HuHzlbikPWiNi+hlt
 oJbDI4/PF14c/GwjAXRldzn9WfLSIq+6WzcSRM+T1A==
X-Google-Smtp-Source: AKy350aICtNkHgOSrD1FmdAwsCcMNFqw0zkdTgXMf4A+OWDyjei2FJlk3s0X+7bMcP9+2NvBQDFBvQ==
X-Received: by 2002:a05:600c:2309:b0:3ed:f5b5:37fc with SMTP id
 9-20020a05600c230900b003edf5b537fcmr6650896wmo.1.1682315078064; 
 Sun, 23 Apr 2023 22:44:38 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 54/57] tcg/ppc: Remove unused constraints A, B, C, D
Date: Mon, 24 Apr 2023 06:41:02 +0100
Message-Id: <20230424054105.1579315-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

These constraints have not been used for quite some time.

Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-str.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index f3bf030bc3..9dcbc3df50 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -10,10 +10,6 @@
  */
 REGS('r', ALL_GENERAL_REGS)
 REGS('v', ALL_VECTOR_REGS)
-REGS('A', 1u << TCG_REG_R3)
-REGS('B', 1u << TCG_REG_R4)
-REGS('C', 1u << TCG_REG_R5)
-REGS('D', 1u << TCG_REG_R6)
 
 /*
  * Define constraint letters for constants:
-- 
2.34.1


