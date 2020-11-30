Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357402C849C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:02:59 +0100 (CET)
Received: from localhost ([::1]:52960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjipW-0006uw-9Z
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kjie3-0005ql-VN
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:51:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kjie0-00016Z-Je
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606740662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EbxOz9d6bnWS7rycw70XW9L80vcpSgPSW1J0DMfqG1s=;
 b=UOQPBQ9BN5NQ9g8yx5ZlAeTdIQLdmNh/b9Wm9vepCB/StZLsUqHtGfCLVft919gMMbUqkX
 x35JsikvBBdsZxG7YAfawJ0xCtL7Yz8u98wcvMxd2ucYr4JM/Mc4YNuS4D294+vUqb3BbS
 yZSiQs9+xTdgHVML6gny6BxP+Cb6+NY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-v0we4g-1Mx2pzGJqRo04zg-1; Mon, 30 Nov 2020 07:51:00 -0500
X-MC-Unique: v0we4g-1Mx2pzGJqRo04zg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABFD89A221
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 12:50:59 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 928B95D9C0;
 Mon, 30 Nov 2020 12:50:58 +0000 (UTC)
Date: Mon, 30 Nov 2020 13:50:56 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 00/36] cleanup qemu_init and make sense of command
 line processing
Message-ID: <20201130135056.3a9e5d7c@redhat.com>
In-Reply-To: <20201123141435.2726558-1-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 09:13:59 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Incompatible changes WRT 5.x:
> 
> - "-incoming defer" will not generate a MIGRATION event until
>   the migrate-incoming command is sent
> 
> - the "preconfig" runstate is not reported anymore, and is replaced
>   with "prelaunch"

I completed reviewing this series (modulo 10/36) which I'm not confident
enough to review. I think Markus might be better fit for reviewing it.

