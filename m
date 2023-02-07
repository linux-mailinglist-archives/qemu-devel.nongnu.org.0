Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BF868D0F9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:52:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPIlF-00039G-Ay; Tue, 07 Feb 2023 02:51:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPIlC-00037X-Up
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:51:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPIlA-0000t4-Vo
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:51:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675756284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+ox8diL8kQyGTWBUS4FkfccAUvNjMVZdjhDv7W1Ixdc=;
 b=KXfiT9oLxkhGwtjyYBgGee+UJskCdJMEtLfmzuRuMqLMmk3b3K6/7TJQ9ciAJyP/1O+snC
 bEszfjfFIXqmEi56KM5Sb/5IT+/6AgL5uw3SCaA5MpstjkEdFslZ0au+E9lhXrKZU7lrNw
 VbYbYx4Bj1n7sOWhxGUMzT0eJYDXZjQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-0-pjUj4qPPqw0uJdlYWDDw-1; Tue, 07 Feb 2023 02:51:18 -0500
X-MC-Unique: 0-pjUj4qPPqw0uJdlYWDDw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 333D385A5A3;
 Tue,  7 Feb 2023 07:51:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2D9B492B21;
 Tue,  7 Feb 2023 07:51:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B5C7F21E6A1F; Tue,  7 Feb 2023 08:51:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, jiri@resnulli.us,
 jasowang@redhat.com, pavel.dovgaluk@ispras.ru, pbonzini@redhat.com,
 zhanghailiang@xfusion.com, quintela@redhat.com, dgilbert@redhat.com,
 michael.roth@amd.com, kkostiuk@redhat.com
Subject: [PATCH 00/12] error: Reduce qerror.h usage a bit more
Date: Tue,  7 Feb 2023 08:51:03 +0100
Message-Id: <20230207075115.1525-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series gets rid of two out of 15 remaining QERR_ macros and
confines use of one more to qga/.  Bonus: better error messages.

Markus Armbruster (12):
  error: Drop superfluous #include "qapi/qmp/qerror.h"
  dump: Improve error message when target doesn't support memory dump
  dump: Assert cpu_get_note_size() can't fail
  hw/core: Improve error message when machine doesn't provide NMIs
  hw/smbios: Dumb down smbios_entry_add() stub
  hw/acpi: Dumb down acpi_table_add() stub
  hw/acpi: Move QMP command to hw/core/
  qga: Drop dangling reference to QERR_QGA_LOGGING_DISABLED
  replay: Simplify setting replay blockers
  hw/core: Improve the query-hotpluggable-cpus error message
  migration/colo: Improve an x-colo-lost-heartbeat error message
  rocker: Tweak stubbed out monitor commands' error messages

 MAINTAINERS                    |  1 -
 include/qapi/qmp/qerror.h      |  6 ------
 include/sysemu/replay.h        |  2 +-
 authz/listfile.c               |  1 -
 backends/cryptodev-vhost.c     |  1 -
 backends/rng.c                 |  1 -
 backends/vhost-user.c          |  1 -
 block/backup.c                 |  1 -
 block/commit.c                 |  1 -
 block/mirror.c                 |  1 -
 block/stream.c                 |  1 -
 dump/dump.c                    |  8 +++-----
 hw/acpi/acpi-stub.c            |  4 +---
 hw/acpi/vmgenid.c              | 18 ------------------
 hw/core/machine-qmp-cmds.c     | 21 +++++++++++++++++++--
 hw/core/machine.c              |  1 -
 hw/core/nmi.c                  |  3 +--
 hw/i386/pc.c                   |  1 -
 hw/i386/x86.c                  |  1 -
 hw/misc/xlnx-zynqmp-apu-ctrl.c |  1 -
 hw/net/rocker/qmp-norocker.c   | 12 +++++-------
 hw/smbios/smbios-stub.c        |  4 +---
 migration/colo-failover.c      |  3 +--
 migration/colo.c               |  1 -
 migration/migration-hmp-cmds.c |  1 -
 qga/commands.c                 |  5 ++---
 qga/main.c                     |  1 -
 replay/replay.c                |  6 +++++-
 replay/stubs-system.c          |  2 +-
 softmmu/qtest.c                |  1 -
 softmmu/rtc.c                  |  5 +----
 softmmu/vl.c                   | 13 +++----------
 stubs/vmgenid.c                | 10 ----------
 target/i386/monitor.c          |  1 -
 target/i386/sev-sysemu-stub.c  |  1 -
 target/i386/sev.c              |  1 -
 util/qemu-config.c             |  1 -
 stubs/meson.build              |  1 -
 38 files changed, 44 insertions(+), 100 deletions(-)
 delete mode 100644 stubs/vmgenid.c

-- 
2.39.0


