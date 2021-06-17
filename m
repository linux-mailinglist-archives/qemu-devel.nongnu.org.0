Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D32E3AB002
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:43:40 +0200 (CEST)
Received: from localhost ([::1]:44172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoYl-000377-5g
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNI-0002jj-Vc
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:48 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNH-000681-4R
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:48 -0400
Received: by mail-ej1-x62d.google.com with SMTP id gt18so8688321ejc.11
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NdoHLlFzwD8m2yrMeCWWQ4lmLVIsMmdxAXvwoIv9UDs=;
 b=n7nffUNP3ajfEokW8OxvbBSdFmM6TZVEbVEjMCosEdIczjzRuPhqnULgFXzrAqelM7
 IV1xCNjWLvHL7Zfh9TXvYGTfImCo2xYfmgrmkLebaIr2h9DfNz05ssfIKuzifuluFv0+
 pDQ9ozGRp/KwzNMmZ0bSu1nfqZ/OvBWfM+GuBLJY6XNg8rjHaMV3MI/tWOlkJSj3/JIv
 YfPGBvc5FPiobtVqL/WDCQB1MPem/MomRaAumnC3KGrtY8mSkcn350AUlr4auaNbnKFt
 9C7WRVRJRYpvoNjaCn4Bybl1xunl6aNd0s9hMXf0iaKxim7IgQ41TAcgD0GyZycjsx9Y
 VHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NdoHLlFzwD8m2yrMeCWWQ4lmLVIsMmdxAXvwoIv9UDs=;
 b=L8VgSEwk7hUTsFcYZ4tsqnE8f1rpZCRWzN8zCFYW++yhjEO7cuwomN0F2a9BmRJiKt
 Ora1I6w43xPpj6fN3+mRu1k7QQFykDiTZSjZTD5QjC2g0MSVFG4Q1aqJZai1kfnN+PFB
 FzkbjxU0BbD7Fk6zZj4o1ooWyHIfrjw46/bO7+rbOR3ffc5ggsk2gwfPf/grsZZRYTZc
 lbWFOW3qfpI+R481ip4wiDqvEpCaMydIHoNBgL5ERCNperFk3cMeskNJYG5gripNAd+1
 fqZafhv6oFnGIR4cwTCHhxkNdDmWsyckdyc2vUotjtytfKN+r4Y1g7YE5GTzG5mpZMI0
 4pxg==
X-Gm-Message-State: AOAM532Nn38cYe+3hQXuQemgWWYvg7sZtu+v7WztlqwggYSg+KWZfg81
 8TNE4Nm+klceJSqnElrBE1cFgPPxBcc=
X-Google-Smtp-Source: ABdhPJzRdSjXv4LbmOw4eV46oKXprUMeSKUuv2SItO74mCmEQJFDyIt3+maR6ckEe2AnHmrC8JrKaQ==
X-Received: by 2002:a17:906:128e:: with SMTP id
 k14mr4192249ejb.485.1623922305949; 
 Thu, 17 Jun 2021 02:31:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/45] softmmu/physmem: Mark shared anonymous memory RAM_SHARED
Date: Thu, 17 Jun 2021 11:31:04 +0200
Message-Id: <20210617093134.900014-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's drop the "shared" parameter from ram_block_add() and properly
store it in the flags of the ram block instead, such that
qemu_ram_is_shared() properly succeeds on all ram blocks that were mapped
MAP_SHARED.

We'll use this information next to fix some cases with shared anonymous
memory.

Reviewed-by: Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210406080126.24010-2-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/physmem.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 1c8717684a..b78b30e7ba 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1946,8 +1946,9 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
     }
 }
 
-static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
+static void ram_block_add(RAMBlock *new_block, Error **errp)
 {
+    const bool shared = qemu_ram_is_shared(new_block);
     RAMBlock *block;
     RAMBlock *last_block = NULL;
     ram_addr_t old_ram_size, new_ram_size;
@@ -2084,7 +2085,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
         return NULL;
     }
 
-    ram_block_add(new_block, &local_err, ram_flags & RAM_SHARED);
+    ram_block_add(new_block, &local_err);
     if (local_err) {
         g_free(new_block);
         error_propagate(errp, local_err);
@@ -2147,10 +2148,13 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
     if (host) {
         new_block->flags |= RAM_PREALLOC;
     }
+    if (share) {
+        new_block->flags |= RAM_SHARED;
+    }
     if (resizeable) {
         new_block->flags |= RAM_RESIZEABLE;
     }
-    ram_block_add(new_block, &local_err, share);
+    ram_block_add(new_block, &local_err);
     if (local_err) {
         g_free(new_block);
         error_propagate(errp, local_err);
-- 
2.31.1



