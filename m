Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B20135CFC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 16:42:21 +0100 (CET)
Received: from localhost ([::1]:34392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipZwx-0008Hf-RI
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 10:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32777)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ipZue-0006NA-5o
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 10:40:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ipZud-0001w8-1r
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 10:39:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26360
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ipZuc-0001tW-5d
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 10:39:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578584393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=X09PFeK12++bcRbpMaVjU50CDKU6kYPNQcQaQtkqakM=;
 b=JEDELNiaCLjPvcsPbNg+ezH4iZ9SlG6jH5eU6h+AaQFeGyNVX49WX+x+Mj1V7dGL23hWl0
 jMGeS0QV9/wTYIN7JzdbuF0C3jv6FAekGCZi4HB9nrLBRxrsob0R7y0YA9dv6dVhQWU12s
 t2Y9TOt7s9dPGgjACVDTIXIuHPd77ko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-vVaEUZE4Mk6Vj0vZehnAag-1; Thu, 09 Jan 2020 10:39:49 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90ADA108141A;
 Thu,  9 Jan 2020 15:39:48 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-180.brq.redhat.com [10.40.204.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21A0886CA5;
 Thu,  9 Jan 2020 15:39:42 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] buildsys: Build quicker (mostly tools and linux-user)
Date: Thu,  9 Jan 2020 16:39:35 +0100
Message-Id: <20200109153939.27173-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: vVaEUZE4Mk6Vj0vZehnAag-1
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In some configuration (linux-user, tools) we can ignore building
various objects (and the libfdt).

Philippe Mathieu-Daud=C3=A9 (4):
  configure: Do not build libfdt is not required
  Makefile: Clarify all the codebase requires qom/ objects
  Makefile: Restrict system emulation and tools objects
  Makefile: Remove unhelpful comment

 configure     |  2 ++
 Makefile.objs | 31 ++++++++++---------------------
 2 files changed, 12 insertions(+), 21 deletions(-)

--=20
2.21.1


