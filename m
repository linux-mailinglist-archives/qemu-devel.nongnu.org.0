Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4233C4925A5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:24:00 +0100 (CET)
Received: from localhost ([::1]:58142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9nWp-0004jJ-5Q
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:23:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEN-0006CO-D4; Tue, 18 Jan 2022 07:05:05 -0500
Received: from [2a00:1450:4864:20::333] (port=40824
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEC-0005kt-Qt; Tue, 18 Jan 2022 07:04:49 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so5172047wmo.5; 
 Tue, 18 Jan 2022 04:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kmU4itPtJkI7ofMECtKgB5LQiZW9Htkdyqvn7BM7rHU=;
 b=KB9tZjAeXP8VnxbqkS2J07GiAei6mF0wylZg4jZXWAwNObpgyngsLQQzmPTepD+EY5
 xFyGlDH4HWs4PN2TTK5AFL+Dt56Tt9WCLrS6h29BKdwB2mtAJHam6TkD6ybxf+EPbU+M
 9KgqVH7q7oO+Hr+0Yzrgzr+QNO72nK5OASSYO2ZjPdlXBzWqJxrvqbtkdBxJert8qwAz
 YuS93lus7z1sIoh9rpDM1elL4yKhBqy02OST0dKmJj/6VbEJvkFEqRBkSwIbs92cQh3k
 J3LjdNcldHjeOAsUiqj8r/Fqdmloh/MldMtiPoJZtYYm+2QN7jt1lTbnx8iWy1tFUdq+
 T6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kmU4itPtJkI7ofMECtKgB5LQiZW9Htkdyqvn7BM7rHU=;
 b=YGlTY7J3O2B6ss4Zkrr/WTMlga+8GLI7xAzAOkTpL1r0YbOh7+wHo8Qzc8TQpsDyjs
 pzioZPn3tEjr1DNQTA7B/k55MKqQEiiX1Pce4z/ThrOCcEvI4CqKKl+p7Yrip0WUbJnw
 g7kCaXRWXj0Magv9vpOVaWeoK7t/6CpHi0eTFeGq7oXiL92P39EL7nlYWe5GDs2e5eao
 VlHmhYgJrFIJMd/Q59WL402kk46YLbxH5d+Nk0KZQGzMAPTZbicUNQdirFAxFqFEy5EX
 OAteXRT+3dY4Ofx8obZMFJ4iRnlEWDxA3xL4I4OmXOD7u5mgFIIgWkB1UqW43IxgPRY/
 uE/A==
X-Gm-Message-State: AOAM530wyyVB9ZmZ+BZNqZjBbAtDbV85v9ez35pMA69IUny3E+vO8BcD
 bjSHR+oyrGAUfPzdoqxXf68rsWwlHz0=
X-Google-Smtp-Source: ABdhPJxHO8CKNqE4Z+vrvqjjrAf+bVQTJRlmTboKdpEOGFhsLQ9TZILKP4BWxC/ZJFkbZwZWZPiJiA==
X-Received: by 2002:a7b:cd8b:: with SMTP id y11mr22842781wmj.76.1642507375058; 
 Tue, 18 Jan 2022 04:02:55 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 g3sm7468614wri.110.2022.01.18.04.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:02:54 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 05/19] memory: Make memory_region_is_mapped() succeed when
 mapped via an alias
Date: Tue, 18 Jan 2022 13:02:15 +0100
Message-Id: <20220118120229.196337-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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

From: David Hildenbrand <david@redhat.com>

memory_region_is_mapped() currently does not return "true" when a memory
region is mapped via an alias.

Assuming we have:
    alias (A0) -> alias (A1) -> region (R0)
Mapping A0 would currently only make memory_region_is_mapped() succeed
on A0, but not on A1 and R0.

Let's fix that by adding a "mapped_via_alias" counter to memory regions and
updating it accordingly when an alias gets (un)mapped.

I am not aware of actual issues, this is rather a cleanup to make it
consistent.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211102164317.45658-3-david@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/memory.h |  1 +
 softmmu/memory.c      | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 20f1b27377e..fea1a493b9c 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -738,6 +738,7 @@ struct MemoryRegion {
     const MemoryRegionOps *ops;
     void *opaque;
     MemoryRegion *container;
+    int mapped_via_alias; /* Mapped via an alias, container might be NULL */
     Int128 size;
     hwaddr addr;
     void (*destructor)(MemoryRegion *mr);
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 5e69624f7ff..e37a4b8ae39 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2545,8 +2545,13 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
                                                hwaddr offset,
                                                MemoryRegion *subregion)
 {
+    MemoryRegion *alias;
+
     assert(!subregion->container);
     subregion->container = mr;
+    for (alias = subregion->alias; alias; alias = alias->alias) {
+        alias->mapped_via_alias++;
+    }
     subregion->addr = offset;
     memory_region_update_container_subregions(subregion);
 }
@@ -2571,9 +2576,15 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
 void memory_region_del_subregion(MemoryRegion *mr,
                                  MemoryRegion *subregion)
 {
+    MemoryRegion *alias;
+
     memory_region_transaction_begin();
     assert(subregion->container == mr);
     subregion->container = NULL;
+    for (alias = subregion->alias; alias; alias = alias->alias) {
+        alias->mapped_via_alias--;
+        assert(alias->mapped_via_alias >= 0);
+    }
     QTAILQ_REMOVE(&mr->subregions, subregion, subregions_link);
     memory_region_unref(subregion);
     memory_region_update_pending |= mr->enabled && subregion->enabled;
@@ -2670,7 +2681,7 @@ static FlatRange *flatview_lookup(FlatView *view, AddrRange addr)
 
 bool memory_region_is_mapped(MemoryRegion *mr)
 {
-    return mr->container ? true : false;
+    return !!mr->container || mr->mapped_via_alias;
 }
 
 /* Same as memory_region_find, but it does not add a reference to the
-- 
2.34.1


