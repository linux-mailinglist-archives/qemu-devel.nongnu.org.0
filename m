Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637DC584491
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 19:02:33 +0200 (CEST)
Received: from localhost ([::1]:57416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH6u5-0000Xm-Rr
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 13:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH6nN-0001B7-2v; Thu, 28 Jul 2022 12:55:33 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:42556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH6nL-0006fu-He; Thu, 28 Jul 2022 12:55:32 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so2995134fac.9; 
 Thu, 28 Jul 2022 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ka3BNUkuXJRjci7kyBlTsxCjMgagmX8j136cdDxlsJI=;
 b=qePUreoDDkhOKrgG2VLe8zGIVmJp6TVCWR94EVEGvSHKOV3ikq5QOERZv3ULgJdnjS
 E6FKZ2QDTG3FgrFfwrdTMIRVmum6ngQdHwQqgAA5BvVpQANDd1AMXgU3404waiteO607
 FmtcICc6UKcWt3Kny+YdITzKbrxTGKmhqU6c24akYLsf8UvMAtgXzoN4fc8D37dWGoYd
 mwP5U7gb7GwRii6nEG9ebgtCvBY97pEcrs4uLDy/2ebJy0yVgO/xMAMR6cv7syjtHvTO
 w//WDqhFONkhUP9barjEidDMqKFXpBnIc59WT3USqfFAN0CqIYuXJQraP7Q/Lr2jjEJL
 SeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ka3BNUkuXJRjci7kyBlTsxCjMgagmX8j136cdDxlsJI=;
 b=XUQgLJFx+IYwQtki0zaYHbPZGuOwJMGSJJto3y56Tif6q6IhTZ5Mc0cgJM4kE5rvcc
 B6Q0ZFytaLj6vUHbUPEUbkWfFq/sMgjOa3k4Nyw7sGIBWSb9yXGhWGkaM3c9hmaa6qZk
 Y2oK5ffi4Eb+vvNpzWKW/ptwBjS03Eq70bfCccbTiRDyHmzLMP783wf8ullZQQ9msc2b
 JH4FMi66VpKjXbUV9YhCzw4Sr4hKCMJX0Rdl57fJLNoKgYcRg0A7UOJoTa2W4B2SLkMk
 ikSZkGz6RUfe3PjW6+3rlbkj4aAkimgp9CuOPJyxMfkyP/telC0Yrxjmn+12843/G1mq
 D9CA==
X-Gm-Message-State: AJIora8p1tU/fHdhu+qeTJ6BZa1QnMCX1OwwqWSiMMq5Q+AZpOLkdY3/
 kjGtgwr4BRm7lUGkbvPfbwGjBg7u25U=
X-Google-Smtp-Source: AGRyM1siHpW6r3RHj2JN6uoygBL6zt85Oz+hPt2ikltfqV6L4RU/ah9uDgcQMRDWlq9bdzSbh4XQLg==
X-Received: by 2002:a05:6870:a920:b0:10e:1cbc:47f0 with SMTP id
 eq32-20020a056870a92000b0010e1cbc47f0mr170820oab.207.1659027329923; 
 Thu, 28 Jul 2022 09:55:29 -0700 (PDT)
Received: from balboa.COMFAST ([179.225.208.46])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a056870170f00b0010e5a5dfcb4sm616290oae.0.2022.07.28.09.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 09:55:29 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org
Subject: [PULL 2/3] hw/ppc/ppc440_uc: Initialize length passed to
 cpu_physical_memory_map()
Date: Thu, 28 Jul 2022 13:55:18 -0300
Message-Id: <20220728165519.2101401-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220728165519.2101401-1-danielhb413@gmail.com>
References: <20220728165519.2101401-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

In dcr_write_dma(), there is code that uses cpu_physical_memory_map()
to implement a DMA transfer.  That function takes a 'plen' argument,
which points to a hwaddr which is used for both input and output: the
caller must set it to the size of the range it wants to map, and on
return it is updated to the actual length mapped. The dcr_write_dma()
code fails to initialize rlen and wlen, so will end up mapping an
unpredictable amount of memory.

Initialize the length values correctly, and check that we managed to
map the entire range before using the fast-path memmove().

This was spotted by Coverity, which points out that we never
initialized the variables before using them.

Fixes: Coverity CID 1487137, 1487150
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220726182341.1888115-2-peter.maydell@linaro.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_uc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index a1ecf6dd1c..11fdb88c22 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -904,14 +904,17 @@ static void dcr_write_dma(void *opaque, int dcrn, uint32_t val)
                     int width, i, sidx, didx;
                     uint8_t *rptr, *wptr;
                     hwaddr rlen, wlen;
+                    hwaddr xferlen;
 
                     sidx = didx = 0;
                     width = 1 << ((val & DMA0_CR_PW) >> 25);
+                    xferlen = count * width;
+                    wlen = rlen = xferlen;
                     rptr = cpu_physical_memory_map(dma->ch[chnl].sa, &rlen,
                                                    false);
                     wptr = cpu_physical_memory_map(dma->ch[chnl].da, &wlen,
                                                    true);
-                    if (rptr && wptr) {
+                    if (rptr && rlen == xferlen && wptr && wlen == xferlen) {
                         if (!(val & DMA0_CR_DEC) &&
                             val & DMA0_CR_SAI && val & DMA0_CR_DAI) {
                             /* optimise common case */
-- 
2.36.1


