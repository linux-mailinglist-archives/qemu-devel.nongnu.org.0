Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B657733491A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 21:48:29 +0100 (CET)
Received: from localhost ([::1]:38672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK5kq-0005IO-MT
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 15:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK5WH-00068m-2d
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:33:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK5WF-0000jd-EX
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615408402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FoLec6+xKQz6+kZzNSNrg7nWUFgwlkYHzUSpPyi8uF8=;
 b=VMA1aDCxmFoXI7fM51STwB1weQd5/Z8PGR3uBLvJf064yKK5fIj7vVj1zLwZ+QZ1KsLH2p
 uvW1XGNTPZvoYPARY3GqUauEqDX36m94llQbz9jH608tru6PV/dsea+LBWYCIHo+5zyfWg
 5Err5traocbgRBaFVp92CKHYzcghx70=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-PDDei4lgNzSGk1j_9DTomg-1; Wed, 10 Mar 2021 15:33:12 -0500
X-MC-Unique: PDDei4lgNzSGk1j_9DTomg-1
Received: by mail-qk1-f199.google.com with SMTP id h134so13789991qke.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 12:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FoLec6+xKQz6+kZzNSNrg7nWUFgwlkYHzUSpPyi8uF8=;
 b=K+5HMzQxgBhuwk4HTuSEzPwmIx0Toz/StDEV9WiYU0Wgh1YELfYjDuCdVVpePpMMAJ
 QoXgysmYl4DocS7gQTgrKzZmbi106Y0182PV0cp+w59oCn0eBGT+Tghb/GQl/bqdEWZz
 wTIMVgAAeFwWQKXSEB+PMCgXqv7QVaTPxN2wehQs4lMQfpZQxAa8HJlAUUlNpUMtcvSm
 Dz5Jxy2TruWhSw8azF1/BHTxFf6guXtdaXf6UPDvGY+mO+Cb8PDuJV95/ofQRblviPib
 M1A8JYlwrs38B8/oA8lRvnamY+z35sGVIhRJEexfAQgxu+HxdHkL9dBxCtbNuCtT2eYb
 WzYQ==
X-Gm-Message-State: AOAM532sTrZTzKsK5D8p9X+AjOUx5BzZTNDLa7w8Y+SJv3AQp4a48pPE
 cUTRMCTCLuwotYNWXxnw5qQk+fV6ie55zivpCJZaby4Y1KhSABPbc1a/P3GO5kXdOi44HDNbXbt
 84ZAYUP5DB0M3BJbtWnvrKvaHzNKkMKFxjjZ1wX+zw9vXNwY8Ge5vaaHWBIbfLN0n
X-Received: by 2002:a05:620a:914:: with SMTP id
 v20mr4629036qkv.140.1615408391365; 
 Wed, 10 Mar 2021 12:33:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgAqrOgEZzkj6ZjV9TWgdWMbvdSqrR0M3RECr1xOJVFWMXsoUYdS4SII97+3q/Cee9L955Eg==
X-Received: by 2002:a05:620a:914:: with SMTP id
 v20mr4629007qkv.140.1615408391070; 
 Wed, 10 Mar 2021 12:33:11 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id z89sm306746qtd.5.2021.03.10.12.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 12:33:10 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/10] KVM: Cache kvm slot dirty bitmap size
Date: Wed, 10 Mar 2021 15:32:58 -0500
Message-Id: <20210310203301.194842-8-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310203301.194842-1-peterx@redhat.com>
References: <20210310203301.194842-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index 20f852a990b..a1e7b1332a1 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -612,6 +612,7 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
     hwaddr bitmap_size = ALIGN(mem->memory_size / qemu_real_host_page_size,
                                         /*HOST_LONG_BITS*/ 64) / 8;
     mem->dirty_bmap = g_malloc0(bitmap_size);
+    mem->dirty_bmap_size = bitmap_size;
 }
 
 /*
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index ab09a150e19..c788452cd96 100644
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


