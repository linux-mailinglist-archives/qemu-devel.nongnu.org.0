Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A495342B9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 20:12:42 +0200 (CEST)
Received: from localhost ([::1]:59086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntvUv-0006mR-6L
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 14:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjothen@gmail.com>) id 1ntsy7-0007SW-8Z
 for qemu-devel@nongnu.org; Wed, 25 May 2022 11:30:39 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:36590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjothen@gmail.com>) id 1ntsy3-00073K-9t
 for qemu-devel@nongnu.org; Wed, 25 May 2022 11:30:37 -0400
Received: by mail-lj1-x232.google.com with SMTP id g7so5534971lja.3
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 08:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=Fa3X8w387s4kq6OsGl81jW8c6wOoEQ1BBFfsEgWlCx8=;
 b=H8Gqu8Ut657vHPxHAmDMvrj/LYLaYUWUQrQvmMGhuPNsvu6Hg2uMejjDM2Q5ItA6nh
 7VEdzsyInsKqRTJPX9eKbCmm+FMwO2lH9qTJ/tAspSI6JmubYqUG88IeUjhwv2PciEBq
 xHy2bWwiseB5LrkvW3qqoOc+Ah1ZTxwEySS/BGYwiNI9Afg2Tnjy9dXxCagEimpMhwbq
 /XWXcHi3tCnX+x5E4gxBH5WxPubI7dmGxku+mXkQGghbk0PuL2YC4Woi0Gr4sWvtfaiE
 YSVVyE9o8g+llITJR9itqjklVV2sCvdShj5Ekj3n8Sk9eTALl6AhXDJylE2BMAmi5+fD
 j5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Fa3X8w387s4kq6OsGl81jW8c6wOoEQ1BBFfsEgWlCx8=;
 b=8GQPPzWZDfKU4qpUSKX1cBsuun/M8bIkATtAsP8aRcbFIbQ1gBPS5P985sLrQcXHqc
 M7yaELKttKp0pwQc70c3CjxuP4bz6Sz4/OwC1yO6eXkkZJ23l3XOecqHkKVwV+V1VS8J
 MCrkcf+Fb1SLM8BwiOZQPM79Uap/UwE2toNsGFTotJRw9mnIV0VnS2fsjEpPReSdBmHI
 20qIQX+rudP03iWqY26as1Ej9nsEaFzvMSjxGXFAcF7yOlS6unTmGDeVu8kCq24jeRQm
 P2ONV7ZONU3rH5MnOdWL6hT76QA7WCKmYt1P2LZ2re//xznAXElveQreNlpFrBPb6ZrM
 56AQ==
X-Gm-Message-State: AOAM5314LBFg8WlHMSzwpYYnb1kzuxB0t38ptm6rgQPNPeHOMqXDZp0j
 K0fnoMMVYM9fznj31ODL4RXh6GfA2nMiDw==
X-Google-Smtp-Source: ABdhPJy7OnMXofyE+vw87aBTCWW/DtwMLHXH9Q0skP2CBBTvsT4HMPXJ7nShNJ5kbp9NKpQqJxQ91w==
X-Received: by 2002:a2e:9655:0:b0:253:d575:9a6d with SMTP id
 z21-20020a2e9655000000b00253d5759a6dmr18799358ljh.207.1653492632536; 
 Wed, 25 May 2022 08:30:32 -0700 (PDT)
Received: from air-old.local ([84.213.16.196])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a2e3c10000000b00253c33d30f0sm3178820lja.87.2022.05.25.08.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 08:30:31 -0700 (PDT)
Date: Wed, 25 May 2022 17:31:11 +0200
From: Stephen Michael Jothen <sjothen@gmail.com>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de
Subject: [PATCH] target/arm/hvf: Fix build failure due to missing cpregs.h
 header file
Message-ID: <Yo5Lv4Hu4jrBbGCi@air-old.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=sjothen@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 25 May 2022 14:09:02 -0400
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

cpregs.h was previously split out from cpu.h into a separate file, but
I think this was forgotten to be included in hvf.c. I got a build failure
when trying to build on Apple Silicon:

[...]

../target/arm/hvf/hvf.c:591:33: error: use of undeclared identifier 'ARM_CP_NO_RAW'
            assert(!(ri->type & ARM_CP_NO_RAW));

Signed-off-by: Stephen Michael Jothen <sjothen@gmail.com>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 86710509d2..6ecf4669a0 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -26,6 +26,7 @@
 #include "sysemu/cpus.h"
 #include "arm-powerctl.h"
 #include "target/arm/cpu.h"
+#include "target/arm/cpregs.h"
 #include "target/arm/internals.h"
 #include "trace/trace-target_arm_hvf.h"
 #include "migration/vmstate.h"
-- 
2.30.1 (Apple Git-130)


