Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E73932F6FE
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 00:56:46 +0100 (CET)
Received: from localhost ([::1]:58366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIKJJ-0008T2-Ju
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 18:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIKH2-0006ms-K4
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 18:54:26 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIKH1-0005rg-BN
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 18:54:24 -0500
Received: by mail-wr1-x431.google.com with SMTP id a18so3887775wrc.13
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 15:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2yJZvfO9sIo/QVUNGf9LQHlm++XZyAwu6lIoAPys+a8=;
 b=c7JTH2M0QrgF1ryBnhZU1bGyWEgtPFb2Wtjc3j4QrehofcbNpv//vK2VZHo0mSH77x
 4CfNuI/scI0fSwOszQ6Ix38FlFBswcBnOtz3ORd1y37duCRlHwgLx2uAjjJUIbt+idDP
 IYtGJxxj8XZeHpDzmKjKARfBoa0NKDaNPZfrUr5djr2Oob0bJ6PcefhIk9cUilVT4dKh
 ErWKtYDgkv33HuXaiwtUem9wyDUelkKND+U7gvLtTG1oviMD2Xx9YJXqLPWathv+S/az
 XCt5mh/KTfbiEDcAFU+onCpNp6wFH+S4OIfIpYvHA6eFHWOSf7de/NZgYqndCTsxGoHK
 vC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2yJZvfO9sIo/QVUNGf9LQHlm++XZyAwu6lIoAPys+a8=;
 b=gzdVaBgzdmqXRx4YFjDv4ryuUALuu+CvYCBGStzptwpsXeCo7jOvgiWVQAQ02TVE/K
 V5cQCLltUbOT+sOnJ6POqCnAj01/HZVB9fVB5AwE4XpWsDMsB6t2PzoflaqGc2Deo0+8
 1vK2clvD4iJIGgoAvgJ+32vPmY1c/ALyZzC2iB3UyIIEq49dQfqn4dg0gy4xa1wtrKcL
 QZ8cQp0LAql7XqM6PcYVtsg6YBYf0QPHJsmsOjdRH4yvGPm/fnsSwkj2KRAdaM9Hu1ci
 c78VJvTwtxsUCMsc7IveO9UJunnRgT/yPzfadQ0+BMkspmNqsBh2VXPmWT0sZqYn7vxo
 4Viw==
X-Gm-Message-State: AOAM533pAoFcDM2vszoG6WVYrEWhy4cejp1bS2AyzPyL9jlFIiXUW1fe
 zw5Vd0g7JO6E1Nzy2TI/ctk3zuMm3nU=
X-Google-Smtp-Source: ABdhPJwf3mfNiMWi1Foi5fJPVGyL6v24fJPprwDvfmTyKXZV481NaShjzeyYL5GQpRizIna2UlHGbw==
X-Received: by 2002:adf:e482:: with SMTP id i2mr11695759wrm.392.1614988461560; 
 Fri, 05 Mar 2021 15:54:21 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm4213490wmq.11.2021.03.05.15.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 15:54:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] memory: Better name 'offset' argument in mtree_print_mr()
Date: Sat,  6 Mar 2021 00:54:12 +0100
Message-Id: <20210305235414.2358144-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210305235414.2358144-1-f4bug@amsat.org>
References: <20210305235414.2358144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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

The 'base' argument of mtree_print_mr() actually represents
an offset, not a base address. Rename it as such.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/memory.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 874a8fccdee..e4d93b2fd6f 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2925,7 +2925,7 @@ static void mtree_print_mr_owner(const MemoryRegion *mr)
 }
 
 static void mtree_print_mr(const MemoryRegion *mr, unsigned int level,
-                           hwaddr base,
+                           hwaddr offset,
                            MemoryRegionListHead *alias_print_queue,
                            bool owner, bool display_disabled)
 {
@@ -2939,7 +2939,7 @@ static void mtree_print_mr(const MemoryRegion *mr, unsigned int level,
         return;
     }
 
-    cur_start = base + mr->addr;
+    cur_start = offset + mr->addr;
     cur_end = cur_start + MR_SIZE(mr->size);
 
     /*
@@ -2947,7 +2947,7 @@ static void mtree_print_mr(const MemoryRegion *mr, unsigned int level,
      * happen normally. When it happens, we dump something to warn the
      * user who is observing this.
      */
-    if (cur_start < base || cur_end < cur_start) {
+    if (cur_start < offset || cur_end < cur_start) {
         qemu_printf("[DETECTED OVERFLOW!] ");
     }
 
-- 
2.26.2


