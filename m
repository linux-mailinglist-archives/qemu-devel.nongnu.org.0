Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBB14A8E9D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:38:21 +0100 (CET)
Received: from localhost ([::1]:42088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFis0-0001dX-ET
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:38:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhwq-0004WM-N3
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:39:19 -0500
Received: from [2607:f8b0:4864:20::434] (port=44704
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhwn-00065x-Vt
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:39:16 -0500
Received: by mail-pf1-x434.google.com with SMTP id n32so3061680pfv.11
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V8C3ToT7n1VbWIxeaFpS+4I7wWNBoxOKoMh2cKmuHT4=;
 b=hU+GCXV3mVt6oYgSnF/z2fkP65lcY7+R8Jsdvyc8EofmNjXXMmQJbcOI+AdaQsW2Gy
 6l9F0WI7Tyzcdwqo1QfalVuOvE+nCIjibSV1Xww3ERKlIpIM+J0zLQB5j4c1MXweE1wl
 LtGejqp0cyCB8jcry7Mv3OkuTxEWbZ+pu0e1pCJzzGg8Lo226De+65uEiPRtezfgc+4D
 pGIiXF5mYk5yMMkZ67QU+B1eCVGQOh+VS16AedCYqbm0ksokgJykkMCRoqX8nApqREC2
 hXKm9htomzJVjqYNjwYIop3QGbEbVcc/gwomlQoTpLZqrn/fZB5EtKU6uuqn4OFlvfeS
 jbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V8C3ToT7n1VbWIxeaFpS+4I7wWNBoxOKoMh2cKmuHT4=;
 b=Vzx0U++ghQkQLp76VYwnbmzpKLaqLwfUfGxTXmsleu3ZXkxJiOUXSlHo3E0DZlV79w
 ow3hc+Sn2KvML150zdRkSwC9hpF5NBXmNYT4L116m/8QJaTBvO9Oib6xk77MAaAMvU6G
 PJvlHE8Ygv6cgF/+dApiZsmWOoCwQY8yentViBhMS7pUKUsEURdhhpocBl3nlHSq0gqc
 fxTknYSEzJ1gA1IBe36c6I3+yfbMbk9Mgt4gBxcMJB93gu6iTBj1OImn088g5nd/c6qi
 DSUdSJzsw4a8dli3XuNa4vFI9i0hi7bdtmNVXo9E9N1XBfgA2GUTNZlJP8sUMT6qWRNv
 pbzQ==
X-Gm-Message-State: AOAM532ZPgbwC2SzKo+UXJQV0l3oz3qDN+RvoyEfJcjPTrUWa2yozXfe
 9mQwfTytEBjPdW8kOkOtezAohzMuUeM=
X-Google-Smtp-Source: ABdhPJzS75FeNiAgI5sFcq2GR9cq/bmIk2mLdwg6/slzU16+11nZOVG5qSKtIUSdgM3hrNNGAPu1Vg==
X-Received: by 2002:a05:6a00:1693:: with SMTP id
 k19mr35227296pfc.71.1643917152566; 
 Thu, 03 Feb 2022 11:39:12 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id kx11sm10767188pjb.1.2022.02.03.11.39.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:39:12 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 08/10] target: Add missing "qemu/timer.h" include
Date: Thu,  3 Feb 2022 20:38:01 +0100
Message-Id: <20220203193803.45671-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203193803.45671-1-f4bug@amsat.org>
References: <20220203193803.45671-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

cpu_get_host_ticks() and NANOSECONDS_PER_SECOND are declared
in "qemu/timer.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.c      | 1 +
 target/arm/helper.c   | 1 +
 target/hppa/cpu.c     | 1 +
 target/riscv/csr.c    | 1 +
 target/sparc/helper.c | 1 +
 5 files changed, 5 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index cdbc4cdd01..9555f6707b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/qemu-print.h"
+#include "qemu/timer.h"
 #include "qemu-common.h"
 #include "target/arm/idau.h"
 #include "qemu/module.h"
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6dd241fbef..e39faa2a98 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -15,6 +15,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "qemu/main-loop.h"
+#include "qemu/timer.h"
 #include "qemu/bitops.h"
 #include "qemu/crc32c.h"
 #include "qemu/qemu-print.h"
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 37b763fca0..5f46ba801e 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/qemu-print.h"
+#include "qemu/timer.h"
 #include "cpu.h"
 #include "qemu/module.h"
 #include "exec/exec-all.h"
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a4db40769b..45f04c701a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/timer.h"
 #include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
diff --git a/target/sparc/helper.c b/target/sparc/helper.c
index c7bcaa3a20..c4358bba84 100644
--- a/target/sparc/helper.c
+++ b/target/sparc/helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "qemu/timer.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 
-- 
2.34.1


