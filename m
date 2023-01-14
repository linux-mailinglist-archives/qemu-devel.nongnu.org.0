Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C9C66A7BE
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 01:40:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGUaA-0004jA-LA; Fri, 13 Jan 2023 19:39:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+3a1a5416dcf0d1877a74+7083+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pGUa0-0004h6-Th
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 19:39:29 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+3a1a5416dcf0d1877a74+7083+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pGUZy-0005NO-FI
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 19:39:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=HIpy//34Aar8gIHgB6X5qpKeO62tXzbseNQ5L9IW1lc=; b=p+gdz+jy/GIkm6ncA9VIV0PqNO
 kslpMLpOv3ivnK0wBvqZ+37QNmhFNyAKP2W2jBS4Gz6nPTUmeTOP9aG0Xs7PDn0dqXpkzIboyPlYy
 iofoUwpX7FXyjsY5/+nhRVqhgTFZBhLzFOmR3IJiyLslejM52Ts7AVqgaD6AMCTv+uNyyqP9qHWnw
 JI+AMhKLWKHd06ulE6zAApWbnBxXPkBrFDTSd1GUYtmgTplBk8GftmbypGk8xrW5jQE1XxB/qzwAi
 WbL26WmMo5ua/8pojiN3vI02VRgczvOurpTpyr37etskgBzCObcjB/5H4LSGEblZHfoOoNXMgcMqq
 9etGxkLA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pGUZf-004X3s-2C; Sat, 14 Jan 2023 00:39:10 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pGUZk-001C29-PS; Sat, 14 Jan 2023 00:39:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 arcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [RFC PATCH 0/5] Xen PIRQ support
Date: Sat, 14 Jan 2023 00:39:04 +0000
Message-Id: <20230114003909.284331-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+3a1a5416dcf0d1877a74+7083+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This continues to build on the basic Xen on KVM platform support from 
https://lore.kernel.org/qemu-devel/20230110122042.1562155-1-dwmw2@infradead.org/

We're working on hooking up the PV backend devices, and the biggest 
remaining noticeably missing part was PIRQ support. This allows a Xen 
guest to route GSI and MSI interrupts to event channels instead of being 
delivered via the emulated I/OAPIC or local APIC respectively.

It starts relatively simple, with the basic hypercalls and infrastructure
for tracking/migrating the PIRQ table (and as I type this I've just
remembered I forgot to write the post_load function to reconstitute the
data structures which explicitly *state* that they need to be rebuilt).

I'm particularly interested in opinions on the hook in gsi_handler() 
which lets the Xen emulation 'eat' the event instead of passing it to 
the I/OAPIC.

I did ponder replacing the qemu_irq in gsi_state->ioapic_irq[n] when
GSI#n is redirected to a PIRQ, but I figured that was worse.

I definitely need to rethink the locking a little bit to avoid the 
potential for deadlock when gsi_handler calls back into the evtchn code 
to translate the event channel GSI. It's non-trivial to drop the lock 
before sending the IRQ; maybe just a different lock with a smaller 
scope. A previous implementation of event channels was a bit more 
lockless, with atomic updates of the port table (the port_info fits in a 
uint64_t). But now we have all the interesting fast paths accelerated in 
the kernel that didn't seem worth it, so I went with simple locking... 
too simple, it seems.

There's a similar recursive locking issue when pirq_bind_port() wants to 
call kvm_update_msi_routes_all(), but is already holding the lock that 
we'd take again when called to redo a translation. (And I still don't 
much like the way that kvm_update_msi_routes_all() has to have a list of 
PCI devices and actually recalculates the routes at all, instead of just 
detaching the IRQFD and letting them be recalculated on demand. But I 
was trying to avoid actually fixing that this week).

David Woodhouse (5):
      i386/xen: Implement HYPERVISOR_physdev_op
      hw/xen: Implement emulated PIRQ hypercall support
      hw/xen: Support GSI mapping to PIRQ
      hw/xen: [FIXME] Avoid deadlock in xen_evtchn_set_gsi()
      hw/xen: Support MSI mapping to PIRQ

 hw/i386/kvm/trace-events     |   4 ++
 hw/i386/kvm/trace.h          |   1 +
 hw/i386/kvm/xen-stubs.c      |  11 ++++
 hw/i386/kvm/xen_evtchn.c     | 461 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 hw/i386/kvm/xen_evtchn.h     |  22 +++++++
 hw/i386/x86.c                |  15 +++++
 hw/pci/msi.c                 |  13 ++++
 hw/pci/msix.c                |   7 ++-
 hw/pci/pci.c                 |  14 +++++
 meson.build                  |   1 +
 target/i386/kvm/kvm.c        |  12 +++-
 target/i386/kvm/kvm_i386.h   |   2 +
 target/i386/kvm/xen-compat.h |  19 ++++++
 target/i386/kvm/xen-emu.c    | 136 +++++++++++++++++++++++++++++++++++++++++-
 14 files changed, 712 insertions(+), 6 deletions(-)






