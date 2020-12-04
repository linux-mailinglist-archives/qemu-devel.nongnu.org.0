Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7B22CE7B1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 06:46:22 +0100 (CET)
Received: from localhost ([::1]:33292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl3vB-0005rV-A2
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 00:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tN-0003rC-14; Fri, 04 Dec 2020 00:44:29 -0500
Received: from ozlabs.org ([203.11.71.1]:46403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tJ-0008Tn-54; Fri, 04 Dec 2020 00:44:27 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CnM8f5b6bz9sT5; Fri,  4 Dec 2020 16:44:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607060658;
 bh=mxWjWsAC0dVXxgKbwgpPWZDm0iZBSpsgilWWeTLy1wA=;
 h=From:To:Cc:Subject:Date:From;
 b=VvdNlqruhi8QpiSlhHbtiZmcLN+T/iqxrEaYWyAPqXmFUKeQj43iZdpFnJU378aJq
 AjsaiHVW2SGmCfXMTOKRxdvm7exQZ1idr85upuRz1XjerQecmgliAPzW6dk5zJeTR/
 d/0Gq7iSG0cFDUmkMNUyMSgSdsgWxSXB75PuKVag=
From: David Gibson <david@gibson.dropbear.id.au>
To: pair@us.ibm.com, pbonzini@redhat.com, frankja@linux.ibm.com,
 brijesh.singh@amd.com, dgilbert@redhat.com, qemu-devel@nongnu.org
Subject: [for-6.0 v5 00/13] Generalize memory encryption models
Date: Fri,  4 Dec 2020 16:44:02 +1100
Message-Id: <20201204054415.579042-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, cohuck@redhat.com, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A number of hardware platforms are implementing mechanisms whereby the=0D
hypervisor does not have unfettered access to guest memory, in order=0D
to mitigate the security impact of a compromised hypervisor.=0D
=0D
AMD's SEV implements this with in-cpu memory encryption, and Intel has=0D
its own memory encryption mechanism.  POWER has an upcoming mechanism=0D
to accomplish this in a different way, using a new memory protection=0D
level plus a small trusted ultravisor.  s390 also has a protected=0D
execution environment.=0D
=0D
The current code (committed or draft) for these features has each=0D
platform's version configured entirely differently.  That doesn't seem=0D
ideal for users, or particularly for management layers.=0D
=0D
AMD SEV introduces a notionally generic machine option=0D
"machine-encryption", but it doesn't actually cover any cases other=0D
than SEV.=0D
=0D
This series is a proposal to at least partially unify configuration=0D
for these mechanisms, by renaming and generalizing AMD's=0D
"memory-encryption" property.  It is replaced by a=0D
"securable-guest-memory" property pointing to a platform specific=0D
object which configures and manages the specific details.=0D
=0D
Changes since v4:=0D
 * Renamed from "host trust limitation" to "securable guest memory",=0D
   which I think is marginally more descriptive=0D
 * Re-organized initialization, because the previous model called at=0D
   kvm_init didn't work for s390=0D
* Assorted fixes to the s390 implementation; rudimentary testing=0D
  (gitlab CI) only=0D
Changes since v3:=0D
 * Rebased=0D
 * Added first cut at handling of s390 protected virtualization=0D
Changes since RFCv2:=0D
 * Rebased=0D
 * Removed preliminary SEV cleanups (they've been merged)=0D
 * Changed name to "host trust limitation"=0D
 * Added migration blocker to the PEF code (based on SEV's version)=0D
Changes since RFCv1:=0D
 * Rebased=0D
 * Fixed some errors pointed out by Dave Gilbert=0D
=0D
David Gibson (12):=0D
  securable guest memory: Introduce new securable guest memory base=0D
    class=0D
  securable guest memory: Handle memory encryption via interface=0D
  securable guest memory: Move side effect out of=0D
    machine_set_memory_encryption()=0D
  securable guest memory: Rework the "memory-encryption" property=0D
  securable guest memory: Decouple kvm_memcrypt_*() helpers from KVM=0D
  sev: Add Error ** to sev_kvm_init()=0D
  securable guest memory: Introduce sgm "ready" flag=0D
  securable guest memory: Move SEV initialization into arch specific=0D
    code=0D
  spapr: Add PEF based securable guest memory=0D
  spapr: PEF: prevent migration=0D
  securable guest memory: Alter virtio default properties for protected=0D
    guests=0D
  s390: Recognize securable-guest-memory option=0D
=0D
Greg Kurz (1):=0D
  qom: Allow optional sugar props=0D
=0D
 accel/kvm/kvm-all.c                   |  39 +------=0D
 accel/kvm/sev-stub.c                  |  10 +-=0D
 accel/stubs/kvm-stub.c                |  10 --=0D
 backends/meson.build                  |   1 +=0D
 backends/securable-guest-memory.c     |  30 +++++=0D
 hw/core/machine.c                     |  71 ++++++++++--=0D
 hw/i386/pc_sysfw.c                    |   6 +-=0D
 hw/ppc/meson.build                    |   1 +=0D
 hw/ppc/pef.c                          | 124 +++++++++++++++++++++=0D
 hw/ppc/spapr.c                        |  10 ++=0D
 hw/s390x/pv.c                         |  58 ++++++++++=0D
 include/exec/securable-guest-memory.h |  86 +++++++++++++++=0D
 include/hw/boards.h                   |   2 +-=0D
 include/hw/ppc/pef.h                  |  26 +++++=0D
 include/hw/s390x/pv.h                 |   1 +=0D
 include/qemu/typedefs.h               |   1 +=0D
 include/qom/object.h                  |   3 +-=0D
 include/sysemu/kvm.h                  |  17 ---=0D
 include/sysemu/sev.h                  |   5 +-=0D
 qom/object.c                          |   4 +-=0D
 softmmu/vl.c                          |  16 ++-=0D
 target/i386/kvm.c                     |  12 ++=0D
 target/i386/monitor.c                 |   1 -=0D
 target/i386/sev.c                     | 153 ++++++++++++--------------=0D
 target/ppc/kvm.c                      |  18 ---=0D
 target/ppc/kvm_ppc.h                  |   6 -=0D
 target/s390x/kvm.c                    |   3 +=0D
 27 files changed, 510 insertions(+), 204 deletions(-)=0D
 create mode 100644 backends/securable-guest-memory.c=0D
 create mode 100644 hw/ppc/pef.c=0D
 create mode 100644 include/exec/securable-guest-memory.h=0D
 create mode 100644 include/hw/ppc/pef.h=0D
=0D
-- =0D
2.28.0=0D
=0D

