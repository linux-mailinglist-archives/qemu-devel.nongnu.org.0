Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E481644235D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:24:28 +0100 (CET)
Received: from localhost ([::1]:44934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfj9-0001wI-R6
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUl-00077t-9d
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUj-0000d2-K7
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635804573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fSoWVIR9hKZoxnk9uhtu16nhbmo8V4KFxeuBGBhsQZ8=;
 b=imeLLk2lzQbDTIADLleCJkDFiWs4vI8fT5C34LTIF4t2WDfbVKHIDGK4sGv1ruOez2iE3c
 L5bh6VuFaKnsmMO5EJ+2Oj3wllMiWoflSl6KHZwATC+dr5HU4E/ywrKpucofvEW9aiyJXM
 xy8GJFHDiRwTgGgtAMUmprQRqFmMyHg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71--GyemFXyPXew2LXYhTYeTA-1; Mon, 01 Nov 2021 18:09:32 -0400
X-MC-Unique: -GyemFXyPXew2LXYhTYeTA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m13-20020a05600c3b0d00b00332f48bef41so225061wms.7
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fSoWVIR9hKZoxnk9uhtu16nhbmo8V4KFxeuBGBhsQZ8=;
 b=E35v1Heo1RiSb8yuDeRe4B6RncObAy+YSrjxTaKZKGtABFW83zk39zbdTyntG9z+tZ
 S7nqfUj1PRR1ddG4qKqP4PHDJXfawb4PftYnuEGTnhO2ynVp0LWcALaAkWTAzDss1HEw
 XAW6v/rx2CO2FiqJbPWB1Oh3P1qSDbX+hyGWXx4BlctvzLYUANU0mPons89JxjwEX+HB
 cIfSoyfi0n2c78NWntT7w9B/AO9ANX6lyh31vmNb/OWQopuqSryy8zNdnDC0Df1ZmVjk
 sClFISV71FFVhQcfCzPXQM4bUMv46HVbkas4ulpg3CgAcbWep5smr6WMaKMVZ0BlHJqp
 ILJw==
X-Gm-Message-State: AOAM530ifPUhXzpJzdS4iRcK3BZ2Q51m1vFJu5sKyw4zjp354FpIagxP
 55qJCJ0fYDXS7bBIGmbLeM44rs5hCF9MRfRbCLBudCiF809fUGvtdtWQyaYR7t1S2AyP6H8gdZg
 psGkJ6seceWxN99OUgTK6/6qxK4CpYQkZ033XoeGgNGcieGM8dUm8HvKe4zKloXisbSQ=
X-Received: by 2002:a1c:ed1a:: with SMTP id l26mr1960981wmh.19.1635804570483; 
 Mon, 01 Nov 2021 15:09:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu/QxnhEuNymsrQqTg8NiGiNIcnxGmbn+stcw6LipoHUBGhkcJBUusifbHj5C9b6NJX/heIQ==
X-Received: by 2002:a1c:ed1a:: with SMTP id l26mr1960945wmh.19.1635804570300; 
 Mon, 01 Nov 2021 15:09:30 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id f133sm655275wmf.31.2021.11.01.15.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:29 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/20] virtio-mem: Implement replay_discarded RamDiscardManager
 callback
Date: Mon,  1 Nov 2021 23:09:04 +0100
Message-Id: <20211101220912.10039-13-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Implement it similar to the replay_populated callback.

Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/virtio/virtio-mem.c | 58 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index df91e454b2..284096ec5f 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -228,6 +228,38 @@ static int virtio_mem_for_each_plugged_section(const VirtIOMEM *vmem,
     return ret;
 }
 
+static int virtio_mem_for_each_unplugged_section(const VirtIOMEM *vmem,
+                                                 MemoryRegionSection *s,
+                                                 void *arg,
+                                                 virtio_mem_section_cb cb)
+{
+    unsigned long first_bit, last_bit;
+    uint64_t offset, size;
+    int ret = 0;
+
+    first_bit = s->offset_within_region / vmem->bitmap_size;
+    first_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size, first_bit);
+    while (first_bit < vmem->bitmap_size) {
+        MemoryRegionSection tmp = *s;
+
+        offset = first_bit * vmem->block_size;
+        last_bit = find_next_bit(vmem->bitmap, vmem->bitmap_size,
+                                 first_bit + 1) - 1;
+        size = (last_bit - first_bit + 1) * vmem->block_size;
+
+        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+            break;
+        }
+        ret = cb(&tmp, arg);
+        if (ret) {
+            break;
+        }
+        first_bit = find_next_zero_bit(vmem->bitmap, vmem->bitmap_size,
+                                       last_bit + 2);
+    }
+    return ret;
+}
+
 static int virtio_mem_notify_populate_cb(MemoryRegionSection *s, void *arg)
 {
     RamDiscardListener *rdl = arg;
@@ -1170,6 +1202,31 @@ static int virtio_mem_rdm_replay_populated(const RamDiscardManager *rdm,
                                             virtio_mem_rdm_replay_populated_cb);
 }
 
+static int virtio_mem_rdm_replay_discarded_cb(MemoryRegionSection *s,
+                                              void *arg)
+{
+    struct VirtIOMEMReplayData *data = arg;
+
+    ((ReplayRamDiscard)data->fn)(s, data->opaque);
+    return 0;
+}
+
+static void virtio_mem_rdm_replay_discarded(const RamDiscardManager *rdm,
+                                            MemoryRegionSection *s,
+                                            ReplayRamDiscard replay_fn,
+                                            void *opaque)
+{
+    const VirtIOMEM *vmem = VIRTIO_MEM(rdm);
+    struct VirtIOMEMReplayData data = {
+        .fn = replay_fn,
+        .opaque = opaque,
+    };
+
+    g_assert(s->mr == &vmem->memdev->mr);
+    virtio_mem_for_each_unplugged_section(vmem, s, &data,
+                                          virtio_mem_rdm_replay_discarded_cb);
+}
+
 static void virtio_mem_rdm_register_listener(RamDiscardManager *rdm,
                                              RamDiscardListener *rdl,
                                              MemoryRegionSection *s)
@@ -1234,6 +1291,7 @@ static void virtio_mem_class_init(ObjectClass *klass, void *data)
     rdmc->get_min_granularity = virtio_mem_rdm_get_min_granularity;
     rdmc->is_populated = virtio_mem_rdm_is_populated;
     rdmc->replay_populated = virtio_mem_rdm_replay_populated;
+    rdmc->replay_discarded = virtio_mem_rdm_replay_discarded;
     rdmc->register_listener = virtio_mem_rdm_register_listener;
     rdmc->unregister_listener = virtio_mem_rdm_unregister_listener;
 }
-- 
2.33.1


