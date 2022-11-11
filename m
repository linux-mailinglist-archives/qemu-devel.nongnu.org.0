Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7CC6254CE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:59:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfm-0006DY-KC; Fri, 11 Nov 2022 02:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfS-00068Z-PI
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:38 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfR-0007q4-B9
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:38 -0500
Received: by mail-pl1-x632.google.com with SMTP id y4so3643538plb.2
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xahjzoLT2lYIuoORTVfzuekRzoA+kKRZyhuxmI6DMcw=;
 b=WjXu6uzcszp5F/aQaA6GfZs9eRwAHNVzH0+s//5GZ6KfgiroX3RSynGtj/EhF5+O/4
 61IUQ0kJ8qE1gCRQ3MElZo/6oj25vZtmpNU7m+JzY9sSpVRX8f6wXZP2ZoTJLmpCXWnj
 5wycsanj/TsRc6nlT3I6aB0Jv6o5/tjaMNQFdae06Bs/ApHIRNr81OZi6duRyMKDmwi/
 rvgfyeSBKU9BSSIzGDnlM8UQQoCIh6JyQU9cceBv9Zezon0SNXHU8jTX5bZkn+YRSyM9
 QmvPGZx8bmyyDE8qOWY2CUhjfGYKBoyvM7VKKfETa0hR7Dq2k9bPftldqnyZg/vuLcoj
 smyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xahjzoLT2lYIuoORTVfzuekRzoA+kKRZyhuxmI6DMcw=;
 b=7vhb5fTDCkl0/Pr/QEkHZk2tmltnMFC/iQYVxqrEeEU3HZeeXUrjSRgZxiH/wTQkGt
 4MkMui3BOciNcTCJOU0b3xB48qo8eyqnUGuftcVHSJ0zEgwRgfFAHMLLOgQwvlle1pyL
 LICL53RPNTauiwYRRL/Ts/FM4UmFS/sAAisiHp1lhHSsu/Qh2NmlLZS0RuHT2ZXQ0668
 b1qnFCLl5uRHu+frRfT3D+I3/1kHg9Vfco5EthKTQotPFP8wFOa14YmODBNPxLlRN64c
 2aWNsfeSpmYnw39BHN/xoHljKiFfemCllroPrXOOC/QkjbKtAMP8xNi+v/+SPkcJ1+xv
 MpLQ==
X-Gm-Message-State: ANoB5plknN8lF3C95/jCvi27e1RQ1G0Vwvf98pIQo2Y2pzHkZZyfzUMr
 GpVqeQu2Zrx1O6OrpeWyLnflekKO8X3hpQVz
X-Google-Smtp-Source: AA0mqf4Nu0sLgmJFotqFy7TVnTycpRL06haqz1QuXhZZ6U3Nu5akVCzl9Hro1K/GfGL8sUxGy4h06g==
X-Received: by 2002:a17:90a:46cb:b0:213:d200:e989 with SMTP id
 x11-20020a17090a46cb00b00213d200e989mr668232pjg.40.1668152493978; 
 Thu, 10 Nov 2022 23:41:33 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 11/45] tcg: Simplify calls to temp_sync vs
 mem_coherent
Date: Fri, 11 Nov 2022 17:40:27 +1000
Message-Id: <20221111074101.2069454-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index a82c291369..583677a1c4 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4117,12 +4117,8 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
 
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


