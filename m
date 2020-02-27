Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6580A17237A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 17:36:26 +0100 (CET)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7M9B-0000sp-En
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 11:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40912)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7M50-0004Nj-U2
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 11:32:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7M50-00033e-1i
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 11:32:06 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58355
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7M4z-00033I-Ty
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 11:32:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582821125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrxksytfH/4aQKzPhPTMKmDyBX6ftLeis8jZBIQPOJY=;
 b=eIcU6rpWHQT5wNbvaHv41q0KLWtnG703RcuaMBSggVaQ8JmnTZVv20Pg9XmHOtGu+8bmyg
 s+QLzpdPcJG5oNWCl/FwSvqFYh+VKzR7PpEBnfqpu9jTNaYYyCs9s5GBZ12QxEmAUQnxfO
 atCGSgie6NTL8o35K8VC7ULRzK25v0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-qrlnDfvtMbanvVC6FzKkoA-1; Thu, 27 Feb 2020 11:32:03 -0500
X-MC-Unique: qrlnDfvtMbanvVC6FzKkoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE4D3800D50;
 Thu, 27 Feb 2020 16:32:00 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-195.brq.redhat.com [10.40.205.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AC436E3EE;
 Thu, 27 Feb 2020 16:31:58 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] qga: Fix a memory leak
Date: Thu, 27 Feb 2020 17:31:00 +0100
Message-Id: <20200227163101.414-6-philmd@redhat.com>
In-Reply-To: <20200227163101.414-1-philmd@redhat.com>
References: <20200227163101.414-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 =?UTF-8?q?Tom=C3=A1=C5=A1=20Golembiovsk=C3=BD?= <tgolembi@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The string returned by g_win32_error_message() has to be
deallocated with g_free().

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 qga/channel-win32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/channel-win32.c b/qga/channel-win32.c
index c86f4388db..774205e017 100644
--- a/qga/channel-win32.c
+++ b/qga/channel-win32.c
@@ -302,8 +302,8 @@ static gboolean ga_channel_open(GAChannel *c, GAChannel=
Method method,
                            OPEN_EXISTING,
                            FILE_FLAG_NO_BUFFERING | FILE_FLAG_OVERLAPPED, =
NULL);
     if (c->handle =3D=3D INVALID_HANDLE_VALUE) {
-        g_critical("error opening path %s: %s", newpath,
-                   g_win32_error_message(GetLastError()));
+        g_autofree gchar *emsg =3D g_win32_error_message(GetLastError());
+        g_critical("error opening path %s: %s", newpath, emsg);
         return false;
     }
=20
--=20
2.21.1


