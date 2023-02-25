Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F4F6A2AB9
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 17:33:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVxSw-0006ws-EF; Sat, 25 Feb 2023 11:32:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pVxSs-0006ub-D2
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 11:32:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pVxSp-0007n5-Am
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 11:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677342718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4KgT2+S1We7LJEei51AwIQia0/3Tv3edo38yyoS6jKc=;
 b=DBArSuTNRlxhjLZB6z524GGx2dwm7ps5gTGjafKf+n/gZl//csJTd9a8jcRM4JS6UVKVR1
 lTz35pqdxoiX2Ok2YNqrel4esqG7X/bsuloV10B0OugTmsL6FwlaZYZIxxUl8+MU368OuX
 I/PlWYJEO7G7MOwLHl+TDZk8xYMXOEI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-258-Ivh0_SzkOh6tinrDkOUX4A-1; Sat, 25 Feb 2023 11:31:57 -0500
X-MC-Unique: Ivh0_SzkOh6tinrDkOUX4A-1
Received: by mail-qt1-f197.google.com with SMTP id
 c5-20020ac85185000000b003bfae3b8051so1345981qtn.0
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 08:31:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677342715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4KgT2+S1We7LJEei51AwIQia0/3Tv3edo38yyoS6jKc=;
 b=1KqrHlVmjbJdoU5pJxfpH0JGk2b9z8LsZCgbH63KREpgW7cprynm1SceRx0OpfRTCc
 SOh+wuUQuiNF7d7/wKLxRmSKTy2A7GwJaK1Ey3rj/UKqxdVnE3wsjEUXFPOU1VspOb7o
 ue90I3/ktfQ023i6wAGni+vY67mgOOdEUTcD6LUpnCxON3YjR3XGinhYkBXGl/wFWW6o
 RslR2BCXrG1MZUkv/XH4GuYxaNTqedfQ0o0DoHOD+z2C8LbqlFpWF9twu5YnaG3AqvY1
 p5zE7SAXLPvyxX1RPClaYXyWuH4V7MbRKls5/CyckFXLchwLbO7u+5OoHV+uJiWpqy1B
 SWcA==
X-Gm-Message-State: AO0yUKUn2OwPsM106ivlHw51WWZgDHH23ovFfQ9RmTRQMCMPMcqir3jP
 4BMeCHLlqPhql2061VuZYaMt1E7ywGJLb/MdTWwK+WzDf6Fkm6dZWjFjFmg4OqkuuU9at2ivoNI
 M5Z1oe6zdLyxllXc+zpgvpIcEh020oWN7oLJRXiPrfPrPcyFqblDeeprnfq4VdQsFVKJuUQ==
X-Received: by 2002:a05:622a:1822:b0:3bf:be4b:8094 with SMTP id
 t34-20020a05622a182200b003bfbe4b8094mr9562678qtc.0.1677342715622; 
 Sat, 25 Feb 2023 08:31:55 -0800 (PST)
X-Google-Smtp-Source: AK7set/y9tanwG7m3Xcj+W8VLLN07nI6CjBKP5IF6+zwazX6mm22KVySBFh1ai/Z93lZAZbIW7qksw==
X-Received: by 2002:a05:622a:1822:b0:3bf:be4b:8094 with SMTP id
 t34-20020a05622a182200b003bfbe4b8094mr9562632qtc.0.1677342715233; 
 Sat, 25 Feb 2023 08:31:55 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 t8-20020ac85888000000b003bb8c60cdf1sm1558142qta.78.2023.02.25.08.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 08:31:54 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Chuang Xu <xuchuangxclwt@bytedance.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 peterx@redhat.com
Subject: [PATCH RFC 3/4] memory: Protect memory_region_clear_dirty_bitmap with
 RCU
Date: Sat, 25 Feb 2023 11:31:40 -0500
Message-Id: <20230225163141.1209368-4-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230225163141.1209368-1-peterx@redhat.com>
References: <20230225163141.1209368-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Clear dirty bitmap operation needs to walk memory_listeners but the context
may not hold BQL.

These callers hold BQL for it:
        cpu_physical_memory_sync_dirty_bitmap
        dirtyrate_manual_reset_protect

These callers hold RCU for it:
        migration_clear_memory_region_dirty_bitmap [1]
        cpu_physical_memory_test_and_clear_dirty

The above case [1] is extremely unobvious and probably still buggy,
because:

  - Either the RCU read lock was taken very high from the stack in
  ram_save_iterate() or ram_save_queue_pages() where the RCU lock was
  probably taken for the sake of ramblock references (which is also
  protected by RCU), or,

  - I _think_ there's path that leaks taking any lock (e.g. the other path
  migration_clear_memory_region_dirty_bitmap_range which is used by
  virtio-mem or virtio-balloon that may or may not really take RCU at all,
  neither BQL).

Add the RCU read lock in memory_region_clear_dirty_bitmap() to make sure
it's not missed.

The RCU is also needed for address_space_get_flatview(), so this will
generally making the RCU section larger to cover the whole walking process
when not taken, but wanted.

This should be the only place that we referenced memory_listeners (or
as->listeners) without guaranteed to hold BQL nor RCU.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index c48e9cc6ed..95cdcaeccf 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2270,7 +2270,8 @@ void memory_region_clear_dirty_bitmap(MemoryRegion *mr, hwaddr start,
     FlatRange *fr;
     hwaddr sec_start, sec_end, sec_size;
 
-    QTAILQ_FOREACH(listener, &memory_listeners, link) {
+    RCU_READ_LOCK_GUARD();
+    QTAILQ_FOREACH_RCU(listener, &memory_listeners, link) {
         if (!listener->log_clear) {
             continue;
         }
-- 
2.39.1


