Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1487A16B964
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 07:01:20 +0100 (CET)
Received: from localhost ([::1]:49368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6THT-0004B8-4C
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 01:01:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33430)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1j6TFk-0003IX-5s
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 00:59:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1j6TFi-000087-Uz
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 00:59:31 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45401
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1j6TFi-00007I-QF
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 00:59:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582610369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XhuronV0GXFsGeqvo1Mo0T66P0pNIA6yKLXkJo/kWGA=;
 b=KZTsoiPConBRcGibKWqqmgnA+z368RZ6whBTVmCZnAPTmdhWWGaKfRRS4rvyf9o13vcFnR
 5wTOeQDgmJle4c3vjAYD0cnlkrxLkfPIDnUOhn0S0O/240sTQ9J4stzoWGj7LGSgP+okl4
 UPgiKJn1CZLGDUf2IOaSfCgYvCv868Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284--GhtoubgNO6aLjs3aG4KMQ-1; Tue, 25 Feb 2020 00:59:27 -0500
X-MC-Unique: -GhtoubgNO6aLjs3aG4KMQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D00F5107ACC5;
 Tue, 25 Feb 2020 05:59:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-87.ams2.redhat.com
 [10.36.116.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C3FD8ED01;
 Tue, 25 Feb 2020 05:59:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7D0981747F; Tue, 25 Feb 2020 06:59:20 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] qxl: map rom r/o, remove shadow.
Date: Tue, 25 Feb 2020 06:59:18 +0100
Message-Id: <20200225055920.17261-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: sstabellini@kernel.org, pmatouse@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, mdroth@linux.vnet.ibm.com,
 ppandit@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Gerd Hoffmann (2):
  qxl: map rom r/o
  qxl: drop shadow_rom

 hw/display/qxl.h |  2 +-
 hw/display/qxl.c | 27 ++++++++++-----------------
 2 files changed, 11 insertions(+), 18 deletions(-)

--=20
2.18.2


