Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832F3184D37
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 18:06:57 +0100 (CET)
Received: from localhost ([::1]:34148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCnlw-0001MF-JG
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 13:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35051)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jCnkT-0008GB-D7
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 13:05:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jCnkR-0006SO-Vl
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 13:05:24 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35254
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jCnkR-0006PQ-Og
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 13:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584119122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uVOb/spz+MMBSJGvzwf3QNtSw4L/HTWH/LLS9nF88iU=;
 b=SQZ07zX6Rqc10H/tQ5HvavIap6ScgPwklvFgo//2szSDlCVXJUyPHVf4+SS7CEw5OH8jKt
 hWC9HGo7UAvw0zSP+zOri3H7w3kzGCAEtaQivcdc6uiTMotlOnjk3PgWoyJRjmkB2maaWv
 mVt3sRDl9DVrbtg+fNraP/5+oHT+7MA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-dS8oFyoAOYiH_SOTa_M7lw-1; Fri, 13 Mar 2020 13:05:21 -0400
X-MC-Unique: dS8oFyoAOYiH_SOTa_M7lw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B63058024DC;
 Fri, 13 Mar 2020 17:05:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-34.ams2.redhat.com
 [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F8058FBF3;
 Fri, 13 Mar 2020 17:05:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C20F711386A6; Fri, 13 Mar 2020 18:05:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Minor error handling cleanups
Date: Fri, 13 Mar 2020 18:05:14 +0100
Message-Id: <20200313170517.22480-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: alxndr@bu.edu, vsementsov@virtuozzo.com, ashijeetacharya@gmail.com,
 qemu-block@nongnu.org, paul.durrant@citrix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster (3):
  Use &error_abort instead of separate assert()
  hw/misc/ivshmem: Use one Error * variable instead of two
  xen-block: Use one Error * variable instead of two

 block/monitor/block-hmp-cmds.c | 4 +---
 hw/block/xen-block.c           | 5 +----
 hw/misc/ivshmem.c              | 7 +++----
 target/arm/monitor.c           | 8 ++------
 tests/qtest/fuzz/qos_fuzz.c    | 6 ++----
 5 files changed, 9 insertions(+), 21 deletions(-)

--=20
2.21.1


