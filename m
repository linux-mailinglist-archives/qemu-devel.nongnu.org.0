Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4942EF637
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:07:10 +0100 (CET)
Received: from localhost ([::1]:48704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvEC-0002Er-P9
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:07:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyg-0008Mc-0j
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:51:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyd-0005aI-L4
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:51:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610124662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/J4bKY4spbyqTa1cxPEZEXtKvTXvco8Td85YHBmvnfU=;
 b=HnYOFdpgWk/tqFYzNNgtyONM91dyYVJ+K3S9EzqA4gxw7SoLZawvARTLyXP8EqNytojMTz
 YSNG2SLSNwA8X+oskDsGkuzEHdvO6FZJSvFipg1OsI4gqR4nMqeQK0pJyTBdkcFlWrtYYT
 OPArg8HBPlcK6EP8Ihr90kB1egRliHU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-ANs1bvCwMfay9hFhu_CIUw-1; Fri, 08 Jan 2021 11:51:01 -0500
X-MC-Unique: ANs1bvCwMfay9hFhu_CIUw-1
Received: by mail-qv1-f70.google.com with SMTP id i20so8647647qvk.18
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:51:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/J4bKY4spbyqTa1cxPEZEXtKvTXvco8Td85YHBmvnfU=;
 b=swraNarywYBR7+5tZfzDTiM9yLNM4emmBDno+vPUV3Vd9QiuA8RBY5fKJRQUUj1CDM
 Ko+ZuViUQ62uw4rMkQ/w9fgsRa7vdZ51lYtKJy1QoJ0HlIojAHIn4O/DYoHGxCL54hYF
 SIRGQ4tEJ6XMm9IgLxS0pegei40MPyB+ptNJOJ5ojZh4h8qKHkLPG20AVEgTds5tJJDd
 m983/+/fWWweBOL6NR5nIOjDKF5xJGit8hsEbhJc2FbDE0zMjaEPUiskgM/CE/H405Z4
 L8Cx9Bd5CkhURpCVnLoIW+m/DY1IekdV0rZKomUvZt9FnCBIaBSDneab+EV9LGVZD/xA
 OoNg==
X-Gm-Message-State: AOAM533ojg5UzIp4oyn8cgCKFDrdTefDeaKHgWk41XoIdtt1F07IFV2v
 bbd08kkI1pPDdYa8gjTsHtYin8GmxqTP8yiMbXtPw4cvF7Z6JMcjZ9nw0LmX7Fod9diL0pFeBuu
 nLwU1pUs5zBov71L+FIG3Mbh4Km7EtVYHdDhQRhy+UvI8mhhR/VOGmhIQmDvjGiao
X-Received: by 2002:a37:9304:: with SMTP id v4mr4716018qkd.137.1610124660293; 
 Fri, 08 Jan 2021 08:51:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLKnwY7W9tRGNjXkhtSxcLpKbKST9IqD0ZakLhQbKNffOLuDhKByIrq5myOvEz4OnhWAZV6A==
X-Received: by 2002:a37:9304:: with SMTP id v4mr4715989qkd.137.1610124660046; 
 Fri, 08 Jan 2021 08:51:00 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id n5sm4954064qkh.126.2021.01.08.08.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 08:50:59 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/13] KVM: Cache kvm slot dirty bitmap size
Date: Fri,  8 Jan 2021 11:50:47 -0500
Message-Id: <20210108165050.406906-7-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108165050.406906-1-peterx@redhat.com>
References: <20210108164601.406146-1-peterx@redhat.com>
 <20210108165050.406906-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cache it too because we'll reference it more frequently in the future.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c      | 1 +
 include/sysemu/kvm_int.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 9cb06ec4d1..5339de04cf 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -630,6 +630,7 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
     hwaddr bitmap_size = ALIGN(((mem->memory_size) >> TARGET_PAGE_BITS),
                                         /*HOST_LONG_BITS*/ 64) / 8;
     mem->dirty_bmap = g_malloc0(bitmap_size);
+    mem->dirty_bmap_size = bitmap_size;
 }
 
 /* Sync dirty bitmap from kernel to KVMSlot.dirty_bmap */
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index e0afdd02fd..7472ddb1a7 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -23,6 +23,7 @@ typedef struct KVMSlot
     int old_flags;
     /* Dirty bitmap cache for the slot */
     unsigned long *dirty_bmap;
+    unsigned long dirty_bmap_size;
     /* Cache of the address space ID */
     int as_id;
     /* Cache of the offset in ram address space */
-- 
2.26.2


