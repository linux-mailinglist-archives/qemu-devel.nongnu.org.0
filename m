Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48788511C91
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:24:12 +0200 (CEST)
Received: from localhost ([::1]:40126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njlOc-0000Qa-V9
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njlMU-00063C-It
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:22:00 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njlMS-00017i-Vq
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:21:58 -0400
Received: by mail-pg1-x536.google.com with SMTP id k14so1996195pga.0
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 10:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mz2/9eV0IoghSDMPYEyso5gtPhOCnLD/4wgUqk1RGY8=;
 b=cbQ6iqPsNB9xpp7yky/LieKx97cePwJc79UjjBZdG2WTqoPlyOW5VZQLJXaZpun2bI
 aCM27Tpdusuz6DRtnXoCVnjCV4o0DjTbdLmTT4zd5JuEiHdMzbsiSEgNgHOaafyXZoaA
 vDfBlwA5nRRGRuXgUfBfCSeM5VIhlX3UvwBBC+Ff47xOj1l+QBK/6HFA/7sTm2gk6WLG
 njZR9giDwPOdp4FjIiBqi/WpgRP1eqWunz51BE8t4Y2gU/DqJRqWO0T+UTWzBoxbzewb
 RBuAqrSQjG8HpwfQHAh5GwNGBuZt0K3v0OYmFg2LGLZ/bf6Ho6v1k66cnzJVN8/QveJ4
 ByAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mz2/9eV0IoghSDMPYEyso5gtPhOCnLD/4wgUqk1RGY8=;
 b=A/+Uu29pF+AqTg7jRJ6nowsAKyD1SE7U+nJdRsW4JE+MTmiCQjIDHpcI3VrvBGw89x
 7fME0IAZoYjg5Rjs/eEQLMvhscfujpGK3dbodozuMHAdPSoS0cYIId8K6T7L3BTaoVBj
 0lL9XQpoiYv8hXtRRQfaRMO5ku2ISapqyqnnikFjBmeTUio6o2N3h10btSiGFld4GZE7
 G4aA0WQhY7jsSEr1XOfwI0bQ2mVfpEEiEcQyjaXTa0i7ziFEyhaKhb+QraAp0ZewRRYN
 k0mwLFtUsVEZd4YFbAH2Axq0lLoKa6qes0p7qT5XN2eUGfV2akN3fvEeowbFTB4UaTIG
 3XCw==
X-Gm-Message-State: AOAM530cDCNm7Fk5a4oCqGxTUqcHmpJCq3cdMDMV6D8dGw5exw2XL+Jk
 sKQfc2ClQuB9r0pqo45/s/8QBjRtdjw=
X-Google-Smtp-Source: ABdhPJzUktSGOuKwryAmx/RY227cI+8UxHdNGvYsIFQe3t8QvKpoatAixd9x+3umTtLWEMPD/wmkXQ==
X-Received: by 2002:a65:524b:0:b0:383:1b87:2d21 with SMTP id
 q11-20020a65524b000000b003831b872d21mr24737101pgp.482.1651080115153; 
 Wed, 27 Apr 2022 10:21:55 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:76e8:b785:3fb9:b6d6])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00239000b004fa7103e13csm21202124pfc.41.2022.04.27.10.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 10:21:54 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] tests/tcg/xtensa: fix watchpoint test
Date: Wed, 27 Apr 2022 10:21:36 -0700
Message-Id: <20220427172140.1406059-4-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427172140.1406059-1-jcmvbkbc@gmail.com>
References: <20220427172140.1406059-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

xtensa core may have only one set of DBREAKA/DBREAKC registers. Don't
hardcode register numbers in the test as 0 and 1, use macros that only
index valid DBREAK* registers.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 tests/tcg/xtensa/test_break.S | 86 +++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 40 deletions(-)

diff --git a/tests/tcg/xtensa/test_break.S b/tests/tcg/xtensa/test_break.S
index 3379a3f9f06e..3aa18b5cec3f 100644
--- a/tests/tcg/xtensa/test_break.S
+++ b/tests/tcg/xtensa/test_break.S
@@ -200,64 +200,70 @@ test_end
 .endm
 
 #if XCHAL_NUM_DBREAK
