Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170A92C416A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 14:52:12 +0100 (CET)
Received: from localhost ([::1]:58226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khvDM-0001zD-W8
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 08:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1khvC0-0001X3-0U
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 08:50:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1khvBw-0000eq-Q2
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 08:50:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606312238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bd2vonRp7SIwB02em5d4uNn2EQKWlm7RTnCAP4gg23c=;
 b=cp3UYChf2dSor5JNL3pWIbXQAKN6iy/YzljB9ksmo0OvCRIt/NzjteAaFsNc6TvaU76f1C
 iYOsopmWDTar3KKpUHFN3WVLKiNCWuyG0ED7g1BGGpPRDJyYn7dj/95cl9msge5QkkVCaD
 vm3tihUTvx10/nUAYU15UQ3rKGpRVJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-5OLnmmhyOgG6GCzyUyi63Q-1; Wed, 25 Nov 2020 08:50:34 -0500
X-MC-Unique: 5OLnmmhyOgG6GCzyUyi63Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0490F801B17;
 Wed, 25 Nov 2020 13:50:33 +0000 (UTC)
Received: from kaapi (unknown [10.74.8.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B397460BE5;
 Wed, 25 Nov 2020 13:50:28 +0000 (UTC)
Date: Wed, 25 Nov 2020 19:20:25 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 0/9] memory: assert and define MemoryRegionOps callbacks
In-Reply-To: <nycvar.YSQ.7.78.906.2009151842200.10832@xnncv>
Message-ID: <n4q317q1-1542-rrss-1033-n23qpsr0q8p2@erqung.pbz>
References: <20200811114133.672647-1-ppandit@redhat.com>
 <nycvar.YSQ.7.78.906.2009151842200.10832@xnncv>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Lei Sun <slei.casper@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Tue, 15 Sep 2020, P J P wrote --+
| +-- On Tue, 11 Aug 2020, P J P wrote --+
| | * This series asserts that MemoryRegionOps objects define read/write
| |   callback methods. Thus avoids potential NULL pointer dereference.
| |   ex. -> https://git.qemu.org/?p=qemu.git;a=commit;h=bb15013ef34617eb1344f5276292cadd326c21b2
| | 
| | * Also adds various undefined MemoryRegionOps read/write functions
| |   to avoid potential assert failure.
| | 
| | Thank you.
| | --
| | Prasad J Pandit (9):
| |   hw/pci-host: add pci-intack write method
| |   pci-host: designware: add pcie-msi read method
| |   vfio: add quirk device write method
| |   prep: add ppc-parity write method
| |   nvram: add nrf51_soc flash read method
| |   spapr_pci: add spapr msi read method
| |   tz-ppc: add dummy read/write methods
| |   imx7-ccm: add digprog mmio write method
| |   memory: assert MemoryRegionOps callbacks are defined
| | 
| |  hw/misc/imx7_ccm.c       |  8 ++++++++
| |  hw/misc/tz-ppc.c         | 14 ++++++++++++++
| |  hw/nvram/nrf51_nvm.c     | 10 ++++++++++
| |  hw/pci-host/designware.c | 19 +++++++++++++++++++
| |  hw/pci-host/prep.c       |  8 ++++++++
| |  hw/ppc/prep_systemio.c   |  8 ++++++++
| |  hw/ppc/spapr_pci.c       | 14 ++++++++++++--
| |  hw/vfio/pci-quirks.c     |  8 ++++++++
| |  softmmu/memory.c         | 10 +++++++++-
| |  9 files changed, 96 insertions(+), 3 deletions(-)
| 
| Ping...@Peter, @David, @Paolo, @Herve, @Alex,
| 
| * This patch series is not pulled/merged yet, could you please help with it?  


Ping..!
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


