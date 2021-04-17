Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC7A363085
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 16:03:58 +0200 (CEST)
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXlYC-0007ar-Ud
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 10:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXlWY-0006iD-5R
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 10:02:15 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXlWV-00057y-1Q
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 10:02:13 -0400
Received: by mail-wr1-x433.google.com with SMTP id a4so29370370wrr.2
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 07:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mG2CetGzS7CKTUwI5wgYD0g3r71RIHSxkx0UQfTG4DQ=;
 b=D/K8VfWZoBVEdljcXWaCU+Mjfboezn4VExREeLxxIv4OHdkTFueyfjMet7Sg0SJGlT
 cnYjjkWp8yfSzTyVT+v6oMTpIkVzNPmuHmCbzUdG2rDQRgTovneADjE09JcfrXKVwpBD
 nXEEc8b9sqaq5eJtkOfeIidNk5QqfjC5u+PQ9RV04tT760kb0csVd2KUndRbpC/VgnF4
 QLyVfj38npid2AeTve0HyR0TsUUhfFp8ICDnSkD0n8D26M6tWFbCb9DC/i479JcMzYkc
 IruFmoiIg6IfPFmORAiRAHrqEdUh1ELrr1Lg+A1lM1+BUKXwRZcNUGP0plYGH2SsjOG1
 16mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mG2CetGzS7CKTUwI5wgYD0g3r71RIHSxkx0UQfTG4DQ=;
 b=kHzMXbTiwDcOyippa1jvlzttIVQtj5PlrnkVXc/C7sOU+lYwYjm2DMD/VRftM51w13
 s/pOE5yAKp84WqfGi71GBr+NxO0wUKgTLhtTXA6UwFZwQmYhbSG2I/rDHSwrc5XRYrCa
 Qo18EyL4enRir3qdsRbDeLB8xVZGrnfAdlkPoDINyT0EvLv7gL/6qaMOxt+TMiyqgE21
 +pCuY14raUDFdtF8fwmmed21CJlcrJPDBIelOJmRzfS3tdnTq41DmYkrNWtFwmWUQEFA
 IH3aRoLh18gEinGRK0l0sTG9J/jSg1nAEv0MMv1xw/du0RaOq8widwUSzQ9OR/o2NuUV
 d5gw==
X-Gm-Message-State: AOAM532YaEGx288h3DzdB5eNWjlENBkwsLUtv7d3pBkbrVsklqnS19uA
 NP92AtVZo74q81nc2/vUDfgo7FP0Pj8=
X-Google-Smtp-Source: ABdhPJx1O4Boc38ZtAeU5ygI3n14EmywJT7vh9eFyjptL4vmBBmgrFT62CtVRxrZj9J4IDpjwbFepA==
X-Received: by 2002:a5d:564a:: with SMTP id j10mr4563257wrw.108.1618668128757; 
 Sat, 17 Apr 2021 07:02:08 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id v4sm11835991wme.14.2021.04.17.07.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 07:02:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] memory: Directly dispatch alias accesses on origin memory
 region
Date: Sat, 17 Apr 2021 16:02:06 +0200
Message-Id: <20210417140206.673885-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

The memory_region_init_alias() flow is:

  memory_region_init_alias()
  -> memory_region_init()
     -> object_initialize(TYPE_MEMORY_REGION)
        -> memory_region_initfn()
           -> mr->ops = &unassigned_mem_ops;

Later when accessing the alias, the memory_region_dispatch_read()
flow is:

  memory_region_dispatch_read(offset)
  -> memory_region_access_valid(mr)   <- offset is ignored
     -> mr->ops->valid.accepts()
        -> unassigned_mem_accepts()
        <- false
     <- false
   <- MEMTX_DECODE_ERROR

The caller gets a MEMTX_DECODE_ERROR while the access is OK.

Fix by dispatching aliases recusirvely, accessing its origin region
after adding the alias offset.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
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
index d4493ef9e43..23bdbfac079 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1442,6 +1442,11 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
     unsigned size = memop_size(op);
     MemTxResult r;
 
+    if (mr->alias) {
+        return memory_region_dispatch_read(mr->alias,
+                                           addr + mr->alias_offset,
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
+                                            addr + mr->alias_offset,
+                                            data, op, attrs);
+    }
     if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
         unassigned_mem_write(mr, addr, data, size);
         return MEMTX_DECODE_ERROR;
-- 
2.26.3


