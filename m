Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F104E2EF6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 18:21:59 +0100 (CET)
Received: from localhost ([::1]:54836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLjB-0001Cz-RG
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 13:21:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nWLhZ-0000U4-UH
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:20:18 -0400
Received: from [2607:f8b0:4864:20::42c] (port=46919
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nWLhW-0001hb-Un
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:20:17 -0400
Received: by mail-pf1-x42c.google.com with SMTP id s11so15990598pfu.13
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 10:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5vnJQuGmsx8Lwg6VQPxPOntEQsXQqrO5kNZiFbFwlqU=;
 b=jQvv3OOB/Y5SeLDxP5AzrQ82+/9xaQmA/GnagJ1CJr6xEr+3nkWRgKynzUJQ37AJEh
 kPGpoYiT2qmHVPSIbrOScM3veqrP3BZzamqkG4Zgp+MRpfDgScNlpQZnEKI6sJWxuKLC
 75AKd92isv5OJWqxw+O2W0HotVk+NGgM0d/Drv0AsBvnSYxddxTdmiL86wBSBbSazqWf
 wTrDmWd8qc9kk+iJg3xGpOmHeYlVqxPmYzpzFT51uqfdY23h80igorxP56Auo0cjXZlB
 9amkGIuQWsV3qyC2ndSBeH+zqNTgRuwKMDzZbpl/bBPNsP2RhIRu39cXu5Oob7+dlHRO
 +fBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5vnJQuGmsx8Lwg6VQPxPOntEQsXQqrO5kNZiFbFwlqU=;
 b=lTTcDsRd6VpvUTfGDWms8vzRCcDcsYbS+GLFSfCwdB2hl7XSClheTDG4NwPbHk2mDC
 vQe8F2MYs7LFCkoOCjC2VzvI8d6skB3tTu9EMzwvqrZi4RS4I0DiH4g1m6grhYGVUyhx
 eqcYAGKSkm0jOVO/8XyrdSvI9anKCdAwGqsXsWO44S7pPPezZKyorrQ++IhSurjdUhzA
 eUGdZD+AZ0Ttg2qrXk7Tzw0NM3Cc4v8LpqWkreqZugFudJjRPPe5TUHx/+2+I03onFsf
 7IeDe3aTXIWkp/JApVb1nRJ5Zxxg7iCJPZ5dWTOR25IDtVolrqjGFWmJj+ra6/D5whBt
 tYpA==
X-Gm-Message-State: AOAM532riL+QQwAvS/XGTmhxirvnamF9K6y2VZp/aUvhoRokxq0AarRM
 5y3d1yYHfEo2B6UVQknIfFFNwCi4asjzCA==
X-Google-Smtp-Source: ABdhPJzLko7s0DiMgUjGr0BDovJBnXVCaq0Aab5WBDSERau5vG4eAfYTweFd4Zrpg6sHoq3q6hQBiw==
X-Received: by 2002:a65:49cc:0:b0:372:a079:cb3a with SMTP id
 t12-20020a6549cc000000b00372a079cb3amr18688961pgs.222.1647883209190; 
 Mon, 21 Mar 2022 10:20:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b004e17ab23340sm20924748pfh.177.2022.03.21.10.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 10:20:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
 systems
Date: Mon, 21 Mar 2022 10:20:06 -0700
Message-Id: <20220321172006.3014516-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=raj.khem@gmail.com; helo=mail-pf1-x42c.google.com
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

linux only wires MAP_SYNC and MAP_SHARED_VALIDATE for architectures
which include asm-generic/mman.h and mips/powerpc are not including this
file in linux/mman.h, therefore these should be defined for such
architectures on Linux as well. This fixes build on mips/musl/linux

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Zhang Yi <yi.z.zhang@linux.intel.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
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


