Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14AA3CCE7D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 09:29:29 +0200 (CEST)
Received: from localhost ([::1]:35012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5NiS-0000ow-PF
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 03:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m5NgF-0007nR-JX
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:27:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m5NgE-0000wp-0c
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626679628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bZuIgA7tnHwG1bTTH5YnW5Iuq367TjXIJ0tQK+nHzvk=;
 b=dn+oaqbTvwXXWKz83C92PRq+XWdxh7MtpfFXaxfuM1hKO3OrvU5p+4W5zF3Luw7vPfxalp
 e398HCT5meMiMI9zPx4H1VxSo1lpuJKqWbeWwFG3OMpfJlJxw2FnNy5Fw3YxDUcqopXAww
 vEddLM8zyx9IqSOBdn2sam3xPHxh00M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-2P7FyNW_NWm6zNRnfIT4bg-1; Mon, 19 Jul 2021 03:27:06 -0400
X-MC-Unique: 2P7FyNW_NWm6zNRnfIT4bg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1AD7100C610
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 07:27:05 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A39425D6BA;
 Mon, 19 Jul 2021 07:26:57 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 00/12] Clipboard fixes (for 6.1?)
Date: Mon, 19 Jul 2021 11:26:42 +0400
Message-Id: <20210719072654.845901-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 Gerd Hoffmann <kraxel@redhat.com>
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
Marc-Andr=C3=A9 Lureau (12):=0D
  ui/vdagent: fix leak on error path=0D
  ui/vdagent: remove copy-pasta comment=0D
  ui/gtk-clipboard: use existing macros=0D
  ui/gtk-clipboard: fix clipboard enum typo=0D
  ui/clipboard: add helper to retrieve current clipboard=0D
  ui/clipboard: release owned grabs on unregister=0D
  ui/vdagent: unregister clipboard peer on finalize=0D
  ui/vdagent: split clipboard recv message handling=0D
  ui/vdagent: use qemu_clipboard_info helper=0D
  ui/gtk-clipboard: use qemu_clipboard_info helper=0D
  ui/vdagent: send release when no clipboard owner=0D
  ui/gtk-clipboard: emit release clipboard events=0D
=0D
 include/ui/clipboard.h |  11 +++=0D
 include/ui/gtk.h       |   1 -=0D
 ui/clipboard.c         |  24 +++++=0D
 ui/gtk-clipboard.c     |  30 +++----=0D
 ui/vdagent.c           | 200 +++++++++++++++++++++++++----------------=0D
 5 files changed, 173 insertions(+), 93 deletions(-)=0D
=0D
--=20=0D
2.32.0.93.g670b81a890=0D
=0D


