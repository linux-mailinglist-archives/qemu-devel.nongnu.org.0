Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F9F13252C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 12:50:44 +0100 (CET)
Received: from localhost ([::1]:47170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ionNi-0001e5-C5
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 06:50:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42104)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ion7s-0008AG-Qz
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:34:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ion7q-0003sF-HA
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:34:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43509
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ion7q-0003rB-DO
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:34:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578396857;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZCagtfuTplucHWENQ+zJb41w91U1QLCqXIaEHdgW9RY=;
 b=aKANFpo0ZqQeFlQNeFrj5cHMPA7FnOKnh8OTAS6EWHUWkIa1x8zmXAcqXZtoNM7Tx36h+E
 5bLgHRLaJ0hxR0mHmYJ+Rsb3pYCROMperQZDZo3YS+oLoXFMa9zwy+z6WXnmr2MNEQ5i77
 Rm2PSkOUybMPMLJDuFjmMJbDdo6zc8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-9VTfdsSIMhiIv8J2hLmMeA-1; Tue, 07 Jan 2020 06:34:16 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96783801E6C
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 11:34:15 +0000 (UTC)
Received: from redhat.com (ovpn-112-61.ams2.redhat.com [10.36.112.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E20595D9CA;
 Tue,  7 Jan 2020 11:34:11 +0000 (UTC)
Date: Tue, 7 Jan 2020 11:34:08 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 078/104] virtiofsd: cleanup allocated resource in se
Message-ID: <20200107113408.GS3368802@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-79-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-79-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 9VTfdsSIMhiIv8J2hLmMeA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 12, 2019 at 04:38:38PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: Liu Bo <bo.liu@linux.alibaba.com>
>=20
> This cleans up unfreed resources in se on quiting, including
> se->virtio_dev, se->vu_socket_path, se->vu_socketfd.
>=20
> Signed-off-by: Liu Bo <bo.liu@linux.alibaba.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c | 7 +++++++
>  tools/virtiofsd/fuse_virtio.c   | 7 +++++++
>  tools/virtiofsd/fuse_virtio.h   | 2 +-
>  3 files changed, 15 insertions(+), 1 deletion(-)

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


