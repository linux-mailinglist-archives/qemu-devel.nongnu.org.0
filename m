Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA8829C7A6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 19:43:54 +0100 (CET)
Received: from localhost ([::1]:55400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXTwn-0005PL-IX
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 14:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kXTbq-0004Da-9U
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 14:22:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kXTbe-0002z3-8h
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 14:22:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603822920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+eSsIsfv6fA//U83l9kwvXr4u4weNz2JjQ/THRFJ+fI=;
 b=avlXM7thF8ZFiFdbtlhvkAx88ixOuMVjwBKu2UBpJLDHHVtc5ZbfvlSLLE4+hFICM5K+xJ
 SGDsvcSUPo0TzBdded3D1aK3WJIGSBYA0WQXnC+J6nlq8N6/tL5/fTSMTmOoz0YjCPgfmW
 IaeBrj9qd0C9A4UgN+KaNzoOYNKox6o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-zP7y5vDdMki-sS1HWH8UOw-1; Tue, 27 Oct 2020 14:21:57 -0400
X-MC-Unique: zP7y5vDdMki-sS1HWH8UOw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B71BA18BE162
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 18:21:44 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C44E60C07
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 18:21:44 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 00/37] cleanup qemu_init and make sense of command line
 processing
Date: Tue, 27 Oct 2020 14:21:15 -0400
Message-Id: <20201027182144.3315885-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main improvements with respect to v1 are:

- further extraction of various phases of command line processing and VM
  creation to separate function;

- removing the preconfig main_loop: the VM is effectively always starting
  as if -preconfig was specified, it just executes automatically if not
  requested.  This enables "-incoming defer" to be specified together
  with "-preconfig".

I have other patches with which I could configure the VM like

  $ qemu -vnc :0 -monitor stdio -preconfig
    ... in theory blockdev-add and other backend creation would go here...
  (qemu) x-create-onboard-devices
  (qemu) device_add virtio-mouse-pci
  (qemu) cont

Here, x-create-onboard-devices creates enough of the machine to make
it possible to issue device_add monitor commands equivalent to
the -device command line.

However, I'm not posting that part because the above is not the
final state of the QMP interface.  The final QMP interface would have
three commands (machine-set, accel-set, machine-set-memory) that
bring the VM through successive phases of initialization corresponding
roughly to qemu_apply_machine_options (-smp, -boot, -M, -cpu?),
configure_accelerators (-accel) and qemu_finish_machine_init (-m, -M memdev);
after these three steps, one of migrate-incoming, cont, loadvm or
finish-machine-init (the latter of which is equivalent to -S on the
command line) leaves preconfig mode.  For more information see
https://wiki.qemu.org/User:Paolo_Bonzini/Machine_init_sequence#Basic_phases.

Based-on: <20201026143028.3034018-1-pbonzini@redhat.com>

Paolo Bonzini (29):
  trace: remove argument from trace_init_file
  semihosting: fix order of initialization functions
  vl: extract validation of -smp to machine.c
  vl: remove bogus check
  vl: split various early command line options to a separate function
  vl: move various initialization routines out of qemu_init
  vl: extract qemu_init_subsystems
  vl: move prelaunch part of qemu_init to new functions
  vl: extract various command line validation snippets to a new function
  vl: preconfig and loadvm are mutually exclusive
  vl: extract various command line desugaring snippets to a new function
  vl: create "-net nic -net user" default earlier
  vl: load plugins as late as possible
  vl: move semihosting command line fallback to qemu_finish_machine_init
  vl: extract default devices to separate functions
  vl: move CHECKPOINT_INIT after preconfig
  vl: separate qemu_create_early_backends
  vl: separate qemu_create_late_backends
  vl: separate qemu_create_machine
  vl: separate qemu_apply_machine_options
  vl: separate qemu_resolve_machine_memdev
  vl: initialize displays before preconfig loop
  vl: move -global check earlier
  migration, vl: start migration via qmp_migrate_incoming
  vl: start VM via qmp_cont
  hmp: introduce cmd_available
  remove preconfig state
  vl: remove separate preconfig main_loop
  vl: allow -incoming defer with -preconfig

 bsd-user/main.c                      |    6 +-
 hw/core/machine-qmp-cmds.c           |    5 +-
 hw/core/machine.c                    |   27 +
 include/hw/boards.h                  |    1 +
 include/hw/qdev-core.h               |    8 -
 include/migration/misc.h             |    1 -
 include/qapi/qmp/dispatch.h          |    1 +
 include/sysemu/runstate.h            |    1 -
 linux-user/main.c                    |    6 +-
 migration/migration.c                |   37 +-
 monitor/hmp.c                        |   23 +-
 monitor/qmp-cmds.c                   |   10 -
 qapi/qmp-dispatch.c                  |    5 +-
 qapi/run-state.json                  |    5 +-
 qemu-img.c                           |    6 +-
 qemu-io.c                            |    6 +-
 qemu-nbd.c                           |    6 +-
 scsi/qemu-pr-helper.c                |    6 +-
 softmmu/qdev-monitor.c               |   18 +-
 softmmu/vl.c                         | 1796 +++++++++++++-------------
 storage-daemon/qemu-storage-daemon.c |    9 +-
 stubs/meson.build                    |    1 +
 stubs/qmp-command-available.c        |    7 +
 trace/control.c                      |   10 +-
 trace/control.h                      |   12 +-
 25 files changed, 1021 insertions(+), 992 deletions(-)
 create mode 100644 stubs/qmp-command-available.c

-- 
2.26.2


