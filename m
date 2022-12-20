Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FD76521CB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 14:54:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3R-00048g-9k; Tue, 20 Dec 2022 08:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3M-00047V-V7; Tue, 20 Dec 2022 08:53:08 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3L-0000zN-Eu; Tue, 20 Dec 2022 08:53:08 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-144bd860fdbso15500759fac.0; 
 Tue, 20 Dec 2022 05:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mL0VJp39CttnSDlqO4/UNmgaMe23MKykdEDegdgvW5k=;
 b=f+0fei0YXG/T3YMpZJK6fXLbxkdn61adCL/c2WrZQ4NM9yxpaokblOwoFdklh45WJf
 jd1iLWpB9MKkukuI6pCR0u9Sq+ccoP9uBEZ6dbLnmQnVtjjMAd8jq0s9bA6pep5u8Rtf
 fuIms27aupOVhjuhZOQb5U+q/4TZhk9DmMgjn5NdQxWHler6GYCwIV3tCwMEbcqsnG1j
 xuqIXSyaMTzbYyiutxDBhI8IOnanBAhWs724qts5QI5J54oTbAJg+0d7y7i2BaRdMam7
 c7D4kOo6X9/FPjEijkjQ2ZwWLoPCmncO4cqWRj2KcrTtuyTXoKUtoxqtS+T1W5CHuDz/
 NcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mL0VJp39CttnSDlqO4/UNmgaMe23MKykdEDegdgvW5k=;
 b=qH2xlTFTnhaDoeS5QCO0ujXzdQekM9q8O9GJDiuLEuxW3Ys90CWqqufuUxhaC5r2jw
 BVzakFCrkWjhsVNbuHhlY7/di2DPjfap+eppWFuCJhLico4jf5BdbO8cND4/lrUhsKkC
 kk0v7kpSlOO1nfbYMA6h8yASPwBx2S+SagzG+EzopFwqvQGLDeTpesUVoH9xZwACCKj8
 Xc6iD7Z0PUk9kgP0Qs0FcSo4kImdWh2v6wNfLfQoYvptn1p9ZmlXv9CBIAKxhrg3ueRp
 +ezOO28/QTzLx1Tw5HMXy8ubhhju3gy6iykx3bA180bEP2JgZHCGLnYRqXm/zaJlodJF
 D3Dg==
X-Gm-Message-State: ANoB5pljB53bMm5mzBaux2T4HOkUfXHb/ZfnAZvZXrKp6EE3hu6uWBsn
 IfMwx55/w+td+yJ7rC1vQgmFLtVsXgw=
X-Google-Smtp-Source: AA0mqf6fZePHkvlwv9THkPSVdrijxVWObwO2fVILViQ7xnMvYpc6h8asXgzmECidj7vGLu9QJ+ptMw==
X-Received: by 2002:a05:6870:4c8b:b0:14b:7e4f:f0ca with SMTP id
 pi11-20020a0568704c8b00b0014b7e4ff0camr11927825oab.31.1671544385746; 
 Tue, 20 Dec 2022 05:53:05 -0800 (PST)
Received: from fedora.dc1.ventanamicro.com (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056870898e00b0014474019e50sm5994933oaq.24.2022.12.20.05.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:53:05 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 02/15] hw/sd/sdhci: MMIO region is implemented in 32-bit
 accesses
Date: Tue, 20 Dec 2022 10:52:38 -0300
Message-Id: <20221220135251.155176-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220135251.155176-1-danielhb413@gmail.com>
References: <20221220135251.155176-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Tested-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221101222934.52444-2-philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/sd/sdhci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 306070c872..22c758ad91 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1332,6 +1332,10 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
 static const MemoryRegionOps sdhci_mmio_ops = {
     .read = sdhci_read,
     .write = sdhci_write,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
     .valid = {
         .min_access_size = 1,
         .max_access_size = 4,
-- 
2.38.1


