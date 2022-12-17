Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B031664F9D5
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 16:26:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Z3l-0003OJ-Cn; Sat, 17 Dec 2022 10:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Z3j-0003NX-3z
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 10:25:07 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Z3h-0005NK-Fi
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 10:25:06 -0500
Received: by mail-ej1-x635.google.com with SMTP id x22so12471435ejs.11
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 07:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1e1FU0aKLX/Wox+fFOeQyUefxVtLx/iUwvcr67HGk04=;
 b=TT1kpYQ7q4riX6ORm/KG5TWUOXTRtJ5kCfAslzTQuZinHAYhh1pYP37n6H1Vm/MsnC
 jwrpE5ArHSvimmvTlI7ttGoXCJNLP4OapfI/KvOP9zfVpEzC6G7L8lpjlPimLVhb4/Yn
 UCAjB2wESg8aZbGffQ6XrDDF0xv09AtY+0qXOIlGZX7wzZkgvkr5nzjmAcynUpIsGZic
 Gdmbwh43CQr1GdoM1k4SiCouFvgI9qh5dQS/X7y0TmDlBXuS/YC0SKsSmkWT7NLiftCY
 hIe68tpcmM7fkwOkvqLoKm8Ak65c+Fd/Lgy6B8N27/7S4X9WkIAvJv265a0MRLwvWosj
 11fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1e1FU0aKLX/Wox+fFOeQyUefxVtLx/iUwvcr67HGk04=;
 b=Y7VODphqqgOAhlolwTqbHK4ILzRQwNaTZXxju8Kliza2hScvS6N1vRpj6H8XnYT2pJ
 I94Px4kCGo4ZRorLkjGzh2esqRNCWcmlSLv6D/OxJhjd1TCPfpGBNgSINrxdlhDCwdd1
 mbKC9/7Kl/X24y2aLvFdIMWcgD2sygTFI81kz1RgXXIddKjNpCGt3g/Az6FJ4WgBfGZG
 E0nRI4fV22yglAC7D8KrvPAkmQyHmEpdg1eYvvlWp+eODmnssWs82QR/J6ZQsc9PPERA
 CV8xcS4gsrzjdIOJYJyHH9d0PSJaMpV8O+BNMxywP9mEf1tme6sYiNUb6VLA+IAgtN5t
 wSuA==
X-Gm-Message-State: AFqh2koI7ECQynt37l8nRw+82TAtj9tx3ngIqVnIvCiqzYTDC1pBBL6S
 pu4nRJdCYTeshFpMgH6AYiTQgRbjLXNQB8UN9LI=
X-Google-Smtp-Source: AMrXdXs5wurE3tWy7yV+i8X/BGK16sjAx/CDlatCbxPw0OVyN+3RosMKQ0jzBUJQei4CoxCiuRJ/ng==
X-Received: by 2002:a17:907:8b89:b0:7c9:6e0e:1428 with SMTP id
 tb9-20020a1709078b8900b007c96e0e1428mr9329800ejc.47.1671290703991; 
 Sat, 17 Dec 2022 07:25:03 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a1709064c8d00b007c0c91eae04sm2108592eju.151.2022.12.17.07.25.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 07:25:03 -0800 (PST)
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
Subject: [PATCH v2 1/5] exec/memory: Expose memory_region_access_valid()
Date: Sat, 17 Dec 2022 16:24:50 +0100
Message-Id: <20221217152454.96388-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217152454.96388-1-philmd@linaro.org>
References: <20221217152454.96388-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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

Instead of having hardware device poking into memory
internal API, expose memory_region_access_valid().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/s390-pci-inst.c       | 2 +-
 include/exec/memory-internal.h | 4 ----
 include/exec/memory.h          | 4 ++++
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 66e764f901..35db7777e4 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "exec/memop.h"
-#include "exec/memory-internal.h"
+#include "exec/memory.h"
 #include "qemu/error-report.h"
 #include "sysemu/hw_accel.h"
 #include "hw/s390x/s390-pci-inst.h"
diff --git a/include/exec/memory-internal.h b/include/exec/memory-internal.h
index 9fcc2af25c..100c1237ac 100644
--- a/include/exec/memory-internal.h
+++ b/include/exec/memory-internal.h
@@ -38,10 +38,6 @@ void flatview_unref(FlatView *view);
 
 extern const MemoryRegionOps unassigned_mem_ops;
 
-bool memory_region_access_valid(MemoryRegion *mr, hwaddr addr,
-                                unsigned size, bool is_write,
-                                MemTxAttrs attrs);
-
 void flatview_add_to_dispatch(FlatView *fv, MemoryRegionSection *section);
 AddressSpaceDispatch *address_space_dispatch_new(FlatView *fv);
 void address_space_dispatch_compact(AddressSpaceDispatch *d);
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 91f8a2395a..c37ffdbcd1 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2442,6 +2442,10 @@ void memory_global_dirty_log_stop(unsigned int flags);
 
 void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled);
 
+bool memory_region_access_valid(MemoryRegion *mr, hwaddr addr,
+                                unsigned size, bool is_write,
+                                MemTxAttrs attrs);
+
 /**
  * memory_region_dispatch_read: perform a read directly to the specified
  * MemoryRegion.
-- 
2.38.1


