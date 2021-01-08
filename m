Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DFF2EF622
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:59:52 +0100 (CET)
Received: from localhost ([::1]:39834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxv79-0006Im-W9
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:59:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuu5-0004Az-DZ
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:46:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxutv-0003jO-VM
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:46:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610124368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eDrGXoEMEvV5hk/kYwH59//xlVgntTCTsSl5BnbR+kw=;
 b=T1xU8LGokVRkhWJv6+ZITdOAyT2A5bRpGZi4p0uJDn58SMQYmXcknxqVIgGUBKItPwZrf5
 wCioZdhrycuw1BKEDVVQPEgdTMQLSvqTXZSeQJawCgMgYaImvXCjsTRGtkz1khqBf6Nnn4
 DCH95R5Tt03+CVuCfEuhow44pTX+rS4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-oFlKW71hNhWdzgnm_K_NyQ-1; Fri, 08 Jan 2021 11:46:05 -0500
X-MC-Unique: oFlKW71hNhWdzgnm_K_NyQ-1
Received: by mail-qv1-f72.google.com with SMTP id v1so8667014qvb.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:46:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q+oRJhZRqMNqFeuGpb/jAVtuLrjw2C7Z6oAA6QdloRA=;
 b=UCnQJlaPi5AQZ/dAkYcyL25y6eMgT678IYB5j+vw3KPyl5xI0uIbqK4O+aXTTf3jWY
 MWL9S1M8QEhMUsGMFhfTSFSyf6Lyh1RBmakco7jZPdbic63t4l0MF4pU9+kEsDpkUbAK
 MzM11YP6BKuCCteYwEE8kfd/snznVcmptwI3QOY4hhf8ul/tj/ANRH3Qx6StgUv2jAA0
 SyMUjhcNsycQYTxjZd3zkpmaN4jRkttgWd9GvCUmxeqVGh3AlBZAL1aa79FlVtcvfzKX
 1rovzbvhYXLU/M7oWy86+kHrb+kfB4EWukgVnFQzHfUTEpjZp/jEBlSfQT7Fwx38HQdZ
 rZsQ==
X-Gm-Message-State: AOAM533cVU64UDfA8DV4qNdaQdgOuCi2byLqqU/klbqBUpd/tllqh9QP
 Uh2bsAxigMbKT7zyWAW/VdMAV+M1nYYwtayMZ03zmpLQrve4vYDrpriYShiZO1ecoMtQZ19IQw9
 pC4zhrfwBc66UURuWSkrzwzgiLJgPlbuhXHEQesGIKrqZyZ4/zvsITgHQTw+gnPIz
X-Received: by 2002:a37:4815:: with SMTP id v21mr4671532qka.130.1610124364269; 
 Fri, 08 Jan 2021 08:46:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIi8WK7GUuV5aSA5p5YAuMUKnr24eOn9Wla9ADLJBJ3lhD6WgaLpkFuWrvZiW6rGwOlTWW2Q==
X-Received: by 2002:a37:4815:: with SMTP id v21mr4671442qka.130.1610124362993; 
 Fri, 08 Jan 2021 08:46:02 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id c139sm5067437qke.24.2021.01.08.08.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 08:46:02 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/13] KVM: Dirty ring support (QEMU part)
