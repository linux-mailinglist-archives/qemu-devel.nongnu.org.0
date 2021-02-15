Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B231B86C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:55:33 +0100 (CET)
Received: from localhost ([::1]:42006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcTU-00033i-9H
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:55:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQ9-0006mK-MZ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:07 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQ7-0003pA-Eb
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:05 -0500
Received: by mail-wr1-x42b.google.com with SMTP id t15so8441149wrx.13
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TPCQ7hQbzvDDHnYGwctNAE4kUhgse5UxYRkoh3yegnE=;
 b=oHXWZxiVJIeV6r7ZllLuGWgHqlOcgt9i9v4+AcKvoXqHxs8Kq34g3qQAFi3ckE9KTP
 MnCbMYOUv2YHCBXYn40ABJQyxGcKCx5llTTp+iHN+wichcfQw4frUMsc+5ac3kZB3yni
 ZtDWTLRbdI6udDDZuXoUFNKM67bHOWqBKeB+p6Jjzv8hvpFvMAw/K2DQCgsPn4gq6jrF
 DZv6Cq/AAvwwih8YHllBNVpR2WueJD8heXk9b+RCkLjmM/2eLCQVP6AlU5CVS+FseWle
 PFhwH9Oj7/sIxwRke8c+27asaSzOZp6U9J7FsMqg4H64OCAj+uxM+o0Lz+t1pizJdFMT
 37fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TPCQ7hQbzvDDHnYGwctNAE4kUhgse5UxYRkoh3yegnE=;
 b=iR0+C+ysXEauhXU9/8ajvSwSQcgp/fFA9HDRjs0LftvWTt8W49N56FaXIgNyAPvjNv
 wkDqAktJik4SvG+BUZ6enfoCdHO0HXgtFlUxWQ2hggwKbVtRQSNJlYiGgumpOLoTpMBQ
 6fxuTahvp0jo88ZBBWsveqMOsKfWP+x20voswJGPGF+i33LHsB6l6ZoaVVcKNMY+5g4J
 9epz24DPBtO6+j+Sd/mP2BAC8LCtXGF1goXaJ41xBUXVShYXan3/7wqjM0zJZlh/BJoO
 xhu9rpK0MOvS1s2+XTA4IIi109eWyD9azN/x0YpKkWAkyo48A/qHWKZUsjNu2gtrD/p4
 doLA==
X-Gm-Message-State: AOAM533v82w1qc4Nwm3ua8B0p6atHH0eIEs0rLyV1Mb2rUT9ROIaNNBK
 xeQS+l0uiiv8idudVvyUNcXWTA==
X-Google-Smtp-Source: ABdhPJwgP14LVqtJ5TrHAwQ7ibamRRjLBXmQTkMXI64NWkrlTA2lZgYA8s5lpGFxzhZN7k17pTJb2g==
X-Received: by 2002:a05:6000:c1:: with SMTP id
 q1mr18562285wrx.114.1613389921530; 
 Mon, 15 Feb 2021 03:52:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 03/24] hw/arm/mps2-tz: Correct the OSCCLK settings for
 mps2-an505 and mps2-an511
Date: Mon, 15 Feb 2021 11:51:17 +0000
Message-Id: <20210215115138.20465-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were previously using the default OSCCLK settings, which are
correct for the older MPS2 boards (mps2-an385, mps2-an386,
mps2-an500, mps2-an511), but wrong for the mps2-an505 and mps2-511
implemented in mps2-tz.c.  Now we're setting the values explicitly we
can fix them to be correct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2-tz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 7c066c11ed4..976f5f5c682 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -221,8 +221,8 @@ static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
     /* This will need to be per-FPGA image eventually */
     qdev_prop_set_uint32(sccdev, "len-oscclk", 3);
-    qdev_prop_set_uint32(sccdev, "oscclk[0]", 50000000);
-    qdev_prop_set_uint32(sccdev, "oscclk[1]", 24576000);
+    qdev_prop_set_uint32(sccdev, "oscclk[0]", 40000000);
+    qdev_prop_set_uint32(sccdev, "oscclk[1]", 24580000);
     qdev_prop_set_uint32(sccdev, "oscclk[2]", 25000000);
     sysbus_realize(SYS_BUS_DEVICE(scc), &error_fatal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(sccdev), 0);
-- 
2.20.1


