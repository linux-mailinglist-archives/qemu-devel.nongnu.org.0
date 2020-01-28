Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A1114BCB3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 16:19:54 +0100 (CET)
Received: from localhost ([::1]:60456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwSef-0005u9-CJ
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 10:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33368)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iwSdQ-0004cM-P7
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 10:18:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iwSdP-0003mZ-Sl
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 10:18:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34445
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iwSdP-0003mM-PD
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 10:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580224715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/6xCCzfxq0XUHEsKbTqyZZthlzVfX0coN5EbOiQswas=;
 b=N1v/c8P2C/akDlSJsmu9HxSiO0XO+In+tnxWy1LsKXzzgtBFRJ+R331Vr0fpAt/m63bxa9
 5R/yPwMcjoSnvzZSgJt8mGgmeYyELOoXFJzVyk1vHl/lAvwaO1pcY/QoolBj4wFoufe+3i
 crV+tBI2fsBVTvhimm4DtB90Pf9XsTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-zCCdvrCnMeew5h-cGDViBg-1; Tue, 28 Jan 2020 10:18:14 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15AE5801E70;
 Tue, 28 Jan 2020 15:18:12 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-106.ams2.redhat.com
 [10.36.117.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DB638E9F8;
 Tue, 28 Jan 2020 15:18:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] mirror: Fix hang (operation waiting for itself)
Date: Tue, 28 Jan 2020 16:17:53 +0100
Message-Id: <20200128151755.25162-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: zCCdvrCnMeew5h-cGDViBg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf (2):
  mirror: Store MirrorOp.co for debuggability
  mirror: Don't let an operation wait for itself

 block/mirror.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

--=20
2.20.1


