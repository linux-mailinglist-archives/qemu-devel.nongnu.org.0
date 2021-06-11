Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96C23A4B98
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 02:06:39 +0200 (CEST)
Received: from localhost ([::1]:32988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrrAc-0007JN-VF
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 20:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmp-0002xd-R0
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:03 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmn-0002ji-81
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:03 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso6852360pjb.4
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oGlm/QkFrT3k7s3B4Mdy2N+YuMxL0+85EjDFAhTeOqA=;
 b=Ec6x/vq2wkKpCa2bzY9c0MUR1Jgjz6JvfO5KTP/n+Fg0psi2PzlBpXcPINJx+Wfzj+
 aGnhrzRyDEgswHNGnP/kq6FowPybs8rCbaBKAg7m8Wt4SFNl8nzoVlqn/s6Sof7LIBdW
 Co5Jmu1c9wUlAgTqIh/akT8OUrR8ycRTDx6t5MPfKs9UIQoq/p1ZrXF6QvkCoGzle33w
 DP9GsKCT9lHn2W0ex39gup8tEmxRoq1zM1Ce3ODlXhv5UxS276+GHvfe5V1Kphu+YGvj
 OSl/d4CzGGVB7fETBSTf/U0pdcBaA6IxNQqeC0yOQjuF0aSaN7yoq8odrDMQmBDcG6pu
 iPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oGlm/QkFrT3k7s3B4Mdy2N+YuMxL0+85EjDFAhTeOqA=;
 b=giz0DK6xulNqt5XN5tL8v0HVx4faodv7wGCLDRShyTLoExFS3JXmdqVBQgBCZV0jET
 eYa0UN3ZPy2I0EJasgu5DTY0NW68sXaSMbB8MuffOFejCbTSlxgg2PL/GlM4oa3D+gJF
 qHepn5tnlxWq2YoQoVheV4H88or73ApZn+lHQetFNc4JY98g/W/lwv451Fqjy2Cdqu1Y
 sb8EuCwfhn79yYBil66tSBUStakW95+SpJCEq7MrjHw8Mb/0PdDkIVWhFwf7Zcck7sgJ
 TxbKAKqA6+5V5jt6Upj1T5DsUIPqP7lSNOWc8wfK2LDyxaWdluBsXK0ivnP5L0vP2JD6
 cXWA==
X-Gm-Message-State: AOAM531MyKS5OcBYV2l9BEVFZXnlkk9CJPDHbeY/2BjW/TT/tFu9Fi+J
 bi5OSmITQ/DU4thCGp+r9lwmk8Oc2qwmzg==
X-Google-Smtp-Source: ABdhPJwmsmhiwQtT8W6R3p7XXJIqueh10qXqlzYD0sGPvco5Y23vd9j6J8EviBpQCLLO6TuVv02uYQ==
X-Received: by 2002:a17:90a:4404:: with SMTP id
 s4mr11544556pjg.218.1623454920007; 
 Fri, 11 Jun 2021 16:42:00 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/34] tcg: Sink qemu_madvise call to common code
Date: Fri, 11 Jun 2021 16:41:34 -0700
Message-Id: <20210611234144.653682-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the call out of the N versions of alloc_code_gen_buffer
and into tcg_region_init.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index e6c80b35b1..2e541cd2bf 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -559,7 +559,6 @@ static int alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
         error_setg_errno(errp, errno, "mprotect of jit buffer");
         return false;
     }
-    qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
 
     region.start_aligned = buf;
     region.total_size = size;
@@ -635,9 +634,6 @@ static int alloc_code_gen_buffer_anon(size_t size, int prot,
     }
 #endif
 
-    /* Request large pages for the buffer.  */
-    qemu_madvise(buf, size, QEMU_MADV_HUGEPAGE);
-
     region.start_aligned = buf;
     region.total_size = size;
     return prot;
@@ -687,9 +683,6 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
     region.total_size = size;
     tcg_splitwx_diff = buf_rx - buf_rw;
 
-    /* Request large pages for the buffer and the splitwx.  */
-    qemu_madvise(buf_rw, size, QEMU_MADV_HUGEPAGE);
-    qemu_madvise(buf_rx, size, QEMU_MADV_HUGEPAGE);
     return PROT_READ | PROT_WRITE;
 
  fail_rx:
@@ -857,6 +850,13 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
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


