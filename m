Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C20662840
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:17:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEskL-0001W3-Of; Mon, 09 Jan 2023 09:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskE-0001Us-BT
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:03:22 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskC-0006PJ-QJ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:03:22 -0500
Received: by mail-lj1-x22f.google.com with SMTP id bx6so8968638ljb.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bwgSmpYYfKNOJH9VNo91pDyRjQC6uHyPY7rBYpr5GJw=;
 b=n5l0+iz3gjBqrKMaIv4+T2CnMxiqzpa1hiMPKWzCyUfaTtojUJTY4jj5noYtmix0PU
 WS+D4c+1/EkUT4KFu+mj6Xyn9iJ3AruoKivNMKkPV4Ay4HFppmY85TjPqPkZdlUWZ6vP
 hnVu5URMcS4CxhN32ApAlobFr7VBiX81tgtQ8IXZYaYxsZFp6mMmA/gZQu3yAmr8Z9tN
 Bh/LbpRBx+vWNau7Q24i2UBR3ipVIv+dkh39gH9fwMvER3FVriZ8gV5dHX+xQSCC8Zd+
 CX1JTGRTmuEePqgLJLphOq2M68TEql69VtuudYcS8/cM3kuslBZL3JDP7+qhuZtnt05s
 FHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bwgSmpYYfKNOJH9VNo91pDyRjQC6uHyPY7rBYpr5GJw=;
 b=LWmYryJOOPNlYtdyJrciJDHbTmW2kKLogJ8ytVq3qga64E3VPdfVNFUlvmPEYYhXX1
 ao7X6oL5/l2jsQEXs3himZHBKxBaRZOw/gn2h1m8HAk2ib91WSa1BOhFbfAA0hwDd8b5
 AzVGRYzEhnVeY292oDzNo8Ohcv2sCS5ZhBUcjxSz2v3wMH/7kxmKeb4ISbM9w4FEqJdy
 kdfOpvzqVIbL3oLmjzR33//wfGxdZ5Wkjugvggzu85w8jGFNKDBZluO8UW3Z5dsTitfq
 k+aZYgwI14+PjF1OI8ttN+ZT7P0suPwLmlvAbEKRKov2uPjx66Cc6L+nVvRiNsnHfLxj
 PTIw==
X-Gm-Message-State: AFqh2krg4Pl1C1v7P3mCr4LSu+fZkhtpk/zcrCGuSmpnxoLdJ+IRKbFi
 CBiIPbSG4UbrRD2u6pKfyT+cu/al0T3kvm/L
X-Google-Smtp-Source: AMrXdXv3Wlqjo4bB4Dp28JEiHBg6Elrz4J6qQwBzU8sNyBeu0hptpHpr41XhlF6z05/YraEl7J80Pw==
X-Received: by 2002:a2e:9e57:0:b0:281:789:7ee5 with SMTP id
 g23-20020a2e9e57000000b0028107897ee5mr4320882ljk.6.1673272998739; 
 Mon, 09 Jan 2023 06:03:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c4ece00b003d9ea176d54sm8462614wmq.27.2023.01.09.06.03.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:03:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 02/14] hw/gpio/omap_gpio: Add local variable to avoid embedded
 cast
Date: Mon,  9 Jan 2023 15:02:54 +0100
Message-Id: <20230109140306.23161-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add a local 'struct omap_gpif_s *' variable to improve readability.
(This also eases next commit conversion).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/gpio/omap_gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index bd0841d57f..12ec16d1b0 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -53,7 +53,8 @@ struct omap_gpif_s {
 /* General-Purpose I/O of OMAP1 */
 static void omap_gpio_set(void *opaque, int line, int level)
 {
-    struct omap_gpio_s *s = &((struct omap_gpif_s *) opaque)->omap1;
+    struct omap_gpif_s *p = opaque;
+    struct omap_gpio_s *s = &p->omap1;
     uint16_t prev = s->inputs;
 
     if (level)
-- 
2.38.1


