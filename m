Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06986A8C2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 14:29:13 +0200 (CEST)
Received: from localhost ([::1]:48290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnMa0-0001KA-6r
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 08:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56888)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <thuth@redhat.com>) id 1hnMZb-0000V4-Si
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 08:28:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hnMZb-000308-0J
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 08:28:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39274)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hnMZZ-0002z5-0O; Tue, 16 Jul 2019 08:28:45 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3B792309174E;
 Tue, 16 Jul 2019 12:28:44 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05EE860C05;
 Tue, 16 Jul 2019 12:28:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Date: Tue, 16 Jul 2019 14:28:32 +0200
Message-Id: <20190716122836.31187-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 16 Jul 2019 12:28:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/4] Enable iotests during "make check"
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's enable the block iotests during "make check" again, to avoid that
they get broken so easily by accident (like we've seen many times in the
past).

v2:
 - Added new patch to allow tests without groups, removed the "o_direct"
   group again.
 - Removed some more tests from the "auto" group, like 197 and 215 which
   were sometimes causing the CI pipelines to fail on gitlab
 - Added a patch to remove the "duplicated" tests from the gitlab-ci.yml
   file.

Thomas Huth (4):
  tests/qemu-iotests/check: Allow tests without groups
  tests/qemu-iotests/group: Remove some more tests from the "auto" group
  tests: Run the iotests during "make check" again
  gitlab-ci: Remove qcow2 tests that are handled by "make check" already

 .gitlab-ci.yml              |  12 +---
 tests/Makefile.include      |   8 +--
 tests/check-block.sh        |  44 ++++++++++----
 tests/qemu-iotests-quick.sh |   8 ---
 tests/qemu-iotests/check    |   4 +-
 tests/qemu-iotests/group    | 114 ++++++++++++++++++------------------
 6 files changed, 101 insertions(+), 89 deletions(-)
 delete mode 100755 tests/qemu-iotests-quick.sh

--=20
2.21.0


