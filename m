Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC0B25C532
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 17:24:07 +0200 (CEST)
Received: from localhost ([::1]:42040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDr5q-0001WU-38
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 11:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kDr4B-00089S-8H
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 11:22:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kDr47-0007yR-Up
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 11:22:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599146538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rgFR/slVNRf9dJyj5eonJUZShFgNWkxmMR7P1e/wpcA=;
 b=QQ31iz4PnEqg7rrzbhmpmKrNPtmOEM7qHEpK3BxLXfSOcxIQ8+ojktOcJO81cHGvq3C8AF
 aISfIEYYEll4fqOPauigtV6x95zzzp6WjjvcVkxdCxA/gRW4gDS7TuCVYsxIgMG+U2WYiF
 CWwq7hymagO55xy989Yzyh2PzstU3YI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-2sYt2AO-O6uMwT3yYQGiZg-1; Thu, 03 Sep 2020 11:22:14 -0400
X-MC-Unique: 2sYt2AO-O6uMwT3yYQGiZg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A73A3805EF2;
 Thu,  3 Sep 2020 15:22:13 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AA782D07D;
 Thu,  3 Sep 2020 15:22:11 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/8] block: improve error reporting for unsupported O_DIRECT
Date: Thu,  3 Sep 2020 16:22:02 +0100
Message-Id: <20200903152210.1917355-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:47:17
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1: https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg00269.html=0D
v2: https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg00589.html=0D
v3: https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg07098.html=0D
v4: https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg05334.html=0D
v5: https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg00947.html=0D
=0D
See patch commit messages for rationale=0D
=0D
Ideally we would convert other callers of qemu_open_old to use=0D
qemu_open, and eventually remove qemu_open_old entirely, so every=0D
caller gets use of Error **errp.=0D
=0D
Improved in v6:=0D
=0D
 - Fix errno regression dup'ing FD=0D
 - Move qapi header to correct patch=0D
 - Fix whitespace and commit messages=0D
 - Converted more use of qemu_open to qemu_open_old after rebase=0D
=0D
Improved in v5:=0D
=0D
 - Drop reporting of flags in failed open call=0D
 - Split O_CLOEXEC handling off into separate helper=0D
 - Refactor monitor FD set APIs to simplify their use=0D
=0D
Improved in v4:=0D
=0D
 - Use assert() for programmer mistakes=0D
 - Split second patch into three distinct parts=0D
 - Misc typos=0D
 - Improve commit message=0D
=0D
Improved in v3:=0D
=0D
 - Re-arrange the patches series, so that the conversion to Error=0D
   takes place first, then the improve O_DIRECT reporting=0D
 - Rename existing method to qemu_open_old=0D
 - Use a pair of new methods qemu_open + qemu_create to improve=0D
   arg checking=0D
=0D
Improved in v2:=0D
=0D
 - Mention that qemu_open_err is preferred over qemu_open=0D
 - Get rid of obsolete error_report call=0D
 - Simplify O_DIRECT handling=0D
 - Fixup iotests for changed error message text=0D
=0D
Daniel P. Berrang=C3=A9 (8):=0D
  monitor: simplify functions for getting a dup'd fdset entry=0D
  util: split off a helper for dealing with O_CLOEXEC flag=0D
  util: rename qemu_open() to qemu_open_old()=0D
  util: refactor qemu_open_old to split off variadic args handling=0D
  util: add Error object for qemu_open_internal error reporting=0D
  util: introduce qemu_open and qemu_create with error reporting=0D
  util: give a specific error message when O_DIRECT doesn't work=0D
  block/file: switch to use qemu_open/qemu_create for improved errors=0D
=0D
 accel/kvm/kvm-all.c            |   2 +-=0D
 backends/rng-random.c          |   2 +-=0D
 backends/tpm/tpm_passthrough.c |   8 +--=0D
 block/file-posix.c             |  16 ++---=0D
 block/file-win32.c             |   5 +-=0D
 block/vvfat.c                  |   5 +-=0D
 chardev/char-fd.c              |   2 +-=0D
 chardev/char-pipe.c            |   6 +-=0D
 chardev/char.c                 |   2 +-=0D
 dump/dump.c                    |   2 +-=0D
 hw/s390x/s390-skeys.c          |   2 +-=0D
 hw/usb/host-libusb.c           |   2 +-=0D
 hw/usb/u2f-passthru.c          |   4 +-=0D
 hw/vfio/common.c               |   4 +-=0D
 include/monitor/monitor.h      |   3 +-=0D
 include/qemu/osdep.h           |   9 ++-=0D
 io/channel-file.c              |   2 +-=0D
 monitor/misc.c                 |  58 ++++++++----------=0D
 net/vhost-vdpa.c               |   2 +-=0D
 os-posix.c                     |   2 +-=0D
 qga/channel-posix.c            |   4 +-=0D
 qga/commands-posix.c           |   6 +-=0D
 stubs/fdset.c                  |   8 +--=0D
 target/arm/kvm.c               |   2 +-=0D
 ui/console.c                   |   2 +-=0D
 util/osdep.c                   | 104 +++++++++++++++++++++++----------=0D
 util/oslib-posix.c             |   2 +-=0D
 27 files changed, 150 insertions(+), 116 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


