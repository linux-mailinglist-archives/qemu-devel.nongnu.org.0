Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B6419FB27
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 19:16:03 +0200 (CEST)
Received: from localhost ([::1]:35450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLVLu-0000XP-0L
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 13:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57463)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jLVKj-0007zp-8s
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:14:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jLVKh-0007pP-PY
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:14:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44262
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jLVKh-0007p8-KI
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586193286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SUVDMuFQiiSGFXqV9zaSm1sQr72YJNjY2dkuiIDGQkY=;
 b=WF3JdeaMRiGTkrZi08q6H52An5Bnpgzbk6JoxFB1jxwek5nVcfhwLsROlTmbboSXo1lQ/W
 MznLpRhw3SoimCYLgWiOsOQ/+nO0PMUmMbQgq3JG/dOs50yQefmSwAS8ud42Dzyy5gSvdS
 1FofU3cJZF416KJHw4DRNuhQwTxOsWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-epxbA7niM36rgs2GbJNfzg-1; Mon, 06 Apr 2020 13:14:44 -0400
X-MC-Unique: epxbA7niM36rgs2GbJNfzg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3568D10832C6;
 Mon,  6 Apr 2020 17:14:09 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-74.ams2.redhat.com [10.36.113.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2450D121F35;
 Mon,  6 Apr 2020 17:14:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-5.0 v2 0/3] block: Fix blk->in_flight during
 blk_wait_while_drained()
Date: Mon,  6 Apr 2020 19:14:00 +0200
Message-Id: <20200406171403.6761-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, s.reiter@proxmox.com,
 qemu-devel@nongnu.org, dietmar@proxmox.com, stefanha@redhat.com,
 mreitz@redhat.com, t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes deadlocks when draining a BlockBackend in an iothread that
receives new requests at the same time.

v2:
- Rework the whole thing so that direct callers of blk_co_*() aren't
  broken after the series [Max]

Kevin Wolf (3):
  block-backend: Reorder flush/pdiscard function definitions
  block: Increase BB.in_flight for coroutine interfaces
  block: Fix blk->in_flight during blk_wait_while_drained()

 include/sysemu/block-backend.h |   1 -
 block/block-backend.c          | 199 +++++++++++++++++++++------------
 2 files changed, 125 insertions(+), 75 deletions(-)

--=20
2.20.1


