Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2703F3F037F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 14:09:58 +0200 (CEST)
Received: from localhost ([::1]:37394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGKOL-0005k0-75
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 08:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mGKJp-0003Pk-37
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 08:05:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mGKJm-00009G-CI
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 08:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629288312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lWngC28n3WS4OO+YeFjlj3SLQjMwFZEgApC2dFxnCg8=;
 b=OUFXHPUqOgCl+FjU3h6oZu0T8QScxAFbrZI3daw0OfZrwHHd8M4RVm6131x5CR8WGxH69I
 d3y5XZHYUKoshew9/Ry3Xal7iz5fgpfUfj59hXZkq3OuIEqnyEu99CcabAs5jihao2RxyJ
 SPgXXoChrXSl6YFlmkFxxVXfdO4QMGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-UjDvdcMKOqSHl9z7jsD2AA-1; Wed, 18 Aug 2021 08:05:11 -0400
X-MC-Unique: UjDvdcMKOqSHl9z7jsD2AA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2E421936B65
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:05:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5DB667899;
 Wed, 18 Aug 2021 12:05:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 57D1C1800904; Wed, 18 Aug 2021 14:05:05 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] uas: add stream number sanity checks (maybe 6.1)
Date: Wed, 18 Aug 2021 14:05:04 +0200
Message-Id: <20210818120505.1258262-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Security fix.  Sorry for the last-minute patch, I had completely=0D
forgotten this one until the CVE number for it arrived today.=0D
=0D
Given that the classic usb storage device is way more popular than=0D
the uas (usb attached scsi) device the impact should be pretty low=0D
and we might consider to not screw up our release schedule for this.=0D
=0D
take care,=0D
  Gerd=0D
=0D
Gerd Hoffmann (1):=0D
  uas: add stream number sanity checks.=0D
=0D
 hw/usb/dev-uas.c | 11 +++++++++++=0D
 1 file changed, 11 insertions(+)=0D
=0D
--=20=0D
2.31.1=0D
=0D


