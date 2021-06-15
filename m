Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88143A8151
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:49:03 +0200 (CEST)
Received: from localhost ([::1]:32894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9R8-0006BA-Vg
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hf-0005oS-7M
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:15 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hd-0002kd-Kb
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:14 -0400
Received: by mail-ej1-x62e.google.com with SMTP id nd37so14904379ejc.3
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NdoHLlFzwD8m2yrMeCWWQ4lmLVIsMmdxAXvwoIv9UDs=;
 b=CZJbVotei2YJzLuDS8YcREXuaWPVAqDex+fj/jucgtMAqYo4Pbpz9QXXNylPuXXvzO
 NRqRO2+BJTp3gXC72QJc3guXILoPeYbvz6NtL/s1m+T8c5ycyrPaqH0BLYIN/C0NHSR8
 Y5i5ig/Qfjk3wFs4ufdO9kY4tuT+srghvpBdAGYtwUg9lzL8Pu2jyC/yn1WDgFIJkJJm
 00NPKFCxpmOL6pqhJ7S8jfTCadw39pN7qc+lrCzhEaVZS3S9vFfEsw4y+xszpc/wwgAq
 BwdepD1L29y4YT0VExyJVeNO/fy2adUZdqzcPmkjgEnFcUxNL00uwS9ogL0WXRLFrWeP
 R1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NdoHLlFzwD8m2yrMeCWWQ4lmLVIsMmdxAXvwoIv9UDs=;
 b=eohjYBUO6HC9nnLn9FU+gMHO57wNwsn5yaVUvHwp8Pr9WPUOTtLydDSjq8lqDZIdCh
 TWHEdCaRM9iRbdMha7mVZWbqnrJ5h3pR9y9Ufno4z7ECaWthioxl0Y7TZtssm02QkFHU
 eXH3VKLjimA+7k98sc2K185pTpxzoXCw5HAJYV7CPxc4m9ACnkrxbkWtm0ZEiogpL5Yg
 zphH5xuvE9/K5cSc7aMf49r5u4KF6PB2scX8Zc3ISt0QSbtD6GG3cgA4MVIiwPY2pC4x
 n14JVKaM0ApAAsc4YCNiXaVg+ouKMwwPQhtvT0itQTyc6RSfs89aNo9NwgIIJ96peDu1
 OC/g==
X-Gm-Message-State: AOAM531IKDKorFUQdb0ZSlkAONtzHwuB+i6uAiWgQy5QHRL29UasUxzr
 OxGeeR7hjHU4Ywhyq8h7bvA3WzKO2tA=
X-Google-Smtp-Source: ABdhPJzEef0+r6YyRpFwyZKLJ1FGrYevGeT+D/ON3xRJw9dpvq0cC2zoA3OlLhaORoEfkX8zYQ2u2A==
X-Received: by 2002:a17:906:b191:: with SMTP id
 w17mr21429738ejy.10.1623764352310; 
 Tue, 15 Jun 2021 06:39:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/33] softmmu/physmem: Mark shared anonymous memory RAM_SHARED
Date: Tue, 15 Jun 2021 15:38:37 +0200
Message-Id: <20210615133855.775687-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
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



