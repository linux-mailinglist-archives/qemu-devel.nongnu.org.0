Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB6E64F9D9
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 16:27:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Z3y-0003Ru-Ud; Sat, 17 Dec 2022 10:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Z3v-0003RI-Rc
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 10:25:19 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Z3t-0005Pg-4v
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 10:25:19 -0500
Received: by mail-ed1-x52a.google.com with SMTP id c17so7356763edj.13
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 07:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m3BLA48xNHLVgpYtc5xcAlbVIvNCftpdVHH8TeBr2fM=;
 b=ap1mJF0AaUvEOAbk2a+bCaChfHX0HNw7ei51hoapYvVdLctPOSsJsHc/n8VA707MkE
 gpyR85b+A6RbRQK7K8szl6Z+eM9RtGWL+or9F9rNnc7zmOcmTnF1xaZsxkEvDmr2TDlb
 +eRWhG+GjuVCQB6JZKAYT64qlutv/n9uypru7KYeCdgZEu3CqlLCalTsuqTaAywPC5mJ
 3fdgX197zxDkzU7qBN291FueRr/XuNa6FL5fGz7RYzEc9lVWiJn60HgXSdLK9ZQF3aaR
 yk4zspviXTzYGAVbnHCtJWpvPradsSk9ec2pmMrSngNycauVFEFIdkDk7IgLC6fbbBAX
 g2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m3BLA48xNHLVgpYtc5xcAlbVIvNCftpdVHH8TeBr2fM=;
 b=5HBccS7RLxXhDQWfv3FUgwuyiZ88JChFtW+LsKOKTVq1a6xI6HnCHqusR6Z3/0mJQo
 bEZMlNjzX9AoI5mjLlHwTceqL4t3II6l/BOo6ej2cgsZ9Ss07CzNi1vJoCeLZ8W6ag9d
 MoItPve8/bH4G4ahJweJNEiJr26DeM6zkUw1Mk7EDfAb1jFi2TJyCnxxnaIctyalSeR1
 jKGwEs3iWatJovNGb/ugKLtckVL5rppvQDf5AQFWZ9d5sQVPdIqvSp3bS7yO2CthQ7uZ
 Kd9j+GYMyyVgfSJtQkuNGVPpWbxkHBWy57UYTFKmo1s5w6iW2MgT3eZbamu1ke825XxY
 i5Mg==
X-Gm-Message-State: ANoB5plcJPag2BoOAd+xxfEYeX844JAug3+0XmZGkNLsUY8wjyYBfFS7
 R7+FldwKioy0KzG6ryNcc0EQhlMbBS5aAcUwfq4=
X-Google-Smtp-Source: AA0mqf4B4qqEnoq375KBhj8j3Mq6hadm761+SAVVMhqGg0p1nFplAjoimnpqvHQsrpHm5lynFkYoGQ==
X-Received: by 2002:a05:6402:7ca:b0:46b:aa:8564 with SMTP id
 u10-20020a05640207ca00b0046b00aa8564mr27004505edy.30.1671290715342; 
 Sat, 17 Dec 2022 07:25:15 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ck29-20020a0564021c1d00b0046f73b46c5csm2071998edb.23.2022.12.17.07.25.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 07:25:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 3/5] hw/s390x/pv: Restrict Protected Virtualization to
 sysemu
Date: Sat, 17 Dec 2022 16:24:52 +0100
Message-Id: <20221217152454.96388-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217152454.96388-1-philmd@linaro.org>
References: <20221217152454.96388-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Protected Virtualization is irrelevant in user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/cpu_features.c | 4 ++++
 target/s390x/cpu_models.c   | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/s390x/cpu_features.c b/target/s390x/cpu_features.c
index 5528acd082..2e4e11d264 100644
--- a/target/s390x/cpu_features.c
+++ b/target/s390x/cpu_features.c
@@ -14,7 +14,9 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "cpu_features.h"
+#ifndef CONFIG_USER_ONLY
 #include "hw/s390x/pv.h"
+#endif
 
 #define DEF_FEAT(_FEAT, _NAME, _TYPE, _BIT, _DESC) \
     [S390_FEAT_##_FEAT] = {                        \
@@ -107,6 +109,7 @@ void s390_fill_feat_block(const S390FeatBitmap features, S390FeatType type,
         feat = find_next_bit(features, S390_FEAT_MAX, feat + 1);
     }
 
+#ifndef CONFIG_USER_ONLY
     if (!s390_is_pv()) {
         return;
     }
@@ -147,6 +150,7 @@ void s390_fill_feat_block(const S390FeatBitmap features, S390FeatType type,
     default:
         return;
     }
+#endif
 }
 
 void s390_add_from_feat_block(S390FeatBitmap features, S390FeatType type,
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index c3a4f80633..065ec6d66c 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -23,8 +23,8 @@
 #include "qemu/qemu-print.h"
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/sysemu.h"
-#endif
 #include "hw/s390x/pv.h"
+#endif
 
 #define CPUDEF_INIT(_type, _gen, _ec_ga, _mha_pow, _hmfai, _name, _desc) \
     {                                                                    \
@@ -236,6 +236,7 @@ bool s390_has_feat(S390Feat feat)
         return 0;
     }
 
+#ifndef CONFIG_USER_ONLY
     if (s390_is_pv()) {
         switch (feat) {
         case S390_FEAT_DIAG_318:
@@ -259,6 +260,7 @@ bool s390_has_feat(S390Feat feat)
             break;
         }
     }
+#endif
     return test_bit(feat, cpu->model->features);
 }
 
-- 
2.38.1


