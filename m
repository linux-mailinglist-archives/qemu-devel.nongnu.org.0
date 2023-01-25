Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C66F67A8D3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 03:36:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKVco-0008HG-PM; Tue, 24 Jan 2023 21:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pKVcl-0008Da-Di
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 21:34:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pKVci-0005LA-6d
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 21:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674614090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=irZ6mDpu78U+KOrLuGEXLqvcmInnzcsUKLm35lmUizk=;
 b=VD4kVQjOC69yAgmG8hfs6P8J0KowFTbk+mPPBhFfAivzyWYWReOUfwcSpqhpqyxAo6MZBN
 b20XN0OA5gFn65mqof1nBCou+a40/2biGztYPna1Xc4NUGBVzBnUbKjN1beK1GuShNBuwg
 8VzZ03/8yaCXX7O59DnUTXcxMrLkVUQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-gPeCo1WFN6yHK-07uVofgw-1; Tue, 24 Jan 2023 21:34:47 -0500
X-MC-Unique: gPeCo1WFN6yHK-07uVofgw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7BD21869A74;
 Wed, 25 Jan 2023 02:34:46 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA1CC2026D4B;
 Wed, 25 Jan 2023 02:34:45 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PULL 0/7] Python patches
Date: Tue, 24 Jan 2023 21:34:38 -0500
Message-Id: <20230125023445.3655253-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a=
:=0D
=0D
  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into s=
taging (2023-01-24 09:45:33 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to bd4c0ef409140bd1be393407c04005ac077d4574:=0D
=0D
  python/qemu/machine: use socketpair() for QMP by default (2023-01-24 13:3=
7:13 -0500)=0D
=0D
----------------------------------------------------------------=0D
Python=0D
=0D
Bits and pieces, kibbles'n'bits=0D
=0D
----------------------------------------------------------------=0D
=0D
Dongdong Zhang (1):=0D
  Fix some typos=0D
=0D
Maksim Davydov (1):=0D
  python/qmp: increase read buffer size=0D
=0D
Marc-Andr=C3=A9 Lureau (3):=0D
  python/qmp/protocol: add open_with_socket()=0D
  python/qmp/legacy: make QEMUMonitorProtocol accept a socket=0D
  python/qemu/machine: use socketpair() for QMP by default=0D
=0D
Peter Delevoryas (1):=0D
  python/machine: Fix AF_UNIX path too long on macOS=0D
=0D
Vladimir Sementsov-Ogievskiy (1):=0D
  python: QEMUMachine: enable qmp accept timeout by default=0D
=0D
 python/qemu/machine/console_socket.py  |  2 +-=0D
 python/qemu/machine/machine.py         | 31 +++++++++++++++++---------=0D
 python/qemu/machine/qtest.py           |  2 +-=0D
 python/qemu/qmp/legacy.py              | 18 ++++++++++++---=0D
 python/qemu/qmp/protocol.py            | 27 +++++++++++++++++-----=0D
 python/qemu/qmp/qmp_client.py          |  4 ++--=0D
 python/qemu/qmp/qmp_tui.py             |  6 ++---=0D
 tests/avocado/avocado_qemu/__init__.py |  2 +-=0D
 8 files changed, 64 insertions(+), 28 deletions(-)=0D
=0D
-- =0D
2.39.0=0D
=0D


