Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48433F4EE3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:01:11 +0200 (CEST)
Received: from localhost ([::1]:48918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDJu-0001FQ-Pt
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1j-0000T2-GQ
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:42:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1g-0007Rf-W7
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:42:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629736940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7R4zUdURf5txsJu6CyZuzHy/f/1sygZW3eoytgU2yN8=;
 b=BbL4GA65WdLhc8rqJa3aaPiG0M/e7MwCE47pKBrViFZebjH9KWaHYlVE7m85vOEK7vHKYI
 tREnWuHWQkBCa3JZwmC1rx61xbHJHCcu/FPMXwVJ9d2y3pLfNAsH+AeL4ylv3zefhVvwz1
 r1R0y8fDagB6lGnl291Mi7Yjge6i59M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-AH0nGgPeOxaZTRdU8yGbjA-1; Mon, 23 Aug 2021 12:42:19 -0400
X-MC-Unique: AH0nGgPeOxaZTRdU8yGbjA-1
Received: by mail-wr1-f70.google.com with SMTP id
 b8-20020a5d5508000000b001574e8e9237so1242499wrv.16
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7R4zUdURf5txsJu6CyZuzHy/f/1sygZW3eoytgU2yN8=;
 b=tjaqR3u76Ef1PTkXic/vDWlvXlTmLChjNOacXxJayQX+xbhDY3TQhaKQXbJQS4gPC7
 wOYgur1/rrJrNTkYrptOVfRAJ3VdVskb+aWYnT4Y3AX86+mNi4K44pJDlrCPKWIAxyH9
 tihIZtb995xnCBLEe28mMeUWx5h931cNdj7uHvhEFD38pj5lnhRVKhjRMJU7zsEag+T3
 5FrH85O2NPVNL0rx36XVhl7aRVuydLP3SHB0TjycBMXX+7L2Abf0ZAARzSNV8xV3hbzI
 9KqcK8oEsi+jFnARYWIF1rtW3P+HVpV52ACTb3dx8nRhOgtJxf2exibRtdoPxkrCHs7t
 0t0g==
X-Gm-Message-State: AOAM532ZZteEiG/6Hq46Pj6zllrPvuuTBSMT5uNEgmAJr4lajAGcCmf5
 0qQxJ6S9H3I4cj/jieT0giNMWfssT6alMdfXSwQJijYOsPqv98cb5W6V8+ldNmxUKIoRGdeXJOW
 K+bQ+J1Kw3sa9JnNM19bbfTUow0deyQdj+dMxWoodrMc3BEWRBZ+AhMYhh+Ri6/Gx
X-Received: by 2002:a1c:4a:: with SMTP id 71mr17335584wma.87.1629736937738;
 Mon, 23 Aug 2021 09:42:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzysm3WS85qZRVEgfejMlzTLBMjDfyEPfsxyuaYQdwihLiPfPMjXZUAZlmI/9N9UU5KhKEfLQ==
X-Received: by 2002:a1c:4a:: with SMTP id 71mr17335551wma.87.1629736937427;
 Mon, 23 Aug 2021 09:42:17 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 o10sm2922553wrc.16.2021.08.23.09.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:42:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 4/5] softmmu/physmem: Introduce
 flatview_access_allowed() to check bus perms
Date: Mon, 23 Aug 2021 18:41:56 +0200
Message-Id: <20210823164157.751807-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823164157.751807-1-philmd@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce flatview_access_allowed() to check bus permission
before running any bus transaction. For now this is a simple
stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/physmem.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index e534dc69918..0d31a2f4199 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2754,6 +2754,27 @@ static bool prepare_mmio_access(MemoryRegion *mr)
     return release_lock;
 }
 
+/**
+ * flatview_access_allowed
+ * @mr: #MemoryRegion to be accessed
+ * @attrs: memory transaction attributes
+ * @addr: address within that memory region
+ * @len: the number of bytes to access
+ * @result: optional pointer to a MemTxResult or NULL
+ *
+ * Check if a memory transaction is allowed. If an error occurs this
+ * method will return false to indicate denial, as well as setting
+ * @result to contain corresponding #MemTxResult.
+ *
+ * Returns: true if transaction is allowed, false if denied.
+ */
+static inline bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
+                                           hwaddr addr, hwaddr len,
+                                           MemTxResult *result)
+{
+    return true;
+}
+
 /* Called within RCU critical section.  */
 static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
                                            MemTxAttrs attrs,
@@ -2768,7 +2789,9 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
     const uint8_t *buf = ptr;
 
     for (;;) {
-        if (!memory_access_is_direct(mr, true)) {
+        if (!flatview_access_allowed(mr, attrs, addr1, l, &result)) {
+            /* 'result' contains the error, keep going. */
+        } else if (!memory_access_is_direct(mr, true)) {
             release_lock |= prepare_mmio_access(mr);
             l = memory_access_size(mr, l, addr1);
             /* XXX: could force current_cpu to NULL to avoid
@@ -2810,9 +2833,13 @@ static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
     hwaddr l;
     hwaddr addr1;
     MemoryRegion *mr;
+    MemTxResult result = MEMTX_OK;
 
     l = len;
     mr = flatview_translate(fv, addr, &addr1, &l, true, attrs);
+    if (!flatview_access_allowed(mr, attrs, addr, len, &result)) {
+        return result;
+    }
     return flatview_write_continue(fv, addr, attrs, buf, len,
                                    addr1, l, mr);
 }
@@ -2831,7 +2858,9 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
 
     fuzz_dma_read_cb(addr, len, mr);
     for (;;) {
-        if (!memory_access_is_direct(mr, false)) {
+        if (!flatview_access_allowed(mr, attrs, addr1, l, &result)) {
+            /* 'result' contains the error, keep going. */
+        } else if (!memory_access_is_direct(mr, false)) {
             /* I/O case */
             release_lock |= prepare_mmio_access(mr);
             l = memory_access_size(mr, l, addr1);
@@ -2871,9 +2900,13 @@ static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
     hwaddr l;
     hwaddr addr1;
     MemoryRegion *mr;
+    MemTxResult result = MEMTX_OK;
 
     l = len;
     mr = flatview_translate(fv, addr, &addr1, &l, false, attrs);
+    if (!flatview_access_allowed(mr, attrs, addr, len, &result)) {
+        return result;
+    }
     return flatview_read_continue(fv, addr, attrs, buf, len,
                                   addr1, l, mr);
 }
-- 
2.31.1


