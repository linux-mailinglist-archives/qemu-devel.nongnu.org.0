Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC5B2D2A28
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:01:45 +0100 (CET)
Received: from localhost ([::1]:35780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmbge-0003wL-7C
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kmbcr-0001Se-NF
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:57:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kmbcp-00053y-TW
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 06:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607428667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LOsxtzK+TosEaDNVPocyop5qecT2wsS9vdbi3xJfzQE=;
 b=EKnix9gqOSRk5/9ILct2QghIVKvWLSF23DWnUTnDOAAFezciJikuFj4z2oS2LetawDYIhR
 kFnSAL00Xnr9UOnL8yZfF+6M8qNKlPqYcfdGHBaWq7GIAYDv739v57Ldrz/R+dar3bSebz
 fHfOd3B7jfE0euyRfvJSIR7O08qfCxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-10N4cMNhMim_0ybV-G_NLQ-1; Tue, 08 Dec 2020 06:57:42 -0500
X-MC-Unique: 10N4cMNhMim_0ybV-G_NLQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 737E1427C7
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 11:57:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D2266E519;
 Tue,  8 Dec 2020 11:57:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2226616E31; Tue,  8 Dec 2020 12:57:37 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] vnc: support some new extensions.
Date: Tue,  8 Dec 2020 12:57:28 +0100
Message-Id: <20201208115737.18581-1-kraxel@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
gtk-vnc (and anything building on top of it like virt-viewer and=0D
virt-manager) has no support for these extensions.=0D
=0D
v2:=0D
 - dropped qxl bits (will be a separate patch series).=0D
 - use error codes for desktop resize responses.=0D
 - little tweaks here and there.=0D
 - pick up some review tags.=0D
=0D
Gerd Hoffmann (9):=0D
  console: drop qemu_console_get_ui_info=0D
  console: allow con=3D=3DNULL in dpy_{get,set}_ui_info and=0D
    dpy_ui_info_supported=0D
  vnc: use enum for features=0D
  vnc: drop unused copyrect feature=0D
  vnc: add pseudo encodings=0D
  vnc: add alpha cursor support=0D
  vnc: force initial resize message=0D
  vnc: add support for extended desktop resize=0D
  vnc: move check into vnc_cursor_define=0D
=0D
 include/ui/console.h |   1 -=0D
 ui/vnc.h             |  32 ++++++++------=0D
 ui/console.c         |  18 ++++----=0D
 ui/vnc.c             | 103 +++++++++++++++++++++++++++++++++++++------=0D
 4 files changed, 118 insertions(+), 36 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


