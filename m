Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 471CB6F4814
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:11:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsZ1-0002r8-2Q; Tue, 02 May 2023 12:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYq-0002oJ-M1
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:04 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYn-0000lT-Id
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:04 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3062678861fso2193438f8f.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043738; x=1685635738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/VkzTTqO3D6h3H85l5Fuk7F2N9PjLSut9TQvQbh7t8=;
 b=gAQsTkjnll3StMQpBK++s438VyluyAXkbKheuaQIz9WAMZpMUMdTYJWWMzCmQY/J2o
 fVbn7p4lgLguKBKXu3LXaOvLVubXFD9/BM4F6IYuDpW3NkRG5DRVfU/dMww8DN4YksN/
 9HvELRkjPslKu6Etn24xJOF45Mez0hGSXnS2ejNzJWBfuKNYrlThM+pBVDOPA/es4bWp
 /IvbrA2JZWObha9EsufOJikL/p6LecoQzjKcl4HgeLYA6YH4jtddNK2k8TPq4/nJMP/L
 86WSUEsVHJmf+S7ArnRu2J0SvRk5lPpwhESS8HfFSB3ZxqkHSJFvBuWS2Y1dwpn9b5dn
 A5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043738; x=1685635738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V/VkzTTqO3D6h3H85l5Fuk7F2N9PjLSut9TQvQbh7t8=;
 b=CN4XhFdpraQLR5GZ4vrxycucCTd4jyySitmH2CeDosnRLd5kE9d2iy49nsaUS1nD9t
 oLgKKG0Wfc4HH0ybYMnI0KE0GkabyRlhtkWv3y/JKbfxQS3JFmRllBEbAaqvDsMyrwxB
 Vy/W9kG8jFrZT+zOiaxZCy1cKU2WN2OSVFcGVTJWjIaGf/3lNUAwvbsTNIemB8wLWkOL
 GOyUhan5YL2cSjOiaQImnkWH8uol3gV6janLFsTzyJBXgDYiXNXc0/dU4x47kGg09MO0
 IljC1O8qBLWYbIlYGjDDBBfEv8NYix5KE/+RC4Mb9KOXQ3JCxGn0rUf+2/smuosbkmd1
 jWXQ==
X-Gm-Message-State: AC+VfDwcW/HK3Ocmw4XS4a4fMaVXV+h0gr53O9fvBZvM7EfDA3gSrfcF
 pH37HAtwXlECtqnzCJCYsL5GxMLtwAHW6EN1UWOQhg==
X-Google-Smtp-Source: ACHHUZ6+gIbaMj5jEx/1hiNq95Mztdeyou/iZbFn2kq14KS5JVBNQBpcycuacJqTdSeU6zcCAMC3QQ==
X-Received: by 2002:a5d:5492:0:b0:304:a984:7cb5 with SMTP id
 h18-20020a5d5492000000b00304a9847cb5mr12472753wrv.50.1683043738616; 
 Tue, 02 May 2023 09:08:58 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003ede3f5c81fsm39918471wmo.41.2023.05.02.09.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:08:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
Subject: [PATCH 16/16] tcg: Remove TARGET_ALIGNED_ONLY
Date: Tue,  2 May 2023 17:08:46 +0100
Message-Id: <20230502160846.1289975-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502160846.1289975-1-richard.henderson@linaro.org>
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

All uses have now been expunged.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memop.h  | 13 ++-----------
 include/exec/poison.h |  1 -
 tcg/tcg.c             |  5 -----
 3 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 25d027434a..07f5f88188 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -47,8 +47,6 @@ typedef enum MemOp {
      * MO_UNALN accesses are never checked for alignment.
      * MO_ALIGN accesses will result in a call to the CPU's
      * do_unaligned_access hook if the guest address is not aligned.
-     * The default depends on whether the target CPU defines
-     * TARGET_ALIGNED_ONLY.
      *
      * Some architectures (e.g. ARMv8) need the address which is aligned
      * to a size more than the size of the memory access.
@@ -65,21 +63,14 @@ typedef enum MemOp {
      */
     MO_ASHIFT = 5,
     MO_AMASK = 0x7 << MO_ASHIFT,
-#ifdef NEED_CPU_H
-#ifdef TARGET_ALIGNED_ONLY
-    MO_ALIGN = 0,
-    MO_UNALN = MO_AMASK,
-#else
-    MO_ALIGN = MO_AMASK,
-    MO_UNALN = 0,
-#endif
-#endif
+    MO_UNALN    = 0,
     MO_ALIGN_2  = 1 << MO_ASHIFT,
     MO_ALIGN_4  = 2 << MO_ASHIFT,
     MO_ALIGN_8  = 3 << MO_ASHIFT,
     MO_ALIGN_16 = 4 << MO_ASHIFT,
     MO_ALIGN_32 = 5 << MO_ASHIFT,
     MO_ALIGN_64 = 6 << MO_ASHIFT,
+    MO_ALIGN    = MO_AMASK,
 
     /* Combinations of the above, for ease of use.  */
     MO_UB    = MO_8,
diff --git a/include/exec/poison.h b/include/exec/poison.h
index 140daa4a85..256736e11a 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -35,7 +35,6 @@
 #pragma GCC poison TARGET_TRICORE
 #pragma GCC poison TARGET_XTENSA
 
-#pragma GCC poison TARGET_ALIGNED_ONLY
 #pragma GCC poison TARGET_HAS_BFLT
 #pragma GCC poison TARGET_NAME
 #pragma GCC poison TARGET_SUPPORTS_MTTCG
diff --git a/tcg/tcg.c b/tcg/tcg.c
index cfd3262a4a..2ce9dba25c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2071,13 +2071,8 @@ static const char * const ldst_name[] =
 };
 
 static const char * const alignment_name[(MO_AMASK >> MO_ASHIFT) + 1] = {
-#ifdef TARGET_ALIGNED_ONLY
-    [MO_UNALN >> MO_ASHIFT]    = "un+",
-    [MO_ALIGN >> MO_ASHIFT]    = "",
-#else
     [MO_UNALN >> MO_ASHIFT]    = "",
     [MO_ALIGN >> MO_ASHIFT]    = "al+",
-#endif
     [MO_ALIGN_2 >> MO_ASHIFT]  = "al2+",
     [MO_ALIGN_4 >> MO_ASHIFT]  = "al4+",
     [MO_ALIGN_8 >> MO_ASHIFT]  = "al8+",
-- 
2.34.1


