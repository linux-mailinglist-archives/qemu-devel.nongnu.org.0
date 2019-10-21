Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6413DEA33
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 12:58:28 +0200 (CEST)
Received: from localhost ([::1]:37768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMVON-00017D-G0
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 06:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iMVKI-0004CS-4M
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:54:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iMVKF-0001hQ-UZ
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:54:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39399
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iMVKD-0001eR-Pc
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571655246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ly/ObAo/UBICmtrRzxmppLk/tP83k8DnQ0dZ67PlFdY=;
 b=EJmeBchQjiwmTCGbwuB98MelkdWouebC8/oo9xEb13On5K8mvuCjT8L4JOVeLY4dbXtnBc
 cxTJ5Z+HZuiZHDmZefM52Mq0DEcOFpBzk2cqM3rNvkti9hDJ2dGDj7pLWbBBZmehSnYYOP
 NXOCY/w1lhaKud6E6fNbKhIWfPEWCP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-x-aJkiDvOjOEW7y4mk1plg-1; Mon, 21 Oct 2019 06:54:02 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B030A80183E;
 Mon, 21 Oct 2019 10:54:01 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51E0F60BE2;
 Mon, 21 Oct 2019 10:53:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org
Subject: [PATCH v2 0/6] Enable more iotests during "make check-block"
Date: Mon, 21 Oct 2019 12:53:44 +0200
Message-Id: <20191021105350.1710-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: x-aJkiDvOjOEW7y4mk1plg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As discussed here:

 https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg00697.html

and here:

 https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg01388.html

it would be good to have some more valuable iotests enabled in the
"auto" group to get better iotest coverage during "make check".

And once Max' "iotests: Add and use $SOCK_DIR" patch series has been
merged, we can indeed enable these Python-based tests, too.

There is just one small downside: Since these tests require a QEMU
that features a 'virtio-blk' device, we cannot run the iotests
with binaries like qemu-system-tricore anymore. But since the iotests
were not very useful with such binaries anyway, I think it's ok now
if we skip them there.

I've also added a patch that removes test 130 from the "auto" group
instead. Test 130 has been reported to fail intermittently, so we
should not use it in "make check" block until it is fixed.

Based-on: 20191010152457.17713-1-mreitz@redhat.com

v2:
 - Checked the iotests with NetBSD, too (now that Eduardo has
   re-activated Gerd's patches for creating NetBSD VM images)
 - Use 'openbsd' instead of 'openbsd6'
 - Use 'grep -q' instead of 'grep' for grep'ing silently
 - Added the patch to disable 130 from the "auto" group

John Snow (1):
  iotests: remove 'linux' from default supported platforms

Thomas Huth (5):
  iotests: Test 041 only works on certain systems
  iotests: Test 183 does not work on macOS and OpenBSD
  iotests: Skip "make check-block" if QEMU does not support virtio-blk
  iotests: Enable more tests in the 'auto' group to improve test
    coverage
  iotests: Remove 130 from the "auto" group

 tests/check-block.sh          | 16 +++++++++++++++-
 tests/qemu-iotests/041        |  3 ++-
 tests/qemu-iotests/183        |  1 +
 tests/qemu-iotests/group      | 20 ++++++++++----------
 tests/qemu-iotests/iotests.py | 16 +++++++++++-----
 5 files changed, 39 insertions(+), 17 deletions(-)

--=20
2.18.1


