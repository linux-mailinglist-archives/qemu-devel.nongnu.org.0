Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F6C4B010E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 00:16:20 +0100 (CET)
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHwCB-0001fg-7k
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 18:16:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvxw-0004UA-4B
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:01:38 -0500
Received: from [2607:f8b0:4864:20::1030] (port=37492
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHvxe-00035c-Bj
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 18:01:20 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so6708756pjl.2
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 15:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BVNq6HKqRhIG4DoxJxFF+5gTjgFiu1ncAD+73fAIqbs=;
 b=jXOY9TOFYJpWItZGuynmhYr8C8okUisndEa/prGgiIalUkJUnUZ0K5sxNd/3Hzdj/I
 xkLoUE3+mIQpabqCXXRKGfcmzA5orgo26vNif2DQQojPavjQLKCa0ycyty0p1rn1pm2L
 2m5auJx3q+xL2ZyUTPgQpu0LeryPuGxNLkfg2bGTwOjHlDNKeyQqFOObG5P0+Y1JX9iC
 m+c31/2csoeRagXK2B6GnzzuKDWwFPhvxdF0HVDesI2t/EwOrFrcpI1RGQGHhtJCdFh9
 5xGxqyXcGrAlLRrdwJIsPvSy8AqvV0YVcxRlujfCsT01PWgw+AyyugEaUma+WVAcm9A3
 +/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BVNq6HKqRhIG4DoxJxFF+5gTjgFiu1ncAD+73fAIqbs=;
 b=liOc7Sg8u38rBGnHCkk7Dt31i5bVYWynd1eS+P8RuaoXn3whXaml5MJvuVmDP1fuNH
 p9JWOdT/YylRcQtvmcIOUV47NxYXoDTwNVz1gu/RVZpQJ2F/L8e2CArQswJrkj7SyWvD
 Nbc4IH4h1uNu6BC9SX219W5gGL758kVEs35PtvsoBRTg9yxluu2+KTahyZKuGcv/9nEO
 OywH9zHmq30W+AnKD6vapWoHpbm4EkdX10rzn/ZK+v84OQW4yACtZp+R6225PWFihAVC
 66mTi8usvH+brlUhsbxRVOvDjAFSinjWmCiQLso21pLbRzm/cQVxX27HqdBnIUXJP9gb
 UQUg==
X-Gm-Message-State: AOAM531dBXeecJR8ukQ3KGLqMVxhkjFYD4PWf0ugtcASLUW3Jy483GSu
 6Nme82Ce0CXL271m8NqtUWnnKO+02iI=
X-Google-Smtp-Source: ABdhPJzxVU54ziHwqzX0rpJxDNCCRJSEF+broQJzFgDAXN2g6cOVe7irnA1Ritwdo/2J/6SApZG05A==
X-Received: by 2002:a17:902:ced1:: with SMTP id
 d17mr4491444plg.78.1644447677032; 
 Wed, 09 Feb 2022 15:01:17 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id s29sm6711641pfw.159.2022.02.09.15.01.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 15:01:16 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 5/9] linux-user/cpu_loop: Add missing 'exec/cpu-all.h' header
Date: Thu, 10 Feb 2022 00:00:26 +0100
Message-Id: <20220209230030.93987-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209230030.93987-1-f4bug@amsat.org>
References: <20220209230030.93987-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

env_cpu() is declared in "exec/cpu-all.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/cpu_loop-common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
index dc0042e4de..b0fd1ea3b1 100644
--- a/linux-user/cpu_loop-common.h
+++ b/linux-user/cpu_loop-common.h
@@ -20,6 +20,7 @@
 #ifndef CPU_LOOP_COMMON_H
 #define CPU_LOOP_COMMON_H
 
+#include "exec/cpu-all.h"
 #include "exec/log.h"
 #include "special-errno.h"
 
-- 
2.34.1


