Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BABA699C4E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:27:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSiy1-000842-UI; Thu, 16 Feb 2023 13:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pSixs-000822-6I
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:26:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pSixp-0006sh-NR
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676571995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x9aBZB7zhJiELZm4OhSNnNWIDnEQ5yd6AE/mourj3zw=;
 b=drBnk2it6k11Fg5pnT2Ywqx2rvSipPbh5xsUDE3bEpU3OGkB5PIevjcDgB9CMj5Lv2gD5c
 34bsyISR6arLE50qpr3lrPhpI1vukkPa7xXWPjayTgN4zI/sCpfOj6O3rpNuOoc6wILRS3
 DYT0UYzeWkcWfbItBpSyFH0hw5zd60w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-G_DPk2_dPlWOakmUjXkynQ-1; Thu, 16 Feb 2023 13:26:34 -0500
X-MC-Unique: G_DPk2_dPlWOakmUjXkynQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E487A85CCE0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 18:26:33 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1682B4010E82;
 Thu, 16 Feb 2023 18:26:32 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: virtio-fs@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 vgoyal@redhat.com, gmaglione@redhat.com
Subject: [PULL 0/4] virtiofs queue
Date: Thu, 16 Feb 2023 18:26:24 +0000
Message-Id: <20230216182628.126139-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 6dffbe36af79e26a4d23f94a9a1c1201de99c261:

  Merge tag 'migration-20230215-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-16 13:09:51 +0000)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20230216b

for you to fetch changes up to a6bfdaed4a735a2cf59f265e6955fe2adcc99637:

  virtiofsd: Swing deprecated message to removed-features (2023-02-16 18:15:08 +0000)

----------------------------------------------------------------
Remove C virtiofsd

We deprecated the C virtiofsd in commit 34deee7b6a1418f3d62a
in v7.0 in favour of the Rust implementation at

  https://gitlab.com/virtio-fs/virtiofsd

since then, the Rust version has had more development and
has held up well.  It's time to say goodbye to the C version
that got us going.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Dr. David Alan Gilbert (4):
      virtiofsd: Remove test
      virtiofsd: Remove build and docs glue
      virtiofsd: Remove source
      virtiofsd: Swing deprecated message to removed-features

 MAINTAINERS                                        |    2 -
 docs/about/deprecated.rst                          |   18 -
 docs/about/removed-features.rst                    |   13 +
 docs/conf.py                                       |    4 -
 docs/meson.build                                   |    1 -
 docs/tools/index.rst                               |    1 -
 docs/tools/virtiofsd.rst                           |  403 --
 meson.build                                        |    1 -
 meson_options.txt                                  |    2 -
 scripts/ci/org.centos/stream/8/x86_64/configure    |    2 -
 scripts/ci/org.centos/stream/8/x86_64/test-avocado |    7 -
 scripts/coverity-scan/COMPONENTS.md                |    3 -
 scripts/meson-buildoptions.sh                      |    3 -
 tests/avocado/virtiofs_submounts.py                |  217 -
 tools/meson.build                                  |   13 -
 tools/virtiofsd/50-qemu-virtiofsd.json.in          |    5 -
 tools/virtiofsd/buffer.c                           |  350 --
 tools/virtiofsd/fuse_common.h                      |  837 ----
 tools/virtiofsd/fuse_i.h                           |  107 -
 tools/virtiofsd/fuse_log.c                         |   40 -
 tools/virtiofsd/fuse_log.h                         |   75 -
 tools/virtiofsd/fuse_lowlevel.c                    | 2732 ------------
 tools/virtiofsd/fuse_lowlevel.h                    | 1988 ---------
 tools/virtiofsd/fuse_misc.h                        |   59 -
 tools/virtiofsd/fuse_opt.c                         |  446 --
 tools/virtiofsd/fuse_opt.h                         |  272 --
 tools/virtiofsd/fuse_signals.c                     |   93 -
 tools/virtiofsd/fuse_virtio.c                      | 1081 -----
 tools/virtiofsd/fuse_virtio.h                      |   33 -
 tools/virtiofsd/helper.c                           |  409 --
 tools/virtiofsd/meson.build                        |   18 -
 tools/virtiofsd/passthrough_helpers.h              |   51 -
 tools/virtiofsd/passthrough_ll.c                   | 4521 --------------------
 tools/virtiofsd/passthrough_seccomp.c              |  182 -
 tools/virtiofsd/passthrough_seccomp.h              |   14 -
 35 files changed, 13 insertions(+), 13990 deletions(-)
 delete mode 100644 docs/tools/virtiofsd.rst
 delete mode 100644 tests/avocado/virtiofs_submounts.py
 delete mode 100644 tools/virtiofsd/50-qemu-virtiofsd.json.in
 delete mode 100644 tools/virtiofsd/buffer.c
 delete mode 100644 tools/virtiofsd/fuse_common.h
 delete mode 100644 tools/virtiofsd/fuse_i.h
 delete mode 100644 tools/virtiofsd/fuse_log.c
 delete mode 100644 tools/virtiofsd/fuse_log.h
 delete mode 100644 tools/virtiofsd/fuse_lowlevel.c
 delete mode 100644 tools/virtiofsd/fuse_lowlevel.h
 delete mode 100644 tools/virtiofsd/fuse_misc.h
 delete mode 100644 tools/virtiofsd/fuse_opt.c
 delete mode 100644 tools/virtiofsd/fuse_opt.h
 delete mode 100644 tools/virtiofsd/fuse_signals.c
 delete mode 100644 tools/virtiofsd/fuse_virtio.c
 delete mode 100644 tools/virtiofsd/fuse_virtio.h
 delete mode 100644 tools/virtiofsd/helper.c
 delete mode 100644 tools/virtiofsd/meson.build
 delete mode 100644 tools/virtiofsd/passthrough_helpers.h
 delete mode 100644 tools/virtiofsd/passthrough_ll.c
 delete mode 100644 tools/virtiofsd/passthrough_seccomp.c
 delete mode 100644 tools/virtiofsd/passthrough_seccomp.h


