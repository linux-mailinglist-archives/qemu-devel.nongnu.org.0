Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246E44E4351
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 16:49:36 +0100 (CET)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWglL-0007br-0p
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 11:49:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nWgix-0006b1-E3
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:47:09 -0400
Received: from [2607:f8b0:4864:20::62f] (port=43676
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nWgiv-0006NB-0a
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:47:06 -0400
Received: by mail-pl1-x62f.google.com with SMTP id w8so15779239pll.10;
 Tue, 22 Mar 2022 08:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJVSwDZLdSSX5Q5h1Pc04iwcrn35ldxRRwFHHVEFamo=;
 b=mqosNJHHXFiBik+jY1rFyzmsh1cqmgVLgaX3JOI2N+iF3iGTsm5cI4HCNbs8aM4D9k
 PzGnDOWmQZKvSas0gjV3cK431p1kKZ3sBxRX5R6P9b8yFPgCnMlGRXagiUHDh/+KMNQW
 3/ap2TB3/F2AdX3tM+EJ53XafvGwWxoRbVwbaRDvRkT/YrrDqwdWEOr0W1TEWqsn5M0R
 so2mL/ruoCf+9uppjNmjguituchGoFg26g9RyiUgFH8TT2VCGy+dhRHmwlELaFl1CuWX
 LOzE06C3hTCq6fPmGALeCHXv42oGRUMaKcJQEuFRmcAA3y64pdrrvaGvu6+uObgOqULi
 NuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oJVSwDZLdSSX5Q5h1Pc04iwcrn35ldxRRwFHHVEFamo=;
 b=ULc236p9jl2k/CZW9FV4nkzKD83eHGU6el4RURiTtIFlzRPo97+ogy0DEupgJzwf9A
 vuLIQR89FoaZ/Ge/OEX6Paqunczep0SdtKaI9Bp+1XRaFMCXiqRPpzLP841StB9XeCp5
 np5+QI0pklJDQZ4oEOgYghDSiVF6gnL2EShea62qfoyDHCTwchK/6E6Ia6Z4xy26diYw
 NiUWZ0LiaY4hC+UVPoIbmrd0CHUpr0Uds7lIZnrrjgLZ0i0/l/FtNfN9fsX+hm1uwKEV
 p/C4xMequ7f5lZi+xROtQU5FeEQGa276GDV7ezQ1B16YXQ/Vn1wON+dhJqnegPcFcmXG
 mZLw==
X-Gm-Message-State: AOAM530hyfnLh66anfQpshyrmW0GkvA7Hziyk7w3IXPrencgHdjTCt4X
 3wvO6GLI3X2g/7wboWNeLmoYZ2ib9hL1cA==
X-Google-Smtp-Source: ABdhPJwrbTetU4rwTWpPcJQuSZCXim+NbK1kmwANL4OGiapYLGOvPlsRPSh5M4L8ChRP4+YL+kb4tg==
X-Received: by 2002:a17:90a:600a:b0:1b9:dd79:ea77 with SMTP id
 y10-20020a17090a600a00b001b9dd79ea77mr5767087pji.44.1647964021470; 
 Tue, 22 Mar 2022 08:47:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a056a00140d00b004e13da93eaasm23517763pfu.62.2022.03.22.08.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 08:47:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-mips@nongnu.org
Subject: [PATCH v2] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
 systems
Date: Tue, 22 Mar 2022 08:46:58 -0700
Message-Id: <20220322154658.1687620-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=raj.khem@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Zhang Yi <yi.z.zhang@linux.intel.com>, Khem Raj <raj.khem@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

linux only wires MAP_SYNC for architectures which include
asm-generic/mman-common.h and mips is one such architecture which is not
including this file via linux/mman.h, therefore as a fall back
these constants should be defined for such architectures on Linux
as well.

This fixes build on mips/musl/linux

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Zhang Yi <yi.z.zhang@linux.intel.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
---
v2: Improve commit message

 util/mmap-alloc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
index 893d864354..86d3cda248 100644
--- a/util/mmap-alloc.c
+++ b/util/mmap-alloc.c
@@ -10,14 +10,18 @@
  * later.  See the COPYING file in the top-level directory.
  */
 
+#include "qemu/osdep.h"
 #ifdef CONFIG_LINUX
 #include <linux/mman.h>
-#else  /* !CONFIG_LINUX */
+#endif  /* CONFIG_LINUX */
+
+#ifndef MAP_SYNC
 #define MAP_SYNC              0x0
+#endif /* MAP_SYNC */
+#ifndef MAP_SHARED_VALIDATE
 #define MAP_SHARED_VALIDATE   0x0
-#endif /* CONFIG_LINUX */
+#endif /* MAP_SHARED_VALIDATE */
 
-#include "qemu/osdep.h"
 #include "qemu/mmap-alloc.h"
 #include "qemu/host-utils.h"
 #include "qemu/cutils.h"
-- 
2.35.1


