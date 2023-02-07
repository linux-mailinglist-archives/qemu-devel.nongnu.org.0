Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C9868CB71
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 01:50:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPCAf-0001B6-OT; Mon, 06 Feb 2023 19:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCAd-0001AW-LC
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:49:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCAb-0002H8-Pi
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675730952;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=uwxooEyQ0TeZj1Lfury3BdYqTv4E7EPLwakYSPvTjjE=;
 b=EPVyWNzPRS9+E0VT2JJbfURtjyjMW4woUTMez68JPA/qDwBmp57lkysSsEKH4ObksrUUZ4
 8N5Kba2xgU0WUErU2H5Lx+BRpZDDFNUEBNqb7AFrcsHn8ZbYTnwBLbZexoKI9/yztzYXxW
 uDyCnWcZLErtLKyyiD2tY7IuCuyJEyk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-402--b1nx9jaNGOkAd-rEK5mpw-1; Mon, 06 Feb 2023 19:49:11 -0500
X-MC-Unique: -b1nx9jaNGOkAd-rEK5mpw-1
Received: by mail-wm1-f69.google.com with SMTP id
 o42-20020a05600c512a00b003dc5341afbaso7356587wms.7
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 16:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:date:reply-to:user-agent:references:message-id
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uwxooEyQ0TeZj1Lfury3BdYqTv4E7EPLwakYSPvTjjE=;
 b=3TNQNRY5opBQsw0fOTmczkAH3x8wgyRfvGOZ+mkd/ubhgQp35gWr5tVbpBXf7L6Zea
 8MJ0NomnpwnloPFNPXICzGVBsSqYt4wTw2U8HuRxeZYsaaf/X8iOIoFG+YvCMiwNiuBs
 3UrvW7oIDXv20sM4vJxugGEkh3A/z11heiAvlO4qHm+FRB9Ofl3gcZp9Tt78Nx03K8lN
 mqM/smDDEgP6rxarbCxHalqdnmogDo0SpQBx0pehWfuCFcue3V20EoYWqgFpqzi0fOPH
 s9qXWV38jSQDNGVaPlsIDV6EhsDNHM62JezULYDuzaaa8wgQBD+FpDHQDuzuQFug8pqI
 YuUg==
X-Gm-Message-State: AO0yUKW9mEk96v3fI3TC+damjRuOY8yYhcbRTQbUPcKH9m9UI445IoXj
 si/zbXX8bHYrMV9VfcqgNKIdkz1x81c0k7Fe/byunTt7ug2Kz6XWlZ4JSORpFN5ZM402i8m2NnS
 snVZ0J9xv4rJpJGWENQbHtLhMFRm3WNA4IN5dkFKtms8woAkL6zqdjSeUozfwSibRhecVCXDJIx
 E=
X-Received: by 2002:a5d:4e03:0:b0:2c3:e139:7b2d with SMTP id
 p3-20020a5d4e03000000b002c3e1397b2dmr786817wrt.5.1675730950126; 
 Mon, 06 Feb 2023 16:49:10 -0800 (PST)
X-Google-Smtp-Source: AK7set9385HDo//v03MqXdzkjv42DAkD7VtKMPN3NvafYx2tDetIvVgFUDCxwLuEc28j777zWiaSew==
X-Received: by 2002:a5d:4e03:0:b0:2c3:e139:7b2d with SMTP id
 p3-20020a5d4e03000000b002c3e1397b2dmr786773wrt.5.1675730949733; 
 Mon, 06 Feb 2023 16:49:09 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 n3-20020a5d6b83000000b002366553eca7sm9867406wrx.83.2023.02.06.16.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 16:49:08 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,  Halil Pasic <pasic@linux.ibm.com>,  =?utf-8?Q?Marc-?=
 =?utf-8?Q?Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Coiby Xu <Coiby.Xu@gmail.com>,
 Eric Farman <farman@linux.ibm.com>,  Alex Williamson
 <alex.williamson@redhat.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Stefan Berger
 <stefanb@linux.vnet.ibm.com>,  Eric Blake <eblake@redhat.com>,  Eduardo
 Habkost <eduardo@habkost.net>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,  David Hildenbrand
 <david@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  John
 Snow <jsnow@redhat.com>,  Yanan Wang <wangyanan55@huawei.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Vladimir
 Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  qemu-block@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Fam Zheng <fam@euphon.net>,  qemu-s390x@nongnu.org
Subject: Re: [PULL 00/26] Next patches
In-Reply-To: <20230202160640.2300-1-quintela@redhat.com> (Juan Quintela's
 message of "Thu, 2 Feb 2023 17:06:14 +0100")
Message-ID: <87a61q1f7t.fsf@secure.mitica>
References: <20230202160640.2300-1-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 07 Feb 2023 01:49:08 +0100
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan Quintela <quintela@redhat.com> wrote:
> The following changes since commit deabea6e88f7c4c3c12a36ee30051c6209561165:
>
>   Merge tag 'for_upstream' of https://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2023-02-02 10:10:07 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/juan.quintela/qemu.git tags/next-pull-request
>
> for you to fetch changes up to 5ee6d3d1eeccd85aa2a835e82b8d9e1b4f7441e1:
>
>   migration: check magic value for deciding the mapping of channels (2023-02-02 17:04:16 +0100)
>
> ----------------------------------------------------------------
> Migration PULL request, new try

