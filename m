Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBDA30B178
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 21:16:28 +0100 (CET)
Received: from localhost ([::1]:47542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6fcZ-00043H-Ls
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 15:16:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6far-0003Xk-6K
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 15:14:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6fao-00055E-Kk
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 15:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612210476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uzITIlbDhYyxfbpdAae2NUTkIugkXDX+Vjz83x358qo=;
 b=fKx5j9wmhM9T0jEMYZ3xzzIzY3Mq740Fogj0Ita31ajWnRtFb0eE5EtGT36zxTmzBSZsMH
 mabtWvjuMYS6feJKl4vveIeK5pF+rTtuMHIAWqvBB4XBRbZ9maSpNnY5PitUSwNBEHPpSz
 gszHXtW2zrvHI/8L9Wc15xK8MNT3M4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-98gMsU7SNqGXn3lwIwyGjg-1; Mon, 01 Feb 2021 15:14:34 -0500
X-MC-Unique: 98gMsU7SNqGXn3lwIwyGjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6305A801B13
 for <qemu-devel@nongnu.org>; Mon,  1 Feb 2021 20:14:33 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A1F760C05;
 Mon,  1 Feb 2021 20:14:25 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Fix (non-vga) QXL async screendump
Date: Tue,  2 Feb 2021 00:14:20 +0400
Message-Id: <20210201201422.446552-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Since commit 0d9b90ce5c ("console: make QMP/HMP screendump run in coroutine=
"),=0D
the screendump code relies on asynchronous QXL rendering. This event isn't=
=0D
correctly triggered with non-vga QXL devices, because console registration =
has=0D
some differences. Those 2 one-liners fix the regression reported by Gerd.=
=0D
=0D
Marc-Andr=C3=A9 Lureau (2):=0D
  qxl: set qxl.ssd.dcl.con on secondary devices=0D
  qxl: also notify the rendering is done when skipping it=0D
=0D
 hw/display/qxl-render.c | 1 +=0D
 hw/display/qxl.c        | 1 +=0D
 2 files changed, 2 insertions(+)=0D
=0D
--=20=0D
2.29.0=0D
=0D