+#define DB0 0
+#if XCHAL_NUM_DBREAK > 1
+#define DB1 1
+#else
+#define DB1 0
+#endif
 test dbreak_exact
-    dbreak_test 0, 0x4000003f, 0xd000007f, 0xd000007f, l8ui
-    dbreak_test 1, 0x4000003e, 0xd000007e, 0xd000007e, l16ui
-    dbreak_test 0, 0x4000003c, 0xd000007c, 0xd000007c, l32i
+    dbreak_test DB0, 0x4000003f, 0xd000007f, 0xd000007f, l8ui
+    dbreak_test DB1, 0x4000003e, 0xd000007e, 0xd000007e, l16ui
+    dbreak_test DB0, 0x4000003c, 0xd000007c, 0xd000007c, l32i
 
-    dbreak_test 1, 0x8000003f, 0xd000007f, 0xd000007f, s8i
-    dbreak_test 0, 0x8000003e, 0xd000007e, 0xd000007e, s16i
-    dbreak_test 1, 0x8000003c, 0xd000007c, 0xd000007c, s32i
+    dbreak_test DB1, 0x8000003f, 0xd000007f, 0xd000007f, s8i
+    dbreak_test DB0, 0x8000003e, 0xd000007e, 0xd000007e, s16i
+    dbreak_test DB1, 0x8000003c, 0xd000007c, 0xd000007c, s32i
 test_end
 
-test dbreak_overlap
-    dbreak_test 0, 0x4000003f, 0xd000007d, 0xd000007c, l16ui
-    dbreak_test 1, 0x4000003f, 0xd000007d, 0xd000007c, l32i
+test DBdbreak_overlap
+    dbreak_test DB0, 0x4000003f, 0xd000007d, 0xd000007c, l16ui
+    dbreak_test DB1, 0x4000003f, 0xd000007d, 0xd000007c, l32i
 
-    dbreak_test 0, 0x4000003e, 0xd000007e, 0xd000007f, l8ui
-    dbreak_test 1, 0x4000003e, 0xd000007e, 0xd000007c, l32i
+    dbreak_test DB0, 0x4000003e, 0xd000007e, 0xd000007f, l8ui
+    dbreak_test DB1, 0x4000003e, 0xd000007e, 0xd000007c, l32i
 
-    dbreak_test 0, 0x4000003c, 0xd000007c, 0xd000007d, l8ui
-    dbreak_test 1, 0x4000003c, 0xd000007c, 0xd000007c, l16ui
+    dbreak_test DB0, 0x4000003c, 0xd000007c, 0xd000007d, l8ui
+    dbreak_test DB1, 0x4000003c, 0xd000007c, 0xd000007c, l16ui
 
-    dbreak_test 0, 0x40000038, 0xd0000078, 0xd000007b, l8ui
-    dbreak_test 1, 0x40000038, 0xd0000078, 0xd000007a, l16ui
-    dbreak_test 0, 0x40000038, 0xd0000078, 0xd000007c, l32i
+    dbreak_test DB0, 0x40000038, 0xd0000078, 0xd000007b, l8ui
+    dbreak_test DB1, 0x40000038, 0xd0000078, 0xd000007a, l16ui
+    dbreak_test DB0, 0x40000038, 0xd0000078, 0xd000007c, l32i
 
-    dbreak_test 1, 0x40000030, 0xd0000070, 0xd0000075, l8ui
-    dbreak_test 0, 0x40000030, 0xd0000070, 0xd0000076, l16ui
-    dbreak_test 1, 0x40000030, 0xd0000070, 0xd0000078, l32i
+    dbreak_test DB1, 0x40000030, 0xd0000070, 0xd0000075, l8ui
+    dbreak_test DB0, 0x40000030, 0xd0000070, 0xd0000076, l16ui
+    dbreak_test DB1, 0x40000030, 0xd0000070, 0xd0000078, l32i
 