Date: Fri,  8 Jan 2021 11:45:48 -0500
Message-Id: <20210108164601.406146-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is v4 of the qemu dirty ring interface support.=0D
=0D
It is merely the same as v3 content-wise, but there're a few things to ment=
ion=0D
besides the rebase itself:=0D
=0D
  - I picked up two patches from Eric Farman for the linux-header updates (=
from=0D
    Eric's v3 series) for convenience just in case any of the series would =
got=0D
    queued by any maintainer.=0D
=0D
  - One more patch is added as "KVM: Disable manual dirty log when dirty ri=
ng=0D
    enabled".  I found this when testing the branch after rebasing to lates=
t=0D
    qemu, that not only the manual dirty log capability is not needed for k=
vm=0D
    dirty ring, but more importantly INITIALLY_ALL_SET is totally against k=
vm=0D
    dirty ring and it could silently crash the guest after migration.  For =
this=0D
    new commit, I touched up "KVM: Add dirty-gfn-count property" a bit.=0D
=0D
  - A few more documentation lines in qemu-options.hx.=0D
=0D
  - I removed the RFC tag after kernel series got merged.=0D
=0D
Again, this is only the 1st step to support dirty ring.  Ideally dirty ring=
=0D
should grant QEMU the possibility to remove the whole layered dirty bitmap =
so=0D
that dirty ring will work similarly as auto-converge enabled but should bet=
ter;=0D
we will just throttle vcpus with the dirty ring kvm exit rather than explic=
itly=0D
adding a timer to stop the vcpu thread from entering the guest again (like =
what=0D
we did with current migration auto-converge).  Some more information could =
also=0D
be found in the kvm forum 2020 talk regarding kvm dirty ring (slides 21/22 =
[1]).=0D
=0D
That next step (to remove all the dirty bitmaps, as mentioned above) is sti=
ll=0D
discussable: firstly I don't know whether there's anything I've overlooked =
in=0D
there.  Meanwhile that's also only services huge VM cases, may not be extre=
mely=0D
helpful with a lot major scenarios where VMs are not that huge.=0D
=0D
There's probably other ways to fix huge VM migration issues, majorly focusi=
ng=0D
on responsiveness and convergence.  For example, Google has proposed some n=
ew=0D
userfaultfd kernel capability called "minor modes" [2] to track page minor=
=0D
faults and that could be finally served for that purpose too using postcopy=
.=0D
That's another long story so I'll stop here, but just as a marker along wit=
h=0D
the dirty ring series so there'll still be a record to reference.=0D
=0D
Said that, I still think this series is very worth merging even if we don't=
=0D
persue the next steps yet, since dirty ring is disabled by default, and we =
can=0D
always work upon this series.=0D
=0D
Please review, thanks.=0D
=0D
V3: https://lore.kernel.org/qemu-devel/20200523232035.1029349-1-peterx@redh=
at.com/=0D
    (V3 contains all the pre-v3 changelog)=0D
=0D
QEMU branch for testing (requires kernel version 5.11-rc1+):=0D
    https://github.com/xzpeter/qemu/tree/kvm-dirty-ring=0D
=0D
[1] https://static.sched.com/hosted_files/kvmforum2020/97/kvm_dirty_ring_pe=
ter.pdf=0D
[2] https://lore.kernel.org/lkml/20210107190453.3051110-1-axelrasmussen@goo=
gle.com/=0D
=0D
---------------------------8<---------------------------------=0D
=0D
Overview=0D
=3D=3D=3D=3D=3D=3D=3D=3D=0D
=0D
KVM dirty ring is a new interface to pass over dirty bits from kernel=0D
to the userspace.  Instead of using a bitmap for each memory region,=0D
the dirty ring contains an array of dirtied GPAs to fetch, one ring=0D
per vcpu.=0D
=0D
There're a few major changes comparing to how the old dirty logging=0D
interface would work:=0D
=0D
- Granularity of dirty bits=0D
=0D
  KVM dirty ring interface does not offer memory region level=0D
  granularity to collect dirty bits (i.e., per KVM memory=0D
  slot). Instead the dirty bit is collected globally for all the vcpus=0D
  at once.  The major effect is on VGA part because VGA dirty tracking=0D
  is enabled as long as the device is created, also it was in memory=0D
  region granularity.  Now that operation will be amplified to a VM=0D
  sync.  Maybe there's smarter way to do the same thing in VGA with=0D
  the new interface, but so far I don't see it affects much at least=0D
  on regular VMs.=0D
=0D
- Collection of dirty bits=0D
=0D
  The old dirty logging interface collects KVM dirty bits when=0D
  synchronizing dirty bits.  KVM dirty ring interface instead used a=0D
  standalone thread to do that.  So when the other thread (e.g., the=0D
  migration thread) wants to synchronize the dirty bits, it simply=0D
  kick the thread and wait until it flushes all the dirty bits to the=0D
  ramblock dirty bitmap.=0D
=0D
A new parameter "dirty-ring-size" is added to "-accel kvm".  By=0D
default, dirty ring is still disabled (size=3D=3D0).  To enable it, we=0D
need to be with:=0D
=0D
  -accel kvm,dirty-ring-size=3D65536=0D
=0D
This establishes a 64K dirty ring buffer per vcpu.  Then if we=0D
migrate, it'll switch to dirty ring.=0D
=0D
I gave it a shot with a 24G guest, 8 vcpus, using 10g NIC as migration=0D
channel.  When idle or dirty workload small, I don't observe major=0D
difference on total migration time.  When with higher random dirty=0D
workload (800MB/s dirty rate upon 20G memory, worse for kvm dirty=0D
ring). Total migration time is (ping pong migrate for 6 times, in=0D
seconds):=0D
=0D
|-------------------------+---------------|=0D
| dirty ring (4k entries) | dirty logging |=0D
|-------------------------+---------------|=0D
|                      70 |            58 |=0D
|                      78 |            70 |=0D
|                      72 |            48 |=0D
|                      74 |            52 |=0D
|                      83 |            49 |=0D
|                      65 |            54 |=0D
|-------------------------+---------------|=0D
=0D
Summary:=0D
=0D
dirty ring average:    73s=0D
dirty logging average: 55s=0D
=0D
The KVM dirty ring will be slower in above case.  The number may show=0D
that the dirty logging is still preferred as a default value because=0D
small/medium VMs are still major cases, and high dirty workload=0D
happens frequently too.  And that's what this series did.=0D
=0D
TODO:=0D
=0D
- Consider to drop the BQL dependency: then we can run the reaper thread in=
=0D
  parallel of main thread.  Needs some thought around the race conditions.=
=0D
=0D
- Consider to drop the kvmslot bitmap: logically this can be dropped with k=
vm=0D
  dirty ring, not only for space saving, but also it's still another layer=
=0D
  linear to guest mem size which is against the whole idea of kvm dirty rin=
g.=0D
  This should make above number (of kvm dirty ring) even smaller (but still=
 may=0D
  not be as good as dirty logging when with such high workload).=0D
=0D
Please refer to the code and comment itself for more information.=0D
=0D
Thanks,=0D
=0D
Eric Farman (2):=0D
  update-linux-headers: Include const.h=0D
  Update linux headers to 5.11-rc2=0D
=0D
Peter Xu (11):=0D
  memory: Introduce log_sync_global() to memory listener=0D
  KVM: Fixup kvm_log_clear_one_slot() ioctl return check=0D
  KVM: Use a big lock to replace per-kml slots_lock=0D
  KVM: Create the KVMSlot dirty bitmap on flag changes=0D
  KVM: Provide helper to get kvm dirty log=0D
  KVM: Provide helper to sync dirty bitmap from slot to ramblock=0D
  KVM: Simplify dirty log sync in kvm_set_phys_mem=0D
  KVM: Cache kvm slot dirty bitmap size=0D
  KVM: Add dirty-gfn-count property=0D
  KVM: Disable manual dirty log when dirty ring enabled=0D
  KVM: Dirty ring support=0D
=0D
 accel/kvm/kvm-all.c                           | 577 +++++++++++++++---=0D
 accel/kvm/trace-events                        |   7 +=0D
 include/exec/memory.h                         |  12 +=0D
 include/hw/core/cpu.h                         |   8 +=0D
 .../infiniband/hw/vmw_pvrdma/pvrdma_ring.h    |  14 +-=0D
 .../infiniband/hw/vmw_pvrdma/pvrdma_verbs.h   |   2 +-=0D
 include/standard-headers/drm/drm_fourcc.h     | 175 +++++-=0D
 include/standard-headers/linux/const.h        |  36 ++=0D
 include/standard-headers/linux/ethtool.h      |   2 +-=0D
 include/standard-headers/linux/fuse.h         |  30 +-=0D
 include/standard-headers/linux/kernel.h       |   9 +-=0D
 include/standard-headers/linux/pci_regs.h     |  16 +=0D
 include/standard-headers/linux/vhost_types.h  |   9 +=0D
 include/standard-headers/linux/virtio_gpu.h   |  82 +++=0D
 include/standard-headers/linux/virtio_ids.h   |  44 +-=0D
 include/sysemu/kvm_int.h                      |   7 +-=0D
 linux-headers/asm-arm64/kvm.h                 |   3 -=0D
 linux-headers/asm-generic/unistd.h            |   6 +-=0D
 linux-headers/asm-mips/unistd_n32.h           |   1 +=0D
 linux-headers/asm-mips/unistd_n64.h           |   1 +=0D
 linux-headers/asm-mips/unistd_o32.h           |   1 +=0D
 linux-headers/asm-powerpc/unistd_32.h         |   1 +=0D
 linux-headers/asm-powerpc/unistd_64.h         |   1 +=0D
 linux-headers/asm-s390/unistd_32.h            |   1 +=0D
 linux-headers/asm-s390/unistd_64.h            |   1 +=0D
 linux-headers/asm-x86/kvm.h                   |   1 +=0D
 linux-headers/asm-x86/unistd_32.h             |   1 +=0D
 linux-headers/asm-x86/unistd_64.h             |   1 +=0D
 linux-headers/asm-x86/unistd_x32.h            |   1 +=0D
 linux-headers/linux/kvm.h                     |  56 +-=0D
 linux-headers/linux/userfaultfd.h             |   9 +=0D
 linux-headers/linux/vfio.h                    |   1 +=0D
 linux-headers/linux/vhost.h                   |   4 +=0D
 qemu-options.hx                               |  12 +=0D
 scripts/update-linux-headers.sh               |   5 +-=0D
 softmmu/memory.c                              |  33 +-=0D
 36 files changed, 1022 insertions(+), 148 deletions(-)=0D
 create mode 100644 include/standard-headers/linux/const.h=0D
=0D
--=20=0D
2.26.2=0D
=0D


