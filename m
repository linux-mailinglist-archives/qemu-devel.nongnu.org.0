Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B61838F1DF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:58:01 +0200 (CEST)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDtw-0003sF-Ip
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeQ-0004oE-At
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:58 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:39675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeI-0004NI-Hq
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:57 -0400
Received: by mail-ej1-x635.google.com with SMTP id l1so42789094ejb.6
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9/dX3PC3FCiO5p7uuZf1RyQ9MDHL5qIlrYK5aAJJIeY=;
 b=vZms4vtQnZxGR2ZaJsIxRZubUfjjDUrsYdFFd9rvVWunjQUacu8KNC+6N3cmjelOTt
 ySJK+pBei1VWMeOzuf5iOYxx/YXVLWCF1AmxF+Vwc2vObP3wf9J7ZzVMQDefoaNuDW5D
 aKBIVMnYX2AfDjxCbgnTGEDx1RCXyO4wgoyiPsdA3/ScGVCHLknWW1CyrLDsX9GmlcYH
 5cym9JDdtifDGjWS2VSG+QKLd4HUgKST0oZiALnwX/MmNrAEYAAiGCE3quvAFY3mIp2y
 pZTW5vvjfL9rxNISNISe6UQuQzj9CsfJKmZP2DBiA4YTljkqA05FRucnrLEJXO8c86Gl
 lYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9/dX3PC3FCiO5p7uuZf1RyQ9MDHL5qIlrYK5aAJJIeY=;
 b=dtgnIRs7D4gA/N9vfQVtxfHTSmsv0KV/+c6aJg+6na7muWr9mTuSNoBweNkMg7bu65
 LzBjJ0kLoGjjd2mCpm340v/HyK10Q+11YouYWWPvODbz+U9OMIE5MeetLI8EPEhRJXp7
 7ZBDaVKlXVyw8r+vqxWRw3SaIiyganuvSPyKDRHpcp2BmsTbWPn+NuDspHfkbb4OA9Lj
 WUquvHO8Qd+buHEb0pyMPA5+oMBIAi+bzg3e1WoIrreivOwKUn2N7LqjGujOFfJPCz3o
 jMYlYd40dODWVOaCBwlTSeUuYZ5G0GFOaS/diuUoU60CYKncpJ75OxZ3h2p41fXlvoer
 YJBg==
X-Gm-Message-State: AOAM533d8c2/xoSU08K/HL293GNubraZ0ZYdiqvnbXMrrYXEz/+hMTKG
 /EAyGOpGwQRUddkzbxl6WcRCCJvuWKM3Tg==
X-Google-Smtp-Source: ABdhPJyhH6qFhwA4UFg1f1Rw9qnozSNOZPMKNfd/G6zUcBtKxClRm+B5XL+Z27llJv8H4Nw27jibMg==
X-Received: by 2002:a17:906:7842:: with SMTP id
 p2mr23814366ejm.487.1621874502188; 
 Mon, 24 May 2021 09:41:42 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/28] KVM: Simplify dirty log sync in kvm_set_phys_mem
Date: Mon, 24 May 2021 18:41:17 +0200
Message-Id: <20210524164131.383778-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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

kvm_physical_sync_dirty_bitmap() on the whole section is inaccurate, because
the section can be a superset of the memslot that we're working on.  The result
is that if the section covers multiple kvm memslots, we could be doing the
synchronization for multiple times for each kvmslot in the section.

With the two helpers that we just introduced, it's very easy to do it right now
by calling the helpers.

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210506160549.130416-7-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 7031dd4250..0ba6d48120 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1161,7 +1161,8 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
                 goto out;
             }
             if (mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
-                kvm_physical_sync_dirty_bitmap(kml, section);
+                kvm_slot_get_dirty_log(kvm_state, mem);
+                kvm_slot_sync_dirty_pages(mem);
             }
 
             /* unregister the slot */
-- 
2.31.1



