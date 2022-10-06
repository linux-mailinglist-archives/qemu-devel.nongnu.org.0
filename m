Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08295F5F64
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:18:58 +0200 (CEST)
Received: from localhost ([::1]:41942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogHPV-0008Ij-WF
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIQ-0005xO-7s
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:38 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:34484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHIO-0006zz-Kt
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:11:37 -0400
Received: by mail-pl1-x62d.google.com with SMTP id n7so564520plp.1
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OimgKPWxXttsQO5Dv6OTe57j981fAqdAef8EXWzK2aE=;
 b=d7UW0XEMHs3SC7qdJUnCK6h/RSp0P+EEVn9Du/CRFJe6FJzVBpaGiBZzeBRFwIGUNX
 8eGXxIafTmb/Es8/NL0WhBscTXKw23arfvj/RjkdWmMTtiTEmXYqmJ1K+5MkAmFkGq+7
 5irLhC+PACYWvzFHT2XnyUCESad3XIH/xh8iASE8kiA6a+Qhq1u4hOM9Wognm59QjZ4t
 km5bzTNNBF2KXq7EbloMp7tTABS2bRgJ6EKGLxZ9zR+frLcJGQqp7wBP8b26xC55JGL9
 8gq0HhtrQrm2Pjmw0G9UhFghXtUhGjJqfxLo99T3EU2GzPcxsj4TCLDibUxLT7S+z+X7
 QUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OimgKPWxXttsQO5Dv6OTe57j981fAqdAef8EXWzK2aE=;
 b=HpzfCrXg2kINx1cN8AuyIWrOrdqoQ52O4iJI5GtO3EI4s3rCGwSCnmVwnhgyr6l/1C
 YFWZmeuTmFjSj5h+9UWQkFpLgoQPO4dmBSMRGug3eDcehUWOsytBLkUrGner1p5CGtwu
 TzsMd9sAWjNDMAxMf3CXFa68luVB+s+dtqve7AHIxUES3U6OsTZ0woLFN1RlgO4aLTCF
 i1VvXDvcRkv/Iyl3urpo2H5GEAyfPJTQovIv1WZbGv5hcKdhGuCNlBsqOkUnJtEkjDHD
 JW2zAdAFKhh3qXRuvp9pBUtmx1I1++ZCYuANQE/Opj7D+lkxR0nP409Xg8RDI7axaSYr
 d17A==
X-Gm-Message-State: ACrzQf0DNX0EYzWWv3NUuhmivjUQdDr7mUG+vvHYMaieFRMq4EAVoy5g
 08i+6vkF/A+B9IUNZTEobfrdS1xbSJDiMQ==
X-Google-Smtp-Source: AMsMyM6VleQNPqzi83rcHOxFps4MGi38WA6dWVuYKrI5U/7QAVc46yLr8vF6E1zMf3CP9yZynMZOtg==
X-Received: by 2002:a17:90b:3146:b0:20a:f817:d620 with SMTP id
 ip6-20020a17090b314600b0020af817d620mr3895717pjb.220.1665025895286; 
 Wed, 05 Oct 2022 20:11:35 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 u128-20020a627986000000b0056281da3bcbsm58360pfc.149.2022.10.05.20.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:11:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: [PATCH 16/24] accel/tcg: Use page_reset_target_data in page_set_flags
Date: Wed,  5 Oct 2022 20:11:05 -0700
Message-Id: <20221006031113.1139454-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006031113.1139454-1-richard.henderson@linaro.org>
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Use the existing function for clearing target data.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index e002981a9f..0006290694 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1370,6 +1370,9 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
         flags |= PAGE_WRITE_ORG;
     }
     reset = !(flags & PAGE_VALID) || (flags & PAGE_RESET);
+    if (reset) {
+        page_reset_target_data(start, end);
+    }
     flags &= ~PAGE_RESET;
 
     for (addr = start, len = end - start;
@@ -1387,14 +1390,8 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
                 (flags & ~p->flags & PAGE_WRITE))) {
             tb_invalidate_phys_page(addr);
         }
-        if (reset) {
-            g_free(p->target_data);
-            p->target_data = NULL;
-            p->flags = flags;
-        } else {
-            /* Using mprotect on a page does not change sticky bits. */
-            p->flags = (p->flags & PAGE_STICKY) | flags;
-        }
+        /* Using mprotect on a page does not change sticky bits. */
+        p->flags = (reset ? 0 : p->flags & PAGE_STICKY) | flags;
     }
 }
 
-- 
2.34.1


