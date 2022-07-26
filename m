Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBF15819B1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 20:28:28 +0200 (CEST)
Received: from localhost ([::1]:53552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGPIB-0006AN-4n
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 14:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGPDi-000165-3z
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:23:50 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGPDg-0001dr-HB
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 14:23:49 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 i205-20020a1c3bd6000000b003a2fa488efdso6059999wma.4
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 11:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QQROlt4QVdWy3PgKcMHnT+BgFWVY7Xfnt+DtI1eK/+U=;
 b=hI4I+aG+qseGvHhj+PS81gWaL9nnKgSOXj4UeBCyzZLT6zjGF4Iz/CDeN2a2SApiP1
 MvsJ7Hcx2isugEbhZcG1auFe6TdX+rU/vCinwlQtKtOVJFZ8idc4pkMsqT5LXEXZwdqc
 cAjXMoI+0qbF8wEOET0hQcMMD3El9zdjABG0FN4RRJDD/l8wZdPkn8lzzYdDVIat/Erj
 tsnuH/5E1lF4ox/f8nxxDqnW6DMi8r8mW7eqYdc7XUt5kZKUDytr51WdBCHyHBuAqUv3
 oLRgoRT4X6d57HG90Ra9Bu+5DVJ1+pC8DebkX4eGo019ZbZ/RLagGKthEc92OtDsgMsT
 81Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QQROlt4QVdWy3PgKcMHnT+BgFWVY7Xfnt+DtI1eK/+U=;
 b=HfkDuK0A0Kk1rpNOPRatOOscnvARtruuWfaOOW3PfeIeEvPmgF8bD5nmf7bS2Wxp57
 NN5ttXFxNuqxA4iKnmvj6huxPErBkwNUDTMk9QJcNWGBWU25zOK3scgrg6iey99TZEgF
 kJCy8spn+VM0JEg79XnVTU/mdxI3h9QUEMs5UIwvmYTbl5o+6eLrvjQ4Lp+qWsEx/Gxh
 Gde7KDwNMVBm2eGNh63RcsyfTZ44LDDWiuHqpbw1/ubBzTb0TSAdNR/UxXUQlxBWrRJV
 35z/IZOcM5uhmRVsSBAHZaijrc746nH++ak+jfRwvom8i4be+k/50XoPZbCgc1pE/OgL
 Y+Lg==
X-Gm-Message-State: AJIora9b883WmdIix9//IeYuBmfzahfYl3v3fZqhDHOPqpvGiFVz4eFg
 F2aloxDx5wYXlXTz3Tuc9qFM3NezxeJaCg==
X-Google-Smtp-Source: AGRyM1vw1/utAIIu2VyLJHJS0e7URGOWRjBeWBqs6y/drfWHCFn7wOsJ8N4WObmjiOhcsj6b4D/Cow==
X-Received: by 2002:a05:600c:410c:b0:3a3:2d78:f07f with SMTP id
 j12-20020a05600c410c00b003a32d78f07fmr330621wmi.130.1658859826677; 
 Tue, 26 Jul 2022 11:23:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f5-20020adff445000000b0021e5f32ade7sm11725343wrp.68.2022.07.26.11.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 11:23:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [RFC 2/2] hw/ppc/ppc440_uc: Handle mapping failure in DMA engine
Date: Tue, 26 Jul 2022 19:23:41 +0100
Message-Id: <20220726182341.1888115-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726182341.1888115-1-peter.maydell@linaro.org>
References: <20220726182341.1888115-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the code for doing DMA in dcr_write_dma() has no fallback
code for if its calls to cpu_physical_memory_map() fail. Add
handling for this situation, by using address_space_read() and
address_space_write() to do the data transfers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I believe this to be equivalent to the fastpath code.  However, as
the comments note, I don't know what the intended behaviour on a DMA
memory access error is, because I couldn't find a datasheet for this
hardware.  I am also a bit suspicious that the current code does not
seem to update any of the count, source or destination addresses
after the memory transfer: is that really how the hardware behaves?
---
 hw/ppc/ppc440_uc.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 11fdb88c220..0879f180a14 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -905,6 +905,7 @@ static void dcr_write_dma(void *opaque, int dcrn, uint32_t val)
                     uint8_t *rptr, *wptr;
                     hwaddr rlen, wlen;
                     hwaddr xferlen;
+                    bool fastpathed = false;
 
                     sidx = didx = 0;
                     width = 1 << ((val & DMA0_CR_PW) >> 25);
@@ -915,6 +916,7 @@ static void dcr_write_dma(void *opaque, int dcrn, uint32_t val)
                     wptr = cpu_physical_memory_map(dma->ch[chnl].da, &wlen,
                                                    true);
                     if (rptr && rlen == xferlen && wptr && wlen == xferlen) {
+                        fastpathed = true;
                         if (!(val & DMA0_CR_DEC) &&
                             val & DMA0_CR_SAI && val & DMA0_CR_DAI) {
                             /* optimise common case */
@@ -940,6 +942,33 @@ static void dcr_write_dma(void *opaque, int dcrn, uint32_t val)
                     if (rptr) {
                         cpu_physical_memory_unmap(rptr, rlen, 0, sidx);
                     }
+                    if (!fastpathed) {
+                        /* Fast-path failed, do each access one at a time */
+                        for (sidx = didx = i = 0; i < count; i++) {
+                            uint8_t buf[8];
+                            assert(width <= sizeof(buf));
+                            if (address_space_read(&address_space_memory,
+                                                   dma->ch[chnl].sa + sidx,
+                                                   MEMTXATTRS_UNSPECIFIED,
+                                                   buf, width) != MEMTX_OK) {
+                                /* FIXME: model correct behaviour on errors */
+                                break;
+                            }
+                            if (address_space_write(&address_space_memory,
+                                                    dma->ch[chnl].da + didx,
+                                                    MEMTXATTRS_UNSPECIFIED,
+                                                    buf, width) != MEMTX_OK) {
+                                /* FIXME: model correct behaviour on errors */
+                                break;
+                            }
+                            if (val & DMA0_CR_SAI) {
+                                sidx += width;
+                            }
+                            if (val & DMA0_CR_DAI) {
+                                didx += width;
+                            }
+                        }
+                    }
                 }
             }
             break;
-- 
2.25.1


