Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5481941AFDB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:19:21 +0200 (CEST)
Received: from localhost ([::1]:32790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVD0y-0002A6-Ca
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaJ-0006gl-Fv
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:51 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:39688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaH-0001WZ-ON
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:47 -0400
Received: by mail-ed1-x529.google.com with SMTP id x7so68158377edd.6
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BM+iD1PcwtRETlHUjTXSADa0Dlink82Tdo9tl/Wyh+U=;
 b=htg23bmCMM58/B2zrQAuD8RM+vDhUJqGSmGpaNqMZ9yWfWL7aR+5Pm7xvZ5Ic5cdsg
 TCr3cSnxzLb1V4wnAaI0a+t0ZEGx0wl37oNGqlpxx0RkYkskFVQmY0XzkOQnT6NT3XWD
 WiuQGeTOFAzXRffnogVq5XMGudHWK9JXY1eS2Ocyq9QV5SbeNTg7LA0b6e5zWe7AoTxL
 /+y4E9ZJ06AP1JiftcTUn3vRdrt6XgASQWNQtaDMCwqzNY/5X81MvuWpIvD0r8vSNHyJ
 JHCukAnl3g5Q1r1XKsHqAOsbm2xZl/khD4ignAku6UKjv0czocEH+FgNcW6qBpSNVUty
 JnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BM+iD1PcwtRETlHUjTXSADa0Dlink82Tdo9tl/Wyh+U=;
 b=yqGCDpz5Ak1CEDNt1/oZk29XgkS/YvV1xKAYFcu+e2XO9u/aINXrmI8AOeKujm9Kqi
 nWcUCUew+BSWMghdF1MEB9fEN/1INDnoYLkX/D9d2QPSQYL4AOs17j+PbQmCEGaThoBw
 Y58OiHLpK60QiuJ1+qlTnhU5rbIJCIcNhUAaOASYAid8tU9ZduEbK2k6JeZyU90n3JYF
 6VBpC6VOwhTXCcVFIoCr+iXghc9Pt2kJC7yr8vaXrEqDlml1G5Diz00STC40CP00IKRw
 1JSahQd82b3pDT8zaRvVrkd5LqnZsUtVx8DCQU79k3VvOh8/HEX0e/gdnic/BvsAXRtk
 VZcQ==
X-Gm-Message-State: AOAM533yhPhqKUgcoJ2W4Djjvbh/GNq7TAEXSlrStL5dbW3UzHlPenIc
 oLbXhFqNpcRhYIZ7SUQu6pS5zExCaOQ=
X-Google-Smtp-Source: ABdhPJwftiKtSMCvKxwQxyrp5qjPLIw9gBIj+uMynUG/PP439c93tiOe+2bRNwuo4JlO8WWJbMBuEA==
X-Received: by 2002:a17:906:bfe7:: with SMTP id
 vr7mr6524011ejb.32.1632833502545; 
 Tue, 28 Sep 2021 05:51:42 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/33] memory: Add tracepoint for dirty sync
Date: Tue, 28 Sep 2021 14:51:14 +0200
Message-Id: <20210928125116.183620-32-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Trace at memory_region_sync_dirty_bitmap() for log_sync() or global_log_sync()
on memory regions.  One trace line should suffice when it finishes, so as to
estimate the time used for each log sync process.

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210817013706.30986-1-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/memory.c     | 2 ++
 softmmu/trace-events | 1 +
 2 files changed, 3 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 54cd0e9824..db182e5d3d 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2154,6 +2154,7 @@ static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
                 }
             }
             flatview_unref(view);
+            trace_memory_region_sync_dirty(mr ? mr->name : "(all)", listener->name, 0);
         } else if (listener->log_sync_global) {
             /*
              * No matter whether MR is specified, what we can do here
@@ -2161,6 +2162,7 @@ static void memory_region_sync_dirty_bitmap(MemoryRegion *mr)
              * sync in a finer granularity.
              */
             listener->log_sync_global(listener);
+            trace_memory_region_sync_dirty(mr ? mr->name : "(all)", listener->name, 1);
         }
     }
 }
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 7b278590a0..bf1469990e 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -15,6 +15,7 @@ memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t va
 memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
+memory_region_sync_dirty(const char *mr, const char *listener, int global) "mr '%s' listener '%s' synced (global=%d)"
 flatview_new(void *view, void *root) "%p (root %p)"
 flatview_destroy(void *view, void *root) "%p (root %p)"
 flatview_destroy_rcu(void *view, void *root) "%p (root %p)"
-- 
2.31.1



