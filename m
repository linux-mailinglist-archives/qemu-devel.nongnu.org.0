Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16F015D1D8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 07:01:36 +0100 (CET)
Received: from localhost ([::1]:35088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2U2h-0000Wq-9V
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 01:01:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35589)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1j2U1H-0007zj-Ql
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 01:00:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1j2U1G-0005BZ-1M
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 01:00:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43304
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1j2U1F-00059j-Ks
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 01:00:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581660004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=k17MgG0DMNlivzXLB/4xrLFHebz8qedy1MC8AxtAf74=;
 b=jHNBDR0TPohGWy+bHMnosDJPhvqECuJiXhCupwxIR4SAtG1DBU4+HiDPiHIbJ69VS1GHs9
 nN0TRK9MIFWT1U3ztRgyKTVd5lkMZljOHlXsl6pxQeH/O5sPwYJOTv1jSWEzYE3pTMIFi/
 Iyfjx64t5NeCcql8YaQ9im21MNvfvVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-VEKe6VICNtqezMQTwUAdMA-1; Fri, 14 Feb 2020 01:00:03 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 236F8101FC62;
 Fri, 14 Feb 2020 06:00:01 +0000 (UTC)
Received: from localhost.localdomain.com (vpn2-54-93.bne.redhat.com
 [10.64.54.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99AD81001B30;
 Fri, 14 Feb 2020 05:59:54 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 0/2] hw/arm/virt: Simulate NMI Injection
Date: Fri, 14 Feb 2020 16:59:48 +1100
Message-Id: <20200214055950.62477-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: VEKe6VICNtqezMQTwUAdMA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, jthierry@redhat.com,
 aik@ozlabs.ru, maz@kernel.org, richard.henderson@linaro.org,
 eric.auger@redhat.com, shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series simulates the behavior of receiving NMI interrupt for "virt"
board. First of all, a new interrupt (SError) is supported for each CPU.
The backend is either sending error events through kvm module or emulating
the bahavior when TCG is enabled. The outcome is SError or data abort is
raised to crash guest.

For GICv2 or GICv3, a new IRQ line is added for each CPU and it's connected
to the (above) introduced SError interrupt. The IRQ line of CPU#0 is raised
when HMP/QMP "nmi" is issued, to crash the guest.

Testing
=3D=3D=3D=3D=3D=3D=3D

After the HMP/QMP "nmi" is issued in the following 4 environment, the guest=
 is
crashed as expected.

   Accel     Mode                  Crashed    Parameter
   ------------------------------------------------------------------------
   kvm       aarch64               yes        -machine virt -cpu host
   kvm       aarch32(cortex-a15)   yes        -machine virt -cpu host,aarch=
64=3Doff
   tcg       aarch64               yes        -machine virt -cpu max
   tcg       aarch32(cortex-a15)   yes        -machine virt -cpu cortex-a15

Changelog
=3D=3D=3D=3D=3D=3D=3D=3D=3D
v3:
   * Support SError injection for aarch32                 (Richard Henderso=
n)
   * Export the SError injection through IRQ line         (Peter Maydell)
   * Removed RFC tag as it seems in correct track         (Gavin Shan)
v2:=20
   * Redesigned to fully exploit SError interrupt

Gavin Shan (2):
  target/arm: Support SError injection
  hw/arm/virt: Simulate NMI injection

 hw/arm/virt.c                      | 34 ++++++++++++++-
 hw/intc/arm_gic_common.c           |  3 ++
 hw/intc/arm_gicv3_common.c         |  3 ++
 include/hw/intc/arm_gic_common.h   |  1 +
 include/hw/intc/arm_gicv3_common.h |  1 +
 target/arm/cpu.c                   | 69 ++++++++++++++++++++++++------
 target/arm/cpu.h                   | 17 +++++---
 target/arm/helper.c                |  6 +++
 target/arm/m_helper.c              |  8 ++++
 9 files changed, 122 insertions(+), 20 deletions(-)

--=20
2.23.0


