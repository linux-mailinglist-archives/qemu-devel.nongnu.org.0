Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C203D132831
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 14:56:15 +0100 (CET)
Received: from localhost ([::1]:49188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iopLB-0003sn-EN
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 08:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55460)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1ionty-0004PA-Oo
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:24:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iontx-0007yv-HJ
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:24:02 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56740
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iontx-0007ya-Cx
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 07:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578399841;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oC07tjMNCb6/KY8QuP2S6Zj4G5pWsRSrG7Ans7trRLU=;
 b=iEybUa6haOMLQX9+pND+Nn6qVhyw3nxehbZLsja+m5p+dZ3wR/FZPPyVBvy1nfzZcZMFib
 9ay48qqMPX3HkSOop+4x89e5V2BSJO8kpy7RSx6zrqEhMk16qxVQJHPpAtHmKVaJEeB+VR
 ydNkXRh2xhFsYotlK+pTcHCQwxrD28I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-RIayX67HN6m4L48ZGlGUwA-1; Tue, 07 Jan 2020 07:23:56 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 419D4477
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 12:23:55 +0000 (UTC)
Received: from redhat.com (ovpn-112-61.ams2.redhat.com [10.36.112.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7686A272AA;
 Tue,  7 Jan 2020 12:23:51 +0000 (UTC)
Date: Tue, 7 Jan 2020 12:23:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 099/104] virtiofsd: use fuse_buf_writev to replace
 fuse_buf_write for better performance
Message-ID: <20200107122347.GI3368802@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
 <20191212163904.159893-100-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191212163904.159893-100-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: RIayX67HN6m4L48ZGlGUwA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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

On Thu, Dec 12, 2019 at 04:38:59PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: piaojun <piaojun@huawei.com>
>=20
> fuse_buf_writev() only handles the normal write in which src is buffer
> and dest is fd. Specially if src buffer represents guest physical
> address that can't be mapped by the daemon process, IO must be bounced
> back to the VMM to do it by fuse_buf_copy().
>=20
> Signed-off-by: Jun Piao <piaojun@huawei.com>
> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tools/virtiofsd/buffer.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

>=20
> diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
> index ae420c70c4..4875473785 100644
> --- a/tools/virtiofsd/buffer.c
> +++ b/tools/virtiofsd/buffer.c
> @@ -33,9 +33,7 @@ size_t fuse_buf_size(const struct fuse_bufvec *bufv)
>      return size;
>  }
> =20
> -__attribute__((unused))
> -static ssize_t fuse_buf_writev(fuse_req_t req,

Lets cull the fuse_req_t param in the previous patch

> -                               struct fuse_buf *out_buf,
> +static ssize_t fuse_buf_writev(struct fuse_buf *out_buf,
>                                 struct fuse_bufvec *in_buf)
>  {
>      ssize_t res, i, j;

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|


