Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580E72A7FF7
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 14:51:06 +0100 (CET)
Received: from localhost ([::1]:57960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaffN-000855-D8
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 08:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kafVy-0003rc-MY
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 08:41:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kafVx-0004Bs-3Y
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 08:41:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604583679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8FP0zGIkkvJXgaS2cRUg9daCOHb7rQj50JSoY3CBhmI=;
 b=Je85+xQzdBZ7Q25Cjj9NalQCycy6VAJdyJB9hiHHjtKpk1eKqY8tWo+C7MOrb8obELJXau
 AiaQJ+SpjK2ahlBTeRPvC8Cj6IHNk9hn3RPIUOG1wfaz+mjw+CyMsEsmrK/eW8YnEwxLuT
 6y5b9lYaLNAtipPXqtQBW8jxvt6+xcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-rdGkAshvNz6FIx6mNUHIeQ-1; Thu, 05 Nov 2020 08:41:17 -0500
X-MC-Unique: rdGkAshvNz6FIx6mNUHIeQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4CA21009E2D
 for <qemu-devel@nongnu.org>; Thu,  5 Nov 2020 13:41:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B77973677;
 Thu,  5 Nov 2020 13:41:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 930E79B09; Thu,  5 Nov 2020 14:41:12 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] usb: fix some guest-triggerable asserts
Date: Thu,  5 Nov 2020 14:41:06 +0100
Message-Id: <20201105134112.25119-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 01:14:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Also kill DPRINTF in usb-storage.c=0D
=0D
Gerd Hoffmann (6):=0D
  usb-storage: switch trace events=0D
  usb-storage: add commandlog property=0D
  usb-storage: use bool for removable property=0D
  usb-storage: fill csw on cancel=0D
  xhci: fix guest triggerable assert=0D
  xhci: move sanity checks=0D
=0D
 hw/usb/dev-storage.c | 60 +++++++++++++++++++++-----------------------=0D
 hw/usb/hcd-xhci.c    | 11 +++++---=0D
 hw/usb/trace-events  | 12 +++++++++=0D
 3 files changed, 48 insertions(+), 35 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


