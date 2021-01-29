Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1B3308806
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:03:04 +0100 (CET)
Received: from localhost ([::1]:34564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RYN-0006HP-5k
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW3-0004OA-Bp
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:39 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVn-0006vJ-PU
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:39 -0500
Received: by mail-wr1-x436.google.com with SMTP id l12so8404730wry.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qewTpRFCmZV4l2YIPf8U3raTgpS0uedHR3JcStZB1zg=;
 b=m4OEAPh+PmUJw4V317r+HyCwpjlCQeFSWh69lU7OwcLKovBFzONgMpHZxNDZcRkKoY
 8yQdDyn6LvBx4XN50zs+t75b5MaQMXoKw8Ode0+/ydgiVXxMu8mfz+R73wNF8zf3ax15
 Ernuvkf56ZmrSZqtQ8vQeAFocz7vrViIsD20q7Ow1B6yGQ9/xAJi6oQG+VKnnK5a5dVf
 l3h3BP5Fj58Y8Y1mjnZc+vQ0uCPVDEibEYNsS0uWHyh08FXsMPhzFH1Uq2zR/WVubCM5
 lo38HbcGbfLTQGXUpUqgCTupCQGooIVZgnsnP+tpFwThQB9Noeby+uJyde1XFoqH2yyZ
 2pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qewTpRFCmZV4l2YIPf8U3raTgpS0uedHR3JcStZB1zg=;
 b=UFj100e8Vr+4th5GJyMSViJn5obgrvU4cxloKpxyXwigA9b8dpkA1pI1g8TXZ8yeOf
 I85Bo8o02ZChCTCE1cHefwhB1bIKA9xhBqlN+i5akEpwQgd482GXxru/dOPHchDhyu08
 kZ2Szkqxpun8KkM2nPeb5mkPg+3RKo49vdX6g/hqD2qGsJhCqPjMz/l9lSRyQcPPvG31
 3ABIjk4z2GQKfh9XzeM2MjhtXqLmaeTBVmroC8vjJX0M1flrYNVUec8JXiVUDc6Qx8pj
 ZEgryHWhU/SxyYXRuyyw6bdQw7HPdsiLAhZWWPbCf90eqTrw3aRzuXwsna1oo2CBGafB
 dOqg==
X-Gm-Message-State: AOAM5304FcmMxZ9M+MBuR7zv7P2xKQBw6qdgRmRLpZNsEhACqNHGA0i4
 7lQ4tGC9FIyxLkRDB9NrYohNZ0q26CLd1Q==
X-Google-Smtp-Source: ABdhPJw9qB/5nUEyje3/M/RAIhF/Jy7WjAVRb9d47chVts8jXUeGl90TQ9ir6+Yck8Px73JHND6IhA==
X-Received: by 2002:adf:c14d:: with SMTP id w13mr3781771wre.383.1611918022420; 
 Fri, 29 Jan 2021 03:00:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/46] target/arm: Replace magic value by MMU_DATA_LOAD
 definition
Date: Fri, 29 Jan 2021 10:59:34 +0000
Message-Id: <20210129110012.8660-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

cpu_get_phys_page_debug() uses 'DATA LOAD' MMU access type.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210127232822.3530782-1-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 677a4aa79e7..47e266d7e64 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12418,7 +12418,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 
     *attrs = (MemTxAttrs) {};
 
-    ret = get_phys_addr(env, addr, 0, mmu_idx, &phys_addr,
+    ret = get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &phys_addr,
                         attrs, &prot, &page_size, &fi, &cacheattrs);
 
     if (ret) {
-- 
2.20.1


