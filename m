Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BD46F43C5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:25:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptovT-0004Mn-14; Tue, 02 May 2023 08:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003oU-Tk
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:36 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouY-0003E7-JP
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:22 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f19ab994ccso38260995e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029713; x=1685621713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OBdth3iwW/4zz8A4f8Bu3URSn8HTxb6Inx0wWl85wL0=;
 b=o1Cvpr88A2SPITpOrLiVWGDuXarn93RlflkUxEWxQyHNUL2sK9r3SznG4kolvmSjon
 J0y1TZUB2YnWAqwlk8tlxCE8ZTSP3xapk84hJQGifkSKcWwbY3ngD68MfLPLtHbOVQ9H
 qiDZDInlncb9MhAfxy/P3AJU0nbsmUDbFFCqLIH9tI0VNFqZe+7URYFm3SWfmZ5bWLnB
 XvqycdT7pn7AX8dtdWIsyJg93kMipxc5+QY4KmK9b10og66/nr4f6NNxEzPArJQx7V8G
 dulZQnbW1Psdk7r9pZNRufnz33Dzig5jen85Gn0Ahw+X/cZ7XQSZuSBaDGoKIsvcHHil
 NK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029713; x=1685621713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OBdth3iwW/4zz8A4f8Bu3URSn8HTxb6Inx0wWl85wL0=;
 b=VqzHNVQhK6oWsllNyKOPzP7x+qv6+IJMjFdcQlcHiN9Dp/HwZcbcpGRghfeuk4KBVe
 c1jQS2ha6DBhNjJehygWrRuYK5Sa8cYysmc2ohecTzmooPDXFCBQTN3uPrgoYJRU/sR1
 ReiJe4yFbweHGa6ENlT6EAG1GLYT4Y6PjY5261OchOLUrfpyEgiAwWb538zEgPmmuefE
 GyvLPEn3CjWS8YMFa+tH4PSkHS8Ay7ZFvRebRkRsKhK6pVEJymkam63kqmVqRk9/F3mS
 6gd0JYdfvyB1ZC6SNOhjskgldlYSOg+ba/8IPtjdld1fHRmdp7g/fZikbHPPp1TWxCGD
 uDeg==
X-Gm-Message-State: AC+VfDxidlF7BvnbDApNt9Dnd964IJvd4WSeFS0EFBxZBL3dMFal0tRj
 5HTUzXh2U5Nocxr+GRNzeZsePNm8lfcC9S2G9U8=
X-Google-Smtp-Source: ACHHUZ7U+awM2wx3C+MpS7nV1uR3567qm3eVN7b+KuzeJKamlogEivDZ/ii4anFSKnwsmQsSlCIthw==
X-Received: by 2002:a1c:f217:0:b0:3f2:5641:1477 with SMTP id
 s23-20020a1cf217000000b003f256411477mr12099387wmc.2.1683029713222; 
 Tue, 02 May 2023 05:15:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/35] hw/net/msf2-emac: Don't modify descriptor in-place in
 emac_store_desc()
Date: Tue,  2 May 2023 13:14:51 +0100
Message-Id: <20230502121459.2422303-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

The msf2-emac ethernet controller has functions emac_load_desc() and
emac_store_desc() which read and write the in-memory descriptor
blocks and handle conversion between guest and host endianness.

As currently written, emac_store_desc() does the endianness
conversion in-place; this means that it effectively consumes the
input EmacDesc struct, because on a big-endian host the fields will
be overwritten with the little-endian versions of their values.
Unfortunately, in all the callsites the code continues to access
fields in the EmacDesc struct after it has called emac_store_desc()
-- specifically, it looks at the d.next field.

The effect of this is that on a big-endian host networking doesn't
work because the address of the next descriptor is corrupted.

We could fix this by making the callsite avoid using the struct; but
it's more robust to have emac_store_desc() leave its input alone.

(emac_load_desc() also does an in-place conversion, but here this is
fine, because the function is supposed to be initializing the
struct.)

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 20230424151919.1333299-1-peter.maydell@linaro.org
---
 hw/net/msf2-emac.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
index 7ccd3e51427..db3a04deb19 100644
--- a/hw/net/msf2-emac.c
+++ b/hw/net/msf2-emac.c
@@ -118,14 +118,18 @@ static void emac_load_desc(MSF2EmacState *s, EmacDesc *d, hwaddr desc)
     d->next = le32_to_cpu(d->next);
 }
 
-static void emac_store_desc(MSF2EmacState *s, EmacDesc *d, hwaddr desc)
+static void emac_store_desc(MSF2EmacState *s, const EmacDesc *d, hwaddr desc)
 {
-    /* Convert from host endianness into LE. */
-    d->pktaddr = cpu_to_le32(d->pktaddr);
-    d->pktsize = cpu_to_le32(d->pktsize);
-    d->next = cpu_to_le32(d->next);
+    EmacDesc outd;
+    /*
+     * Convert from host endianness into LE. We use a local struct because
+     * calling code may still want to look at the fields afterwards.
+     */
+    outd.pktaddr = cpu_to_le32(d->pktaddr);
+    outd.pktsize = cpu_to_le32(d->pktsize);
+    outd.next = cpu_to_le32(d->next);
 
-    address_space_write(&s->dma_as, desc, MEMTXATTRS_UNSPECIFIED, d, sizeof *d);
+    address_space_write(&s->dma_as, desc, MEMTXATTRS_UNSPECIFIED, &outd, sizeof outd);
 }
 
 static void msf2_dma_tx(MSF2EmacState *s)
-- 
2.34.1


