Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4276DFE08
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 20:52:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmfYt-0000k3-I5; Wed, 12 Apr 2023 14:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9719990f4703cc1bc73b+7171+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pmfYn-0000jJ-Rp
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:51:13 -0400
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9719990f4703cc1bc73b+7171+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pmfYk-0003BF-AO
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=FAopztqETbo2fPeQeCNjHsbWvQfvN+qB27Usma2Ee8w=; b=j2olmn1su4XXnixX5a0dl5WOQs
 tGYDDng0Lu+7HnGPetpa5EKtx3Lh/D8nFMhXglOuKJzqlsQwOBDoQXWNtMljZQblzaKOV87EDsLRZ
 pKAmiO3JtQ1YIlqJfjTzOZJaXMkA3Nl6WPyaJbSPv7KJzgTV/r5skMbPF4geX7HCxRpVQQGcyuob5
 qZVUs4cPDm0csrie7Ly5YZ8Zxr7tQbe/0n/V2YJDDMijpRdLW9YQCRiOI/yknWTPT3OPM1/KBR/r7
 4gA+a3Oju3jyc4FeBjWcLFL9ogJsiMqaX7dvj6CqYVHCf7rGfp9punMadb1R04bsjxcg2Z8OxJDKY
 NA37yTRg==;
Received: from [2001:8b0:10b:5::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pmfYf-0077lB-4g; Wed, 12 Apr 2023 18:51:05 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pmfYe-001r1B-1f; Wed, 12 Apr 2023 19:51:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: no Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 xen-devel@lists.xenproject.org
Subject: [PATCH for-8.0 0/5] Xen emulation build/Coverity fixes
Date: Wed, 12 Apr 2023 19:50:57 +0100
Message-Id: <20230412185102.441523-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+9719990f4703cc1bc73b+7171+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
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

Some Coverity fixes and minor cleanups. And most notably, dropping
support for Xen libraries older than 4.7.1.

I believe there are two issues that remain to be fixed. The x32 build
fails, and I've seen patches which attempt to detect x32 and disable
the Xen emulation. Along with assertions that we just shouldn't care.
I don't have a strong opinion either way but it seems to be in hand.

The other is the question of what Xen *actually* does if you try to
unmap an IRQ_MSI_EMU PIRQ. I don't think Linux guests try that, and
I'm fairly sure Windows doesn't even use MSI→PIRQ mappings in the
first place, and I doubt any other guests care either. I'd like to
establish the 'correct' behaviour and implement it, ideally before
the 8.0 release, but it's going to take me a few days more.

David Woodhouse (5):
      hw/xen: Simplify emulated Xen platform init
      hw/xen: Fix memory leak in libxenstore_open() for Xen
      xen: Drop support for Xen versions below 4.7.1
      hw/xen: Fix double-free in xen_console store_con_info()
      hw/xen: Fix broken check for invalid state in xs_be_open()

 hw/char/xen_console.c       |  13 ++----
 hw/i386/kvm/xen_evtchn.c    |  40 ++++++++---------
 hw/i386/kvm/xen_evtchn.h    |   3 +-
 hw/i386/kvm/xen_xenstore.c  |   2 +-
 hw/i386/pc.c                |  13 ++----
 hw/xen/xen-operations.c     |  59 +-----------------------
 include/hw/xen/xen_native.h | 107 +-------------------------------------------
 meson.build                 |   5 +--
 scripts/xen-detect.c        |  60 -------------------------
 9 files changed, 33 insertions(+), 269 deletions(-)




