Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289D830B647
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 05:15:31 +0100 (CET)
Received: from localhost ([::1]:46210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6n69-0007eX-GV
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 23:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l6n4M-0005pa-G0; Mon, 01 Feb 2021 23:13:38 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41527 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l6n4J-0004oM-Ha; Mon, 01 Feb 2021 23:13:38 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DVBHx5DVZz9tkS; Tue,  2 Feb 2021 15:13:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612239197;
 bh=C/CvveZV8v771qNCTCPNypMV4EecUIQrKmjTMt5Ss1Q=;
 h=From:To:Cc:Subject:Date:From;
 b=iMNCFAV8ljlf/pbAHHb047ThAznHrYrhFTvKrtL5L0KsjKYYNbcCk21iEfOGgPNOZ
 VDYZksrxZdQKqsuOQJH86C7IUVYT3Fq28N4VFxW4/qb+DbxTSliABghh8EQrv+F8hR
 yCfcd7gBhXMw5L/x5qCRpiw9pj7s/ojJ3X4nzTZA=
From: David Gibson <david@gibson.dropbear.id.au>
To: dgilbert@redhat.com, pair@us.ibm.com, qemu-devel@nongnu.org,
 brijesh.singh@amd.com, pasic@linux.ibm.com
Subject: [PATCH v8 00/13] Generalize memory encryption models
Date: Tue,  2 Feb 2021 15:13:02 +1100
Message-Id: <20210202041315.196530-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
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
Cc: thuth@redhat.com, Cornelia Huck <cohuck@redhat.com>, berrange@redhat.com,
 mst@redhat.com, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 jun.nakajima@intel.com, mtosatti@redhat.com, richard.henderson@linaro.org,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, pragyansri.pathi@intel.com, qemu-s390x@nongnu.org,
 frankja@linux.ibm.com, qemu-ppc@nongnu.org, andi.kleen@intel.com,
 pbonzini@redhat.com, borntraeger@de.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
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
"confidential-guest-support" property pointing to a platform specific=0D
object which configures and manages the specific details.=0D
=0D
Note to Ram Pai: the documentation I've included for PEF is very=0D
minimal.  If you could send a patch expanding on that, it would be=0D
very helpful.=0D
=0D
Changes since v7:=0D
 * Tweaked and clarified meaning of the 'ready' flag=0D
 * Polished the interface to the PEF internals=0D
 * Shifted initialization for s390 PV later (I hope I've finally got=0D
   this after apply_cpu_model() where it needs to be)=0D
Changes since v6:=0D
 * Moved to using OBJECT_DECLARE_TYPE and OBJECT_DEFINE_TYPE macros=0D
 * Assorted minor fixes=0D
Changes since v5:=0D
 * Renamed from "securable guest memory" to "confidential guest=0D
   support"=0D
 * Simpler reworking of x86 boot time flash encryption=0D
 * Added a bunch of documentation=0D
 * Fixed some compile errors on POWER=0D
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
  confidential guest support: Introduce new confidential guest support=0D
    class=0D
  sev: Remove false abstraction of flash encryption=0D
  confidential guest support: Move side effect out of=0D
    machine_set_memory_encryption()=0D
  confidential guest support: Rework the "memory-encryption" property=0D
  sev: Add Error ** to sev_kvm_init()=0D
  confidential guest support: Introduce cgs "ready" flag=0D
  confidential guest support: Move SEV initialization into arch specific=0D
    code=0D
  confidential guest support: Update documentation=0D
  spapr: Add PEF based confidential guest support=0D
  spapr: PEF: prevent migration=0D
  confidential guest support: Alter virtio default properties for=0D
    protected guests=0D
  s390: Recognize confidential-guest-support option=0D
=0D
Greg Kurz (1):=0D
  qom: Allow optional sugar props=0D
=0D
 accel/kvm/kvm-all.c                       |  38 ------=0D
 accel/kvm/sev-stub.c                      |  10 +-=0D
 accel/stubs/kvm-stub.c                    |  10 --=0D
 backends/confidential-guest-support.c     |  33 +++++=0D
 backends/meson.build                      |   1 +=0D
 docs/amd-memory-encryption.txt            |   2 +-=0D
 docs/confidential-guest-support.txt       |  49 ++++++++=0D
 docs/papr-pef.txt                         |  30 +++++=0D
 docs/system/s390x/protvirt.rst            |  19 ++-=0D
 hw/core/machine.c                         |  63 ++++++++--=0D
 hw/i386/pc_sysfw.c                        |  17 +--=0D
 hw/ppc/meson.build                        |   1 +=0D
 hw/ppc/pef.c                              | 140 ++++++++++++++++++++++=0D
 hw/ppc/spapr.c                            |   8 +-=0D
 hw/s390x/pv.c                             |  62 ++++++++++=0D
 hw/s390x/s390-virtio-ccw.c                |   3 +=0D
 include/exec/confidential-guest-support.h |  62 ++++++++++=0D
 include/hw/boards.h                       |   2 +-=0D
 include/hw/ppc/pef.h                      |  17 +++=0D
 include/hw/s390x/pv.h                     |  17 +++=0D
 include/qemu/typedefs.h                   |   1 +=0D
 include/qom/object.h                      |   3 +-=0D
 include/sysemu/kvm.h                      |  16 ---=0D
 include/sysemu/sev.h                      |   4 +-=0D
 qom/object.c                              |   4 +-=0D
 softmmu/rtc.c                             |   3 +-=0D
 softmmu/vl.c                              |  27 ++++-=0D
 target/i386/kvm/kvm.c                     |  20 ++++=0D
 target/i386/sev-stub.c                    |   5 +=0D
 target/i386/sev.c                         |  95 ++++++---------=0D
 target/ppc/kvm.c                          |  18 ---=0D
 target/ppc/kvm_ppc.h                      |   6 -=0D
 32 files changed, 595 insertions(+), 191 deletions(-)=0D
 create mode 100644 backends/confidential-guest-support.c=0D
 create mode 100644 docs/confidential-guest-support.txt=0D
 create mode 100644 docs/papr-pef.txt=0D
 create mode 100644 hw/ppc/pef.c=0D
 create mode 100644 include/exec/confidential-guest-support.h=0D
 create mode 100644 include/hw/ppc/pef.h=0D
=0D
-- =0D
2.29.2=0D
=0D

