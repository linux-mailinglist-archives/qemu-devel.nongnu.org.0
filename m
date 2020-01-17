Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC4214088E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 12:00:24 +0100 (CET)
Received: from localhost ([::1]:55324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isPMU-0001XS-12
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 06:00:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59101)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1isPLI-0000Ms-Ak
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:59:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1isPLG-00069a-V8
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:59:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32048
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1isPLG-00069F-SJ
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 05:59:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579258746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=it7s6uKwgpaitb9rzfDC65waPTJivSUvHQUDyk3VCD4=;
 b=GSAiwyiIoPDZuuWz6ZkEfXA6lfHltwlGfHFMeHy8W2wdS1FrrHFCHmOrlZlBzCzu56C8C9
 dW+2AZxx/Ld6LfpHOQSZGsweVSNrPEEzjCgdbxpuimsvqOU2WOrXYy1gtOj8/DBiJQUME+
 SMT/zA8fjhlWzePE/nEPfj9gVgYSfzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-Z1_0N6KLMbeK6X_Saf7aXA-1; Fri, 17 Jan 2020 05:59:03 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D0B618CA26D;
 Fri, 17 Jan 2020 10:59:02 +0000 (UTC)
Received: from localhost (ovpn-117-75.ams2.redhat.com [10.36.117.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95D4626FC4;
 Fri, 17 Jan 2020 10:59:01 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] block: Fix VM size field width in snapshot dump
Date: Fri, 17 Jan 2020 11:58:57 +0100
Message-Id: <20200117105859.241818-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Z1_0N6KLMbeK6X_Saf7aXA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

https://bugs.launchpad.net/qemu/+bug/1859989 reports that fields in
"qemu-img snapshot -l"s output are not always separated by spaces in
4.1.1.  Fix that.


Branch: https://github.com/XanClic/qemu.git lp-1859989-v1
Branch: https://git.xanclic.moe/XanClic/qemu.git lp-1859989-v1


Max Reitz (2):
  block: Fix VM size field width in snapshot dump
  iotests: Test snapshot -l field separation

 block/qapi.c               |  4 +-
 tests/qemu-iotests/284     | 76 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/284.out |  8 ++++
 tests/qemu-iotests/group   |  1 +
 4 files changed, 87 insertions(+), 2 deletions(-)
 create mode 100755 tests/qemu-iotests/284
 create mode 100644 tests/qemu-iotests/284.out

--=20
2.24.1


