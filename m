Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE33C3A8184
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:57:14 +0200 (CEST)
Received: from localhost ([::1]:34554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9Z3-0000vf-TC
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hh-0005to-5Q
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:17 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hf-0002mD-L6
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:16 -0400
Received: by mail-ej1-x62a.google.com with SMTP id g8so22656446ejx.1
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VfdzGHWM1V4e3ocZC9Ld1RwC+NetqD/RU7bcXjAcddc=;
 b=iE4flkm9oxpBzzyPKR6z0u5mLtEAmDJtHvqgYcofQWoZXj+9MJLmfVe3i5z3J4pDdk
 TnjHW9XELCHqsqBKwM5I7EkjdIxBn6sMM3iHLDB1Gm8fR0zYCjZm/3gvmOpaISZNFkR8
 PfT5fRjvLQZ1WCsOcaaImXcfsf3PTpTWqfkPkKHgtZfj+h3o+V2SdJzY7cRM7crsQl/o
 HIkV2bti2RSHmeImc2v6TbScXYhJUWZ3waKIWMpy3lWuqtCnR68AeWpQ9tNrHbkzr5y+
 aWL+17RBLNtZvl9z3nUhYxYILX0B9VvLy1rsq7szjZ7Q6grespohNkh8IHK0mknN42wj
 D3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VfdzGHWM1V4e3ocZC9Ld1RwC+NetqD/RU7bcXjAcddc=;
 b=QdanTjh1zs1qSf15eGd+Ez4gzaSQHanFO4710zzTMi/z6+mWID6A+Bn0XIDk1P2o2y
 xVErVd1zCNZDI3LyoCVJQOwnw3BOYp1vBy5QiozES1Lf82cMidOYXFU/4cmsgxt4Z/JX
 vvQBArA8z0i1ANc6AooGDgl456rdhsYsL4w1pDiM7tIt5nUoijfCtT5sphx45/VeYZTd
 YGFaVeMVZTZEGHbYQ3IHteSDjl5j822xU5nztxCKkuHdYWfrNEWmA8wrdLPgC3mQ2ohq
 a7NCyPgKiXSp8W+ANQ2DFvhj0aeXh20eIYJmQDjHQZgT4ceZcEv88T+GFOipDYZSWFli
 uRSQ==
X-Gm-Message-State: AOAM532VGuF5swUMwFoB/VkFnH/RGsvyGk5nED81+EGWAyq2KQD5TMIU
 E5tvAd87fxCH89rY4/gARFFo6hWAjPI=
X-Google-Smtp-Source: ABdhPJzAe6IE75tHSFewqbOXFPcJjhpj9sRkgWy8O5ehVb6izNVYwc7mwG/NX9gNfEK9BolUwHy3Zw==
X-Received: by 2002:a17:906:7c4d:: with SMTP id
 g13mr21052035ejp.216.1623764353778; 
 Tue, 15 Jun 2021 06:39:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/33] softmmu/physmem: Fix qemu_ram_remap() to handle shared
 anonymous memory
Date: Tue, 15 Jun 2021 15:38:39 +0200
Message-Id: <20210615133855.775687-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
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
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

RAM_SHARED now also properly indicates shared anonymous memory. Let's check
that flag for anonymous memory as well, to restore the proper mapping.

Fixes: 06329ccecfa0 ("mem: add share parameter to memory-backend-ram")
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210406080126.24010-4-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/physmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index b417f9c282..2f106d0680 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2243,13 +2243,13 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length)
                 abort();
             } else {
                 flags = MAP_FIXED;
+                flags |= block->flags & RAM_SHARED ?
+                         MAP_SHARED : MAP_PRIVATE;
                 if (block->fd >= 0) {
-                    flags |= (block->flags & RAM_SHARED ?
-                              MAP_SHARED : MAP_PRIVATE);
                     area = mmap(vaddr, length, PROT_READ | PROT_WRITE,
                                 flags, block->fd, offset);
                 } else {
-                    flags |= MAP_PRIVATE | MAP_ANONYMOUS;
+                    flags |= MAP_ANONYMOUS;
                     area = mmap(vaddr, length, PROT_READ | PROT_WRITE,
                                 flags, -1, 0);
                 }
-- 
2.31.1



