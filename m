Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9051B047F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 10:34:15 +0200 (CEST)
Received: from localhost ([::1]:59614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQRsc-0004eY-QP
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 04:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56458 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jQRrA-0002su-Rc
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 04:32:45 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jQRr9-0006vB-Vt
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 04:32:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43633
 helo=us-smtp-1.mimecast.com)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jQRr9-0006so-It
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 04:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587371562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdJl/PQJmyTmQZwAl3BjGF01EwCwSr6LL+1E8TqTgAw=;
 b=SPD7Rd95sxlmCX5yKR0SYF6c7RviaYneSa7DFZ7k4lddGpgA31JGP4Ib9L2+k7lyB6vABK
 AhhsyvigKy2egaZmmwhrIgWbiLjJUMYJ7MF/P0FQI3tHrBx6wKtIoWYAaWkgF/UY8rG1By
 +cc1IvGyY//zqSedFkejGPeU0j2vTok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-dYaYX7dQN9uwNlwvinFLnw-1; Mon, 20 Apr 2020 04:32:40 -0400
X-MC-Unique: dYaYX7dQN9uwNlwvinFLnw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F36BE8018A1
 for <qemu-devel@nongnu.org>; Mon, 20 Apr 2020 08:32:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1A3026578;
 Mon, 20 Apr 2020 08:32:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B00F411358C2; Mon, 20 Apr 2020 10:32:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] fdc: Fix fallback=auto error handling
Date: Mon, 20 Apr 2020 10:32:31 +0200
Message-Id: <20200420083236.19309-7-armbru@redhat.com>
In-Reply-To: <20200420083236.19309-1-armbru@redhat.com>
References: <20200420083236.19309-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 03:29:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fdctrl_realize_common() rejects fallback=3Dauto.  Used by devices
"isa-fdc", "sysbus-fdc", "SUNW,fdtwo".  The error handling is broken:

    $ qemu-system-x86_64 -nodefaults -device isa-fdc,fallback=3Dauto,driveA=
=3Dfd0 -drive if=3Dnone,id=3Dfd0
    **
    ERROR:/work/armbru/qemu/hw/block/fdc.c:434:pick_drive_type: assertion f=
ailed: (drv->drive !=3D FLOPPY_DRIVE_TYPE_AUTO)
    Aborted (core dumped)

Cause: fdctrl_realize_common() neglects to bail out after setting the
error.  Fix that.

Fixes: a73275dd6fc3bfda33165bebc28e0c33c20cb0a0
Cc: John Snow <jsnow@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/block/fdc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 33bc9e2f92..9628cc171e 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -2615,6 +2615,7 @@ static void fdctrl_realize_common(DeviceState *dev, F=
DCtrl *fdctrl,
=20
     if (fdctrl->fallback =3D=3D FLOPPY_DRIVE_TYPE_AUTO) {
         error_setg(errp, "Cannot choose a fallback FDrive type of 'auto'")=
;
+        return;
     }
=20
     /* Fill 'command_to_handler' lookup table */
--=20
2.21.1