-    dbreak_test 0, 0x40000020, 0xd0000060, 0xd000006f, l8ui
-    dbreak_test 1, 0x40000020, 0xd0000060, 0xd0000070, l16ui
-    dbreak_test 0, 0x40000020, 0xd0000060, 0xd0000074, l32i
+    dbreak_test DB0, 0x40000020, 0xd0000060, 0xd000006f, l8ui
+    dbreak_test DB1, 0x40000020, 0xd0000060, 0xd0000070, l16ui
+    dbreak_test DB0, 0x40000020, 0xd0000060, 0xd0000074, l32i
 
 
-    dbreak_test 0, 0x8000003f, 0xd000007d, 0xd000007c, s16i
-    dbreak_test 1, 0x8000003f, 0xd000007d, 0xd000007c, s32i
+    dbreak_test DB0, 0x8000003f, 0xd000007d, 0xd000007c, s16i
+    dbreak_test DB1, 0x8000003f, 0xd000007d, 0xd000007c, s32i
 
-    dbreak_test 0, 0x8000003e, 0xd000007e, 0xd000007f, s8i
-    dbreak_test 1, 0x8000003e, 0xd000007e, 0xd000007c, s32i
+    dbreak_test DB0, 0x8000003e, 0xd000007e, 0xd000007f, s8i
+    dbreak_test DB1, 0x8000003e, 0xd000007e, 0xd000007c, s32i
 
-    dbreak_test 0, 0x8000003c, 0xd000007c, 0xd000007d, s8i
-    dbreak_test 1, 0x8000003c, 0xd000007c, 0xd000007c, s16i
+    dbreak_test DB0, 0x8000003c, 0xd000007c, 0xd000007d, s8i
+    dbreak_test DB1, 0x8000003c, 0xd000007c, 0xd000007c, s16i
 
-    dbreak_test 0, 0x80000038, 0xd0000078, 0xd000007b, s8i
-    dbreak_test 1, 0x80000038, 0xd0000078, 0xd000007a, s16i
-    dbreak_test 0, 0x80000038, 0xd0000078, 0xd000007c, s32i
+    dbreak_test DB0, 0x80000038, 0xd0000078, 0xd000007b, s8i
+    dbreak_test DB1, 0x80000038, 0xd0000078, 0xd000007a, s16i
+    dbreak_test DB0, 0x80000038, 0xd0000078, 0xd000007c, s32i
 
-    dbreak_test 1, 0x80000030, 0xd0000070, 0xd0000075, s8i
-    dbreak_test 0, 0x80000030, 0xd0000070, 0xd0000076, s16i
-    dbreak_test 1, 0x80000030, 0xd0000070, 0xd0000078, s32i
+    dbreak_test DB1, 0x80000030, 0xd0000070, 0xd0000075, s8i
+    dbreak_test DB0, 0x80000030, 0xd0000070, 0xd0000076, s16i
+    dbreak_test DB1, 0x80000030, 0xd0000070, 0xd0000078, s32i
 
-    dbreak_test 0, 0x80000020, 0xd0000060, 0xd000006f, s8i
-    dbreak_test 1, 0x80000020, 0xd0000060, 0xd0000070, s16i
-    dbreak_test 0, 0x80000020, 0xd0000060, 0xd0000074, s32i
+    dbreak_test DB0, 0x80000020, 0xd0000060, 0xd000006f, s8i
+    dbreak_test DB1, 0x80000020, 0xd0000060, 0xd0000070, s16i
+    dbreak_test DB0, 0x80000020, 0xd0000060, 0xd0000074, s32i
 test_end
 
-test dbreak_invalid
-    dbreak_test 0, 0x40000030, 0xd0000071, 0xd0000070, l16ui
-    dbreak_test 1, 0x40000035, 0xd0000072, 0xd0000070, l32i
+test DBdbreak_invalid
+    dbreak_test DB0, 0x40000030, 0xd0000071, 0xd0000070, l16ui
+    dbreak_test DB1, 0x40000035, 0xd0000072, 0xd0000070, l32i
 test_end
 #endif
 
-- 
2.30.2


