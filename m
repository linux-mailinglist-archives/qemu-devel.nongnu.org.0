Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC1D114C1A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 06:40:36 +0100 (CET)
Received: from localhost ([::1]:35852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1id6Lz-0004De-Oq
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 00:40:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43318)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1id6J4-0002FU-4z
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 00:37:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1id6J2-0005gk-3e
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 00:37:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47871
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1id6J1-0005g0-TE
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 00:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575610650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fl3E6rnCXiWuVVML0BycNp4NnS5LrtHxR/odXnW2yDs=;
 b=ebBjo4+HAXxWDootvooIAHV4iNX4azgp116XnsAcW3Lv/mP1hH8FUxAeNZwRlF5Ybhsgx/
 vIwcedqp2ewmfWJJhOCXZ4CAEZuSCUz3Fz10kngpRxUptsZ2JXRY0xm1ObVw/2fEjlecv7
 a2NGy15v+vRkA+eMoxx9D9IaRqdxK6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-qQhD_9OlPHSfYKl_-b5m-w-1; Fri, 06 Dec 2019 00:36:48 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8957DB2F
 for <qemu-devel@nongnu.org>; Fri,  6 Dec 2019 05:36:47 +0000 (UTC)
Received: from thuth.com (ovpn-116-97.ams2.redhat.com [10.36.116.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1F1260F88;
 Fri,  6 Dec 2019 05:36:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 0/2] net: Drop legacy "name" from -net and remove NetLegacy
Date: Fri,  6 Dec 2019 06:36:38 +0100
Message-Id: <20191206053640.29368-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: qQhD_9OlPHSfYKl_-b5m-w-1
X-Mimecast-Spam-Score: 0
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
Cc: libvir-list@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's time to remove the deprecated "name" parameter from -net.

Please have a closer look at the second patch ... I think it should be
fine, but I'm not 100% sure whether it's ok for all cases to drop NetLegacy=
,
so please double-check.

Thomas Huth (2):
  net: Drop the legacy "name" parameter from the -net option
  net: Drop the NetLegacy structure, always use Netdev instead

 net/net.c            | 84 +++++++-------------------------------------
 qapi/net.json        | 53 +---------------------------
 qemu-deprecated.texi | 12 ++++---
 3 files changed, 20 insertions(+), 129 deletions(-)

--=20
2.18.1


