Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB89132571
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 12:58:37 +0100 (CET)
Received: from localhost ([::1]:47308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ionVM-0007bo-5r
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 06:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41443)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ion4Y-0008C3-5C
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:30:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1ion4W-0002Ni-VD
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:30:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21415
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1ion4W-0002NN-Qz
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578396652;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qyukNUulRaCbkFZWoMo6iDqN6p+ud+FpmZqEzI+ebw4=;
 b=dgSpvrkCNJ5YisnBjeBSwu98NFEOi2vc/d5fxB75BIpwzyTgZOhXnGjXqKMsT5mSWL2DxD
 9wBOadsFmpqOzdd4sQIcJ7K35Y4GOtbgMOQJKJmKl3N18eWx2sSSze9OzMxVLh42oUs0qf
 9qL4pJSdgpm/chTmrRIGHUEVoeX/YA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-h9usjLCJMDezaOqOcKtJRA-1; Tue, 07 Jan 2020 06:30:50 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1818E800D41
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 11:30:50 +0000 (UTC)
Received: from redhat.com (ovpn-112-61.ams2.redhat.com [10.36.112.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BA9485EE6;
 Tue,  7 Jan 2020 11:30:45 +0000 (UTC)
Date: Tue, 7 Jan 2020 11:30:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 077/104] virtiofsd: fix error handling in main()
Message-ID: <20200107113042.GR3368802@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-78-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-78-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: h9usjLCJMDezaOqOcKtJRA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 12, 2019 at 04:38:37PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: Liu Bo <bo.liu@linux.alibaba.com>
>=20
> Neither fuse_parse_cmdline() nor fuse_opt_parse() goes to the right place
> to do cleanup.
>=20
> Signed-off-by: Liu Bo <bo.liu@linux.alibaba.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

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


