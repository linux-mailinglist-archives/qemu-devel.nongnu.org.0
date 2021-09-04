Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F261400D80
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 01:14:41 +0200 (CEST)
Received: from localhost ([::1]:53950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMerw-0005ei-HU
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 19:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMeoh-0001jO-8U
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:11:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMeof-0002qF-1e
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630797076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVY5s7Ej5sbjg7B8ruPNuC3GirHMa+aQnRQ8uX+CC4Q=;
 b=b5FwyIrUn3cJlBtkGQpKY5KkdKIKCAaKhkz4VMqHzD6KKi/74USLzllMQacuzeyuraqpKs
 1YR5LgoAcV1vaIERLFdrOBRBX9F7uiVHvaEWuKl7g4+slCufmZLjVi8xBIEFaEir9T0eP/
 M/U4j/3Z0j4x4hf02hNU1vz3G+M6Th8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-2ndmBxD8O-WYdeTD1SJ-wQ-1; Sat, 04 Sep 2021 19:11:14 -0400
X-MC-Unique: 2ndmBxD8O-WYdeTD1SJ-wQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso1758092wma.9
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KVY5s7Ej5sbjg7B8ruPNuC3GirHMa+aQnRQ8uX+CC4Q=;
 b=gaV582Hpwqssg7THnZ+Rv2Kzkqodtv8Lifn85KykL3cvERvEVAPbTeAYhRXTMFEFbP
 QpXWam5/FvcAVuJOQCBAKnw8LraD+PQJlgCbgyo/GOnAnfbctseiJB0QOV2FpGdG3ENU
 vL0h+tZlXUiYUqjx/WM69hG9H63oJY+Mk1hsOE5IyjyhapeplHXVRDa8R9Ban2Yvbych
 EVotwn0y5rGjpHxLQl8H9yKB6lGXO7x6Oe5GWwnbYdKjrqvk3ovKnPrzw9VfsbP3jq/e
 pdALqQz9XJr8nwUbhekJaoVSbnOHMPwq4dhZ8/tTBeXaZN4qKbvAUDRPiYTRoweT8GZU
 h3Ig==
X-Gm-Message-State: AOAM532pmrH7PDc/uCDeKV3Ou4xpzVm5w3YLeKDocmWh9FP+cdWK6ryK
 8pq6XS/zc80VBQ4lgHwJi7QNyUISn48g8wRxTV8GzHE36jTaIpKvMe8h8w7jYD189+rvbw0lL8g
 lsZRVka3dFTIVCVUAhOuSH9Ytq0B9laC3QY18TDh+bxMdpMi9zPfjNSEj4oBn1dkZ
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr5716919wrj.72.1630797072938; 
 Sat, 04 Sep 2021 16:11:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaRj7AFyygdWRYmK9p3SbTRBJeHrGZZjzkjH+3Q/PQ9MF4d5ssledTuMOgq05g8xMhNwJPFg==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr5716890wrj.72.1630797072630; 
 Sat, 04 Sep 2021 16:11:12 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id u17sm3023554wmm.33.2021.09.04.16.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:11:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 2/2] memory: Have 'info mtree' remove duplicated Address
 Space information
Date: Sun,  5 Sep 2021 01:11:01 +0200
Message-Id: <20210904231101.1071929-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904231101.1071929-1-philmd@redhat.com>
References: <20210904231101.1071929-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per Peter Maydell [*]:

  'info mtree' monitor command was designed on the assumption that
  there's really only one or two interesting address spaces, and
  with more recent developments that's just not the case any more.

Similarly about how the FlatView are sorted using a GHashTable,
sort the AddressSpace objects to remove the duplications (AS
using the same root MemoryRegion).

This drastically reduces the output of 'info mtree' on some boards.

Before:

  $ (echo info mtree; echo q) \
    | qemu-system-aarch64 -S -monitor stdio -M raspi3b \
    | wc -l
  423

