Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C421F134458
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 14:55:51 +0100 (CET)
Received: from localhost ([::1]:44298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipBoM-00036I-Pw
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 08:55:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54004)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ipBme-00016x-0k
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 08:54:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ipBmc-0002e1-Oy
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 08:54:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50505
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ipBmc-0002dH-LI
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 08:54:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578491641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j/FBanFcuRghguM7TaIIcfYmNVj78XEbSupccIm4XKU=;
 b=NmjHLES37cvGifbneeBEKrNNzjjsF7sQfEUAJXebIMtOfQHlXJflmytJsteQS7KcSX+DKm
 ijv3r7s/TViQtUN2xn60mbigJ06vk/jtpqie2/42LVx9dY6F7B2i69NwUX0t81ciVJu7rZ
 mgICQNk9+dbHxBIQXPM46j1NlaODchc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-mArqYGCIOkSt8eEdXwtB2A-1; Wed, 08 Jan 2020 08:54:00 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C0301005502
 for <qemu-devel@nongnu.org>; Wed,  8 Jan 2020 13:53:59 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60B4710013A7;
 Wed,  8 Jan 2020 13:53:55 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vkuznets@redhat.com, mst@redhat.com,
 jasowang@redhat.com
Subject: [PATCH 0/2] exclude hyperv synic sections from vhost
Date: Wed,  8 Jan 2020 13:53:51 +0000
Message-Id: <20200108135353.75471-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: mArqYGCIOkSt8eEdXwtB2A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Hyperv's synic (that we emulate) is a feature that allows the guest
to place some magic (4k) pages of RAM anywhere it likes in GPA.
This confuses vhost's RAM section merging when these pages
land over the top of hugepages.

Since they're not normal RAM, and they shouldn't have vhost DMAing
into them, exclude them from the vhost set.

I do that by marking them as device-ram and then excluding device-ram
from vhost.

bz: https://bugzilla.redhat.com/show_bug.cgi?id=3D1779041

Dr. David Alan Gilbert (2):
  vhost: Don't pass ram device sections
  hyperv/synic: Allocate as ram_device

 hw/hyperv/hyperv.c | 14 ++++++++------
 hw/virtio/vhost.c  |  1 +
 2 files changed, 9 insertions(+), 6 deletions(-)

--=20
2.24.1


