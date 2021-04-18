Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0D63633EB
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 07:59:12 +0200 (CEST)
Received: from localhost ([::1]:55998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lY0Sd-0000v5-2i
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 01:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lY0Qn-0000Td-CK
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 01:57:17 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lY0Qj-0001AJ-3I
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 01:57:15 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s7so30529952wru.6
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 22:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EQnokyzPBUlpkcCtUGe9E3DY+cuW/2ENBpzEnBucWls=;
 b=CyiBziCLsWmWzdYC3QkD+h5za0C7dtBR501NODUruEZSZP2nmDqydKftLY5LGg272w
 vdyiNWMuUi91UFzEccUusE3Oz5cD0PX3kiUVjZyd4sdkG392H8MUTiCQXHhBSeco5f5X
 2+p0slpcsk2DLuxODrrUytdGm5PVCUC9nJv4bbuCzZvbMe/KoTTw1KzEhGDIP226rHmQ
 hOmqPHf2UNn7r4eL6VuW6026LosoLIryeSSKouO8u/8N1vcSJMLm2+dU/TcfxP0f6m6Q
 isqus1kuo2tlkA7vt3WA1kJLOlCLX3tv24u9KwN0JLmdPc38wTNqJ/MHvAp7w/CG9YXq
 EaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=EQnokyzPBUlpkcCtUGe9E3DY+cuW/2ENBpzEnBucWls=;
 b=boBzkraSLayBmLXOxIuNwPftLFOddw3m5kBT/LwX6hJD2mP+qu67aXIxH6gcBRvohY
 P81VnU5HI8Y7rEvexszQmdnpFZBt6SvZECL7pFZB4SrsMlj9p9bDMmODSKVFOP7ORpW2
 pjDYEyvX8MqJFUnFPm5lEUD7fOCVMcQrIlDxPhO2yKqP5cib3SBFQvhGtg9xynfYOTea
 VGWn9wdAV/bE3QKJEP6vWDwwXJYeGUs0oiW5qY9FqE+6/d7+B+2G4b11wgZKSgMo5Kfr
 8p1/suf6SYNS6pJiRON6TGbQ0eYomJLLeoemPdHOoqOZ/rhi8Th+2GX3PI7GCfNkIWPq
 b89g==
X-Gm-Message-State: AOAM533+1x2ECC1XSc21a/MrB81rwiy5kmJIOWRjL99+Q7bamkHbk580
 iJ1Hg5waAVc8SyE61+cHxTxfib7zHC4f6w==
X-Google-Smtp-Source: ABdhPJwaOF+9AWnNtyUXab99V0KwNOmwNxUZezjlrOIgpHyFEJ9HkpDFpVR++2T9efyyfSC+fLXR0Q==
X-Received: by 2002:adf:ea09:: with SMTP id q9mr7610564wrm.235.1618725431164; 
 Sat, 17 Apr 2021 22:57:11 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u2sm15058744wmc.22.2021.04.17.22.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 22:57:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4] memory: Directly dispatch alias accesses on origin memory
 region
Date: Sun, 18 Apr 2021 07:57:08 +0200
Message-Id: <20210418055708.820980-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 2cdfcf272d ("memory: assign MemoryRegionOps to all
regions"), all newly created regions are assigned with
unassigned_mem_ops (which might be then overwritten).

When using aliased container regions, and there is no region mapped
at address 0 in the container, the memory_region_dispatch_read()
and memory_region_dispatch_write() calls incorrectly return the
container unassigned_mem_ops, because the alias offset is not used.

Consider the following setup:

    +--------------------+ < - - - - - - - - - - - +
    |     Container      |  mr
    |  (unassigned_mem)  |                         |
    |                    |
    |                    |                         |
    |                    |  alias_offset
    +                    + <- - - - - - +----------+---------+
    | +----------------+ |              |                    |
    | |  MemoryRegion0 | |              |                    |
    | +----------------+ |              |       Alias        |  addr1
    | |  MemoryRegion1 | | <~ ~  ~  ~ ~ |                    | <~~~~~~
    | +----------------+ |              |                    |
    |                    |              +--------------------+
    |                    |
    |                    |
    |                    |
    |                    |
    | +----------------+ |
    | |  MemoryRegionX | |
    | +----------------+ |
    | |  MemoryRegionY | |
    | +----------------+ |
    | |  MemoryRegionZ | |
    | +----------------+ |
    +--------------------+

The memory_region_init_alias() flow is:

  memory_region_init_alias()
  -> memory_region_init()
     -> object_initialize(TYPE_MEMORY_REGION)
        -> memory_region_initfn()
           -> mr->ops = &unassigned_mem_ops;

Later when accessing offset=addr1 via the alias, we expect to hit
MemoryRegion1. The memory_region_dispatch_read() flow is:

  memory_region_dispatch_read(addr1)
  -> memory_region_access_valid(mr)   <- addr1 offset is ignored
     -> mr->ops->valid.accepts()
        -> unassigned_mem_accepts()
        <- false
     <- false
   <- MEMTX_DECODE_ERROR

The caller gets a MEMTX_DECODE_ERROR while the access is OK.

Fix by dispatching aliases recursively, accessing its origin region
after adding the alias offset.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v4:
- added ASCII schema
v3:
- reworded, mentioning the "alias to container" case
- use recursive call instead of while(), because easier when debugging
  therefore reset Richard R-b tag.
v2:
- use while()
---
 softmmu/memory.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index d4493ef9e43..b899ca6a6b7 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1442,6 +1442,11 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
     unsigned size = memop_size(op);
     MemTxResult r;
 
+    if (mr->alias) {
+        return memory_region_dispatch_read(mr->alias,
+                                           mr->alias_offset + addr,
+                                           pval, op, attrs);
+    }
     if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
         *pval = unassigned_mem_read(mr, addr, size);
         return MEMTX_DECODE_ERROR;
@@ -1486,6 +1491,11 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
 {
     unsigned size = memop_size(op);
 
+    if (mr->alias) {
+        return memory_region_dispatch_write(mr->alias,
+                                            mr->alias_offset + addr,
+                                            data, op, attrs);
+    }
     if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
         unassigned_mem_write(mr, addr, data, size);
         return MEMTX_DECODE_ERROR;
-- 
2.26.3


