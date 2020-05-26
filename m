Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474531ACA70
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 17:35:39 +0200 (CEST)
Received: from localhost ([::1]:36046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP6YE-0002cu-C4
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 11:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50784)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jP6X1-0001PQ-A9
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 11:34:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jP6Wz-0000uG-ST
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 11:34:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60280
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jP6Wz-0000tf-K3
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 11:34:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587051260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ixhG1qFaHQ4qkzX1XDyWnP4H20PpptBHaAIxy5t5BEw=;
 b=CG39frawLGUXg89Hi8H6SOwcW90475NiPU6zpSvlk58EuUV2r2O1eiydVxK6MeN+E5hQzW
 2UVfe+ec+olGGBdtMPe842qZsYHfV8t2GMuHmsTERJfCaupTTCNWtx+J7+hYS6ZwbAeTBY
 /ie2AeVFIJvgdJ/K8Tb7R0rPHk5Ez0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-UOwR2DxXOfWRQv552KaLOw-1; Thu, 16 Apr 2020 11:34:18 -0400
X-MC-Unique: UOwR2DxXOfWRQv552KaLOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57BF48024D3;
 Thu, 16 Apr 2020 15:34:15 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-109.ams2.redhat.com
 [10.36.113.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6180F28D02;
 Thu, 16 Apr 2020 15:34:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] qemu-storage-daemon: Fix non-string --object properties
Date: Thu, 16 Apr 2020 17:34:02 +0200
Message-Id: <20200416153404.15389-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 coiby.xu@gmail.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf (2):
  qom: Factor out user_creatable_add_dict()
  qemu-storage-daemon: Fix non-string --object properties

 include/qom/object_interfaces.h | 16 ++++++++++++++++
 qemu-storage-daemon.c           |  4 +---
 qom/object_interfaces.c         | 31 +++++++++++++++++++++++++++++++
 qom/qom-qmp-cmds.c              | 24 +-----------------------
 4 files changed, 49 insertions(+), 26 deletions(-)

--=20
2.20.1


