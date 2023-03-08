Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFA86B05B7
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 12:20:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZrqC-0005ch-JG; Wed, 08 Mar 2023 06:20:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9591d7c4daecea4c87af+7136+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pZrq6-0005bC-DZ
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 06:20:10 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9591d7c4daecea4c87af+7136+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pZrq2-0005zB-UX
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 06:20:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=GhFKJgGofODWcD6y76sA7JctwGb6UxxM0NMMIYt3IOE=; b=mHPc5ubL/xy6L+efYFT/HcFWhb
 Cd+PJW9Pi0bN4Bm+b9MzZpzx/j7aGCwrd50eom11p/LTZskqc3hIZj5ZUcPS5Pwu6N7R73pRJM3P9
 wOIQxo5ohqEpVk+ObtHwhWYipx0cmJtZ1FZLThfzyT8F58VghNDjtWVDtqJXhQ3EbodkFFI1xAD1N
 EA/igzGGNqlQF1BM9uqZh9hMeW/upOly1xH11FdF3cIoG3524xC9ovxsBUfMSHSWDLKzetUnesgvy
 5DNuE78LoUliSR1YdFI7datIoqG6E7G0FQi9D0qwlkJB6u6MKaYXhsM0xHckapgmNmfx308Dcnq0g
 rM/i0Bsw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pZrpr-00HMr8-2k; Wed, 08 Mar 2023 11:19:56 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZrpq-00BS0W-07; Wed, 08 Mar 2023 11:19:54 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 0/3] Enable avocado testing for Xen guests
Date: Wed,  8 Mar 2023 11:19:49 +0000
Message-Id: <20230308111952.2728440-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+9591d7c4daecea4c87af+7136+infradead.org+dwmw2@desiato.srs.infradead.org;
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

I'd love to test other operating systems too (FreeBSD does work if I 
abuse the stuff in tests/vm/ and add a Xen guest mode). But this is
enough for now to help catch regressions on the QEMU side.

Especially the polling for the event channel GSI deassertion is likely 
to be fragile, and in the not-so-distant future I really do want to add 
an explicit EOI hook in the interrupt controllers; as discussed, VFIO 
INTx would benefit from that too.

When the guest kernel boots with 4 CPUs, it ends up initially targeting 
the event channel GSI to CPU#2, and then testing the migration.

Since nobody evidently cared about the I/OAPIC migration bug in the 7
years since it was introduced with the first split-irqchip support,
that fix might as well stay here in this series.

v2: https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-test-2

 • Use xen-disk now that the PR adding support for that has been submitted

 • Include the I/O APIC migration fix, so that we can use -smp 4 

v1: https://lore.kernel.org/qemu-devel/20230303125126.1269861-1-dwmw2@infradead.org/
    https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-test

David Woodhouse (3):
      hw/intc/ioapic: Update KVM routes before redelivering IRQ, on RTE update
      tests/avocado: Add Fedora 34 distro, including kernel/initrd checksums
      tests/avocado: Test Xen guest support under KVM

 hw/intc/ioapic.c                       |   3 +-
 tests/avocado/avocado_qemu/__init__.py |  27 ++++++
 tests/avocado/xen_guest.py             | 147 +++++++++++++++++++++++++++++++++
 3 files changed, 175 insertions(+), 2 deletions(-)
 create mode 100644 tests/avocado/xen_guest.py



