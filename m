Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47444670B59
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:11:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9I-0000D2-F5; Tue, 17 Jan 2023 17:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9G-00007E-AR
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9D-0007YX-Lv
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vOgoyenP92MI75OuuSbWf2PpAHEguwfvpUNa2Tx4ejQ=;
 b=Nbo7f1h9b6QL12HPaOJJTibm5p/3jzr1P6/NUoQ+N7zy9aBdxVVvF8zU/tjnilo2cPBioT
 uCxKCFPEVpXNFfFvMpGoxSG0jj1y5JYtyMTvWxMeJeojX3PmDMluyYAX7A2p4o5tJ/C8dF
 J4VpR/jtSHoqQ9cmDinlxiE3ZBMbM3A=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-507-4Igi9gGjPFqaBlaOpsSeOA-1; Tue, 17 Jan 2023 17:09:36 -0500
X-MC-Unique: 4Igi9gGjPFqaBlaOpsSeOA-1
Received: by mail-vs1-f69.google.com with SMTP id
 b65-20020a676744000000b003cedad0ea4bso8210435vsc.9
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:09:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vOgoyenP92MI75OuuSbWf2PpAHEguwfvpUNa2Tx4ejQ=;
 b=F4HJRR8x/4C6N0rF0Du9D1DnmHFB5dRQz46TPJyB6tF28Jam358nxnNpBcEPA3pO+J
 ZeJboyuscV5ZVULpxVx3Hratm/9LsVlYXTlzRL/ltEEOeDRLHzIg2zhP8POQTlMoeG3b
 aXzFdead/5AQu4O2uS8PpuAy8J1EvPGLlrntf2psBw+vsecY4IMh6C4tj16IPxdYGaQy
 o+uTie0oZXcXMAjYNeeGZ9ZI+9sym5Y+Lmap+iw2pv0W09/QKGv3oT5ELeyrseto+slg
 9ft1UBaQ0v6PkG6+FaadD9YHXfAiZqCGXX3Zpnwem6LZgcPefVCHz4xxlny973FEeXJO
 1bdw==
X-Gm-Message-State: AFqh2krjtlPuO2q6KYmSED6UnKvWoTzjmhumuzQdvVAG5TU8wEjZR4wR
 ldkk98mWFiVwlw07c9lUQ2ep3xUm+4MFFcWux3tWtkAjXErEYsQvudF767RCNIy9t3TyQwlHJpY
 3F2wtX8K/+rF0ThRsD5SZ3EcX7vj4ubcpuKhJRVqp1mhZKGJLiaG2Rwb28fXjftmz
X-Received: by 2002:a05:6102:2f9:b0:3d0:e802:2f7d with SMTP id
 j25-20020a05610202f900b003d0e8022f7dmr2403844vsj.13.1673993375037; 
 Tue, 17 Jan 2023 14:09:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsGELj8RRaJlcwuKvPt2ZLOgcAn51lq/aLv5xR5o3raou2OBHrIb9nhyhQmIZ8PRiPH3t7oRg==
X-Received: by 2002:a05:6102:2f9:b0:3d0:e802:2f7d with SMTP id
 j25-20020a05610202f900b003d0e8022f7dmr2403814vsj.13.1673993374743; 
 Tue, 17 Jan 2023 14:09:34 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:09:33 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 07/21] ramblock: Cache file offset for file-backed
 ramblocks
Date: Tue, 17 Jan 2023 17:09:00 -0500
Message-Id: <20230117220914.2062125-8-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230117220914.2062125-1-peterx@redhat.com>
References: <20230117220914.2062125-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This value was only used for mmap() when we want to map at a specific
offset of the file for memory.  To be prepared that we might do another map
upon the same range for whatever reason, cache the offset so we know how to
map again on the same range.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/ramblock.h | 5 +++++
 softmmu/physmem.c       | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
index adc03df59c..76cd0812c8 100644
--- a/include/exec/ramblock.h
+++ b/include/exec/ramblock.h
@@ -41,6 +41,11 @@ struct RAMBlock {
     QLIST_HEAD(, RAMBlockNotifier) ramblock_notifiers;
     int fd;
     size_t page_size;
+    /*
+     * Cache for file offset to map the ramblock.  Only used for
+     * file-backed ramblocks.
+     */
+    off_t file_offset;
     /* dirty bitmap used during migration */
     unsigned long *bmap;
     /* bitmap of already received pages in postcopy */
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index a4fb129d8f..aa1a7466e5 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1543,6 +1543,8 @@ static void *file_ram_alloc(RAMBlock *block,
     uint32_t qemu_map_flags;
     void *area;
 
+    /* Remember the offset just in case we'll need to map the range again */
+    block->file_offset = offset;
     block->page_size = qemu_fd_getpagesize(fd);
     if (block->mr->align % block->page_size) {
         error_setg(errp, "alignment 0x%" PRIx64
-- 
2.37.3


