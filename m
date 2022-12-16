Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD2064F414
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:26:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Ip8-0007ew-B5; Fri, 16 Dec 2022 17:04:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Ioa-0007dX-38
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:04:24 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IoY-0005Ad-4o
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:04:23 -0500
Received: by mail-ej1-x62b.google.com with SMTP id n20so9390938ejh.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2cVk58Dcn2Rj8aTFRvN2/fiers8pgqo5iyjoGh8F+w=;
 b=iMZl//DVGdc74hAZUvDezhtC31xHMwxivZAdDW64VkSgvRaFbqLPhKq86YbHoNRpqi
 hr7uyey5mdaWWFvWg7m9mDe4kgdhohY4FbF86rxfyoUxc/UZOfC4wwmc00JNxNCw8ylY
 4x9UGGgIkC6Pt84dAGYmChZj7Rg8Xptc5j+Uk0pHfOEKufrhtil5oOg/X1gKXWX/E99N
 mVIo9TU1WoGVZZZR4D76ljjNCtonuYUoqyFwuQVC1gsrUqJ6ssHQCU+wbQOBrn2lUmAY
 BcwuH80ut6fLMS46RejvarNfpphy9dZES63gFcgiHeDUQoMKKj8Uqr+IKmtLtV/q3BUO
 K5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i2cVk58Dcn2Rj8aTFRvN2/fiers8pgqo5iyjoGh8F+w=;
 b=xR99KzStWzWUbvG7Z7gOBWdVBRPSNzGUlLlR32JAG86NG5NW74+VIODJCoKhYPVOVg
 HIxmvMfet/cnEXM26U5gng1v4vEsDZm32+RWW2uBKN+crFc3JkKJ4z766kZS1AVp5aMx
 cNpIzr63RZCXSOSrcgwL9b7ioMan5wlN4EsUXXDXoF8GTtY/HEMXRY9/XISxAqLNOoRs
 P7YTHoTGS+GMYh6R79WeIZ98LL5OlHszecePeHl0a429FMUfEyZA9ABP7aEUuhsYeJHr
 Gca/72jQLGQrqaXvTaN0/cDVn91iQzPwThupq1n3Ulu0XRmMEh19sYbuAANqkwN2a7As
 xXaw==
X-Gm-Message-State: AFqh2kpuIzt3Hl+oX5NE8AWqDGjXiDIbbdCUUeJvKmf6zo8umqyK4D3Q
 82Pq95l07pC18LaXKLcGeo4BvwaUCFbGVer5Lq0=
X-Google-Smtp-Source: AMrXdXu5txSuLe9aj+LmfoL66P4AtYBDM5fa1jCZpD5s5MJFqLRkZYWPuzz7B7I9xd45doewPc6NEQ==
X-Received: by 2002:a17:906:a20d:b0:7fc:4242:f9e9 with SMTP id
 r13-20020a170906a20d00b007fc4242f9e9mr142598ejy.70.1671228260600; 
 Fri, 16 Dec 2022 14:04:20 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a170906b10b00b00781dbdb292asm1275400ejy.155.2022.12.16.14.04.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:04:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 1/5] exec/memory: Expose memory_region_access_valid()
Date: Fri, 16 Dec 2022 23:04:07 +0100
Message-Id: <20221216220411.6779-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220411.6779-1-philmd@linaro.org>
References: <20221216220411.6779-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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


