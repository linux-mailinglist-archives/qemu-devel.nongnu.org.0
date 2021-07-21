Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797673D0AB6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:48:22 +0200 (CEST)
Received: from localhost ([::1]:40788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67tt-0002IM-Il
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67nZ-0005nW-Vc
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:41:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m67nY-0004Yl-4b
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:41:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626856906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HIdjafWpdnahBR+Py92eTMqZw974Y/XoxZzNv2gpo4U=;
 b=AhvNG+d59xgJ453fqOOWk6kALwa1mQeqXx0G6RlBvu14IC1aN47czMn6qtl13/Oy9jeCIs
 Qv1Bpt1xFEDnShLxVABnev9n5lrZLkwuxJsswIHUwBkkBLy6YavCTl7D+u8erjQjrz4+el
 gSEcyzNnSmzD+iXsIcFKORHkVX4XQ/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-iUCqUjv_M_qE6u8ZgTHk0A-1; Wed, 21 Jul 2021 04:41:45 -0400
X-MC-Unique: iUCqUjv_M_qE6u8ZgTHk0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D7911934100
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:41:44 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A3892C015;
 Wed, 21 Jul 2021 08:41:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/13] Clipboard fixes (for 6.1?)
Date: Wed, 21 Jul 2021 12:41:26 +0400
Message-Id: <20210721084139.1124779-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Here is a few fixes I have collected while working on clipboard-related cod=
e.=0D
=0D
There are some obvious code improvements/fixes, and better handling of rele=
ase &=0D
unregister to avoid dangling pointers and improve user experience.=0D
=0D
v2:=0D
 - replaced "ui/vdagent: unregister clipboard peer on finalize" with "ui/vd=
agent: disconnect handlers and reset state on finalize" patch.=0D
 - added "ui/vdagent: reset outbuf on disconnect"=0D
 - commit message tweaks=0D
=0D
Marc-Andr=C3=A9 Lureau (13):=0D
  ui/vdagent: fix leak on error path=0D
  ui/vdagent: remove copy-pasta comment=0D
  ui/gtk-clipboard: use existing macros=0D
  ui/gtk-clipboard: fix clipboard enum typo=0D
  ui/clipboard: add helper to retrieve current clipboard=0D
  ui/clipboard: release owned grabs on unregister=0D
  ui/vdagent: disconnect handlers and reset state on finalize=0D
  ui/vdagent: reset outbuf on disconnect=0D
  ui/vdagent: split clipboard recv message handling=0D
  ui/vdagent: use qemu_clipboard_info helper=0D
  ui/gtk-clipboard: use qemu_clipboard_info helper=0D
  ui/vdagent: send release when no clipboard owner=0D
  ui/gtk-clipboard: emit release clipboard events=0D
=0D
 include/ui/clipboard.h |  11 ++=0D
 include/ui/gtk.h       |   1 -=0D
 ui/clipboard.c         |  24 +++++=0D
 ui/gtk-clipboard.c     |  30 +++---=0D
 ui/vdagent.c           | 225 +++++++++++++++++++++++++----------------=0D
 5 files changed, 188 insertions(+), 103 deletions(-)=0D
=0D
--=20=0D
2.32.0.264.g75ae10bc75=0D
=0D


