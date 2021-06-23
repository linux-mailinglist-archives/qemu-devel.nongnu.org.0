Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1753B1A32
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:31:17 +0200 (CEST)
Received: from localhost ([::1]:59650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw22G-0003yD-4F
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m8-000414-RO
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:36 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m7-000240-5Z
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:36 -0400
Received: by mail-ej1-x629.google.com with SMTP id ot9so2677019ejb.8
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 05:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q0ZN4n/dtFMRMepbnfjzMN5tAEFeuoYDClHc1sps4os=;
 b=FBDceoT60Aearx2S/IAUP7YOHu1SYbRveXq5ucHpmpGueyVv/m/UGz1XYo40jZppc2
 cgB63l3Ih8GWKUuR59zAMQxhKdg8d/4WMv/alAJ6KKl2p2q4cB4GlqgF+jm7WQiK4qXS
 KIHow56ASBPmwnUcsvolZKsQyviZH2BoQEykS6IVJyAsqcC9bFb+fdkZqzn/qryOYWW2
 3XCYtL7UiH5dywNWONmTzuXZS4CTkjeSMxGrCMbwjIsfPhlxYBf8lf50ZxlPxh2rAzGf
 5E7rF0Jq4+1BbBInhAetk4ipmN+uw14zpUayjTf70BHxsHRYxIdMf3PO8+9DVfaUtwx8
 KZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Q0ZN4n/dtFMRMepbnfjzMN5tAEFeuoYDClHc1sps4os=;
 b=BLkar5gmhkysJVYzVyRw60G2+/bZl844KytCgOTP4YL1tg8YgDwmSxNko0UNLQSCWV
 p9Kkij1M88epjVGqnTog9K+IXbCImqIDnciDIliD0PRzS0i/WjsaEawh821DFLT1hPe0
 4za9DuHxclLgxmjHJsbkyJG5mFFO+sCHHo+2l3GqhqiLFx/VJvFTmkhNXANWP/DW39Je
 vcxBNCyulsSA7D3EIz//k2OR8dAZTUC2TmprI0sumYRFAGavMvgMszjQk/rLAKxHj22K
 xTWZoWCv2befMt6w8HJ9wWMbFAB+ItOq6DZmVmT+bHtJlXbXnjX3UbtQWaxSmepD27aC
 Sd9g==
X-Gm-Message-State: AOAM530LgQBNANs8/cnPPZz8AVR2wODo0hFVUObLZjY4QxXeiQtxvZ/X
 kVU91We+c9CKhUgvV0g+T4BB87vMxK4=
X-Google-Smtp-Source: ABdhPJwwvWW7JAoAQg8gBOIX2cATroaYL2QoAtm4z/VDaLWPpjq/wr/gsKQiLIPwJ+kDX9lOGhFUVw==
X-Received: by 2002:a17:907:1b11:: with SMTP id
 mp17mr9794417ejc.1.1624450473874; 
 Wed, 23 Jun 2021 05:14:33 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o5sm1680778edt.44.2021.06.23.05.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 05:14:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/12] KVM: Fix dirty ring mmap incorrect size due to renaming
 accident
Date: Wed, 23 Jun 2021 14:14:24 +0200
Message-Id: <20210623121424.1259496-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623121424.1259496-1-pbonzini@redhat.com>
References: <20210623121424.1259496-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Hyman Huang <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Found this when I wanted to try the per-vcpu dirty rate series out, then I
found that it's not really working and it can quickly hang death a guest.  I
found strange errors (e.g. guest crash after migration) happens even without
the per-vcpu dirty rate series.

When merging dirty ring, probably no one notice that the trivial renaming diff
[1] missed two existing references of kvm_dirty_ring_sizes; they do matter
since otherwise we'll mmap() a shorter range of memory after the renaming.

I think it didn't SIGBUS for me easily simply because some other stuff within
qemu mmap()ed right after the dirty rings (e.g. when testing 4096 slots, it
aligned with one small page on x86), so when we access the rings we've been
reading/writting to random memory elsewhere of qemu.

Fix the two sizes when map/unmap the shared dirty gfn memory.

[1] https://lore.kernel.org/qemu-devel/dac5f0c6-1bca-3daf-e5d2-6451dbbaca93@redhat.com/

Cc: Hyman Huang <huangy81@chinatelecom.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210609014355.217110-1-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index c7ec538850..e5b10dd129 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -411,7 +411,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
     }
 
     if (cpu->kvm_dirty_gfns) {
-        ret = munmap(cpu->kvm_dirty_gfns, s->kvm_dirty_ring_size);
+        ret = munmap(cpu->kvm_dirty_gfns, s->kvm_dirty_ring_bytes);
         if (ret < 0) {
             goto err;
         }
@@ -495,7 +495,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
 
     if (s->kvm_dirty_ring_size) {
         /* Use MAP_SHARED to share pages with the kernel */
-        cpu->kvm_dirty_gfns = mmap(NULL, s->kvm_dirty_ring_size,
+        cpu->kvm_dirty_gfns = mmap(NULL, s->kvm_dirty_ring_bytes,
                                    PROT_READ | PROT_WRITE, MAP_SHARED,
                                    cpu->kvm_fd,
                                    PAGE_SIZE * KVM_DIRTY_LOG_PAGE_OFFSET);
-- 
2.31.1


