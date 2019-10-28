Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A88E7205
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 13:45:23 +0100 (CET)
Received: from localhost ([::1]:53336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP4Of-0006Mi-Q7
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 08:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50406)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iP3wS-0002FB-9r
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:16:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iP3wQ-0001gH-4K
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:16:12 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34105
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iP3wP-0001fe-Am
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572264968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aQySpcdMF2qRUs1pIR4JbiwZcLMvjua8tE1iMlsuzl4=;
 b=CTvF7mg5MUdKEe+gTlIWjbiaQHq68qyZDTS1S61UelmQIR7cykLJEy5s/soynWjoBaiG9e
 N3pJUZommYfoW2VhoaAi9XPmgwBOzooD5Eso1HKQTDG/5PgH5izHq1BeHEdmupvj+tYyU7
 hFg6JvrdKNnBELcfqQuC3aW8KYZTQ3E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-c7-SvNFNNCG3_RNQZyFR1g-1; Mon, 28 Oct 2019 08:16:04 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 807DD80183E;
 Mon, 28 Oct 2019 12:16:03 +0000 (UTC)
Received: from localhost (ovpn-117-83.ams2.redhat.com [10.36.117.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 248705DA32;
 Mon, 28 Oct 2019 12:16:02 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 29/69] iotests/208: Create socket in $SOCK_DIR
Date: Mon, 28 Oct 2019 13:14:21 +0100
Message-Id: <20191028121501.15279-30-mreitz@redhat.com>
In-Reply-To: <20191028121501.15279-1-mreitz@redhat.com>
References: <20191028121501.15279-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: c7-SvNFNNCG3_RNQZyFR1g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20191017133155.5327-18-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/208 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/208 b/tests/qemu-iotests/208
index 1e202388dc..546eb1de3e 100755
--- a/tests/qemu-iotests/208
+++ b/tests/qemu-iotests/208
@@ -26,7 +26,7 @@ iotests.verify_image_format(supported_fmts=3D['generic'])
=20
 with iotests.FilePath('disk.img') as disk_img_path, \
      iotests.FilePath('disk-snapshot.img') as disk_snapshot_img_path, \
-     iotests.FilePath('nbd.sock') as nbd_sock_path, \
+     iotests.FilePath('nbd.sock', iotests.sock_dir) as nbd_sock_path, \
      iotests.VM() as vm:
=20
     img_size =3D '10M'
--=20
2.21.0


