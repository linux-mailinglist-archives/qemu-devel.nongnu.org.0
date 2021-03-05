Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE55632F6FF
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 00:56:50 +0100 (CET)
Received: from localhost ([::1]:58812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIKJN-0000Ck-ND
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 18:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIKH8-0006ub-JX
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 18:54:30 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIKH7-0005si-1N
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 18:54:30 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so244670wmi.3
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 15:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4mjb5oVPdSX2n3hHdEG4YVcAQRM4J7GHgoGoVwiwxxY=;
 b=p3f0iUM22NybklUFvcTtr8DEnIqpWNXAkBCqsdRqJGcr4KGhXSDDu2wL/7Ymh7ZR0o
 j598skSGoULelCvC9081zlt6KQKxa4IXKf7iiZu8AQWbJ5BGvVKhA6CHBeIv/lkjtCa+
 8YV6i4gSZtAfogvUEYV0oDYZhWaGdyLxynm8T/XOKo4LHUcQkMUrTLojU87paguLLWdt
 D95LTC30Z2lbQtKKJOwEwbpCHF6+9tQT25Ld2+H8qr0BOz9sqzOjpygZD26Rcoc/REtl
 ymEeNMZWdoKZ90vN80cWGYlwne3KwuYuDI8+h23VAQNIwFJrTqyyzCCRQrPsD4G2JNXh
 aF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4mjb5oVPdSX2n3hHdEG4YVcAQRM4J7GHgoGoVwiwxxY=;
 b=aorcbsY7bkvzwrkuH0PAzLT/FYiLQNretYc4QYDYS+AxOPnkhn3FkYFA/+Y+DwRwQL
 wMVJw1Ls0xxV2mkgG/p5n4ixm3TcT9TCwsOO0Ac40kXR/weBjrlpGBNVjpa6mxxP6Arw
 Gh4q8SieM1WBsLsSBEtz5gv+rmCgoQInn35AXdI/cK8VhvVmuqCbs9c4i+TXFhScXdK1
 ABgLyk25EgphzZUv51p/FrwgSnLp/gFzcNZKKVfMxdRczPAGLONxCHWZg4FZidwHNcir
 1Ph8teZa4u2lNSs2rbFLu297rPRbNofAIk5Bvikx9sUsnnf36BA0S+ote8R68aWuQj/u
 +smA==
X-Gm-Message-State: AOAM530Ui6Cc8gyVIb371JZAEc5dvkm1ztfna+7NW126WKfyIGxGMFek
 RtGvZ6ClI0KPMhHHM/UOrTKJIuL22jM=
X-Google-Smtp-Source: ABdhPJxWzUtM3XKLlU5e5xBvTkeYnxwlSnB+TVgA73Y7Z2RHEHRhWo5z74Bi27ojf/d6Pz9uqO/AHA==
X-Received: by 2002:a1c:a5cb:: with SMTP id
 o194mr10910575wme.129.1614988466419; 
 Fri, 05 Mar 2021 15:54:26 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i1sm5838120wmq.12.2021.03.05.15.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 15:54:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] memory: Provide 'base address' argument to
 mtree_print_mr()
Date: Sat,  6 Mar 2021 00:54:13 +0100
Message-Id: <20210305235414.2358144-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210305235414.2358144-1-f4bug@amsat.org>
References: <20210305235414.2358144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently AdressSpace are display in 'info mtree' based on
the physical address of their first MemoryRegion. This is
rather confusing.

Provide a 'base' address argument to mtree_print_mr() and
use it in mtree_info() to display AdressSpace always based
at address 0.

Display behavior of MemoryRegions and FlatViews is not modified.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/memory.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index e4d93b2fd6f..991d9227a88 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2925,7 +2925,7 @@ static void mtree_print_mr_owner(const MemoryRegion *mr)
 }
 
 static void mtree_print_mr(const MemoryRegion *mr, unsigned int level,
-                           hwaddr offset,
+                           hwaddr offset, hwaddr base,
                            MemoryRegionListHead *alias_print_queue,
                            bool owner, bool display_disabled)
 {
@@ -2974,7 +2974,7 @@ static void mtree_print_mr(const MemoryRegion *mr, unsigned int level,
             qemu_printf(TARGET_FMT_plx "-" TARGET_FMT_plx
                         " (prio %d, %s%s): alias %s @%s " TARGET_FMT_plx
                         "-" TARGET_FMT_plx "%s",
-                        cur_start, cur_end,
+                        cur_start - base, cur_end - base,
                         mr->priority,
                         mr->nonvolatile ? "nv-" : "",
                         memory_region_type((MemoryRegion *)mr),
@@ -2995,7 +2995,7 @@ static void mtree_print_mr(const MemoryRegion *mr, unsigned int level,
             }
             qemu_printf(TARGET_FMT_plx "-" TARGET_FMT_plx
                         " (prio %d, %s%s): %s%s",
-                        cur_start, cur_end,
+                        cur_start - base, cur_end - base,
                         mr->priority,
                         mr->nonvolatile ? "nv-" : "",
                         memory_region_type((MemoryRegion *)mr),
@@ -3028,7 +3028,7 @@ static void mtree_print_mr(const MemoryRegion *mr, unsigned int level,
     }
 
     QTAILQ_FOREACH(ml, &submr_print_queue, mrqueue) {
-        mtree_print_mr(ml->mr, level + 1, cur_start,
+        mtree_print_mr(ml->mr, level + 1, cur_start, base,
                        alias_print_queue, owner, display_disabled);
     }
 
@@ -3188,14 +3188,15 @@ void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool disabled)
 
     QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
         qemu_printf("address-space: %s\n", as->name);
-        mtree_print_mr(as->root, 1, 0, &ml_head, owner, disabled);
+        mtree_print_mr(as->root, 1, 0, as->root->addr,
+                       &ml_head, owner, disabled);
         qemu_printf("\n");
     }
 
     /* print aliased regions */
     QTAILQ_FOREACH(ml, &ml_head, mrqueue) {
         qemu_printf("memory-region: %s\n", memory_region_name(ml->mr));
-        mtree_print_mr(ml->mr, 1, 0, &ml_head, owner, disabled);
+        mtree_print_mr(ml->mr, 1, 0, 0, &ml_head, owner, disabled);
         qemu_printf("\n");
     }
 
-- 
2.26.2


