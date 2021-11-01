Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4257444232F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:13:03 +0100 (CET)
Received: from localhost ([::1]:47484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfY6-0001Fr-25
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUa-0006q2-K0
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUW-0000Xq-7L
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635804558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UcUIBTO6A2A6Mr3DNTGimCFNhmnrVDJGDlnfgcY6wsE=;
 b=AbbEtOqV5+v9HxPUyMgPaJBRNs5rFG57PZzamI8JbU1O28Ar0ZkzItmo8wX5JeyGJ3lnfM
 6ZAgG+yyzP+ddHGZOCA83YZz5N+JN7TW2hZJSjZ3Kq4bgxYYlaN/RvPO0KYMg3KrVofEC3
 lWZlhKYK0/WNgQbTqg7phKFYVD95YNo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-8NwEf14bPbasAfS6DYwaTQ-1; Mon, 01 Nov 2021 18:09:15 -0400
X-MC-Unique: 8NwEf14bPbasAfS6DYwaTQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so169918wmc.7
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mg126+9me9ZhZB/Tacp08IAkZeaGvGDXykNGOzkIohU=;
 b=IXbmMQO8vdnb+9whJSdPsaKURnMotkEI0DP6I6rfWfNPv4J8HGJsomk/b9KaMSO5Dn
 FXlYD0PGlUeb/ZkDFuwKTBUde/a3ibu5E5fRo0c4woxZsfQHDXnw8sp2JPwbqBCNFO4x
 dS6bp6TlaFTTXagpPTDAMtH0iWgFZLoOjO6qXJjfnH6cb80HNE6NLFLlwJun13YxRFCm
 3XBUwWzptJrRkLstc1O9vAgmwwS81IT3nTrAR0TmTL3P0uR0NTYzNGHMbFOJr3kmwhNg
 X2tRvObfJCmLl5MCC8a0FprTj7gtScyPVhXd77PpjnBK5iazLz3goiLbIMVZMEwnvIIm
 R/QA==
X-Gm-Message-State: AOAM532FkRNhSYSiInMALiDu9KPfFozYiC0GlY/s/0speVtUy9csGRLl
 4B1LBmuGNYOwK9ZMwznrZBo7OMzh08O6IsASPqu24lmjyOp3wfq1PGK/49mDOt2CAcd4Xr8zUDZ
 Fr/VvOcNcztEpO1iaUTJI6Qt0NAdF95sKGZil1aMr1hnYVMGzgTsdpyeUOWQ2KI9RA1M=
X-Received: by 2002:a5d:6e8c:: with SMTP id k12mr40207245wrz.401.1635804554392; 
 Mon, 01 Nov 2021 15:09:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiYqS6XG9xwq0Xi+0IIDYOMlQDxPDwjRqxs0xc44YT7VvgO+jFUiosfcGK1mj6k1mDxUBPBw==
X-Received: by 2002:a5d:6e8c:: with SMTP id k12mr40207187wrz.401.1635804554086; 
 Mon, 01 Nov 2021 15:09:14 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id i15sm630121wmb.20.2021.11.01.15.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:13 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/20] Migration 20211031 patches
Date: Mon,  1 Nov 2021 23:08:52 +0100
Message-Id: <20211101220912.10039-1-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into =
staging (2021-10-30 11:31:41 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/juanquintela/qemu.git tags/migration-20211031-pull-req=
uest=0D
=0D
for you to fetch changes up to 826b8bc80cb191557a4ce7cf0e155b436d2d1afa:=0D
=0D
  migration/dirtyrate: implement dirty-bitmap dirtyrate calculation (2021-1=
1-01 22:56:44 +0100)=0D
=0D
----------------------------------------------------------------=0D
Migration Pull request=0D
=0D
Hi=0D
=0D
this includes pending bits of migration patches.=0D
=0D
- virtio-mem support by David Hildenbrand=0D
- dirtyrate improvements by Hyman Huang=0D
- fix rdma wrid by Li Zhijian=0D
- dump-guest-memory fixes by Peter Xu=0D
=0D
Pleas apply.=0D
=0D
Thanks, Juan.=0D
=0D
----------------------------------------------------------------=0D
=0D
David Hildenbrand (8):=0D
  memory: Introduce replay_discarded callback for RamDiscardManager=0D
  virtio-mem: Implement replay_discarded RamDiscardManager callback=0D
  migration/ram: Handle RAMBlocks with a RamDiscardManager on the=0D
    migration source=0D
  virtio-mem: Drop precopy notifier=0D
  migration/postcopy: Handle RAMBlocks with a RamDiscardManager on the=0D
    destination=0D
  migration: Simplify alignment and alignment checks=0D
  migration/ram: Factor out populating pages readable in=0D
    ram_block_populate_pages()=0D
  migration/ram: Handle RAMBlocks with a RamDiscardManager on background=0D
    snapshots=0D
=0D
Hyman Huang(=C3=A9=C2=BB=E2=80=9E=C3=A5=E2=80=B9=E2=80=A1) (6):=0D
  KVM: introduce dirty_pages and kvm_dirty_ring_enabled=0D
  memory: make global_dirty_tracking a bitmask=0D
  migration/dirtyrate: introduce struct and adjust DirtyRateStat=0D
  migration/dirtyrate: adjust order of registering thread=0D
  migration/dirtyrate: move init step of calculation to main thread=0D
  migration/dirtyrate: implement dirty-ring dirtyrate calculation=0D
=0D
Hyman Huang(=E9=BB=84=E5=8B=87) (2):=0D
  memory: introduce total_dirty_pages to stat dirty pages=0D
  migration/dirtyrate: implement dirty-bitmap dirtyrate calculation=0D
=0D
Li Zhijian (1):=0D
  migration/rdma: Fix out of order wrid=0D
=0D
Peter Xu (3):=0D
  migration: Make migration blocker work for snapshots too=0D
  migration: Add migrate_add_blocker_internal()=0D
  dump-guest-memory: Block live migration=0D
=0D
 qapi/migration.json            |  48 ++++-=0D
 include/exec/memory.h          |  41 +++-=0D
 include/exec/ram_addr.h        |  13 +-=0D
 include/hw/core/cpu.h          |   1 +=0D
 include/hw/virtio/virtio-mem.h |   3 -=0D
 include/migration/blocker.h    |  16 ++=0D
 include/sysemu/kvm.h           |   1 +=0D
 migration/dirtyrate.h          |  21 +-=0D
 migration/ram.h                |   1 +=0D
 accel/kvm/kvm-all.c            |   7 +=0D
 accel/stubs/kvm-stub.c         |   5 +=0D
 dump/dump.c                    |  19 ++=0D
 hw/i386/xen/xen-hvm.c          |   4 +-=0D
 hw/virtio/virtio-mem.c         |  92 ++++++---=0D
 migration/dirtyrate.c          | 367 ++++++++++++++++++++++++++++++---=0D
 migration/migration.c          |  30 +--=0D
 migration/postcopy-ram.c       |  40 +++-=0D
 migration/ram.c                | 180 ++++++++++++++--=0D
 migration/rdma.c               | 138 +++++++++----=0D
 softmmu/memory.c               |  43 +++-=0D
 hmp-commands.hx                |   8 +-=0D
 migration/trace-events         |   2 +=0D
 softmmu/trace-events           |   1 +=0D
 23 files changed, 909 insertions(+), 172 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


