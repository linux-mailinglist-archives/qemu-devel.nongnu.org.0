Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71FE338850
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:11:03 +0100 (CET)
Received: from localhost ([::1]:55540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdp0-0001c2-O3
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKdio-00038w-2h
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:04:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKdik-0001iO-26
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615539873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WL1dzFzSS3s2Agh7IutO4jqLs1t14nIpvbeUqRPdrCc=;
 b=bKmeWRv+amkrtc0biJ/w6QPk4q/dUZgnq+CzInb9oXlJ4Hf+40wosJqxzknBvNZ7h7mAgX
 l5LXAwbNd6DJhTlvkqPyWon2g2t7u2xh59ARiHEvW9J1qpJTesVw80oyK6/msgRAZsykEe
 k/OfiI0bnCdDy5KFAJTrYHStRmqPM6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-ZeCHAD2KMVuOggLgy6s90Q-1; Fri, 12 Mar 2021 04:04:31 -0500
X-MC-Unique: ZeCHAD2KMVuOggLgy6s90Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72E5B100C661
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:04:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE9896A854;
 Fri, 12 Mar 2021 09:04:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2C3741800380; Fri, 12 Mar 2021 10:04:25 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] usb/storage: split into multiple source files.
Date: Fri, 12 Mar 2021 10:04:21 +0100
Message-Id: <20210312090425.772900-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One new file for the usb-bot device.=0D
Another new files for the classic usb-storage device.=0D
The abstract parent class remains in the original file.=0D
=0D
Gerd Hoffmann (4):=0D
  usb/storage: move declarations to usb/msd.h header=0D
  usb/storage: move usb-bot device to separate source file=0D
  usb/storage move usb-storage device to separate source file=0D
  usb/storage: add kconfig symbols=0D
=0D
 include/hw/usb/msd.h         |  54 +++++++++=0D
 hw/usb/dev-storage-bot.c     |  63 ++++++++++=0D
 hw/usb/dev-storage-classic.c | 156 ++++++++++++++++++++++++=0D
 hw/usb/dev-storage.c         | 225 +----------------------------------=0D
 hw/usb/Kconfig               |  13 +-=0D
 hw/usb/meson.build           |   4 +-=0D
 6 files changed, 294 insertions(+), 221 deletions(-)=0D
 create mode 100644 include/hw/usb/msd.h=0D
 create mode 100644 hw/usb/dev-storage-bot.c=0D
 create mode 100644 hw/usb/dev-storage-classic.c=0D
=0D
--=20=0D
2.29.2=0D
=0D


