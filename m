Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D22192F20
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 18:24:48 +0100 (CET)
Received: from localhost ([::1]:39998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH9ln-0008MN-2r
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 13:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jH9kl-0006wa-D2
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 13:23:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jH9kk-0002lB-DA
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 13:23:43 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:24158)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jH9kk-0002ji-A6
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 13:23:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585157020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A8S56yDveqfJ5g4M30HnVdlrJvqHqKg9MMG4JjEtMuI=;
 b=T9Q5kmFdNOlaDFUrZLinH6YGLFVla5XWicFqWhskNe1MF4yGe25jrr9RWLRww//kd8Kgkr
 rvL0PZSqMt3HtetaSpmBSMiWQk9sJDqRxFbUkMqdeIg7hZJbiewL5Of2LXU7DDdMQyPsTO
 7mFUYg6vwftAA9MOmGLmT1BRzteGHco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-Gq0z95tYMmun8VEX13S2sg-1; Wed, 25 Mar 2020 13:23:37 -0400
X-MC-Unique: Gq0z95tYMmun8VEX13S2sg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12E028010EB;
 Wed, 25 Mar 2020 17:23:36 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-184.ams2.redhat.com
 [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB7796266E;
 Wed, 25 Mar 2020 17:23:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] mirror: Fix hang (operation waiting for itself/circular
 dependency)
Date: Wed, 25 Mar 2020 18:23:24 +0100
Message-Id: <20200325172326.22347-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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

The recent fix didn't actually fix the whole problem. Operations can't
only wait for themselves, but we can also end up with circular
dependencies like two operations waiting for each other to complete.

This reverts the first fix and implements another approach.

Kevin Wolf (2):
  Revert "mirror: Don't let an operation wait for itself"
  mirror: Wait only for in-flight operations

 block/mirror.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

--=20
2.20.1


