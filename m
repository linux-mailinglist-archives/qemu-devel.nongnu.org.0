Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3723368C3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:35:05 +0100 (CET)
Received: from localhost ([::1]:33034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9I8-0003Vj-U8
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:35:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95z-000532-Qf
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:31 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:46938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95v-0001QW-7T
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:31 -0500
Received: by mail-ot1-x331.google.com with SMTP id r24so11235580otq.13
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PoqRbki7Idn5iHV7K8YoFRN0OhEMVywDMAwVqD1I+wc=;
 b=nAMLd4773x3rf+PhLz60xdREgc7RWftCi/5OVX0KTFU9/ykLS32Z91yC7bpyij3fwV
 japhrUArr1YPAlGR6nqu93COZzqpAkitBAsf/Kuf3BRv60DZa6OMNmEeV/EXgfkqrN0Q
 OT2JI5dcPJqViha3kx7aVUxfGKpIS+PElNmkvS0tE5dj0EoNHlNCOfkCXlhCyHB5RRq/
 HRs/0I52qLggb1he7tVHpQunlH+iS8RxIGYUi2TQ/Vhi91mgRFIWJdgMaXoptNuVEVoH
 VpKO0mGIDar4U8P26a4awJT5NKy3SuFniCL4yGHBuvvAilX5DzgUyq5asWUjLBVSaQc8
 WIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PoqRbki7Idn5iHV7K8YoFRN0OhEMVywDMAwVqD1I+wc=;
 b=Ce2IzjSEsaikQcwpgVkGxRRZKBKt4KP/6n4mMfCqlmD4LqGB4T58YaIgXurCu8OR4X
 IHCkEmsBTGOQb7K8Nme5Yu+UmK+1C+m+sy58nSzNZa3kKYQCz6OBigqH2Aq7q4lWi4Ft
 iqpOz/S3a7SsjNq8Q7JuurDnaO4Yx+aP5Ai0Kr/GpLGQr8ZJ+osJctnr/Nhi76GEtun6
 WZv3+eDFzAXXzXcE6P7S1NF1F7Vb5C2nr1d//sdusd9pVY8XOkKloQZQRafORrpigBHg
 j4XABayaT4Tib5QhNa/bsCbCNImTjA4OUDxTkTWexmXYe+4BNuGTo/pceIMNzkIxT5qR
 XdWQ==
X-Gm-Message-State: AOAM532eEi2ukcwhomjcSZPe06seeohiyytOok4giFSsLsjhyzGrlcpm
 pNIQYWaiVKVKZtDMN17SG+PN9Yol3OcxPxtc
X-Google-Smtp-Source: ABdhPJysKI6lhBYqTcHAFbS56cLz3cX050Al2gZGyVy5a3dPtg9F99NBBKNuxNo8jTZ6aO+yDgQUUw==
X-Received: by 2002:a05:6830:401c:: with SMTP id
 h28mr4518143ots.347.1615422145816; 
 Wed, 10 Mar 2021 16:22:25 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/26] tcg: Sink qemu_madvise call to common code
Date: Wed, 10 Mar 2021 18:21:52 -0600
Message-Id: <20210311002156.253711-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the call out of the N versions of alloc_code_gen_buffer
and into tcg_region_init.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index f25ec1ecad..7640aac243 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -518,7 +518,6 @@ static int alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
         error_setg_errno(errp, errno, "mprotect of jit buffer");
         return false;
     }
-    qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
 
     region.start_aligned = buf;
     region.total_size = size;
@@ -594,9 +593,6 @@ static int alloc_code_gen_buffer_anon(size_t size, int prot,
     }
 #endif
 
-    /* Request large pages for the buffer.  */
-    qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
-
     region.start_aligned = buf;
     region.total_size = size;
     return prot;
@@ -646,9 +642,6 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
     region.total_size = size;
     tcg_splitwx_diff = buf_rx - buf_rw;
 
-    /* Request large pages for the buffer and the splitwx.  */
-    qemu_madvise(buf_rw, size, QEMU_MADV_HUGEPAGE);
-    qemu_madvise(buf_rx, size, QEMU_MADV_HUGEPAGE);
     return PROT_READ | PROT_WRITE;
 
  fail_rx:
@@ -817,6 +810,13 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
                                       splitwx, &error_fatal);
     assert(have_prot >= 0);
 
+    /* Request large pages for the buffer and the splitwx.  */
+    qemu_madvise(region.start_aligned, region.total_size, QEMU_MADV_HUGEPAGE);
+    if (tcg_splitwx_diff) {
+        qemu_madvise(region.start_aligned + tcg_splitwx_diff,
+                     region.total_size, QEMU_MADV_HUGEPAGE);
+    }
+
     /*
      * Make region_size a multiple of page_size, using aligned as the start.
      * As a result of this we might end up with a few extra pages at the end of
-- 
2.25.1


