Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC7A2CD451
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:10:34 +0100 (CET)
Received: from localhost ([::1]:37108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmVN-0005bC-3p
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmTG-0003CJ-4D
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:08:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmT8-0006dH-P8
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 06:08:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606993694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UYpb16H9W4bUYbRqpMW3Fj/IByjZyRN+XOExjvaNvVQ=;
 b=Fn4VSrR3mGTA5WbgN6Rx0TgcusW91IZt8M4HzXAMfh+6BifSjvCUe04yJ4VMkfpVOQ3X3I
 cgDsECAyOpNFoy16GvhNR/Eu7fb5cS1UcmjjW7xfYyKoZ/9fhK8eY9vJZyTIQdh4T+QAZj
 1yHD5AoBuaBoZ4s8Mr/jqCG2nsfLZEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-h57uZ9_WPnmuhtfIHdGQUQ-1; Thu, 03 Dec 2020 06:08:11 -0500
X-MC-Unique: h57uZ9_WPnmuhtfIHdGQUQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DB8A185E489
 for <qemu-devel@nongnu.org>; Thu,  3 Dec 2020 11:08:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED22E5D9CA;
 Thu,  3 Dec 2020 11:08:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 051C011AB8; Thu,  3 Dec 2020 12:08:06 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] vnc: support some new extensions.
Date: Thu,  3 Dec 2020 12:07:56 +0100
Message-Id: <20201203110806.13556-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Gerd Hoffmann (9):=0D
  console: allow con=3D=3DNULL in dpy_set_ui_info=0D
  console: add check for ui_info pointer=0D
  vnc: use enum for features=0D
  vnc: drop unused copyrect feature=0D
  vnc: add pseudo encodings=0D
  vnc: add alpha cursor support=0D
  vnc: force initial resize message=0D
  vnc: add support for extended desktop resize=0D
  qxl: add ui_info callback=0D
=0D
 ui/vnc.h         | 32 +++++++++-------=0D
 hw/display/qxl.c | 27 ++++++++++++++=0D
 ui/console.c     |  8 +++-=0D
 ui/vnc.c         | 97 ++++++++++++++++++++++++++++++++++++++++++------=0D
 4 files changed, 138 insertions(+), 26 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


