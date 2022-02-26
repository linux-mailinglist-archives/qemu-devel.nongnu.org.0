Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D254C5758
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 19:13:24 +0100 (CET)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO1ZL-0006Ey-DT
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 13:13:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Tl-0005do-KG
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:37 -0500
Received: from [2a00:1450:4864:20::42d] (port=43906
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Ti-0004Op-C1
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:37 -0500
Received: by mail-wr1-x42d.google.com with SMTP id s1so9148275wrg.10
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 10:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WRvAwDdZz4cYnOqR7LnotomJn/XVA//9i159XJwF/QI=;
 b=xnRAsAJeeo85tyhoFFeFLFxXowGYT0B0cDkUJT1m5pl4bsVcF0szrBWMokm0PYdiTv
 W+q2QEeAPLQ5S7p9H0uxFUc0fub98IyuxqjIrmD8dHaG9JCUwKe7dLO0j9UOXKtkUFtt
 M3R4gAxOmh3rf8Z1n8Qaf2j2FBFKBAlsVJw7ezSHdhl06FF5jby4t9SmjNlyG/7aiSdd
 WtE6UouZzK6OLIynPwSNy7yGTB7NMJz/H5flcu7QYeP3KfBD2+1REbQKWtumej0hH4rd
 awItjUDrEzrKQSIr7dgkBXnFWtj7x7jL7uPRxHi1epZph4Nit1gxucgyeuy2oZH2xlHs
 Ns2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WRvAwDdZz4cYnOqR7LnotomJn/XVA//9i159XJwF/QI=;
 b=NO1YE2X8pRZpeEvdHw2v4Lp7NKOriGC5q3aMUmxmG5aHFgL9FPFro9vOW1uGekxjqt
 2BYLrMNby5aidyqwxEI9opuBp5RPfjwLVOQSGP76d54pkRS8wUM4MhuNSKSgllMrsobS
 sXrHMQCbHRpfyw6Ls3WGYl05mnPoY598IFAdW1PHSg8PisOosBCfaqEwLJHY0utidD4J
 +7OWrpWIZMPltfQAiCPsTRVd6jSM/+sfZetDUcfOmKP0Y4DERra74nIXCHMGZAWvvTho
 quksYUiMy7edSlF0582hTICWE9eWWJP+UHZwGQBpFZCCUnx952Y6ESGmuJEcp1tLMzvj
 UE8A==
X-Gm-Message-State: AOAM5325lPHexs6pUPxv+dkPdKfjjta1YXxpz9AnJJrd2SMTiCFQhpHF
 +uNI/dJn5xy0NdoRt2C4gy9UK4CuHl1EyA==
X-Google-Smtp-Source: ABdhPJzJvLuoZsZZ5ym36CG+fHIvnMASsUCU7LN8mGV93xXdz5KicteJbGOUUtug2VhG72FeAnaDIw==
X-Received: by 2002:a05:6000:18ab:b0:1e8:f67a:1518 with SMTP id
 b11-20020a05600018ab00b001e8f67a1518mr10143533wri.52.1645898852458; 
 Sat, 26 Feb 2022 10:07:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adfe64f000000b001e60965a5d4sm5622409wrn.44.2022.02.26.10.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 10:07:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] util: Use meson checks for valloc() and memalign()
 presence
Date: Sat, 26 Feb 2022 18:07:21 +0000
Message-Id: <20220226180723.1706285-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220226180723.1706285-1-peter.maydell@linaro.org>
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of assuming that all CONFIG_BSD have valloc() and anything
else is memalign(), explicitly check for those functions in
meson.build and use the "is the function present" define.  Tests for
specific functionality are better than which-OS checks; this also
lets us give a helpful error message if somehow there's no usable
function present.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 meson.build     | 2 ++
 util/memalign.c | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 21511d4fb61..1c44198ebda 100644
--- a/meson.build
+++ b/meson.build
@@ -1610,6 +1610,8 @@ config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'
 # thinking that Windows has posix_memalign()
 config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign', prefix: '#include <stdlib.h>'))
 config_host_data.set('CONFIG_ALIGNED_MALLOC', cc.has_function('_aligned_malloc'))
+config_host_data.set('CONFIG_VALLOC', cc.has_function('valloc'))
+config_host_data.set('CONFIG_MEMALIGN', cc.has_function('memalign'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 config_host_data.set('CONFIG_SEM_TIMEDWAIT', cc.has_function('sem_timedwait', dependencies: threads))
diff --git a/util/memalign.c b/util/memalign.c
index ee3393cc601..fc8228bffb5 100644
--- a/util/memalign.c
+++ b/util/memalign.c
@@ -25,6 +25,8 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "trace.h"
 
 void *qemu_try_memalign(size_t alignment, size_t size)
 {
@@ -50,10 +52,12 @@ void *qemu_try_memalign(size_t alignment, size_t size)
     } else {
         ptr = NULL;
     }
-#elif defined(CONFIG_BSD)
+#elif defined(CONFIG_VALLOC)
     ptr = valloc(size);
-#else
+#elif defined(CONFIG_MEMALIGN)
     ptr = memalign(alignment, size);
+#else
+    #error No function to allocate aligned memory available
 #endif
     trace_qemu_memalign(alignment, size, ptr);
     return ptr;
-- 
2.25.1


