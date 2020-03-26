Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FE5194352
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 16:38:41 +0100 (CET)
Received: from localhost ([::1]:55544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHUae-0006zf-Bm
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 11:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54455)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jHUYn-0005Vl-5o
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 11:36:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jHUYk-0002rB-Jp
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 11:36:44 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:53253)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jHUYg-0002o1-Vo
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 11:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585236998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yBwS7f4qww1s93tPn3J5P+83hlcxr7JDlKJaH1dgrqE=;
 b=BgU/uOHBryOneT4iJDbF6pKxjmrQiXsjg7+P2M4FHaXrKd3YUQJpdlb85dIqbHl3YQPvo0
 j1kl97YTM+RkeIzXq6oYqQX2WMgfSdWD045s6k+JJcyym9cGl1686YsoMlLxLW+vx3+2tK
 ahs2u+UBYpBmQZtg1d7RmzaIBByyGQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-G4y7xfcuPbyvn54AE0j4Wg-1; Thu, 26 Mar 2020 11:36:36 -0400
X-MC-Unique: G4y7xfcuPbyvn54AE0j4Wg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CF44192D786;
 Thu, 26 Mar 2020 15:36:35 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-112-205.ams2.redhat.com
 [10.36.112.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0D925C1BA;
 Thu, 26 Mar 2020 15:36:33 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/2] mirror: Fix hang (operation waiting for
 itself/circular dependency)
Date: Thu, 26 Mar 2020 16:36:26 +0100
Message-Id: <20200326153628.4869-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

v2:
- Mark active mirror operations as in-flight, too

Kevin Wolf (2):
  Revert "mirror: Don't let an operation wait for itself"
  mirror: Wait only for in-flight operations

 block/mirror.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

--=20
2.20.1