After:

  $ (echo info mtree; echo q) \
    | qemu-system-aarch64 -S -monitor stdio -M raspi3b \
    | wc -l
  106

  (qemu) info mtree
  address-space: I/O
    0000000000000000-000000000000ffff (prio 0, i/o): io

  address-space: cpu-memory-0
  address-space: cpu-memory-1
  address-space: cpu-memory-2
  address-space: cpu-memory-3
  address-space: cpu-secure-memory-0
  address-space: cpu-secure-memory-1
  address-space: cpu-secure-memory-2
  address-space: cpu-secure-memory-3
  address-space: memory
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-000000003fffffff (prio 0, ram): ram
      000000003f000000-000000003fffffff (prio 1, i/o): bcm2835-peripherals
        000000003f003000-000000003f00301f (prio 0, i/o): bcm2835-sys-timer
        000000003f004000-000000003f004fff (prio -1000, i/o): bcm2835-txp
        000000003f006000-000000003f006fff (prio 0, i/o): mphi
        000000003f007000-000000003f007fff (prio 0, i/o): bcm2835-dma
        000000003f00b200-000000003f00b3ff (prio 0, i/o): bcm2835-ic
        000000003f00b400-000000003f00b43f (prio -1000, i/o): bcm2835-sp804
        000000003f00b800-000000003f00bbff (prio 0, i/o): bcm2835-mbox
        000000003f100000-000000003f1001ff (prio 0, i/o): bcm2835-powermgt
        000000003f101000-000000003f102fff (prio 0, i/o): bcm2835-cprman
        000000003f104000-000000003f10400f (prio 0, i/o): bcm2835-rng
        000000003f200000-000000003f200fff (prio 0, i/o): bcm2835_gpio
        000000003f201000-000000003f201fff (prio 0, i/o): pl011
        000000003f202000-000000003f202fff (prio 0, i/o): bcm2835-sdhost
        000000003f203000-000000003f2030ff (prio -1000, i/o): bcm2835-i2s
        000000003f204000-000000003f20401f (prio -1000, i/o): bcm2835-spi0
        000000003f205000-000000003f20501f (prio -1000, i/o): bcm2835-i2c0
        000000003f20f000-000000003f20f07f (prio -1000, i/o): bcm2835-otp
        000000003f212000-000000003f212007 (prio 0, i/o): bcm2835-thermal
        000000003f214000-000000003f2140ff (prio -1000, i/o): bcm2835-spis
        000000003f215000-000000003f2150ff (prio 0, i/o): bcm2835-aux
        000000003f300000-000000003f3000ff (prio 0, i/o): sdhci
        000000003f600000-000000003f6000ff (prio -1000, i/o): bcm2835-smi
        000000003f804000-000000003f80401f (prio -1000, i/o): bcm2835-i2c1
        000000003f805000-000000003f80501f (prio -1000, i/o): bcm2835-i2c2
        000000003f900000-000000003f907fff (prio -1000, i/o): bcm2835-dbus
        000000003f910000-000000003f917fff (prio -1000, i/o): bcm2835-ave0
        000000003f980000-000000003f990fff (prio 0, i/o): dwc2
          000000003f980000-000000003f980fff (prio 0, i/o): dwc2-io
          000000003f981000-000000003f990fff (prio 0, i/o): dwc2-fifo
        000000003fc00000-000000003fc00fff (prio -1000, i/o): bcm2835-v3d
        000000003fe00000-000000003fe000ff (prio -1000, i/o): bcm2835-sdramc
        000000003fe05000-000000003fe050ff (prio 0, i/o): bcm2835-dma-chan15
      0000000040000000-00000000400000ff (prio 0, i/o): bcm2836-control

  address-space: bcm2835-dma-memory
  address-space: bcm2835-fb-memory
  address-space: bcm2835-property-memory
  address-space: dwc2
    0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
      0000000000000000-000000003fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      0000000040000000-000000007fffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-peripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
      0000000080000000-00000000bfffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
      00000000c0000000-00000000ffffffff (prio 0, ram): alias bcm2835-gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff

  address-space: bcm2835-mbox-memory
    0000000000000000-000000000000008f (prio 0, i/o): bcm2835-mbox
      0000000000000010-000000000000001f (prio 0, i/o): bcm2835-fb
      0000000000000080-000000000000008f (prio 0, i/o): bcm2835-property

  memory-region: ram
    0000000000000000-000000003fffffff (prio 0, ram): ram

  memory-region: bcm2835-peripherals
    000000003f000000-000000003fffffff (prio 1, i/o): bcm2835-peripherals
      000000003f003000-000000003f00301f (prio 0, i/o): bcm2835-sys-timer
      000000003f004000-000000003f004fff (prio -1000, i/o): bcm2835-txp
      000000003f006000-000000003f006fff (prio 0, i/o): mphi
      000000003f007000-000000003f007fff (prio 0, i/o): bcm2835-dma
      000000003f00b200-000000003f00b3ff (prio 0, i/o): bcm2835-ic
      000000003f00b400-000000003f00b43f (prio -1000, i/o): bcm2835-sp804
      000000003f00b800-000000003f00bbff (prio 0, i/o): bcm2835-mbox
      000000003f100000-000000003f1001ff (prio 0, i/o): bcm2835-powermgt
      000000003f101000-000000003f102fff (prio 0, i/o): bcm2835-cprman
      000000003f104000-000000003f10400f (prio 0, i/o): bcm2835-rng
      000000003f200000-000000003f200fff (prio 0, i/o): bcm2835_gpio
      000000003f201000-000000003f201fff (prio 0, i/o): pl011
      000000003f202000-000000003f202fff (prio 0, i/o): bcm2835-sdhost
      000000003f203000-000000003f2030ff (prio -1000, i/o): bcm2835-i2s
      000000003f204000-000000003f20401f (prio -1000, i/o): bcm2835-spi0
      000000003f205000-000000003f20501f (prio -1000, i/o): bcm2835-i2c0
      000000003f20f000-000000003f20f07f (prio -1000, i/o): bcm2835-otp
      000000003f212000-000000003f212007 (prio 0, i/o): bcm2835-thermal
      000000003f214000-000000003f2140ff (prio -1000, i/o): bcm2835-spis
      000000003f215000-000000003f2150ff (prio 0, i/o): bcm2835-aux
      000000003f300000-000000003f3000ff (prio 0, i/o): sdhci
      000000003f600000-000000003f6000ff (prio -1000, i/o): bcm2835-smi
      000000003f804000-000000003f80401f (prio -1000, i/o): bcm2835-i2c1
      000000003f805000-000000003f80501f (prio -1000, i/o): bcm2835-i2c2
      000000003f900000-000000003f907fff (prio -1000, i/o): bcm2835-dbus
      000000003f910000-000000003f917fff (prio -1000, i/o): bcm2835-ave0
      000000003f980000-000000003f990fff (prio 0, i/o): dwc2
        000000003f980000-000000003f980fff (prio 0, i/o): dwc2-io
        000000003f981000-000000003f990fff (prio 0, i/o): dwc2-fifo
      000000003fc00000-000000003fc00fff (prio -1000, i/o): bcm2835-v3d
      000000003fe00000-000000003fe000ff (prio -1000, i/o): bcm2835-sdramc
      000000003fe05000-000000003fe050ff (prio 0, i/o): bcm2835-dma-chan15

  (qemu) q

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg829821.html

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
checkpatch warning (81 chars):

  WARNING: line over 80 characters
  #86: FILE: softmmu/memory.c:3348:
  +                                  address_space_compare_name);
