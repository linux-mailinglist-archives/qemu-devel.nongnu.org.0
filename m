Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBFE42C8A2
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:25:34 +0200 (CEST)
Received: from localhost ([::1]:47390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maiwU-0006Mh-Sy
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maitq-0003bd-10
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:46 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maito-0002y0-Ea
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:45 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso5061926pjb.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OcQ/8dg+uyCnQNjoef3iDXLc5D161p75+kxjS6wsxRk=;
 b=CVuXOrOqNEEerpD7YUjAQB/oP8P7/+YUHVk4TPZD7rGBqIbMRRwYxqkVOhFrKYKTXm
 4+dg0QO3G/iGPMlGM7u4KqrOl3oWHvC1mZYXBAu9CG8hh9CQdmAQOu1hP2mBR87IJ2Nk
 Qp+Hajm1O5XGKBPtNwLGYG/V7NC5vginvA/0Wthjs4fJla/slr2qtcu6Sddim7fL913f
 Ke5axfKFpWBzSdvwQucU0aWONvrpzVa9sinYy3lJVQq79I96GLmv0WK4cBOFCTP4gYeH
 tNuT1qUvD+M32HJgr9FGY+kE2Bh57FdMdOTAkh8wRvZ+Zd4t3sxKtHIOJxTgU4JUPk7h
 iEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OcQ/8dg+uyCnQNjoef3iDXLc5D161p75+kxjS6wsxRk=;
 b=4JmJDr2zvf3bgfIflOpTyhFnz4/tOmjdGum5sfaoeXhWaRVBxy6oDjWTXuUgeqAlzB
 gQpklTF/NYYwflTqsmla7o8SMdwyXqm5dz1GfRgoe2jKVdoOTxP1sA3FQ8zH4IElQFZM
 B7DMwzCXKpxlQGgNtccdPh8xcmJfd/tRHDz5Jowx1bRO1QbQSg34tgUHAizriEIFrLIv
 LeNIAR5Y+VAk9fPDA/deRz93VxamBf9aSv6OarnKMXHwGJ5AbCOts42i9DnrJr+0S8kp
 qhcrPOsTaNzj2YxeL7Mxca9B68P/V0v1XbVg4t9OOKffD0aqePbT9vQo0aLMok12OI5a
 ycVQ==
X-Gm-Message-State: AOAM531EYcfBYblzCnFhWEvxqAqQ4sKFRefvhTmoxptojqMVM5e3nXlb
 Lk8zwqO2oFmdaiZJsN7RxEX0CfoW9L/3/Q==
X-Google-Smtp-Source: ABdhPJxQVeGPgQQHbjX2TQAdkm1QH3pgNI5q4SQY8xEjxOmxH1xz6ix8z4eugwm+UP4FNAVmwqP8Aw==
X-Received: by 2002:a17:90b:4ac9:: with SMTP id
 mh9mr873392pjb.173.1634149362930; 
 Wed, 13 Oct 2021 11:22:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm177140pfe.210.2021.10.13.11.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:22:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/15] memory: Log access direction for invalid accesses
Date: Wed, 13 Oct 2021 11:22:25 -0700
Message-Id: <20211013182239.991127-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013182239.991127-1-richard.henderson@linaro.org>
References: <20211013182239.991127-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

In memory_region_access_valid() invalid accesses are logged to help
debugging but the log message does not say if it was a read or write.
Log that too to better identify the access causing the problem.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20211011173616.F1DE0756022@zero.eik.bme.hu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/memory.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index db182e5d3d..e5826faa0c 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1378,17 +1378,17 @@ bool memory_region_access_valid(MemoryRegion *mr,
 {
     if (mr->ops->valid.accepts
         && !mr->ops->valid.accepts(mr->opaque, addr, size, is_write, attrs)) {
-        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
-                                       "0x%" HWADDR_PRIX ", size %u, "
-                                       "region '%s', reason: rejected\n",
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
+                      ", size %u, region '%s', reason: rejected\n",
+                      is_write ? "write" : "read",
                       addr, size, memory_region_name(mr));
         return false;
     }
 
     if (!mr->ops->valid.unaligned && (addr & (size - 1))) {
-        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
-                                       "0x%" HWADDR_PRIX ", size %u, "
-                                       "region '%s', reason: unaligned\n",
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
+                      ", size %u, region '%s', reason: unaligned\n",
+                      is_write ? "write" : "read",
                       addr, size, memory_region_name(mr));
         return false;
     }
@@ -1400,10 +1400,10 @@ bool memory_region_access_valid(MemoryRegion *mr,
 
     if (size > mr->ops->valid.max_access_size
         || size < mr->ops->valid.min_access_size) {
-        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
-                                       "0x%" HWADDR_PRIX ", size %u, "
-                                       "region '%s', reason: invalid size "
-                                       "(min:%u max:%u)\n",
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
+                      ", size %u, region '%s', reason: invalid size "
+                      "(min:%u max:%u)\n",
+                      is_write ? "write" : "read",
                       addr, size, memory_region_name(mr),
                       mr->ops->valid.min_access_size,
                       mr->ops->valid.max_access_size);
-- 
2.25.1


