Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E349D655BF3
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:13:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOy-0002dI-DI; Sat, 24 Dec 2022 18:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOi-0002O1-Ak
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:49 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOg-0006KE-3p
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:47 -0500
Received: by mail-pl1-x633.google.com with SMTP id m4so8047270pls.4
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zkDNvTm+PB28QbxJv1RcKBwbBiJBv33q35rFa86H5jg=;
 b=wbN19EKkoE8P0aWrpzGEEkbs4px8oH3fQU/ykqZibDZmeey8uG/KdT553Y2L9cklrV
 vNx9FZwetldnRZyabkb/M7BzvMQVzIiui0q7PZtNtzXFNcxaGE9TySnPhTj02ao5+mAd
 0yhfgZ3ghNXc/7x6bB742cxp8SRvxmuyTydNnZtZK8keYTNvKwZa1Gy7Lk5+i4MUJpgV
 qAR5LT0ZfSuTPhn+nPguZ7Yhx5GW1/901oYVgloTvurSXGqMNZmcB6PiH5RmsQXYLxdq
 r9wjZCLGAlgI0/Zc6kTmgzgMjHxZhnAIpFQtyntkM0FgUigS8NeofIUleoRRSZwVaJiN
 +H6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zkDNvTm+PB28QbxJv1RcKBwbBiJBv33q35rFa86H5jg=;
 b=Md3FbeqkjoRz8+WqRWNWyKbtNQH1NWRTnAEbQqVBLb6HVId3PAcAM8DwDtfUgoJFmL
 JBhzzaz8E9Go1BBxwapMa7ExJb0s7jDwOpweDbQaVcoBoMmdPtt+TLNhzQPVMrCzdYCl
 eopMU+/Xq8xLrbYLZWUmJ5jnQq7P4gAkGPEftcG9TCZJMjc/w4zLEn20UPk4YVJFASna
 KMKVC2tfs8OV9blkhBjkVstTHXzn6EYpkEVmwMOo7LAuEVpRvOL5zs18Ufxw6fn8tQxR
 VjDGzxX94fDdGTPHgoRpibfKrEFs26QxpxEg8bXbWVltq36idrnVJsQjQy0n6GH2Xy/I
 ++Dw==
X-Gm-Message-State: AFqh2kqLbPqG2VpCksf/mGZobHxVqAtFvYrYVNQgTCHAhysX78Og+g68
 5wqLI0D3R6iUhRqTHnx9DaPx+9Hlw81HBP4F
X-Google-Smtp-Source: AMrXdXveIHAlkEQUXZGJROCRKG8IdhGO+zLwRHZtkxVJ8QZtl32+eKzNr3Q/5IIFFJb1GKxX9rDwww==
X-Received: by 2002:a17:903:3255:b0:191:f83:636b with SMTP id
 ji21-20020a170903325500b001910f83636bmr16626975plb.25.1671926265352; 
 Sat, 24 Dec 2022 15:57:45 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 24/43] tcg: Simplify calls to temp_sync vs mem_coherent
Date: Sat, 24 Dec 2022 15:57:01 -0800
Message-Id: <20221224235720.842093-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The first thing that temp_sync does is check mem_coherent,
so there's no need for the caller to do so.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0f58013a5a..36a33a122c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4075,12 +4075,8 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
 
     /* If the two inputs form one 64-bit value, try dupm_vec. */
     if (itsl + 1 == itsh && itsl->base_type == TCG_TYPE_I64) {
-        if (!itsl->mem_coherent) {
-            temp_sync(s, itsl, s->reserved_regs, 0, 0);
-        }
-        if (!itsh->mem_coherent) {
-            temp_sync(s, itsh, s->reserved_regs, 0, 0);
-        }
+        temp_sync(s, itsl, s->reserved_regs, 0, 0);
+        temp_sync(s, itsh, s->reserved_regs, 0, 0);
 #if HOST_BIG_ENDIAN
         TCGTemp *its = itsh;
 #else
-- 
2.34.1


