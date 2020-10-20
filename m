Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7D729368C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 10:15:34 +0200 (CEST)
Received: from localhost ([::1]:40342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUmnt-0007bg-Qe
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 04:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kUmli-0006MM-LY
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 04:13:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kUmle-0001XW-F4
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 04:13:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603181588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8KGz+620VV6OAVDi1Kpt/dPEGi/LYyTvXMAs2/u6pD8=;
 b=b8ovdSSb+5VT9Ysy7VMDeEH1xCrD61eY23qYiPCV3q4ih0jHDZgWjIaD02RKkS8fXPZ5dj
 a5lg2XU/x5kwN2+2X3o21fWJs9/NfMhkU/c08yodcIAD1knA9EDRochAjh3AZHbHVYT8jJ
 RAGyFOU/8BBuw4kjOodbxAU8BNbD/+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-1ulUW-hGMbm1H1tdepjhfg-1; Tue, 20 Oct 2020 04:13:06 -0400
X-MC-Unique: 1ulUW-hGMbm1H1tdepjhfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 485261020902;
 Tue, 20 Oct 2020 08:13:05 +0000 (UTC)
Received: from localhost (unknown [10.36.110.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3ECAA5C1A3;
 Tue, 20 Oct 2020 08:13:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] qemu-ga: add ssh-{get,add,remove}-authorized-keys
Date: Tue, 20 Oct 2020 12:12:50 +0400
Message-Id: <20201020081257.2054548-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com, Michael Roth <mdroth@linux.vnet.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi=0D
=0D
Add new commands to help modify a user .ssh/authorized_keys.=0D
=0D
Although it's possible already to modify the authorized_keys files via=0D
file-{read,write} or exec, the commands are often denied by default, and th=
e=0D
logic is left to the client. Let's add specific commands for this job.=0D
=0D
Fixes:=0D
https://bugzilla.redhat.com/show_bug.cgi?id=3D1885332=0D
=0D
v3:=0D
 - add "qga: add ssh-get-authorized-keys" & "qga: add *reset argument to=0D
   ssh-add-authorized-keys" patches=0D
 - add some fixup! patches to be squashed after review, adding 'if'=0D
 - added the reviewed-by=0D
 - misc doc improvements=0D
=0D
v2:=0D
 - misc doc improvements=0D
 - various warnings fixes=0D
 - fix build for !unix=0D
 - added reviewed-by=0D
=0D
Marc-Andr=C3=A9 Lureau (7):=0D
  glib-compat: add g_unix_get_passwd_entry_qemu()=0D
  qga: add ssh-{add,remove}-authorized-keys=0D
  fixup! qga: add ssh-{add,remove}-authorized-keys=0D
  fixup! qga: add ssh-{add,remove}-authorized-keys=0D
  qga: add *reset argument to ssh-add-authorized-keys=0D
  meson: minor simplification=0D
  qga: add ssh-get-authorized-keys=0D
=0D
 include/glib-compat.h    |  26 ++=0D
 qga/commands-posix-ssh.c | 516 +++++++++++++++++++++++++++++++++++++++=0D
 qga/meson.build          |  34 ++-=0D
 qga/qapi-schema.json     |  67 +++++=0D
 4 files changed, 636 insertions(+), 7 deletions(-)=0D
 create mode 100644 qga/commands-posix-ssh.c=0D
=0D
--=20=0D
2.28.0=0D
=0D


