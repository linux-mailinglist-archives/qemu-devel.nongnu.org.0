Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B7636C88B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:19:21 +0200 (CEST)
Received: from localhost ([::1]:42648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbPUe-0004ca-5B
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lbPKH-0003O8-1I
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lbPKE-0002Az-6g
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619536113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vRDQkaR0w9U7N+Z0K4gNs/TAhGsoOGxtVBLc9dOHWPU=;
 b=LjaMxmnCW8QIhPhMwA5sq2SDOkULad889Zen2EeJF6iKfcUAG2ks14/qWx5GuBpzmR0Ovl
 VuNC4tV3yp5AOq5m7fPRIJnHjY9WvdeYktV9z3IxYCoNf/WkftrB2X8PWu7IaCFCHfkQsp
 UXNFUwhzkPWNtcbETD8i9Wf8dT9WUGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-oCFyPnP9MIurt52HpwT-EQ-1; Tue, 27 Apr 2021 11:08:31 -0400
X-MC-Unique: oCFyPnP9MIurt52HpwT-EQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 823A71922961
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 15:08:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3CBF50C0D;
 Tue, 27 Apr 2021 15:08:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E8CF61800393; Tue, 27 Apr 2021 17:08:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] edid: windows fixes
Date: Tue, 27 Apr 2021 17:08:16 +0200
Message-Id: <20210427150824.638359-1-kraxel@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Windows guests are not that happy with the edid blob we provide.=0D
Tweak things a bit to make windows pick up more resolutions.=0D
=0D
Also rebased all pending edid patches on top of that, so this=0D
is the latest "all in one" patch series.=0D
=0D
v2:=0D
 - rebase the latest master.=0D
 - drop one bugfix patch which was added to 6.0.=0D
=0D
Akihiko Odaki (1):=0D
  edid: Make refresh rate configurable=0D
=0D
Gerd Hoffmann (4):=0D
  qemu-edid: use qemu_edid_size()=0D
  edid: edid_desc_next=0D
  edid: move xtra3 descriptor=0D
  edid: use dta extension block descriptors=0D
=0D
Konstantin Nazarov (3):=0D
  edid: move timing generation into a separate function=0D
  edid: allow arbitrary-length checksums=0D
  edid: add support for DisplayID extension (5k resolution)=0D
=0D
 include/hw/display/edid.h  |  12 +-=0D
 hw/display/edid-generate.c | 232 +++++++++++++++++++++++++++----------=0D
 hw/display/vga-pci.c       |   2 +-=0D
 qemu-edid.c                |   6 +-=0D
 4 files changed, 183 insertions(+), 69 deletions(-)=0D
=0D
--=20=0D
2.30.2=0D
=0D


