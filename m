Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A779119D532
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 12:45:37 +0200 (CEST)
Received: from localhost ([::1]:53460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKJpQ-0004vI-AV
	for lists+qemu-devel@lfdr.de; Fri, 03 Apr 2020 06:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39532)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jKJoO-0003xL-9X
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 06:44:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jKJoN-0006RQ-0k
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 06:44:31 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25693
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jKJoM-0006Qc-QL
 for qemu-devel@nongnu.org; Fri, 03 Apr 2020 06:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585910669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xDXAfKM3DHuG2CkfDq4VvfiF/EUxbwFMnuQDv6Z0Svg=;
 b=R8xVYuzNUCAJezGuLmXUgb/zpBojG4/RL/StrfkWnk6cEWfbcYnLcBzbhbx8vP14Nj7/+3
 jKm/qKfL3eMJW7oXSMVpDQEW7byf4iIEe/IcUvYqKN8HWRNEm8EkXwXSMrQvkKyurDFtUz
 5jnG+w0dmXJ4p8UkPL1nPtnN0OGuYyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-BDBFaz02OmWyct4-WcfCqg-1; Fri, 03 Apr 2020 06:44:28 -0400
X-MC-Unique: BDBFaz02OmWyct4-WcfCqg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A596CDB22;
 Fri,  3 Apr 2020 10:44:26 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-132.ams2.redhat.com
 [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDF2A8EA1A;
 Fri,  3 Apr 2020 10:44:21 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-5.0 0/2] block: Fix blk->in_flight during
 blk_wait_while_drained()
Date: Fri,  3 Apr 2020 12:44:13 +0200
Message-Id: <20200403104415.20963-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, s.reiter@proxmox.com,
 qemu-devel@nongnu.org, dietmar@proxmox.com, stefanha@redhat.com,
 mreitz@redhat.com, t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes deadlocks when draining a BlockBackend in an iothread that
receives new requests at the same time.

Kevin Wolf (2):
  block: Don't blk_wait_while_drained() in blk_co_preadv/pwritev
  block: Fix blk->in_flight during blk_wait_while_drained()

 block/block-backend.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

--=20
2.20.1


