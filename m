Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C448936308A
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 16:10:24 +0200 (CEST)
Received: from localhost ([::1]:41010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXleR-0001zD-AU
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 10:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXldE-0001EZ-Jw
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 10:09:08 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXldD-0000nH-03
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 10:09:08 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m9so16613267wrx.3
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 07:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LuLkmyssT6Xg6qDeKETGDqI87aMBd3atyc1rUywcRKk=;
 b=h/IRTLGICuWYWeSh2yzAj8z162VjsI0WhE8Fb+j0A9zaEMsnzpKlIK62Vy3SVz+bp2
 d5cH9b9HgHt/BqcZsZEdJIC3o+bYrOHS4vhvUvs8e9cZUxNAirq9idjs1NOOrDIp8CPG
 V0pMIfoF/5Bfc8E46jrfzf8FvYoIRU0yRosMrxe2LEF94kf8XUz54kEFjI8rUlqBbTRw
 KYM8tuQ3QLDFXwOVXspwbK6iG9w+lbq5FkP1gdOEvERLQxYrFK+6ft4MobOtleP4TxGC
 bi67LmmHzuosdODXMTOyX+iKP86MvZ7tsATyOC9SQJ6DQgkZBG4hAuLxvAxvs9kKcQ20
 myww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=LuLkmyssT6Xg6qDeKETGDqI87aMBd3atyc1rUywcRKk=;
 b=C3Ihuz/PXirrJ+N90uwOr6Z/896HEQQ7nw2NmdkSa9QUglRH2Q8pFkN4SINKZNM3XY
 1GXr64Et/wfe4h/9/iM3LQFilHQvPNGcez5WBn5oZcN9/kwTPN6cofCDpZoxl8rWBq45
 IgUe1/Um70g0zTwHI44pHDJ4QBYM6Eh78/EHo/60yBnpjCRmyrWaZhxlSYPxmgYCipJN
 At1FtYZz6LyrkUdBV74gZLqvudV0NUkj+fPJH2NjEX9O4YvNDDANb6sW3fB4K/UVADyH
 EKjFOeGqKwZD6mo/MwIyL59MER6/7AcHE3aJJ7Zbk2hnCnwwRn7fa7diJLLmkqHycU/l
 Fdeg==
X-Gm-Message-State: AOAM531/0Q2GSTDBTbpZwSx4gOIVb4wuEg1YTwQvswTnuvgeyRI+buO7
 iUCDsYfSmXMga5A++4SXgPxw/lEzTTg=
X-Google-Smtp-Source: ABdhPJw1qHPPufnBuf2I0W4LFRRH+tRTJSPxQtQOBXMoq0Uz6+iOQ4KomoVhIfvz7Llprmt5AdGx6w==
X-Received: by 2002:a05:6000:1ac7:: with SMTP id
 i7mr4588156wry.9.1618668544829; 
 Sat, 17 Apr 2021 07:09:04 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a8sm16451802wrh.91.2021.04.17.07.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 07:09:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] memory: Initialize MemoryRegionOps for RAM memory regions
Date: Sat, 17 Apr 2021 16:09:02 +0200
Message-Id: <20210417140902.677295-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Prasad J Pandit <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is an issue when using memory_region_dispatch_read() or
memory_region_dispatch_write() on RAM memory regions.

RAM memory regions are initialized as:

  memory_region_init_ram()
  -> memory_region_init_ram_nomigrate()
     -> memory_region_init_ram_shared_nomigrate()
        -> memory_region_init()
           -> object_initialize(TYPE_MEMORY_REGION)
              -> memory_region_initfn()
                 -> mr->ops = &unassigned_mem_ops;

Later when accessing the alias, the memory_region_dispatch_read()
flow is:

  memory_region_dispatch_read()
  -> memory_region_dispatch_read1()
     -> if (mr->ops->read) { /* not taken */ } else ...
        -> access_with_adjusted_size
           -> memory_region_read_with_attrs_accessor
              -> memory_region_dispatch_read
                 -> unassigned_mem_read
              <- MEMTX_DECODE_ERROR

The caller gets a MEMTX_DECODE_ERROR while the access is OK.
(Similar flow with memory_region_dispatch_write).

Fix by initializing the MemoryRegionOps to ram_device_mem_ops,
this way the memory accesses are properly dispatched using
memory_region_ram_device_read() / memory_region_ram_device_write().

Fixes: 4a2e242bbb ("memory: Don't use memcpy for ram_device regions")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Since v1: Corrected description (PJP)
---
 softmmu/memory.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 23bdbfac079..99886886a22 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1556,6 +1556,8 @@ void memory_region_init_ram_shared_nomigrate(MemoryRegion *mr,
     Error *err = NULL;
     memory_region_init(mr, owner, name, size);
     mr->ram = true;
+    mr->ops = &ram_device_mem_ops;
+    mr->opaque = mr;
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
     mr->ram_block = qemu_ram_alloc(size, share, mr, &err);
@@ -1579,6 +1581,8 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
     Error *err = NULL;
     memory_region_init(mr, owner, name, size);
     mr->ram = true;
+    mr->ops = &ram_device_mem_ops;
+    mr->opaque = mr;
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
     mr->ram_block = qemu_ram_alloc_resizeable(size, max_size, resized,
@@ -1604,6 +1608,8 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
     Error *err = NULL;
     memory_region_init(mr, owner, name, size);
     mr->ram = true;
+    mr->ops = &ram_device_mem_ops;
+    mr->opaque = mr;
     mr->readonly = readonly;
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
@@ -1629,6 +1635,8 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
     Error *err = NULL;
     memory_region_init(mr, owner, name, size);
     mr->ram = true;
+    mr->ops = &ram_device_mem_ops;
+    mr->opaque = mr;
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
     mr->ram_block = qemu_ram_alloc_from_fd(size, mr,
@@ -1650,6 +1658,8 @@ void memory_region_init_ram_ptr(MemoryRegion *mr,
 {
     memory_region_init(mr, owner, name, size);
     mr->ram = true;
+    mr->ops = &ram_device_mem_ops;
+    mr->opaque = mr;
     mr->terminates = true;
     mr->destructor = memory_region_destructor_ram;
 
-- 
2.26.3


