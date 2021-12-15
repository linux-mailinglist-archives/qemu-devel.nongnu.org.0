Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CE74761A3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:24:02 +0100 (CET)
Received: from localhost ([::1]:48080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZsf-0004gz-NN
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:24:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxYxN-0005V9-HL
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 13:24:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxYxL-0007Px-GT
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 13:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639592686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qgbl1qGGn0Mrb86U52QIs0aG9NLVai4plfdZIwipvAo=;
 b=RvJkx0SoTa5lVAH1DN/FIHHKuF0gZpzSCkmSwHr/odn6HvObe+72Va7py9HefTfMf3k8Rq
 HMnaRzlGcAEy7eELrEnR9Q6bm6wQwt1dR3/e7jZtzFtQNYXdzxWShI4UUtayinCtNQ4oOy
 nmcVQZiG5W81KZinoSHU8xIQCJSl3VM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-II3OYx6aNT-EF2KrURDWwQ-1; Wed, 15 Dec 2021 13:24:45 -0500
X-MC-Unique: II3OYx6aNT-EF2KrURDWwQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v23-20020a05600c215700b0034566adb612so1237874wml.0
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 10:24:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qgbl1qGGn0Mrb86U52QIs0aG9NLVai4plfdZIwipvAo=;
 b=r35fRCLjiIQmynrIjKz/yHxh9P5WZUn8SFMs7G+BlgKdClhUoSrt31bWdlG7E0AUPw
 H3fC3lbzrTBmIWjP6EmYl3h5LDtfYnv8yLxBlUK/mHo09WXFM6qhn/WHG3nCGKKsJEsU
 L7uFAA5upsyVoy/JDOlnWv4u1v9CKa3ZmIKciLBunJSl7uPBGDax9hO615Rg/uA6lRoo
 RyXqpznZCTsBboPEY1KU4LQQb6yOxTjVHBUamv1E0CKblBRGGObvnQ+A5n35bpwo+MUe
 LmLwEjhjlG//bTU6SXwcxpsk5805J1Cm/glouUGv7pJ1T8TubFGEPJ+61aqbuwzdcdi0
 mYdQ==
X-Gm-Message-State: AOAM530oVjO6XC8A+Su/41KqxfygwjN/6KN2Iap+YxDQN8JUJc2AUdV6
 lNtxFVgsXTA9slCRYXukxAF8mtWUDfXoRKrw6FGgBUfy+B36e6gcedoiBdeezx4feSu3wcmjnCi
 dFbsRCzHgVLrwb60B+LLxm94TENA5CRUCYB4sK1krcutSm4iEvwbpewuRn/G2S9uz
X-Received: by 2002:a1c:7714:: with SMTP id t20mr1239922wmi.139.1639592684257; 
 Wed, 15 Dec 2021 10:24:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpaabsCA78x06H1uYhXHm0o3inKjGufr9gQkFjF3/b1QFaIPlsGYfF0QkLkJlzYRwkOpJBzA==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr1239873wmi.139.1639592683929; 
 Wed, 15 Dec 2021 10:24:43 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o1sm3493282wri.100.2021.12.15.10.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 10:24:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 3/3] softmmu/physmem: Introduce MemTxAttrs::memory
 field and MEMTX_BUS_ERROR
Date: Wed, 15 Dec 2021 19:24:21 +0100
Message-Id: <20211215182421.418374-4-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215182421.418374-1-philmd@redhat.com>
References: <20211215182421.418374-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the 'memory' bit to the memory attributes to restrict bus
controller accesses to memories.

Introduce flatview_access_allowed() to check bus permission
before running any bus transaction.

Have read/write accessors return MEMTX_BUS_ERROR if an access is
restricted.

There is no change for the default case where 'memory' is not set.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memattrs.h |  9 +++++++++
 softmmu/physmem.c       | 43 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 95f2d20d55b..f0063583ee2 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -35,6 +35,14 @@ typedef struct MemTxAttrs {
     unsigned int secure:1;
     /* Memory access is usermode (unprivileged) */
     unsigned int user:1;
+    /*
+     * Bus interconnect and peripherals can access anything (memories,
+     * devices) by default. By setting the 'memory' bit, bus transaction
+     * are restricted to "normal" memories (per the AMBA documentation)
+     * versus devices. Access to devices will be logged and rejected
+     * (see MEMTX_BUS_ERROR).
+     */
+    unsigned int memory:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
     /* Invert endianness for this page */
@@ -66,6 +74,7 @@ typedef struct MemTxAttrs {
 #define MEMTX_OK 0
 #define MEMTX_ERROR             (1U << 0) /* device returned an error */
 #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
+#define MEMTX_BUS_ERROR         (1U << 2) /* bus returned an error */
 typedef uint32_t MemTxResult;
 
 #endif
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 6c97a20107a..c03abcc0362 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2759,6 +2759,33 @@ static bool prepare_mmio_access(MemoryRegion *mr)
     return release_lock;
 }
 
+/**
+ * flatview_access_allowed
+ * @mr: #MemoryRegion to be accessed
+ * @attrs: memory transaction attributes
+ * @addr: address within that memory region
+ * @len: the number of bytes to access
+ *
+ * Check if a memory transaction is allowed.
+ *
+ * Returns: true if transaction is allowed, false if denied.
+ */
+static inline bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
+                                           hwaddr addr, hwaddr len)
+{
+    if (likely(!attrs.memory)) {
+        return true;
+    }
+    if (memory_region_is_ram(mr)) {
+        return true;
+    }
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "Invalid access to non-RAM device at "
+                  "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
+                  "region '%s'\n", addr, len, memory_region_name(mr));
+    return false;
+}
+
 /* Called within RCU critical section.  */
 static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
                                            MemTxAttrs attrs,
@@ -2773,7 +2800,10 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
     const uint8_t *buf = ptr;
 
     for (;;) {
-        if (!memory_access_is_direct(mr, true)) {
+        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
+            result |= MEMTX_BUS_ERROR;
+            /* Keep going. */
+        } else if (!memory_access_is_direct(mr, true)) {
             release_lock |= prepare_mmio_access(mr);
             l = memory_access_size(mr, l, addr1);
             /* XXX: could force current_cpu to NULL to avoid
@@ -2818,6 +2848,9 @@ static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
 
     l = len;
     mr = flatview_translate(fv, addr, &addr1, &l, true, attrs);
+    if (!flatview_access_allowed(mr, attrs, addr, len)) {
+        return MEMTX_BUS_ERROR;
+    }
     return flatview_write_continue(fv, addr, attrs, buf, len,
                                    addr1, l, mr);
 }
@@ -2836,7 +2869,10 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
 
     fuzz_dma_read_cb(addr, len, mr);
     for (;;) {
-        if (!memory_access_is_direct(mr, false)) {
+        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
+            result |= MEMTX_BUS_ERROR;
+            /* Keep going. */
+        } else if (!memory_access_is_direct(mr, false)) {
             /* I/O case */
             release_lock |= prepare_mmio_access(mr);
             l = memory_access_size(mr, l, addr1);
@@ -2879,6 +2915,9 @@ static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
 
     l = len;
     mr = flatview_translate(fv, addr, &addr1, &l, false, attrs);
+    if (!flatview_access_allowed(mr, attrs, addr, len)) {
+        return MEMTX_BUS_ERROR;
+    }
     return flatview_read_continue(fv, addr, attrs, buf, len,
                                   addr1, l, mr);
 }
-- 
2.33.1


