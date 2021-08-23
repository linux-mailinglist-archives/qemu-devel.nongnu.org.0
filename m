Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D25E3F46FD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 10:56:51 +0200 (CEST)
Received: from localhost ([::1]:33458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5l7-0002Iu-Ao
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 04:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI5j4-0000uo-UG
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:54:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI5j2-0003UV-8u
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629708875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2X67DihpIc+4URUXABy3a5n/xaaJxJczhGLT2mDoAGU=;
 b=FE3q2zy/BMbKdHshC0d4I4VYt+gmYonAS2BjUI6N8GPy27OhozE9qSHPyOpu9srH//B6Wd
 1esQQuCH7Q9+16vabbXQ+4zf6XefnnSn/HaHEVpxbcs6z/EVXzOUNUJZw/Gi+ZNCZyo0Ym
 yL9hcRNqgi+rG5lnAt6mokzZL7tbnlg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-cYYyGsopO4GpkgC5vCvNtw-1; Mon, 23 Aug 2021 04:54:32 -0400
X-MC-Unique: cYYyGsopO4GpkgC5vCvNtw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m22-20020a7bca56000000b002e7508f3faeso198768wml.2
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 01:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2X67DihpIc+4URUXABy3a5n/xaaJxJczhGLT2mDoAGU=;
 b=M86vP/oTlb11bp/VdjbDMcNpEydiUJ2wYQ1RVdmYlJAIb03AzuzQ0gxK2vwTyEBnZ6
 /Grzw4k0iJJCG1iuuIHIK2Lx2j19LLBbqqTDBT1b0i4C2/UxggoVK1UtHtPe6BDp5x5K
 iBBD60YGm+XuVfmJYyAz4NsAOaq9sB1gV93wgdiXvrEd4YNrRVNt2jI0X0Fzd5h5BxDB
 Qa2D5NRL3B3hDfFr2brwXj+UvDaFTF+vaeLnYyTdk4XaeJ6bWmuH8kQU3aFZyy+Sdq5p
 E+D8ZYGVyJxncQAk7PouTFtrz051yRnFEDFbcRLByaUhekv8UP5HoJ7priSflQ9R7jYm
 VVvA==
X-Gm-Message-State: AOAM530IweRRpFPAFlN5olzapWTmHx2mR+bhxLp2ZO0QoGDqzTV90Uj9
 XnQxX9XVckanYWl17BB0XU3kvT9V0TSB6iIv2P3eMONmodLFN+PhWZmpVxt41ZehdnS/RqiE4QS
 jIJCUmoRPWvHuufFfDisEZVAcm4OrXz/BgQEt9H472Rl2UEJuzd/Qa6rYiS/voIYZ
X-Received: by 2002:a5d:4fc7:: with SMTP id h7mr11067959wrw.333.1629708870899; 
 Mon, 23 Aug 2021 01:54:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuJ3njXg6UHbjq+SkByLAEfK+9qxmm1HbqhGveFLXqCXDOHpA3QK7mUvE3MB3YJxz8qxWtGQ==
X-Received: by 2002:a5d:4fc7:: with SMTP id h7mr11067932wrw.333.1629708870605; 
 Mon, 23 Aug 2021 01:54:30 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f5sm2597697wmb.47.2021.08.23.01.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 01:54:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] memory: Have 'info mtree' remove duplicated Address Space
 information
Date: Mon, 23 Aug 2021 10:54:29 +0200
Message-Id: <20210823085429.597873-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
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

This drastically reduce 'info mtree' on some boards.

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
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: Removed unused AddressSpaceInfo::counter
v2: List AS similarly to 'info mtree -f' (peterx)
---
 softmmu/memory.c | 64 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 60 insertions(+), 4 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4df..459d6246672 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3246,11 +3246,55 @@ static gboolean mtree_info_flatview_free(gpointer key, gpointer value,
     return true;
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
 void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
 {
     MemoryRegionListHead ml_head;
     MemoryRegionList *ml, *ml2;
     AddressSpace *as;
+    GHashTable *views = g_hash_table_new(g_direct_hash, g_direct_equal);
+    GSList *as_same_root_mr_list;
 
     if (flatview) {
         FlatView *view;
@@ -3260,7 +3304,6 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
             .owner = owner,
         };
         GArray *fv_address_spaces;
-        GHashTable *views = g_hash_table_new(g_direct_hash, g_direct_equal);
         AccelClass *ac = ACCEL_GET_CLASS(current_accel());
 
         if (ac->has_memory) {
@@ -3293,11 +3336,24 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
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
 
+    struct AddressSpaceInfo asi = {
+        .ml_head = &ml_head,
+        .owner = owner,
+        .disabled = disabled,
+    };
+
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


