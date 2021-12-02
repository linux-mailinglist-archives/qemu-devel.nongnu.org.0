Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB4F466745
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 16:53:10 +0100 (CET)
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msoOS-00078F-NI
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 10:53:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1msoMg-0005MO-BR
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 10:51:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1msoMc-0007ct-0U
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 10:51:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638460273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DwDFL780Dv/zY+dUlAUznVuZNLTsUT/0J7f+xwGcORw=;
 b=NmEzmitREX2hXFD7Vw2NmW7LUGp0HO28AD3/jb2ShM8h+dm/2pWJn3mz7Tu62cUMR9ybHc
 bKUfttxtMOHrhKAmBnnV885FcEn/BbKW2sMGNjZNiBZVZ0b88L7fnYg0I6t7XeypHxf8Wg
 mXF2+8iYh8q6rF8XJ+MHPkhoLIW7az8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-165-z5f4yFOxNSqRU_ESNFcjuA-1; Thu, 02 Dec 2021 10:50:05 -0500
X-MC-Unique: z5f4yFOxNSqRU_ESNFcjuA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 191351023F52;
 Thu,  2 Dec 2021 15:50:03 +0000 (UTC)
Received: from localhost (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29842196FC;
 Thu,  2 Dec 2021 15:49:09 +0000 (UTC)
Date: Thu, 2 Dec 2021 15:49:08 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 0/6] aio-posix: split poll check from ready handler
Message-ID: <20211202154908.GW1127@redhat.com>
References: <20211202153402.604951-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211202153402.604951-1-stefanha@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Peter Lieven <pl@kamp.de>,
 Stefan Weil <sw@weilnetz.de>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Not sure if this is related, but builds are failing with:

FAILED: libblockdev.fa.p/block_export_fuse.c.o=20
cc -m64 -mcx16 -Ilibblockdev.fa.p -I. -I.. -Iqapi -Itrace -Iui -Iui/shader =
-I/usr/include/fuse3 -I/usr/include/p11-kit-1 -I/usr/include/glib-2.0 -I/us=
r/lib64/glib-2.0/include -I/usr/include/sysprof-4 -fdiagnostics-color=3Daut=
o -Wall -Winvalid-pch -std=3Dgnu11 -O2 -g -isystem /home/rjones/d/qemu/linu=
x-headers -isystem linux-headers -iquote . -iquote /home/rjones/d/qemu -iqu=
ote /home/rjones/d/qemu/include -iquote /home/rjones/d/qemu/disas/libvixl -=
iquote /home/rjones/d/qemu/tcg/i386 -pthread -DSTAP_SDT_V2 -U_FORTIFY_SOURC=
E -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE=
_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmis=
sing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declar=
ation -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -=
Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-label=
s -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-di=
rs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE -MD =
-MQ libblockdev.fa.p/block_export_fuse.c.o -MF libblockdev.fa.p/block_expor=
t_fuse.c.o.d -o libblockdev.fa.p/block_export_fuse.c.o -c ../block/export/f=
use.c
../block/export/fuse.c: In function =E2=80=98setup_fuse_export=E2=80=99:
../block/export/fuse.c:226:59: warning: passing argument 7 of =E2=80=98aio_=
set_fd_handler=E2=80=99 from incompatible pointer type [-Wincompatible-poin=
ter-types]
  226 |                        read_from_fuse_export, NULL, NULL, exp);
      |                                                           ^~~
      |                                                           |
      |                                                           FuseExpor=
t *
In file included from ../block/export/fuse.c:22:
/home/rjones/d/qemu/include/block/aio.h:472:36: note: expected =E2=80=98voi=
d (*)(void *)=E2=80=99 but argument is of type =E2=80=98FuseExport *=E2=80=
=99
  472 |                         IOHandler *io_poll_ready,
      |                         ~~~~~~~~~~~^~~~~~~~~~~~~
../block/export/fuse.c:224:5: error: too few arguments to function =E2=80=
=98aio_set_fd_handler=E2=80=99
  224 |     aio_set_fd_handler(exp->common.ctx,
      |     ^~~~~~~~~~~~~~~~~~
In file included from ../block/export/fuse.c:22:
/home/rjones/d/qemu/include/block/aio.h:466:6: note: declared here
  466 | void aio_set_fd_handler(AioContext *ctx,
      |      ^~~~~~~~~~~~~~~~~~
../block/export/fuse.c: In function =E2=80=98fuse_export_shutdown=E2=80=99:
../block/export/fuse.c:268:13: error: too few arguments to function =E2=80=
=98aio_set_fd_handler=E2=80=99
  268 |             aio_set_fd_handler(exp->common.ctx,
      |             ^~~~~~~~~~~~~~~~~~
In file included from ../block/export/fuse.c:22:
/home/rjones/d/qemu/include/block/aio.h:466:6: note: declared here
  466 | void aio_set_fd_handler(AioContext *ctx,
      |      ^~~~~~~~~~~~~~~~~~

Rich.

--=20
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjon=
es
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top