NACK

Has the same problem that peter detected.
Rebased it and fix file to only be included on linux.




>
> Hi
>
> It includes:
> - David Hildenbrand fixes for virtio-men
> - David Gilbert canary to detect problems
> - Fix for rdma return values (Fiona)
> - Peter Xu uffd_open fixes
> - Peter Xu show right downtime for postcopy
> - manish.mishra msg fix fixes
> - my vfio changes.
>
> Please apply.
>
> Please, apply.
>
> ----------------------------------------------------------------
>
> David Hildenbrand (13):
>   migration/ram: Fix populate_read_range()
>   migration/ram: Fix error handling in ram_write_tracking_start()
>   migration/ram: Don't explicitly unprotect when unregistering uffd-wp
>   migration/ram: Rely on used_length for uffd_change_protection()
>   migration/ram: Optimize ram_write_tracking_start() for
>     RamDiscardManager
>   migration/savevm: Move more savevm handling into vmstate_save()
>   migration/savevm: Prepare vmdesc json writer in
>     qemu_savevm_state_setup()
>   migration/savevm: Allow immutable device state to be migrated early
>     (i.e., before RAM)
>   migration/vmstate: Introduce VMSTATE_WITH_TMP_TEST() and
>     VMSTATE_BITMAP_TEST()
>   migration/ram: Factor out check for advised postcopy
>   virtio-mem: Fail if a memory backend with "prealloc=on" is specified
>   virtio-mem: Migrate immutable properties early
>   virtio-mem: Proper support for preallocation with migration
>
> Dr. David Alan Gilbert (2):
>   migration: Add canary to VMSTATE_END_OF_LIST
>   migration: Perform vmsd structure check during tests
>
> Fiona Ebner (1):
>   migration/rdma: fix return value for qio_channel_rdma_{readv,writev}
>
> Juan Quintela (4):
>   migration: No save_live_pending() method uses the QEMUFile parameter
>   migration: Split save_live_pending() into state_pending_*
>   migration: Remove unused threshold_size parameter
>   migration: simplify migration_iteration_run()
>
> Peter Xu (3):
>   migration: Fix migration crash when target psize larger than host
>   util/userfaultfd: Add uffd_open()
>   migration: Show downtime during postcopy phase
>
> Zhenzhong Duan (1):
>   migration/dirtyrate: Show sample pages only in page-sampling mode
>
> manish.mishra (2):
>   io: Add support for MSG_PEEK for socket channel
>   migration: check magic value for deciding the mapping of channels
>
>  docs/devel/migration.rst            |  18 +--
>  docs/devel/vfio-migration.rst       |   4 +-
>  include/hw/virtio/virtio-mem.h      |   8 ++
>  include/io/channel.h                |   6 +
>  include/migration/misc.h            |   4 +-
>  include/migration/register.h        |  17 +--
>  include/migration/vmstate.h         |  35 +++++-
>  include/qemu/userfaultfd.h          |   8 ++
>  migration/channel.h                 |   5 +
>  migration/migration.h               |   4 +
>  migration/multifd.h                 |   2 +-
>  migration/postcopy-ram.h            |   2 +-
>  migration/savevm.h                  |  10 +-
>  chardev/char-socket.c               |   4 +-
>  hw/core/machine.c                   |   4 +-
>  hw/s390x/s390-stattrib.c            |  11 +-
>  hw/vfio/migration.c                 |  20 +--
>  hw/virtio/virtio-mem.c              | 144 ++++++++++++++++++++-
>  io/channel-buffer.c                 |   1 +
>  io/channel-command.c                |   1 +
>  io/channel-file.c                   |   1 +
>  io/channel-null.c                   |   1 +
>  io/channel-socket.c                 |  19 ++-
>  io/channel-tls.c                    |   1 +
>  io/channel-websock.c                |   1 +
>  io/channel.c                        |  16 ++-
>  migration/block-dirty-bitmap.c      |  14 +--
>  migration/block.c                   |  13 +-
>  migration/channel-block.c           |   1 +
>  migration/channel.c                 |  45 +++++++
>  migration/dirtyrate.c               |  10 +-
>  migration/migration.c               | 119 ++++++++++++------
>  migration/multifd.c                 |  19 +--
>  migration/postcopy-ram.c            |  16 +--
>  migration/ram.c                     | 120 +++++++++++++-----
>  migration/rdma.c                    |  16 ++-
>  migration/savevm.c                  | 187 ++++++++++++++++++++--------
>  migration/vmstate.c                 |   2 +
>  scsi/qemu-pr-helper.c               |   2 +-
>  tests/qtest/migration-test.c        |   3 +-
>  tests/qtest/tpm-emu.c               |   2 +-
>  tests/unit/test-io-channel-socket.c |   1 +
>  util/userfaultfd.c                  |  13 +-
>  util/vhost-user-server.c            |   2 +-
>  hw/vfio/trace-events                |   2 +-
>  migration/trace-events              |   7 +-
>  46 files changed, 715 insertions(+), 226 deletions(-)


