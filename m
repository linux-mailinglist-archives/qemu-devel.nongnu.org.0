Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6B92F31E8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 14:44:03 +0100 (CET)
Received: from localhost ([::1]:39398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJxq-0003d3-GE
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 08:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kzJvT-0002OO-HW
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:41:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kzJvR-0004Sq-Km
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610458892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OcSd3nNnoLT5plbgSSGUjHLsxtS1sriggN68Ma+u5yY=;
 b=BSXKoQd3TtxnLRBwM0N7HFYcJDKKFGS3fk6do8+jRCrKHGAYQjpcVBTSmulp+XVVLXqshy
 A/36otxpAnv0/7tofat4aUoIWulcOUzvV7FX4g4X10/UuhXsr0msrjstdvFNQKHuhRCkvH
 1mG0/dQ6faSfr2ftJw0LDTPf5RBldXQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-pPwPmr2NODiu-KtDBGfOIQ-1; Tue, 12 Jan 2021 08:41:29 -0500
X-MC-Unique: pPwPmr2NODiu-KtDBGfOIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 473C3100C662
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:41:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-197.ams2.redhat.com
 [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A8ACF10013BD;
 Tue, 12 Jan 2021 13:41:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B8CF5180009A; Tue, 12 Jan 2021 14:41:20 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] vnc: support some new extensions.
Date: Tue, 12 Jan 2021 14:41:17 +0100
Message-Id: <20210112134120.2031837-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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

The rfb standard keeps envolving.  While the official spec is kind of=0D
frozen since a decade or so the community maintains an updated version=0D
of the spec at:=0D
=09https://github.com/rfbproto/rfbproto/=0D
=0D
This series adds support for two new extensions from that spec: alpha=0D
cursor and extended desktop resize.=0D
=0D
alpha cursor allows a full alpha channel for the cursor image (unlike=0D
the rich cursor extension which has only a bitmask for transparency).=0D
=0D
extended desktop resize makes the desktop-resize work both ways, i.e. we=0D
can not only signal guest display resolution changes to the vnc client=0D
but also vnc client window size changes to the guest.=0D
=0D
Tested with tigervnc.=0D
=0D
Support for gtk-vnc is in progress.=0D
=0D
v3:=0D
 - dropped cursor patches (already merged).=0D
 - fix client initialization (reply to update request not set encoding).=0D
=0D
v2:=0D
 - dropped qxl bits (will be a separate patch series).=0D
 - use error codes for desktop resize responses.=0D
 - little tweaks here and there.=0D
 - pick up some review tags.=0D
=0D
Gerd Hoffmann (3):=0D
  vnc: move check into vnc_cursor_define=0D
  vnc: move initialization to framebuffer_update_request=0D
  vnc: add support for extended desktop resize=0D
=0D
 ui/vnc.h |  2 ++=0D
 ui/vnc.c | 85 +++++++++++++++++++++++++++++++++++++++++++++++---------=0D
 2 files changed, 74 insertions(+), 13 deletions(-)=0D
=0D
--=20=0D
2.29.2=0D
=0D


