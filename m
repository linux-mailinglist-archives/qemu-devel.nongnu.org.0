Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764E81B0769
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 13:27:21 +0200 (CEST)
Received: from localhost ([::1]:33626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQUa8-00036f-JZ
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 07:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37440 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jQUZM-0002f9-TG
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 07:26:33 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jQUZK-0001gl-TF
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 07:26:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60547
 helo=us-smtp-1.mimecast.com)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jQUZK-0001fB-GZ
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 07:26:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587381989;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pz/TffPen8wLR6BPrzUN36er8+auIwZi7f9ZpFeBRWw=;
 b=cYi/b5jIjXENYEKcdsqyTTvfXPNfcug+Cr4vdbtgDIN6JGyEUOV67IwCQPqIGPMEmmF6X9
 MgAVYr05znVO6al4lX5qxcwPFLpmsrGXvLWctyFkRXYKhXiBRDHtszoP0oLO44PoC7+Qj6
 OHrJXEVHam37Aae7sDlJ5GvmhflYnPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-oBto0PDINASN3Ifn90JSFQ-1; Mon, 20 Apr 2020 07:26:27 -0400
X-MC-Unique: oBto0PDINASN3Ifn90JSFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 580CD800D53
 for <qemu-devel@nongnu.org>; Mon, 20 Apr 2020 11:26:26 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 066AF1001DC2;
 Mon, 20 Apr 2020 11:26:22 +0000 (UTC)
Date: Mon, 20 Apr 2020 12:26:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH] char: fix use-after-free with dup chardev & reconnect
Message-ID: <20200420112619.GO346737@redhat.com>
References: <20200420112012.567284-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200420112012.567284-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 04:32:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 20, 2020 at 01:20:12PM +0200, Marc-Andr=C3=A9 Lureau wrote:
> With a reconnect socket, qemu_char_open() will start a background
> thread. It should keep a reference on the chardev.
>=20
> Fixes invalid read:
> READ of size 8 at 0x6040000ac858 thread T7
>     #0 0x5555598d37b8 in unix_connect_saddr /home/elmarco/src/qq/util/qem=
u-sockets.c:954
>     #1 0x5555598d4751 in socket_connect /home/elmarco/src/qq/util/qemu-so=
ckets.c:1109
>     #2 0x555559707c34 in qio_channel_socket_connect_sync /home/elmarco/sr=
c/qq/io/channel-socket.c:145
>     #3 0x5555596adebb in tcp_chr_connect_client_task /home/elmarco/src/qq=
/chardev/char-socket.c:1104
>     #4 0x555559723d55 in qio_task_thread_worker /home/elmarco/src/qq/io/t=
ask.c:123
>     #5 0x5555598a6731 in qemu_thread_start /home/elmarco/src/qq/util/qemu=
-thread-posix.c:519
>     #6 0x7ffff40d4431 in start_thread (/lib64/libpthread.so.0+0x9431)
>     #7 0x7ffff40029d2 in __clone (/lib64/libc.so.6+0x1019d2)
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  chardev/char-socket.c |  3 ++-
>  tests/test-char.c     | 51 ++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 52 insertions(+), 2 deletions(-)


Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


