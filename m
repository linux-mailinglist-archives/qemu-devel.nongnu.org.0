Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FBF5355FD
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:06:41 +0200 (CEST)
Received: from localhost ([::1]:38638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLcu-0001lz-RU
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCn-00026Y-Jg; Thu, 26 May 2022 17:39:42 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:37588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCm-0008EV-42; Thu, 26 May 2022 17:39:41 -0400
Received: by mail-oi1-x233.google.com with SMTP id s188so3669807oie.4;
 Thu, 26 May 2022 14:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ukrDa1HkCn68Oj0Zz2gvxXbf53bdsSnmqAPIz7DiIBs=;
 b=Vufh8EPo1gL8xQgbKULQwXxVurdqp9C9kecrrDnBk+mpTaPLuG5aURTasd3Sogm1gT
 xZnX25IYfT//3deXmU4AaDN0U0m8AxeMpT/ZXIrhRyKYtU2zgW7OOoF1FEN4n3Moa4f9
 wKgcxs20LsfTuNvU/G4ekpzRljhQADHpCCm+tdGQsWPp5A1g2TZabRqnd472fPi4ZgqW
 8ZBOlQPeAJBC5HCVj3DZS/AGql7JTk+hmFoLUgYOQagjmmMjiIAppGZCdlWrN7hAt02g
 K1/0Dxm4B2a95V3C+gPGcpQHOwYgn4I8v3PEMU9KTyOn+XD6RECYxsJh+WhkOVkWqAHl
 vRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ukrDa1HkCn68Oj0Zz2gvxXbf53bdsSnmqAPIz7DiIBs=;
 b=b9GCHhBFmD17qRzRpss2T0XEm361j4+9Liviq4XZ2U3vdgUhQwHusICGJDewCj1/Rt
 oKAy1zAjgqX7FJXtltln9ZCERAaOf6EXu5aM1Sx+pJ/FJbxvTZpj8qevD3/gknKD+Gbe
 N1xne3J91Scejxv8zSV49iim7/1I28f/yTQUcEgE+6JFYuURk+LKN+ihCtvEqB/3a2C3
 lS+1ZAlH19yj4LuVws4rNybanxiHmx/Boy8W7hGaALLQtwbqJ035djKqOiDffRCQhGnI
 nhd/cI8qmTjIq7jcbeJP/UftZiNn8pRcq7thb1kwfPMZPknaF90AsG+zy2TNPBG/Mhgf
 yqVQ==
X-Gm-Message-State: AOAM531i9BWPBqy9E8Jr6IF3hHBLdzn6JHWF9j/1wTt4GIc6LIA1qjRN
 yD/dD8Zf4dUCTSE2WGe5fG1bWnaYzMc=
X-Google-Smtp-Source: ABdhPJwRu0e+R/ZWLfsqh4nGjeWeGpUWhkAIj6r99JemqRLN3g6F8LBWBbUgCPSQbMjnZPT9zN0M0w==
X-Received: by 2002:a05:6808:221a:b0:32b:9564:c949 with SMTP id
 bd26-20020a056808221a00b0032b9564c949mr2257091oib.149.1653601178581; 
 Thu, 26 May 2022 14:39:38 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:38 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Nicholas Piggin <npiggin@gmail.com>
Subject: [PULL 24/34] tcg/ppc: ST_ST memory ordering is not provided with eieio
Date: Thu, 26 May 2022 18:38:05 -0300
Message-Id: <20220526213815.92701-25-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

eieio does not provide ordering between stores to CI memory and stores
to cacheable memory so it can't be used as a general ST_ST barrier.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-of-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20220519135908.21282-3-npiggin@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tcg/ppc/tcg-target.c.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index fc8ae47293..4750091c9c 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1836,8 +1836,6 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
     a0 &= TCG_MO_ALL;
     if (a0 == TCG_MO_LD_LD) {
         insn = LWSYNC;
-    } else if (a0 == TCG_MO_ST_ST) {
-        insn = EIEIO;
     }
     tcg_out32(s, insn);
 }
-- 
2.36.1


