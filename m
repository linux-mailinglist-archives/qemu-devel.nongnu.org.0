Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FCB19E4E4
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Apr 2020 14:25:56 +0200 (CEST)
Received: from localhost ([::1]:38408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKhs3-0003Ru-HV
	for lists+qemu-devel@lfdr.de; Sat, 04 Apr 2020 08:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54321)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jKhqZ-00024p-HN
 for qemu-devel@nongnu.org; Sat, 04 Apr 2020 08:24:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jKhqY-00032j-B1
 for qemu-devel@nongnu.org; Sat, 04 Apr 2020 08:24:23 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53663
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jKhqY-00031g-46
 for qemu-devel@nongnu.org; Sat, 04 Apr 2020 08:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586003061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CstDN7UD5mVUe6ztScl6ZUiL72gXbxOkziUsVF398ZU=;
 b=epxry9IJU3tndcM2+/7O97ssh3cm+DRaXJHimCjZSd3qqgl/75sFEHKJ4bbpNgpzo4/mU9
 LJlkOaoLjPRXrsPB+OIiOFwgfu8M4sXRjaFM/Vt/SGwccEFUEcFjaIP1xhmdN9Zy1bSDUB
 twsT3P1hOGDxZqGj4LoNdxcIOE0S50Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-RdUL1NboMjWJ1onOCi5lAw-1; Sat, 04 Apr 2020 08:24:19 -0400
X-MC-Unique: RdUL1NboMjWJ1onOCi5lAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 279E918A8C80
 for <qemu-devel@nongnu.org>; Sat,  4 Apr 2020 12:24:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-152.ams2.redhat.com
 [10.36.112.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAF9760BF3
 for <qemu-devel@nongnu.org>; Sat,  4 Apr 2020 12:24:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5A0301138610; Sat,  4 Apr 2020 14:24:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Error reporting patches for 2020-04-04
Date: Sat,  4 Apr 2020 14:24:13 +0200
Message-Id: <20200404122416.1837-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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

The following changes since commit 146aa0f104bb3bf88e43c4082a0bfc4bbda4fbd8=
:

  Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' i=
nto staging (2020-04-03 15:30:11 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-error-2020-04-04

for you to fetch changes up to 6a4a38530e70f3917a58d71d4d08e28bd8146015:

  qga/commands-posix: fix use after free of local_err (2020-04-04 14:15:24 =
+0200)

----------------------------------------------------------------
Error reporting patches for 2020-04-04

----------------------------------------------------------------
Vladimir Sementsov-Ogievskiy (3):
      scripts/coccinelle: add error-use-after-free.cocci
      dump/win_dump: fix use after free of err
      qga/commands-posix: fix use after free of local_err

 scripts/coccinelle/error-use-after-free.cocci | 52 +++++++++++++++++++++++=
++++
 dump/win_dump.c                               |  4 +--
 qga/commands-posix.c                          |  3 ++
 MAINTAINERS                                   |  5 +++
 4 files changed, 61 insertions(+), 3 deletions(-)
 create mode 100644 scripts/coccinelle/error-use-after-free.cocci

--=20
2.21.1


