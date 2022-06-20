Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6A855168B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 13:05:43 +0200 (CEST)
Received: from localhost ([::1]:45816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3FDy-0005rE-5w
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 07:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FAf-0002m4-Ut
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:02:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FAd-0007Tp-Jx
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655722934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=k7M9eG4ES0Tb9RcaMGRjXBPRle1hQce1Gzhgv+9UBsw=;
 b=F5i+/hXGEIFIbaEuRTepfx+i1PDhZZ6yqTM+z/8yv2uKbyLqjo0sxbSs+Kl8XMgo3KzXQU
 OMbV2TYs/g1KdolbI5ahmzMMMCWYBBWNz5H/8DAzZKIpuWh0d0rvH+iVpjpvrpJiUFGrM5
 94TyWOcEkfHm/NQH9QW/yEvflDiktj8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-J26uDEXZPKiOmHUDixspUg-1; Mon, 20 Jun 2022 07:02:09 -0400
X-MC-Unique: J26uDEXZPKiOmHUDixspUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DC5A80B70E;
 Mon, 20 Jun 2022 11:02:09 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EDDCC2810D;
 Mon, 20 Jun 2022 11:02:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: [PATCH v2 00/21] migration: remove QEMUFileOps concept and assume use
 of QIOChannel
Date: Mon, 20 Jun 2022 12:01:44 +0100
Message-Id: <20220620110205.1357829-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quite a while ago now, the majority of QEMUFile implementations were=0D
switched over to use QIOChannel APIs, but a couple remained.=0D
=0D
The newish multifd code is directly using QIOChannel, only calling=0D
in to QEMUFile for the VMState transfer and for rate limiting=0D
purposes.=0D
=0D
This series finishes the job of converting QEMUFile to always have=0D
a QIOChannel as its backend, enabling a removal of QEMUFileOps.=0D
=0D
Most callers still need to use the QEMUFile APIs though, as that=0D
performs buffering of reads/writes.=0D
=0D
As a followup to this series, however, it would be practical to=0D
introduce a QIOChannelCache that layers on top of another QIOChannel=0D
to add buffering equivalent to what QEMUFile does, possibly with=0D
the rate limiting too.=0D
=0D
At that point QEMUFile would not really be doing much at all and=0D
could possibly go away entirely, leaving just the MigrationState=0D
object for global state tracking, managing one or more QIOChannel=0D
objects for the data transfer. I think this could simplify future=0D
evolution of migration code.=0D
=0D
I'm not likely to have time in the immediate future to work on=0D
such a followup though.=0D
=0D
Changed in v2:=0D
=0D
 - Fix explanation of QIOChannelNull functionality=0D
 - Improve commit message wrt renaming 'pos' field=0D
 - Add patch to rename qemu_update_transfer method too=0D
 - Avoid redundancy in qemu_file_total_transferred=0D
   and qemu_file_total_transferred_fast docs=0D
 - Address line length / trailing whitespace=0D
 - Remove qemu_get_fd prototype at same time as=0D
   QEMUFileGetFD typedef=0D
=0D
Daniel P. Berrang=C3=A9 (21):=0D
  io: add a QIOChannelNull equivalent to /dev/null=0D
  migration: switch to use QIOChannelNull for dummy channel=0D
  migration: remove unreachble RDMA code in save_hook impl=0D
  migration: rename rate limiting fields in QEMUFile=0D
  migration: rename 'pos' field in QEMUFile to 'bytes_processed'=0D
  migration: rename qemu_ftell to qemu_file_total_transferred=0D
  migration: rename qemu_update_position to qemu_file_credit_transfer=0D
  migration: rename qemu_file_update_transfer to=0D
    qemu_file_acct_rate_limit=0D
  migration: introduce a QIOChannel impl for BlockDriverState VMState=0D
  migration: convert savevm to use QIOChannelBlock for VMState=0D
  migration: stop passing 'opaque' parameter to QEMUFile hooks=0D
  migration: hardcode assumption that QEMUFile is backed with QIOChannel=0D
  migration: introduce new constructors for QEMUFile=0D
  migration: remove unused QEMUFileGetFD typedef / qemu_get_fd method=0D
  migration: remove the QEMUFileOps 'shut_down' callback=0D
  migration: remove the QEMUFileOps 'set_blocking' callback=0D
  migration: remove the QEMUFileOps 'close' callback=0D
  migration: remove the QEMUFileOps 'get_buffer' callback=0D
  migration: remove the QEMUFileOps 'writev_buffer' callback=0D
  migration: remove the QEMUFileOps 'get_return_path' callback=0D
  migration: remove the QEMUFileOps abstraction=0D
=0D
 include/io/channel-null.h         |  55 +++++++=0D
 io/channel-null.c                 | 237 ++++++++++++++++++++++++++++++=0D
 io/meson.build                    |   1 +=0D
 io/trace-events                   |   3 +=0D
 migration/block.c                 |  10 +-=0D
 migration/channel-block.c         | 195 ++++++++++++++++++++++++=0D
 migration/channel-block.h         |  59 ++++++++=0D
 migration/channel.c               |   4 +-=0D
 migration/colo.c                  |   5 +-=0D
 migration/meson.build             |   2 +-=0D
 migration/migration.c             |  10 +-=0D
 migration/multifd.c               |   4 +-=0D
 migration/qemu-file-channel.c     | 194 ------------------------=0D
 migration/qemu-file-channel.h     |  32 ----=0D
 migration/qemu-file.c             | 193 +++++++++++++-----------=0D
 migration/qemu-file.h             | 125 +++++++---------=0D
 migration/ram.c                   |   8 +-=0D
 migration/rdma.c                  | 144 +++++-------------=0D
 migration/savevm.c                |  55 ++-----=0D
 migration/vmstate.c               |   4 +-=0D
 tests/unit/meson.build            |   1 +=0D
 tests/unit/test-io-channel-null.c |  95 ++++++++++++=0D
 tests/unit/test-vmstate.c         |   5 +-=0D
 23 files changed, 879 insertions(+), 562 deletions(-)=0D
 create mode 100644 include/io/channel-null.h=0D
 create mode 100644 io/channel-null.c=0D
 create mode 100644 migration/channel-block.c=0D
 create mode 100644 migration/channel-block.h=0D
 delete mode 100644 migration/qemu-file-channel.c=0D
 delete mode 100644 migration/qemu-file-channel.h=0D
 create mode 100644 tests/unit/test-io-channel-null.c=0D
=0D
-- =0D
2.36.1=0D
=0D


