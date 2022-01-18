Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEE3492586
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:15:06 +0100 (CET)
Received: from localhost ([::1]:37384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9nOD-00070G-DW
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:15:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nCC-0005zr-Hu; Tue, 18 Jan 2022 07:03:56 -0500
Received: from [2a00:1450:4864:20::32b] (port=41933
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nCA-0005iw-4I; Tue, 18 Jan 2022 07:02:40 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so6872083wme.0; 
 Tue, 18 Jan 2022 04:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MO1wiroHmEXR7v0/BicKh1zjhy8mrqOByKV8ImIX2R4=;
 b=OUMgJMPgkSEOHWnBB4CbNLg01dImnRR9b9K42JhRz+eTGmHFxiWDWsskLlVtxHDgvp
 J0Wga250YSCVVtJWGM32nBM4uUQoMRMi63R/20xnOvpTNADyUNyjzPmz+ZWLUFQ8R/Ys
 YzW4CFTMxcIabGDsk7pjeSUvFAROH4esLHD3ivaQGUeEtK1alDM/0EFMr0fNw6Cfe8Z7
 RTM7Ef5MhSVu0nvFg/QyK0bSdmgDiznaPq6eIdiyJBgkzfNMm64H4KbNWd/I/TS6MuDn
 lDZFF0UfaSKhvpi5L1DPLWNhGCSM4iaZm/LkMtt+HnLRFHEOMBXrYzofI1ZNkklHG0Jh
 v9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MO1wiroHmEXR7v0/BicKh1zjhy8mrqOByKV8ImIX2R4=;
 b=BocffW8MH0/5qCM9v7ayECyU7CrB2/PTK5Ffyn3Er2cEelBCXOpMgoAU1y6uGIBu0Q
 Sfazq9wTo78f8AXbCcXBNmA5L8undNhWP8wBofRR5VlX6OYCgug9LuViNd7PEasm1YXE
 wJtpFMBq6MKkRhWh+OT0M6xomicFDdweSyKBeson6f9m7dOvxz+MEvFl2uxl5+ZZbzdl
 zpCd5JlCHmgBHFcGt53tdSAYqiFpWrb9CFWeY65vzdmp/rcnCHvjy6WdP7ItEMSp3j2F
 cdex/RiGu9359PZ2dLUcEAVf6/RDfB1Mx3xUogdLFc1l4uSqeHV+XCGXQZIlUk1oZoO1
 vDSw==
X-Gm-Message-State: AOAM5307bjUET1TKlFaSmXNTabJGROJ4Qp+NY7MH9xPAW4n7I4jRgjRb
 EB8V3zTAy/9/yWSsvK4YrEjioTRjt9M=
X-Google-Smtp-Source: ABdhPJwb/vOZRF796fJSHfl3DOOjh+TRAgBg+Flqdq2jhPZk8YCOzAN+8SdYy09AYCaPcJwitx6zEQ==
X-Received: by 2002:adf:e949:: with SMTP id m9mr1670317wrn.401.1642507355493; 
 Tue, 18 Jan 2022 04:02:35 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 8sm17047839wrz.60.2022.01.18.04.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:02:35 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 01/19] memory: Directly dispatch alias accesses on origin
 memory region
Date: Tue, 18 Jan 2022 13:02:11 +0100
Message-Id: <20220118120229.196337-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

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
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210418055708.820980-1-f4bug@amsat.org>
---
 softmmu/memory.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7340e19ff5e..0c463e0fe53 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1444,6 +1444,11 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
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
@@ -1488,6 +1493,11 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
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
2.34.1


