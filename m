Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228DD33D5FA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:42:56 +0100 (CET)
Received: from localhost ([::1]:38486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMAuN-0000A6-5y
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMApy-0003df-BL
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMApw-0002AX-Mk
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615905500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LLeRlekNa0EDApGphdF2htA2lYzeS3UdJVyRKY3sXPc=;
 b=bVNrEVAA5SdVZLGoRs+MgKUohyI9L6UX2MjhI7OdqAZluYzR5oJzCS/RZE7cedHPsytHEA
 pOwy6V4Nc7FkwBzd2xN0Zl1gDkqmRxy0ay15l1/IWKGz1K1z4ZA2SxVGZIoQ6q1IdAlDCf
 Mm8lerTUVpUbboRsPWsdWr0uIUImlm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-JtwaP-NdP4u6B--RB4S1Xg-1; Tue, 16 Mar 2021 10:38:18 -0400
X-MC-Unique: JtwaP-NdP4u6B--RB4S1Xg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D633100C662
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 14:38:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C878050F1A;
 Tue, 16 Mar 2021 14:38:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 383801800626; Tue, 16 Mar 2021 15:38:12 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] edid: windows fixes
Date: Tue, 16 Mar 2021 15:38:03 +0100
Message-Id: <20210316143812.2363588-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Akihiko Odaki (1):=0D
  edid: Make refresh rate configurable=0D
=0D
Gerd Hoffmann (5):=0D
  qemu-edid: use qemu_edid_size()=0D
  edid: edid_desc_next=0D
  edid: move xtra3 descriptor=0D
  edid: use dta extension block descriptors=0D
  edid: prefer standard timings=0D
=0D
Konstantin Nazarov (3):=0D
  edid: move timing generation into a separate function=0D
  edid: allow arbitrary-length checksums=0D
  edid: add support for DisplayID extension (5k resolution)=0D
=0D
 include/hw/display/edid.h  |  12 +-=0D
 hw/display/edid-generate.c | 247 +++++++++++++++++++++++++++----------=0D
 hw/display/vga-pci.c       |   2 +-=0D
 qemu-edid.c                |   6 +-=0D
 4 files changed, 191 insertions(+), 76 deletions(-)=0D
=0D
--=20=0D
2.30.2=0D
=0D


