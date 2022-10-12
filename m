Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62F15FC4F9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 14:07:11 +0200 (CEST)
Received: from localhost ([::1]:47830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiaVv-00045q-7n
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 08:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiaSF-0000hD-J5
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:03:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiaS2-0004mw-G4
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:03:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665576185;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/Yy1WvOvS7nLxgQLG84PvIhn8CgeBuDVqJ+j42tI3LE=;
 b=SzdqYQRSNx0ZZTrOB51DYV1MZc6kgC2BQIWEYkDvlh3RQukV6NOjHp85vgmzIjPeQz0wUD
 vs408TbasQaPrOftS9FJQSCbXd9RtsRX875rD25P8GAQAJlRUJGHBRjuUGkWOdFkif5Trr
 vxJqalVPTcZg1wPMwGDjn8WmgE6piPk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-_21VavnvN6qCa2V-AmvGDg-1; Wed, 12 Oct 2022 08:03:02 -0400
X-MC-Unique: _21VavnvN6qCa2V-AmvGDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E4D63C14841;
 Wed, 12 Oct 2022 12:03:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D17282156A21;
 Wed, 12 Oct 2022 12:03:00 +0000 (UTC)
Date: Wed, 12 Oct 2022 13:02:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com
Subject: Re: [PATCH] migration/channel-block: fix return value for
 qio_channel_block_{readv, writev}
Message-ID: <Y0asvufIM2hZgGau@redhat.com>
References: <20221012111935.117480-1-f.ebner@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221012111935.117480-1-f.ebner@proxmox.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 12, 2022 at 01:19:35PM +0200, Fiona Ebner wrote:
> in the error case. The documentation in include/io/channel.h states
> that -1 or QIO_CHANNEL_ERR_BLOCK should be returned upon error. Simply
> passing along the return value from the bdrv-functions has the
> potential to confuse the call sides. Non-blocking mode is not
> implemented currently, so -1 it is.

Opps, yes, my bad in writing this code.

> 
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> ---
>  migration/channel-block.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/channel-block.c b/migration/channel-block.c
> index c55c8c93ce..aabc4634a4 100644
> --- a/migration/channel-block.c
> +++ b/migration/channel-block.c
> @@ -62,7 +62,8 @@ qio_channel_block_readv(QIOChannel *ioc,
>      qemu_iovec_init_external(&qiov, (struct iovec *)iov, niov);
>      ret = bdrv_readv_vmstate(bioc->bs, &qiov, bioc->offset);
>      if (ret < 0) {
> -        return ret;
> +        error_setg(errp, "bdrv_readv_vmstate returned error %d", ret);

IIUC,  the bdrv functions return errno, so should use

    error_setg_errno(errp, -ret, "bdrv_readv_vmstate returned error");


>      bioc->offset += qiov.size;
> @@ -86,7 +87,8 @@ qio_channel_block_writev(QIOChannel *ioc,
>      qemu_iovec_init_external(&qiov, (struct iovec *)iov, niov);
>      ret = bdrv_writev_vmstate(bioc->bs, &qiov, bioc->offset);
>      if (ret < 0) {
> -        return ret;
> +        error_setg(errp, "bdrv_writev_vmstate returned error %d", ret);
> +        return -1;
>      }
>  
>      bioc->offset += qiov.size;
> -- 
> 2.30.2
> 
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


