Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE726F50C7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:11:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6SG-0000hQ-H0; Wed, 03 May 2023 02:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6RY-0008OO-2e
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:58:28 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qz-0001ip-EQ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:58:27 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f55ffdbaedso2874679f8f.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097072; x=1685689072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ePGQgjAgeqBpbV0KhHIgImg7evASXxc6+J4X6wS7qUw=;
 b=d1CH305R62rgu4Qpl2EjVg4x+Jf755qK1sKeoS7tYe5xRPE07GWrF3diHGXs5uES+c
 g2TPDi1sfmAW5dAKg0t7AVRcfBjmJ6T42qVGtyNzFIAFUz/hLgt2IeuCoehzR2NtnUx2
 mqUPK15rukGrC+pIqYaVuikS2v7rvEQ4f6EjFvPEHsHzjde8eRCcd/NeMlEPVsY1d2MF
 DICS+np0HJ4ZqyFlwfFFFBXptqStXCHpyGeID66tqIjWx3XiVc9gQ+8OEOCtDG/FHI4+
 E4FkQQlJruInJjH4YoPfxO1jRax208GqzjgjxQslNK9OYLgBcNc26HHND/9oGa6ypuyH
 N6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097072; x=1685689072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ePGQgjAgeqBpbV0KhHIgImg7evASXxc6+J4X6wS7qUw=;
 b=lC450ZBPtbHHUCxzJ+5G122wY2ppTeKKzL47Q/IFxq+Z1WEYUErxXk9bScqV6c+yTN
 L54F9ubzj0eGPUJfAv2JjhTqdPnBEN+/GxhjXDrmev57LKS+K1mdaHqPFfm+Ux6ZtH2N
 1hiejVyn7GSPqA7/7b2gN4GCbmqggl9XF0KIzQ5VA77HArGB6azEsTp/Bxp0G+jnNCQK
 hJ6x0lyXOjcw4zsVenzktKQFffw67smIDKPUSpwwnwMLLxPLrzWRKMZV4tH99AHYP/w7
 b9v026gZWJxGvPgL8ZQ8YvHwBdYEs90FmsJosEaWOJG5CDPqJA6C6vxCBpDOWeVNAA6h
 FCmA==
X-Gm-Message-State: AC+VfDy87qqoMP36ZAiMbahUlBjH3642x8o1e6Nbsn3h4fMeefZtQgdE
 JnVuDNhD/Rpbt5UZCLuIV+jQBQes4dqBhi4WmlJPJQ==
X-Google-Smtp-Source: ACHHUZ5v7R2+xzf5uBTQqHTFY4vxqseYu7kKzOXdcMX9OdOvd+IGH8pemT2HeaMDCB9T45wOqU0JAw==
X-Received: by 2002:adf:f752:0:b0:306:2b9f:fa4c with SMTP id
 z18-20020adff752000000b003062b9ffa4cmr7884781wrp.3.1683097072478; 
 Tue, 02 May 2023 23:57:52 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 28/54] tcg/sparc64: Drop is_64 test from tcg_out_qemu_ld
 data return
Date: Wed,  3 May 2023 07:57:03 +0100
Message-Id: <20230503065729.1745843-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In tcg_canonicalize_memop, we remove MO_SIGN from MO_32 operations
with TCG_TYPE_I32.  Thus this is never set.  We already have an
identical test just above which does not include is_64

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 4f477d539c..dbe4bf96b9 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1220,7 +1220,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_O2, oi);
 
     /* We let the helper sign-extend SB and SW, but leave SL for here.  */
-    if (is_64 && (memop & MO_SSIZE) == MO_SL) {
+    if ((memop & MO_SSIZE) == MO_SL) {
         tcg_out_ext32s(s, data, TCG_REG_O0);
     } else {
         tcg_out_mov(s, TCG_TYPE_REG, data, TCG_REG_O0);
-- 
2.34.1