> Since the patches build on a bunch of more mechanical changes to
> remove the ram_size and bios_name global variables, which affect
> all targets, I have already placed the result in the for-6.0 branch of
> my gitlab repository.  The branch has also passed CI already.
> 
> Thanks,
> 
> Paolo
> 
> Paolo Bonzini (36):
>   vl: extract validation of -smp to machine.c
>   vl: remove bogus check
>   vl: split various early command line options to a separate function
>   vl: move various initialization routines out of qemu_init
>   vl: extract qemu_init_subsystems
>   vl: move prelaunch part of qemu_init to new functions
>   vl: extract various command line validation snippets to a new function
>   vl: preconfig and loadvm are mutually exclusive
>   vl: extract various command line desugaring snippets to a new function
>   qemu-option: restrict qemu_opts_set to merge-lists QemuOpts
>   vl: create "-net nic -net user" default earlier
>   vl: load plugins as late as possible
>   vl: move semihosting command line fallback to qemu_init_board
>   vl: extract default devices to separate functions
>   vl: move CHECKPOINT_INIT after preconfig
>   vl: separate qemu_create_early_backends
>   vl: separate qemu_create_late_backends
>   vl: separate qemu_create_machine
>   vl: separate qemu_apply_machine_options
>   vl: separate qemu_resolve_machine_memdev
>   vl: initialize displays before preconfig loop
>   vl: move -global check earlier
>   migration, vl: start migration via qmp_migrate_incoming
>   vl: start VM via qmp_cont
>   hmp: introduce cmd_available
>   remove preconfig state
>   vl: remove separate preconfig main_loop
>   vl: allow -incoming defer with -preconfig
>   vl: extract softmmu/datadir.c
>   vl: extract machine done notifiers
>   vl: extract softmmu/rtc.c
>   vl: extract softmmu/runstate.c
>   vl: extract softmmu/globals.c
>   vl: remove serial_max_hds
>   vl: clean up -boot variables
>   vl: move all generic initialization out of vl.c
> 
>  hw/alpha/dp264.c              |    1 +
>  hw/arm/boot.c                 |    1 +
>  hw/arm/digic_boards.c         |    1 +
>  hw/arm/highbank.c             |    1 +
>  hw/arm/npcm7xx_boards.c       |    1 +
>  hw/arm/sbsa-ref.c             |    1 +
>  hw/arm/vexpress.c             |    1 +
>  hw/arm/virt.c                 |    1 +
>  hw/avr/boot.c                 |    1 +
>  hw/core/loader.c              |    1 +
>  hw/core/machine-qmp-cmds.c    |    5 +-
>  hw/core/machine.c             |  103 ++
>  hw/core/qdev.c                |   12 +-
>  hw/display/cg3.c              |    1 +
>  hw/display/tcx.c              |    1 +
>  hw/hppa/machine.c             |    1 +
>  hw/i386/x86.c                 |    1 +
>  hw/lm32/milkymist.c           |    1 +
>  hw/m68k/mcf5208.c             |    1 +
>  hw/m68k/q800.c                |    1 +
>  hw/microblaze/boot.c          |    1 +
>  hw/mips/fuloong2e.c           |    1 +
>  hw/mips/jazz.c                |    1 +
>  hw/mips/malta.c               |    1 +
>  hw/mips/mipssim.c             |    1 +
>  hw/nios2/boot.c               |    1 +
>  hw/nvram/fw_cfg.c             |    1 +
>  hw/pci-host/prep.c            |    1 +
>  hw/pci/pci.c                  |    1 +
>  hw/ppc/e500.c                 |    1 +
>  hw/ppc/mac_newworld.c         |    1 +
>  hw/ppc/mac_oldworld.c         |    1 +
>  hw/ppc/pnv.c                  |    1 +
>  hw/ppc/ppc405_boards.c        |    1 +
>  hw/ppc/ppc440_bamboo.c        |    1 +
>  hw/ppc/sam460ex.c             |    1 +
>  hw/ppc/spapr.c                |    7 +-
>  hw/ppc/virtex_ml507.c         |    1 +
>  hw/riscv/boot.c               |    1 +
>  hw/s390x/ipl.c                |    1 +
>  hw/sparc/leon3.c              |    1 +
>  hw/sparc/sun4m.c              |    1 +
>  hw/sparc64/sun4u.c            |    1 +
>  include/exec/cpu-common.h     |    3 +
>  include/exec/exec-all.h       |    3 -
>  include/hw/boards.h           |    2 +
>  include/hw/qdev-core.h        |    9 +-
>  include/migration/misc.h      |    1 -
>  include/qapi/qmp/dispatch.h   |    1 +
>  include/qemu-common.h         |   21 -
>  include/qemu/datadir.h        |   28 +
>  include/qemu/option.h         |    3 +-
>  include/sysemu/runstate.h     |    1 -
>  include/sysemu/sysemu.h       |   12 +-
>  migration/migration.c         |   37 +-
>  monitor/hmp.c                 |   23 +-
>  monitor/qmp-cmds.c            |   10 -
>  qapi/qmp-dispatch.c           |    5 +-
>  qapi/run-state.json           |    5 +-
>  softmmu/datadir.c             |  129 ++
>  softmmu/globals.c             |   74 +
>  softmmu/meson.build           |    4 +
>  softmmu/qdev-monitor.c        |   18 +-
>  softmmu/rtc.c                 |  190 +++
>  softmmu/runstate.c            |  800 ++++++++++
>  softmmu/vl.c                  | 2761 ++++++++++-----------------------
>  stubs/meson.build             |    1 +
>  stubs/qmp-command-available.c |    7 +
>  tests/qtest/fuzz/fuzz.c       |    1 +
>  tests/qtest/qmp-test.c        |    2 +-
>  tests/test-qemu-opts.c        |   20 +-
>  ui/keymaps.c                  |    1 +
>  util/qemu-option.c            |    9 +-
>  73 files changed, 2311 insertions(+), 2036 deletions(-)
>  create mode 100644 include/qemu/datadir.h
>  create mode 100644 softmmu/datadir.c
>  create mode 100644 softmmu/globals.c
>  create mode 100644 softmmu/rtc.c
>  create mode 100644 softmmu/runstate.c
>  create mode 100644 stubs/qmp-command-available.c
> 


