Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BB63EE39D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 03:33:28 +0200 (CEST)
Received: from localhost ([::1]:46570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFnyp-0004br-8A
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 21:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mFnx0-0002WQ-Ta
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 21:31:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mFnwx-0006uK-8j
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 21:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629163889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVYRVMH8WHd91fY4Jdw5KkQgHnOwpylUSfTTbNBS2vA=;
 b=ELqcMbwMA2W2k4dOQP0wBGOIIyNMy1he10kb4wgwJIHb5ad2Byap2aybOuoXyKRz4fZvof
 vhFGTiJrCDRww2TDRaApL1jPC4WDoV6DWy7Ud1VDxMiowJ7XtNKbUToJCUUJBJS1hpLxrz
 YPymsf5O/c47X6a5Csa5Ul+8wHcErCA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-KxMgwfsqOKqZzg2CKO_idw-1; Mon, 16 Aug 2021 21:31:29 -0400
X-MC-Unique: KxMgwfsqOKqZzg2CKO_idw-1
Received: by mail-qt1-f200.google.com with SMTP id
 h18-20020ac856920000b029025eb726dd9bso9409518qta.8
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 18:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aVYRVMH8WHd91fY4Jdw5KkQgHnOwpylUSfTTbNBS2vA=;
 b=IC1ONTyG862BOgG103I1VKPqO6KS7a0H0OFNFuPp3nlK/9HjGE6m3IkE1BRl3GeHCg
 m7FWrOAXvSiWjNvriCtNS1Nva03eSaCQPfjokNUUg0xbi6mAPKDRUtN8ZrT0gfg+jRgg
 SfUmCZhIK4BJjLUtrOnWYtr+7s2pjEuuQDMoTxVN9jD99FT4DSq/w8g/r+xia+FLAMLO
 t8OKn1mOBX8PNXgccfYUIQ0UgquiqI9VxiW2wgzi5AAEjnnD8XJiXmCZL0CaBj0Zk/tb
 Ixf4Vizu2rtiT0zUv7D2gBFn5HPJL+qCP7R0nHax8naDn+VWmaN0oi8RGuw1xPLcBqY9
 w+FA==
X-Gm-Message-State: AOAM532OFXUiJoZiNdSksuAubG133T+ysbjMwAR7Rp2QvmPKnq7x4MvP
 iV+/Cf2dVss/MS00UsMxHIDpv/EiLftab3aiU3z9kuNesYh3v9i/ylIoxLLnpaDzCwuV5gTY9w3
 5Of0DeylDwBGmMaZNRrG1ptv+lrNg2n4vLlapYnCaLxDefgV3w4XCP401TaFhdu1D
X-Received: by 2002:a05:6214:768:: with SMTP id f8mr940305qvz.32.1629163888132; 
 Mon, 16 Aug 2021 18:31:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQm8WcmHcIv+rQewZA2AzMhXkvjyh4MBx8lHBVJ+aVVUaoQvUg3IWnTeUiUlV+bbuyTRctug==
X-Received: by 2002:a05:6214:768:: with SMTP id f8mr940277qvz.32.1629163887854; 
 Mon, 16 Aug 2021 18:31:27 -0700 (PDT)
Received: from t490s.redhat.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id y185sm423384qkb.36.2021.08.16.18.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 18:31:26 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] memory: Add tracepoint for dirty sync
Date: Mon, 16 Aug 2021 21:31:21 -0400
Message-Id: <20210817013121.29941-3-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817013121.29941-1-peterx@redhat.com>
References: <20210817013121.29941-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trace at memory_region_sync_dirty_bitmap() for log_sync() or global_log_sync()
on memory regions.  One trace line should suffice when it finishes, so as to
estimate the time used for each log sync process.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c     | 2 ++
 softmmu/trace-events | 1 +
 2 files changed, 3 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4d..f0c5817b97 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2149,6 +2149,7 @@ static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
                 }
             }
             flatview_unref(view);
+            trace_memory_region_sync_dirty(mr ? mr->name : "(all)", listener->name, 0);
         } else if (listener->log_sync_global) {
             /*
              * No matter whether MR is specified, what we can do here
@@ -2156,6 +2157,7 @@ static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
              * sync in a finer granularity.
              */
             listener->log_sync_global(listener);
+            trace_memory_region_sync_dirty(mr ? mr->name : "(all)", listener->name, 1);
         }
     }
 }
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 7b278590a0..bf1469990e 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -15,6 +15,7 @@ memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t va
 memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
+memory_region_sync_dirty(const char *mr, const char *listener, int global) "mr '%s' listener '%s' synced (global=%d)"
 flatview_new(void *view, void *root) "%p (root %p)"
 flatview_destroy(void *view, void *root) "%p (root %p)"
 flatview_destroy_rcu(void *view, void *root) "%p (root %p)"
-- 
2.31.1


