Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965F36A9796
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 13:52:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY4sv-0007vr-Ky; Fri, 03 Mar 2023 07:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+c2a260b7edcf36afa963+7131+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pY4st-0007vV-GH
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:51:39 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+c2a260b7edcf36afa963+7131+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pY4sr-0000VI-ID
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:51:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=TxQ+0QDvoR12hGNUybvVqDZRC8+OYpouVH405mcO7UA=; b=Y2r1Kpesndzx8qIeP7vec0kM7w
 PpI5IkpXaiR5mRygz+BPU4te7Stf+n/U0uYIq2L0cyQyJAbrL7KYAIRqf/gh0uRVjHuQKFoZkRiL7
 s9r+2U+Ho0y9z7RCU48D9ixtRK3nXqvwTE6KZboOUerXo2HPIV8rXycebvV9rN6HqyyB22+8ixxrI
 mjC2t79Ulpi8m4ITfIfhhIYyJXk2FlHyf1gY2FkoMYr/nPvc5yig8bDZlF8bXkhBAhviBTVIuk4WX
 Cfcf7RDywi80iYYD2mmgW1yaXvfoBKfhVy0Z0oDDHOfKrAIfHSj8fGT/HYjHusvuKGn1T86qkktUJ
 lolrEL1A==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pY4si-00388D-EP; Fri, 03 Mar 2023 12:51:28 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pY4sh-005KMY-1w; Fri, 03 Mar 2023 12:51:27 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>
Subject: [PATCH 0/2] tests/avocado: Test Xen guest support under KVM
Date: Fri,  3 Mar 2023 12:51:24 +0000
Message-Id: <20230303125126.1269861-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+c2a260b7edcf36afa963+7131+infradead.org+dwmw2@casper.srs.infradead.org;
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

Add avocado tests to boot Xen guests in various interesting modes:
 • MSI delivered via PIRQ.
 • MSI delivered directly with vAPIC.
 • Event channel interrupt to I/O APIC.
 • Event channel interrupt to legacy PIC.

Using AHCI disk for now so this should work with the basic platform
support that's already in Paolo's pull request. After phase 2 of the
Xen support is merged, we can switch it to use xen-disk instead.

The warnings about not being able to validate the kernel and initrd
images made me sad, so I added hashes of those to the distro structure.

David Woodhouse (2):
      tests/avocado: Add Fedora 34 distro, including kernel/initrd checksums
      tests/avocado: Test Xen guest support under KVM

 tests/avocado/avocado_qemu/__init__.py |  27 ++++++++
 tests/avocado/xen_guest.py             | 113 +++++++++++++++++++++++++++++++++
 2 files changed, 140 insertions(+)