---
 softmmu/memory.c | 63 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 60 insertions(+), 3 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 5be7d5e7412..4d62357da64 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3284,20 +3284,77 @@ static void mtree_info_flatview(bool dispatch_tree, bool owner)
     g_hash_table_unref(views);
 }
 
+struct AddressSpaceInfo {
+    MemoryRegionListHead *ml_head;
+    bool owner;
+    bool disabled;
+};
+
+/* Returns negative value if a < b; zero if a = b; positive value if a > b. */
+static gint address_space_compare_name(gconstpointer a, gconstpointer b)
+{
+    const AddressSpace *as_a = a;
+    const AddressSpace *as_b = b;
+
+    return g_strcmp0(as_a->name, as_b->name);
+}
+
+static void mtree_print_as_name(gpointer data, gpointer user_data)
+{
+    AddressSpace *as = data;
+
+    qemu_printf("address-space: %s\n", as->name);
+}
+
+static void mtree_print_as(gpointer key, gpointer value, gpointer user_data)
+{
+    MemoryRegion *mr = key;
+    GSList *as_same_root_mr_list = value;
+    struct AddressSpaceInfo *asi = user_data;
+
+    g_slist_foreach(as_same_root_mr_list, mtree_print_as_name, NULL);
+    mtree_print_mr(mr, 1, 0, asi->ml_head, asi->owner, asi->disabled);
+    qemu_printf("\n");
+}
+
+static gboolean mtree_info_as_free(gpointer key, gpointer value,
+                                   gpointer user_data)
+{
+    GSList *as_same_root_mr_list = value;
+
+    g_slist_free(as_same_root_mr_list);
+
+    return true;
+}
+
 static void mtree_info_as(bool dispatch_tree, bool owner, bool disabled)
 {
     MemoryRegionListHead ml_head;
     MemoryRegionList *ml, *ml2;
     AddressSpace *as;
+    GHashTable *views = g_hash_table_new(g_direct_hash, g_direct_equal);
+    GSList *as_same_root_mr_list;
+    struct AddressSpaceInfo asi = {
+        .ml_head = &ml_head,
+        .owner = owner,
+        .disabled = disabled,
+    };
 
     QTAILQ_INIT(&ml_head);
 
     QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
-        qemu_printf("address-space: %s\n", as->name);
-        mtree_print_mr(as->root, 1, 0, &ml_head, owner, disabled);
-        qemu_printf("\n");
+        /* Create hashtable, key=AS root MR, value = list of AS */
+        as_same_root_mr_list = g_hash_table_lookup(views, as->root);
+        as_same_root_mr_list = g_slist_insert_sorted(as_same_root_mr_list, as,
+                                                     address_space_compare_name);
+        g_hash_table_insert(views, as->root, as_same_root_mr_list);
     }
 
+    /* print address spaces */
+    g_hash_table_foreach(views, mtree_print_as, &asi);
+    g_hash_table_foreach_remove(views, mtree_info_as_free, 0);
+    g_hash_table_unref(views);
+
     /* print aliased regions */
     QTAILQ_FOREACH(ml, &ml_head, mrqueue) {
         qemu_printf("memory-region: %s\n", memory_region_name(ml->mr));
-- 
2.31.1


