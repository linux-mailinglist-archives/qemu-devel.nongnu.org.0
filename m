Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58C63715FE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:31:55 +0200 (CEST)
Received: from localhost ([::1]:45270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYfy-0006Tg-RR
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldYdb-0005Ep-OL
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:29:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldYdZ-0000aI-Od
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620048565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DKSxx3CPZkP/5HEiirjWe8TC4fO3D469kADFFUsZOOU=;
 b=RJctdjtt4aHoHUNZh3Qjgq/OlOW9/lxY5+Qh44bWiO8vlAC1B7V7rUhfsLEQ2iYfHY8bL6
 OnYspLN5rGqpWGS3S+TFs744OxMtWN6fMQB3lI4KeWczPQTVm+fxvUM4aOxjWtIqLrfufI
 6b7bZPFwrTK8fheX0gc2vVN/wKlGZZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-X3tWzd4EPi-fdaRb9c0s3A-1; Mon, 03 May 2021 09:29:23 -0400
X-MC-Unique: X3tWzd4EPi-fdaRb9c0s3A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 218F1100807F;
 Mon,  3 May 2021 13:29:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 251612BFE6;
 Mon,  3 May 2021 13:29:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 921D71CEC734; Mon,  3 May 2021 15:29:15 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] usb: fix some memory allocation issues.
Date: Mon,  3 May 2021 15:29:10 +0200
Message-Id: <20210503132915.2335822-1-kraxel@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mcascell@redhat.com, remy.noel@blade-group.com, philmd@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2: add one more fix (Philippe).=0D
=0D
Gerd Hoffmann (5):=0D
  usb/hid: avoid dynamic stack allocation=0D
  usb/redir: avoid dynamic stack allocation (CVE-2021-3527)=0D
  usb/mtp: avoid dynamic stack allocation=0D
  usb/xhci: sanity check packet size=0D
  usb: limit combined packets to 1 MiB=0D
=0D
 hw/usb/combined-packet.c | 4 +++-=0D
 hw/usb/dev-hid.c         | 2 +-=0D
 hw/usb/dev-mtp.c         | 3 ++-=0D
 hw/usb/dev-wacom.c       | 2 +-=0D
 hw/usb/hcd-xhci.c        | 5 +++++=0D
 hw/usb/redirect.c        | 6 +++---=0D
 6 files changed, 15 insertions(+), 7 deletions(-)=0D
=0D
--=20=0D
2.30.2=0D
=0D


