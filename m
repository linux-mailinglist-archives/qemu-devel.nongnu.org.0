Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD21483C0F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 07:50:59 +0100 (CET)
Received: from localhost ([::1]:37304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4der-0002cY-HE
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 01:50:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1n4dPa-0000hf-2K
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 01:35:10 -0500
Received: from [2607:f8b0:4864:20::62c] (port=39604
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1n4dPX-0002XW-Sq
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 01:35:09 -0500
Received: by mail-pl1-x62c.google.com with SMTP id h6so22582720plf.6
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 22:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gkygk7HFkDRQqBR7gPramWeqcVEw4UkCyEe2l45+d4s=;
 b=SnH5pxHJLncjnBkK3NfPVznNU4C+DEBPjgbHB+QzQunwAU/taKFwmHmyapddJfprF3
 mifc6rUWkElhtQQwFFkB6cLQAoWsjUrFydTLP8h2jzVmMB6ijTpCz8Wu3t8dhkihvVGX
 jGI81w4qd+jHMv058V9JbQl1KzjJOpL9udWT0eciQ14qSn3uxXdvwS2fXX0FB5FuFx+E
 XslQcaV+5afg0rBXZVTHsWvpbLN3LPjNJ12obKwjYEA4aPOk6cVqORz8kmGWSfCrRKsu
 SKUzFlUj4Rba5wf2w+IyeK8gL2L9SmXC3zl4f+HTnpadhUxwgGQl5sWykpcAoBL9Vpio
 35VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gkygk7HFkDRQqBR7gPramWeqcVEw4UkCyEe2l45+d4s=;
 b=ldiFdXJR5XEpNsUOL+qchRLtuyXRL0LNgNlmDUX63bTBxro56dcCAtT6DPWF3u/UHo
 Pc4ub+Q1IFD+YkeDPPOUgbYCW9+bnOCOxlRqBkoOAwhsbMXmlsZjfNwlQ7oG1wVvKOTq
 cxuWddFQl9/6qkfosakGvZLeucAq5XcvBBXq6aU6bQ1Ram5kiwBdd9ZXTHPzfHjpr7H0
 2ic1ufqgwEXor+oZwmjGb7SAxKqvICoE3VXhxj21udr4fPsmu9ft8vRQPM021SgzYlFV
 zFr6dpc81XXo60mEYsLfuCG3ouqImR2bEgQPdPoSKI4zN95xdwHU7aVlzMlG3rsg0Fdb
 x17Q==
X-Gm-Message-State: AOAM5312/8hl08zrYlpy+7X99+4BqqbP1KILqS3bm0SSP1H7RgC0C192
 tb1iGMBriDZOzD5PeVRX8qOMeg==
X-Google-Smtp-Source: ABdhPJzmMGZPbbVIqmegnGuFfEtplZk88t1NsnxnAEqASyucQ+PWC0Z192QXm2HufXx3lgq6hHG6Ag==
X-Received: by 2002:a17:902:a584:b0:143:c2e3:c4 with SMTP id
 az4-20020a170902a58400b00143c2e300c4mr48258648plb.69.1641278106711; 
 Mon, 03 Jan 2022 22:35:06 -0800 (PST)
Received: from jimshu-VirtualBox.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b65sm39371533pfg.209.2022.01.03.22.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 22:35:06 -0800 (PST)
From: Jim Shu <jim.shu@sifive.com>
To: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 frank.chang@sifive.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/dma: sifive_pdma: permit 4/8-byte access size of
 PDMA registers
Date: Tue,  4 Jan 2022 14:34:08 +0800
Message-Id: <20220104063408.658169-3-jim.shu@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220104063408.658169-1-jim.shu@sifive.com>
References: <20220104063408.658169-1-jim.shu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jim Shu <jim.shu@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's obvious that PDMA supports 64-bit access of 64-bit registers, and
in previous commit, we confirm that PDMA supports 32-bit access of
both 32/64-bit registers. Thus, we configure 32/64-bit memory access
of PDMA registers as valid in general.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/dma/sifive_pdma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
index f4df16449b..1dd88f3479 100644
--- a/hw/dma/sifive_pdma.c
+++ b/hw/dma/sifive_pdma.c
@@ -444,6 +444,10 @@ static const MemoryRegionOps sifive_pdma_ops = {
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


