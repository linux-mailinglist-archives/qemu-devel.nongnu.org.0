Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE4010AF0C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 12:54:15 +0100 (CET)
Received: from localhost ([::1]:37354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZvte-0008Vx-6X
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 06:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50294)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iZvrr-0007XN-5e
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 06:52:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iZvrm-0005Nu-Mv
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 06:52:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42802
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iZvrm-0005MZ-IT
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 06:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574855537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TWsThEf/9g19lBsNmTR6Wb8tex0uVcjXcS3yYFh3tX4=;
 b=UES2GL9XdANrOjDE9sNZLINjxjmHHRT5XZgUOu9/nxIha0nZZnha3tKpwhcfJmW1ejd/KP
 h6S7HdQ4Jf/mrnHp0IuvhvFPQLwP3ngnPNBkrZxfdY3blHtNn//GPnqjw/7j2+siLIPkFL
 Neh/ygkET1iZZr7wXp+/F0I4WsD1S1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-OlJb-37AM3SRIqK7K7B9Ng-1; Wed, 27 Nov 2019 06:52:14 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C50B580183D
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2019 11:52:13 +0000 (UTC)
Received: from localhost (ovpn-112-17.ams2.redhat.com [10.36.112.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03E95608EB;
 Wed, 27 Nov 2019 11:52:06 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] console: screendump improvements
Date: Wed, 27 Nov 2019 15:51:55 +0400
Message-Id: <20191127115202.375107-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: OlJb-37AM3SRIqK7K7B9Ng-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The following patches have been extracted from the "[PATCH v6 00/25]
monitor: add asynchronous command type", as they are
reviewable/mergeable independantly.

They introduce some internal API changes, and fix
qemu_open()/qemu_close()/unlink() misusages which should be quite
harmless.

Marc-Andr=C3=A9 Lureau (7):
  console: add graphic_hw_update_done()
  ppm-save: pass opened fd
  ui: add pixman image g_autoptr support
  object: add g_autoptr support
  screendump: replace FILE with QIOChannel and fix close()/qemu_close()
  osdep: add qemu_unlink()
  screendump: use qemu_unlink()

 hw/display/qxl-render.c  |  9 +++--
 hw/display/qxl.c         |  1 +
 include/qemu/osdep.h     |  1 +
 include/qom/object.h     |  3 ++
 include/ui/console.h     |  2 ++
 include/ui/qemu-pixman.h |  2 ++
 ui/console.c             | 74 +++++++++++++++++++++-------------------
 ui/trace-events          |  2 +-
 util/osdep.c             | 15 ++++++++
 9 files changed, 71 insertions(+), 38 deletions(-)

--=20
2.24.0


