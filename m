Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4A748056A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 01:55:49 +0100 (CET)
Received: from localhost ([::1]:57122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n20mK-0001yh-3q
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 19:55:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1n20kO-000812-K7
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 19:53:49 -0500
Received: from [2607:f8b0:4864:20::52a] (port=42793
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1n20kN-0002qq-4K
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 19:53:48 -0500
Received: by mail-pg1-x52a.google.com with SMTP id g2so14639535pgo.9
 for <qemu-devel@nongnu.org>; Mon, 27 Dec 2021 16:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+nJte6JP6EZUPzQBYs32kg6qH8WTQTkFEHae1nTePgI=;
 b=bHVGEvfy8rTJZ1OcncAtIJrmj984Tg5RU+HQ2T322BB7+rqQn0rKI1YZeKEjYGDsOl
 xDIQx9r4wW1p6ZDaU4plUQFC9xKRmxQ+3lmZqXFuTqLV1qRNWpxixPPXRBKnoWcQS1Sb
 FFmywveWGveQ41bwE+2FUZ/+obu/fbV5tar+Rv7AcPE/DP1bWuMwuamBr5dKHB80d4/1
 yTgScS1oeKyA/DNH9CKG2xbd8ispSYzyIpIDSpXQJ5ohOsC+PKZg0QhIK58+s4tBiR9i
 Tuye3YErFk4L6RzdIyYDz5kM+X9zTHQaUfn8xs8IBUSLwS4HyKs3tR0WP9tWqNPOEVLf
 msfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+nJte6JP6EZUPzQBYs32kg6qH8WTQTkFEHae1nTePgI=;
 b=c6hNrAG020jG7QM8qhRODIrj7Q3mu9W7X/97QhVPrcvMCDLzkSLaXPFatRXG27Zuna
 79Shd7dMRV1wLzdYUKojENxVvB5cbBSf3s/u0hEGQIxPe1BsAZuMo0G9zpBseW9bpC4w
 RlBNGzhGgfyLVb+t5HzbtiiWvkcFQmLVBBemAuVH+RIdurK/UBx1GWEFkhpMZxefcOwj
 OByXFSmjhEcoJ/cqcPmRD9xIQ8tsjbRqzbK2L9xHXBo275yNIpBLpYbAEvk+O6VuIanZ
 7QkbVIId5WerD79N+soydJA5lYTkA2Zvp7VN78BjEbZcmaZZyrnMNB2DUYQ/cDQs7YrR
 /8rA==
X-Gm-Message-State: AOAM532B4LfUiN26U/EfWQ0gOgu4/bSltKNqU4I85EX3EE0x0JVchAq0
 BuyM8LJCel/ut8lTZuQDL8zM1g==
X-Google-Smtp-Source: ABdhPJwoeOSjWadWH4WVesXLVrFH7Y3POkv5+eAevixjh1i4HoXbbS2RQc4B2qcPmf1QfZwZgM/FoQ==
X-Received: by 2002:a63:790a:: with SMTP id u10mr8739039pgc.302.1640652824814; 
 Mon, 27 Dec 2021 16:53:44 -0800 (PST)
Received: from localhost.localdomain (1-169-192-165.dynamic-ip.hinet.net.
 [1.169.192.165])
 by smtp.gmail.com with ESMTPSA id t27sm19266587pfg.41.2021.12.27.16.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 16:53:44 -0800 (PST)
From: Jim Shu <jim.shu@sifive.com>
To: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 frank.chang@sifive.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/dma: sifive_pdma: permit 4/8-byte access size of PDMA
 registers
Date: Tue, 28 Dec 2021 08:52:36 +0800
Message-Id: <20211228005236.415583-3-jim.shu@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228005236.415583-1-jim.shu@sifive.com>
References: <20211228005236.415583-1-jim.shu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=jim.shu@sifive.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jim Shu <jim.shu@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's obvious that PDMA support 64-bit access of 64-bit registers, and
in previous commit, we confirm that PDMA support 32-bit access of both
32/64-bit registers. Thus, we configure 32/64-bit memory access of
PDMA registers as valid in general.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/dma/sifive_pdma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index b8b198ab4e..731fcdcf89 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -441,6 +441,10 @@ static const MemoryRegionOps sifive_pdma_ops = {
     .impl = {
         .min_access_size = 4,
         .max_access_size = 8,
+    },
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
     }
 };
 
-- 
2.25.1


