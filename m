Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFDF28D551
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 22:27:48 +0200 (CEST)
Received: from localhost ([::1]:46864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSQtf-0005cO-J2
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 16:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kSQrI-0003lc-T1
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 16:25:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kSQrF-0007jx-Ed
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 16:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602620715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oz958320meSr4T408dHrvfjoVbwvdk+dvZiikvNu/5U=;
 b=U8WVtPAqu7Gfhcdu55Kzip1ZhffUzbJZWV9j+cwPsRRxEaxZDYNbTh7OjGW7Qjg4a0fG2B
 1N+vdUqayLqHY7g6zJePDHIvHX2kUEhekDAmypfNosiPOTNO5sbKgryDzj1DyrKjFlhQHD
 E2f9XNfxNJN7p/OdthZgKRdw5p1EGpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-dWT6UFe8MYu2UXW0yVhkuw-1; Tue, 13 Oct 2020 16:25:10 -0400
X-MC-Unique: dWT6UFe8MYu2UXW0yVhkuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3DAF1020901;
 Tue, 13 Oct 2020 20:25:09 +0000 (UTC)
Received: from localhost (unknown [10.36.110.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAD4C6EF53;
 Tue, 13 Oct 2020 20:25:05 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] qemu-ga: add ssh-{add,remove}-authorized-keys
Date: Wed, 14 Oct 2020 00:25:00 +0400
Message-Id: <20201013202502.335336-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:06:42
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 berrange@redhat.com, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Add two new commands to help modify ~/.ssh/authorized_keys.=0D
=0D
Although it's possible already to modify the authorized_keys files via=0D
file-{read,write} or exec, the commands are often denied by default, and th=
e=0D
logic is left to the client. Let's add specific commands for this job.=0D
=0D
Fixes:=0D
https://bugzilla.redhat.com/show_bug.cgi?id=3D1885332=0D
=0D
Marc-Andr=C3=A9 Lureau (2):=0D
  glib-compat: add g_unix_get_passwd_entry_qemu()=0D
  qga: add ssh-{add,remove}-authorized-keys=0D
=0D
 include/glib-compat.h    |  24 +++=0D
 qga/commands-posix-ssh.c | 394 +++++++++++++++++++++++++++++++++++++++=0D
 qga/commands-win32.c     |  10 +=0D
 qga/meson.build          |  17 +-=0D
 qga/qapi-schema.json     |  32 ++++=0D
 5 files changed, 476 insertions(+), 1 deletion(-)=0D
 create mode 100644 qga/commands-posix-ssh.c=0D
=0D
--=20=0D
2.28.0=0D
=0D


