Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4A94E2EEF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 18:18:32 +0100 (CET)
Received: from localhost ([::1]:50388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLfr-0006K7-GS
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 13:18:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nWLdy-0004Vm-Va
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:16:35 -0400
Received: from [2607:f8b0:4864:20::52f] (port=43863
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nWLdx-0007WX-B6
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:16:34 -0400
Received: by mail-pg1-x52f.google.com with SMTP id c2so10744076pga.10
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zJtMQ13CQvg474uCXbu5yh0qiyJR2Z2Vhabj+f7rO/0=;
 b=J5kPMpTW5k99Veq/Vpu14XYUz0KOhcUbL5NByu15iAcvKRsY+B7pCxbPxju84p1p3j
 5zKPdjRvrRg804P8Hqj5yH18EsYT2Oaem2mv+w9fRuj0qfUZyojg8Aw9U0RvIp3RxTec
 k0FA4p89pbtYW6EONmo962RBRGNXXg71iX+/p8Cwp/U8oj8qR4/3FQnCeQ0UyA2OfwJL
 2GxXBS+vblUm8+nym2UEamdm95lCFCQTQngsOny2t1MEFI4OMYCm0z4RaY0yoKo5NGal
 pv0fD3CNIbSOPgL30b09UOnZzJiLMCKpcBAj3kKsI7W8UOPpnD+Nbiwn9vNY3hUs2WhU
 lZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zJtMQ13CQvg474uCXbu5yh0qiyJR2Z2Vhabj+f7rO/0=;
 b=Ub6p9Kfj0CMqhTLMHh/lTpGNtYnzBSTypYVakUOtGkFYD3GmKHsNqIOo1yNTfKnCw0
 1M28sil2jExQXr3BoRfhC8kP2z2qxqncC7W/uwkB4QQ22pxze0PAmTe1Q7Ec8AUfG0UU
 KJ4mFf4pOglqgdgGcnH2DlZqisVV58rOrD79faqQ3ADS/k7VSfwsHV2/9WGeIBVoc7uc
 nYTNUyOOlx4XaGGEqbRvIkDeqFx9jgH2M5WuY3hL/FTrsH4N4wxbC3jJRZnJaTD95wIw
 PgTNWXWbDslMXVfeTk2F18LSgFmoAMTH+uN+WTw8KVOw1bN9LDyQ6+oFQNmLjGm+V7Su
 9U9A==
X-Gm-Message-State: AOAM530cNmcvEmWScycb9IfCOoq67zBgmgf7GsaKX4YD2QnN/4+iEWpI
 aCa/4vwe62hV/g3tpTVU9u1zzROfQPMrUw==
X-Google-Smtp-Source: ABdhPJxXBYPPoR3MQ+ReMPNXYnKRRFRmuZpBDjtGYioC4qM9sNCRYTQ7dnHhV9sWKJpffT8L+sZeKA==
X-Received: by 2002:a62:6410:0:b0:4fa:6d21:139e with SMTP id
 y16-20020a626410000000b004fa6d21139emr18662764pfb.13.1647882991094; 
 Mon, 21 Mar 2022 10:16:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
 by smtp.gmail.com with ESMTPSA id
 y20-20020aa78054000000b004f6f267dcc9sm19086698pfm.187.2022.03.21.10.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 10:16:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
 systems
Date: Mon, 21 Mar 2022 10:16:22 -0700
Message-Id: <20220321171622.2942892-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=raj.khem@gmail.com; helo=mail-pg1-x52f.google.com
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
Cc: Khem Raj <raj.khem@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

linux only wires MAP_SYNC and MAP_SHARED_VALIDATE for architectures
which include asm-generic/mman.h and mips/powerpc are not including this
file in linux/mman.h, therefore these should be defined for such
architectures on Linux as well. This fixes build on mips/musl/linux

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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


