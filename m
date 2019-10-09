Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256CBD14B2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 18:57:16 +0200 (CEST)
Received: from localhost ([::1]:52618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIFH0-0005WH-Ln
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 12:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60026)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iI59C-0001XQ-El
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 02:08:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iI59B-0006V4-1h
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 02:08:30 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:60537 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iI59A-0006P8-Lu; Wed, 09 Oct 2019 02:08:28 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46p3gD03Vqz9sPF; Wed,  9 Oct 2019 17:08:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570601304;
 bh=uQKW8zEtgE5P17ujUQFzUffUIX01ocBt6Nsm2Y3358A=;
 h=From:To:Cc:Subject:Date:From;
 b=UL3U981PNwzWcIZOgcIuJ/Jzkzjq3sdttJaYY0kU5hWfVf570fR9yrRA2MzRQowcA
 D/Kp8GfPEcgSFNPjla9eNaApvbshPdhJs1YDlXGH+A8GE99OTWKEvxzAG8RamAdUDa
 Xlf5gLGbWoVUwO+zcCb5x70fS2cWkKNcShX+/DH4=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	clg@kaod.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 00/19] spapr: IRQ subsystem cleanup
Date: Wed,  9 Oct 2019 17:07:59 +1100
Message-Id: <20191009060818.29719-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 groug@kaod.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a substantial rework to clean up the handling of IRQs in
spapr.  It includes some cleanups to both the XICS and XIVE interrupt
controller backends, as well as more to the common spapr irq handling
infrastructure.

The last two patches of this series, dealing with VFIO devices, are
RFC only - there some problems that I'm discussing with Alex
Williamson.

Changes since v3:
 * Further minor tweaks to error handling
 * Other minor polishes from feedback
 * Added some patches to address VFIO irq routing
 * Removed the first ~20 patches, which are now merged

Changes since v2:
 * Fixed a bug where the "move handling multiple irq frees" to
   frontend patch was actually freeing one irq over and over, rather
   than freeing multiple irqs
 * Fixed some places I missed still using only-Error * style, and flow
   on adjustments
 * New idiom to iterate across all constructed backends for the things
   that need that (cpu_intc_create, claim & freem), rather than
   open-coding a call on the xics, then xive versions.

Changes since v1:
 * Lots of extra patches
 * Many minor adjustments based on feedback
 * Moved towards return value + Error * style, instead of just Error *
   style

David Gibson (16):
  spapr, xics, xive: Introduce SpaprInterruptController QOM interface
  spapr, xics, xive: Move cpu_intc_create from SpaprIrq to
    SpaprInterruptController
  spapr, xics, xive: Move irq claim and free from SpaprIrq to
    SpaprInterruptController
  spapr: Formalize notion of active interrupt controller
  spapr, xics, xive: Move set_irq from SpaprIrq to
    SpaprInterruptController
  spapr, xics, xive: Move print_info from SpaprIrq to
    SpaprInterruptController
  spapr, xics, xive: Move dt_populate from SpaprIrq to
    SpaprInterruptController
  spapr, xics, xive: Match signatures for XICS and XIVE KVM connect
    routines
  spapr: Remove SpaprIrq::init_kvm hook
  spapr, xics, xive: Move SpaprIrq::reset hook logic into
    activate/deactivate
  spapr, xics, xive: Move SpaprIrq::post_load hook to backends
  spapr: Remove SpaprIrq::nr_msis
  spapr: Move SpaprIrq::nr_xirqs to SpaprMachineClass
  spapr: Remove last pieces of SpaprIrq
  spapr: Handle irq backend changes with VFIO PCI devices
  spapr: Work around spurious warnings from vfio INTx initialization

Greg Kurz (2):
  xive: Make some device types not user creatable
  xics: Make some device types not user creatable

Stefan Brankovic (1):
  target/ppc: Fix for optimized vsl/vsr instructions

 hw/intc/spapr_xive.c                | 295 ++++++++----
 hw/intc/spapr_xive_kvm.c            |  22 +-
 hw/intc/xics.c                      |  10 +
 hw/intc/xics_kvm.c                  |   9 +-
 hw/intc/xics_spapr.c                | 110 ++++-
 hw/intc/xive.c                      |  15 +
 hw/ppc/spapr.c                      |  52 ++-
 hw/ppc/spapr_caps.c                 |  64 +++
 hw/ppc/spapr_cpu_core.c             |   3 +-
 hw/ppc/spapr_hcall.c                |   7 +-
 hw/ppc/spapr_irq.c                  | 668 +++++++++-------------------
 hw/ppc/spapr_pci.c                  |  16 +-
 include/hw/pci-host/spapr.h         |   4 +-
 include/hw/ppc/spapr.h              |  17 +-
 include/hw/ppc/spapr_irq.h          |  72 +--
 include/hw/ppc/spapr_xive.h         |   9 +-
 include/hw/ppc/xics_spapr.h         |   6 +-
 target/ppc/translate/vmx-impl.inc.c |  84 ++--
 18 files changed, 769 insertions(+), 694 deletions(-)

--=20
2.21.0


