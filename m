Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D373A0995
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 03:45:07 +0200 (CEST)
Received: from localhost ([::1]:59256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqnHG-0003mi-EY
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 21:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lqnGJ-0002yy-Jc
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 21:44:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lqnGF-0006oM-7Y
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 21:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623203042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=az9n575ux7O8J27ld36XUg4KrEIGOek1XFJWxEDtjzw=;
 b=FNr/LeANBHZ60qondkJNehmEAvZYhz8BcbLi6kqqf6RkMiQsqry0+lo7chHO1+seg88wGR
 RJFij1+DQfX6AsiZsqdDBA4+ItOSREj7kYbXp+ZQdpXgPL/DeAuCMs7O91CrCeK6gL3hN4
 cS3B1AGvlMsieLadoF9kVPrhFfFXifg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-mH5QHK_PPA-bALNkYS2T1A-1; Tue, 08 Jun 2021 21:44:00 -0400
X-MC-Unique: mH5QHK_PPA-bALNkYS2T1A-1
Received: by mail-qk1-f198.google.com with SMTP id
 l6-20020a3770060000b02902fa5329f2b4so16264599qkc.18
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 18:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=az9n575ux7O8J27ld36XUg4KrEIGOek1XFJWxEDtjzw=;
 b=rU6p4lMP0RAi0Wh/6RH8cCvgtPJnSVvVGOH3a/2A6PD7IrqEJOOc1qQACJJNnDEU6O
 XfcN0wDqmlayTPz49FKsqkBv8h8ygDENanRm4EX2HnAEXu8BRFg5sutJP0S4D4KAzWDT
 TX/7hTugX6DR7rfMs2oRd/BvNh1DZV6mHNJCIJF8cOFOml1B1gg+SsTlDtbg0MAxo8dL
 3M0QMy4gBx8doKxUBd/lu+DC7VGrxM7k/2hFBziVD3KWfFPQzD3KfojvN+dCJZfBWDI1
 VHkvh0si4mBAE8b3Dl591JAVuaGJlRkSDyO0+47AU6VbiUORugOP4jrzm1YAVxQzb4sh
 IFgg==
X-Gm-Message-State: AOAM531/YSBuqNVicD1EdCoQnE6/O47+0LB6klgSew1Jcec7dDPukJ+U
 BpPCg2+BEXt0ISYoTpF16b6qYr0chUT5NgepwCa6qU1bgTUBvtElXOxIVX9DxObp9v5jyk6NCSQ
 TavH7lFSOg/tXmkHdCqQT27NlevVFv7a+/Wnbej6jD4LXfcxxEnZRqneEmNZXOHrt
X-Received: by 2002:a05:6214:8ec:: with SMTP id
 dr12mr3470047qvb.48.1623203039806; 
 Tue, 08 Jun 2021 18:43:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1QkJW2mgFssUiz6x+Hd0G56p/hoYE3IU+4ZM+tPrJblrvgusxIHfbLGxsql1AOxUoqigvHg==
X-Received: by 2002:a05:6214:8ec:: with SMTP id
 dr12mr3470031qvb.48.1623203039556; 
 Tue, 08 Jun 2021 18:43:59 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca. [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id u3sm11857704qtg.16.2021.06.08.18.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 18:43:59 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] KVM: Fix dirty ring mmap incorrect size due to renaming
 accident
Date: Tue,  8 Jun 2021 21:43:55 -0400
Message-Id: <20210609014355.217110-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman Huang <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 accel/kvm/kvm-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index c7ec5388500..e5b10dd129c 100644
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


