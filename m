Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B961714A8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 11:05:15 +0100 (CET)
Received: from localhost ([::1]:56420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7G2c-0003ZJ-Sx
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 05:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35368)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7G0Z-0001gB-Pr
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:03:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7G0W-0002aL-RS
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:03:07 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36525
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7G0W-0002Zp-NO
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 05:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582797784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7uPfE4iEFnYWU7lgYjg6n8W9+J+9kIh7GVAn+snpbUk=;
 b=JsFyiIy9Jvmwg6OjpgtWRIUrTw8JznVxd5Qit4iBCWSmPPFrBNO6L8A/lrEjkvhE29tAXu
 x1vG5LkoglgiAW2a7GTps0Lc2Yzt7IaUUbXvuBY2p+QHCft06Qjd5nqKDypf5DX+wHEYQ0
 Tr45ly65ABJ1Duwyefp6Q496wpZfrMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-DwZLYB3XOpy2NU3Ttzz2RQ-1; Thu, 27 Feb 2020 05:02:59 -0500
X-MC-Unique: DwZLYB3XOpy2NU3Ttzz2RQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D042213FC;
 Thu, 27 Feb 2020 10:02:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-195.brq.redhat.com [10.40.205.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E098B8C091;
 Thu, 27 Feb 2020 10:02:52 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] misc: Improve error reporting on Windows
Date: Thu, 27 Feb 2020 11:02:48 +0100
Message-Id: <20200227100250.20514-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>, qemu-trivial@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Two patches to improve bug reports on Windows.
(i.e. https://bugs.launchpad.net/qemu/+bug/1657841)

Philippe Mathieu-Daud=C3=A9 (2):
  chardev: Improve error report by calling error_setg_win32()
  util/oslib-win32: Improve error report by calling error_setg_win32()

 chardev/char-pipe.c | 2 +-
 chardev/char-win.c  | 2 +-
 util/oslib-win32.c  | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

--=20
2.21.1


