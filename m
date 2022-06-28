Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A62A655BF0E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:26:21 +0200 (CEST)
Received: from localhost ([::1]:44272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65c4-0000SW-Mc
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63K8-0002g1-L7
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:40 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63K6-0000b7-65
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:39 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 w19-20020a17090a8a1300b001ec79064d8dso14659316pjn.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lp6xOv80VDFzS9xxN19WiasmRSXfzVX2i/YL5INbRnk=;
 b=a5GrIpalYDaQk+Uok6mZnjYvJJsgtxHZKiE3IC3ZgPXHNW1mgXguWDo05VL3k4su1x
 0BilF4u1GY6N2ILosi/+PTaA7Lzy2nGLHxjEnKubGlyzxZcQEuGaYjFuZQNK5MNC3Y7J
 g8KMomRhLPl1iHiXTyMNIF23tu0Fc3Hn918jVLisOFyFc34IGUB7UmfXL2aE25d9Jc9w
 mKiKykP9rv70B6rfO3z7732nz051dBxXGHZdTuDrAOgDjHJ5qFOcx3MtnkoQsO61FM+5
 JTJNha3J+0iHM1EbJBPNng1/hdI1kVJVTFtVgf4bZiTd0In4i2uSDw/xLk5PGHldCqa8
 Ebig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lp6xOv80VDFzS9xxN19WiasmRSXfzVX2i/YL5INbRnk=;
 b=fkavQf0QTADY7L1xjw2a6dtiWjS5tBoQysooPToK6wn761AlTfGeEtOpbgj0JcHivH
 fZOBUlhS3qSjaV6P3i36gtG5oYFjo0wRD/a91DzweI4r56BWdSmvjVawfhTkcvXZsxDH
 8IjLKvcLjp1376yyZ0NeKyf2oKfBn5G60HeIfOWaKpi6VZXK5O6sU35z/wBXlanDzMKY
 822z1PVdiBuZQ9ultKcTC3by+9IFORW0/Ta7E9Ig+DfrnuQcm20RPq2JrJBfFSm1l/Of
 ZaYmCgegX5if1VOvJ76Z2iNp4njP+4QiEqxSriV6akMBkCgcEt8XmwDE8xJ8eZArslVF
 hyjg==
X-Gm-Message-State: AJIora9msDFuBXr7qSvj0z0NJDIjKu9XXFyAC1enxGocPBJImEGg/ZXy
 51WXsxtLYyOrWqiVzSoT0zOvyR3d8i6Zzw==
X-Google-Smtp-Source: AGRyM1s+92dYdhK5A2bzmzpoHISz/46VChsxPDgFpfbdt20ENovEQC9ejBVo6PN8sbeDEP3ZaiN4Cw==
X-Received: by 2002:a17:90b:3ec6:b0:1ec:ac25:ce6f with SMTP id
 rm6-20020a17090b3ec600b001ecac25ce6fmr24619521pjb.203.1656392376219; 
 Mon, 27 Jun 2022 21:59:36 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:59:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 60/60] target/nios2: Move nios2-semi.c to nios2_softmmu_ss
Date: Tue, 28 Jun 2022 10:24:03 +0530
Message-Id: <20220628045403.508716-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Semihosting is not enabled for nios2-linux-user.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/nios2-semi.c | 5 -----
 target/nios2/meson.build  | 4 ++--
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index bdf8849689..55061bb2dc 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -22,14 +22,9 @@
  */
 
 #include "qemu/osdep.h"
-
 #include "cpu.h"
 #include "exec/gdbstub.h"
-#if defined(CONFIG_USER_ONLY)
-#include "qemu.h"
-#else
 #include "semihosting/softmmu-uaccess.h"
-#endif
 #include "qemu/log.h"
 
 #define HOSTED_EXIT  0
diff --git a/target/nios2/meson.build b/target/nios2/meson.build
index 2bd60ba306..c6e2243cc3 100644
--- a/target/nios2/meson.build
+++ b/target/nios2/meson.build
@@ -1,7 +1,6 @@
 nios2_ss = ss.source_set()
 nios2_ss.add(files(
   'cpu.c',
-  'nios2-semi.c',
   'op_helper.c',
   'translate.c',
 ))
@@ -10,7 +9,8 @@ nios2_softmmu_ss = ss.source_set()
 nios2_softmmu_ss.add(files(
   'helper.c',
   'monitor.c',
-  'mmu.c'
+  'mmu.c',
+  'nios2-semi.c',
 ))
 
 target_arch += {'nios2': nios2_ss}
-- 
2.34.1


