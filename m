Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B8A3067E8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 00:31:01 +0100 (CET)
Received: from localhost ([::1]:39028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4uH6-0000GA-5l
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 18:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4uEf-0007e9-3J; Wed, 27 Jan 2021 18:28:29 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4uEc-0006re-RR; Wed, 27 Jan 2021 18:28:28 -0500
Received: by mail-wm1-x32c.google.com with SMTP id z16so529506wml.2;
 Wed, 27 Jan 2021 15:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wvjU515Spj3A6CDw5WT0Qql1F2X6k6eBgld4h9Q3aTY=;
 b=QslmrtenSqE+UQ/I5U0seLfuh5vVJj48pVeD/EgSl2hcng1f7oCcD8IKmoKa8tuXHe
 h5nIOI18XP5/NRHAPeqJbU7nGPHXDICqLDTsYslHDBnGa/3qbPGvTYH10u6AnR+n9mwo
 xvgvn7NVymvpXztbdZjJDa9A9QezOOYej4V9475XcpHFtBopKXjcYjEew8IgM2o9tSyx
 BBpgozV//eumobKuBkOT6TF8NlNn9IF8XU4TCSU6syh+FMrVFoN/hB6ofAxXZeaVcyS5
 86AFHSnD4APi6IBcnVif9s/yy3aGTQETXdZ2c1git0Q1vorjTsOjbnASouQ5xzLrANb3
 Ou5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wvjU515Spj3A6CDw5WT0Qql1F2X6k6eBgld4h9Q3aTY=;
 b=isonr9Y/thgVA8jUuv8/47MklwLqvGn3vX1a4q7VZ4drjp6PZzfGLMZT5h6ZqANfMB
 WL3rHsQtg2Ai62tTIrlOE+a+gKBgrLSFVp75fMwLBNn2yztOOs8CTqxwHW7ahn5NIikR
 FvEqqPpub6RgjpMQ/fRdfmDITiCnLug2hhy38wxGHCkZBNfyQS09rCPXVW4X+u+JHJeI
 NDdtZ2f4t8OUXSECuDC/te/viJyaH1tbI0tK9gfYBFW7XeaQzFg+kZna2I0fd5+ODtBD
 e3UtU+Kkd5nISlnSmLeBEZdSLBGnaSbpGYJda6P13r+Dj5fl2rnGBzdpriagGVtw2zBC
 aPJw==
X-Gm-Message-State: AOAM5306R7SZzHFbPzmQSrV5mCYyjRJcG98Enw9aQId9kDsKYRy7SgMT
 jkRJYSla+rMKDDdg3bhMP4wTCTlXVko=
X-Google-Smtp-Source: ABdhPJxRSCIOmVrGp3wYYbtJ1fjTJB1yMe4D63whcmRzdqEwmRc4s7HSVfkqyPccp8JJ4nhco9U6tw==
X-Received: by 2002:a05:600c:21d8:: with SMTP id
 x24mr6049698wmj.27.1611790104950; 
 Wed, 27 Jan 2021 15:28:24 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z130sm3634316wmb.33.2021.01.27.15.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 15:28:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Replace magic value by MMU_DATA_LOAD definition
Date: Thu, 28 Jan 2021 00:28:22 +0100
Message-Id: <20210127232822.3530782-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_get_phys_page_debug() uses 'DATA LOAD' MMU access type.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d2ead3fcbdb..766ca8b5c78 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12409,7 +12409,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 
     *attrs = (MemTxAttrs) {};
 
-    ret = get_phys_addr(env, addr, 0, mmu_idx, &phys_addr,
+    ret = get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &phys_addr,
                         attrs, &prot, &page_size, &fi, &cacheattrs);
 
     if (ret) {
-- 
2.26.2


