Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA69538F1EE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:03:27 +0200 (CEST)
Received: from localhost ([::1]:48846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDzC-0004xh-AG
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeR-0004r1-3N
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:59 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeI-0004Np-Jl
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:58 -0400
Received: by mail-ej1-x62a.google.com with SMTP id f18so12624571ejq.10
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XwYPwSfA8Cvd3/TBJlc2cW5Z9lV4MqaeOY7vnJJhpgo=;
 b=kx41ThiT0Sp7DPEHEhXUgWUGConJajD3+F3eb2rghcQ7OryOhXAJlHW8zH2ggxdzoc
 IPGxDbjthdAydZb/IWbnIytCm8AXvWAuUIm1e8Yv03p2oVqSOL/n2f6S8R5jEuGliTeV
 JPpCETHRWned+Ft1jvzZTfdWuYg8AJ90YDrYjx3sUN9yrd26/mPlll+hyBp2VIbdqIGn
 3w/CsUvUtJg06C3h7t9Eyuyy0svQdb9VR6Nrs8HfEcZOud7Wax0H55c2QP2QLxrpSBG8
 OdskPtIFpuC6fIbfXlymhYAYXu3vy4N9N5MFAtQt/3aDRxkk1uUv4fsiCv83oCQ6/n+s
 eR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XwYPwSfA8Cvd3/TBJlc2cW5Z9lV4MqaeOY7vnJJhpgo=;
 b=aJwtuDThPycUTAQyPI+nXMIdiCKeLFOx4kxDmfezh/ShEeJAMTzAs3xVsa5yLxd2vA
 wBBLV3ot5kdidhap1iZYyX6zd8npkCU1tJNqvnJb9ID2TCam9OZoWPRnfE1lBLgcV9XK
 X/rabZRQMj1o8LqhN8+93wdDJofX0d4NT8AkkrZfq1pQXtzvUtLHH32k7WgGHDp5mdJV
 BcSls6l/mBSX5ir7mS86xiNuYDDRB9UiRXKpIhM2qIAg+0xQ2nemOztWEpl7KBsY/rLA
 GoVmv26usApw4LtOqcP0vzmItRDzik3juotkK+O3jOg47i6Mwp4IbxVpAxo9N9V+IKmv
 iimA==
X-Gm-Message-State: AOAM531uFTGwxBRX71+Bm1BTleJZJvGUYZw5wtz7i9ovWKEaupRnPCHl
 i+e2MvOb74YAU4UQzNlcx/SMEp416jbU7Q==
X-Google-Smtp-Source: ABdhPJxEE9vEGaACf5ddOvdcRdrJALDUbJHzt1nTHJXQS17fMjWxOeahwH3I77pwAcU46IHXSYillA==
X-Received: by 2002:a17:906:c212:: with SMTP id
 d18mr4945967ejz.291.1621874502889; 
 Mon, 24 May 2021 09:41:42 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/28] KVM: Cache kvm slot dirty bitmap size
Date: Mon, 24 May 2021 18:41:18 +0200
Message-Id: <20210524164131.383778-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Cache it too because we'll reference it more frequently in the future.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210506160549.130416-8-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c      | 1 +
 include/sysemu/kvm_int.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0ba6d48120..df9fbf59a6 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -610,6 +610,7 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
     hwaddr bitmap_size = ALIGN(mem->memory_size / qemu_real_host_page_size,
                                         /*HOST_LONG_BITS*/ 64) / 8;
     mem->dirty_bmap = g_malloc0(bitmap_size);
+    mem->dirty_bmap_size = bitmap_size;
 }
 
 /*
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index ab09a150e1..c788452cd9 100644
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
2.31.1



