Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FC54111AA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 11:07:16 +0200 (CEST)
Received: from localhost ([::1]:48124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSFGd-0008Ny-7J
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 05:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mSFDN-00068i-9x
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 05:03:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mSFDK-0007O6-Hn
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 05:03:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632128629;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nbCVcmNe+GYNaHRmEXHlx+O0um7vsX+kVb9zQ0yCEII=;
 b=f/tSEI1w8y0OI7t7Omjytc3/arqmHdSXekyIFpmPr/TUrOf6bacWHiEJwsHcAh7BHpVS7Q
 x5DXQwpe5rl4QxLo1gLUsjMkew14JFWTiNmsSMvGKmRExeF9Acm23sCuYlA65SazcHsTuC
 ju6sv70denlF/rwRrulrUAvxL6eWX3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-qe-s-pR1M4imMEROx2EakQ-1; Mon, 20 Sep 2021 05:03:39 -0400
X-MC-Unique: qe-s-pR1M4imMEROx2EakQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D4579126D;
 Mon, 20 Sep 2021 09:03:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C67836A257;
 Mon, 20 Sep 2021 09:03:36 +0000 (UTC)
Date: Mon, 20 Sep 2021 10:03:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: lishan <lishan24@huawei.com>
Subject: Re: [PATCH] block/file-posix: Limit max_iov to IOV_MAX
Message-ID: <YUhOZuo2kclYpKZ+@redhat.com>
References: <20210918040658.19484-1-lishan24@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210918040658.19484-1-lishan24@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, eric.fangyi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC'ing qemu-block list

On Sat, Sep 18, 2021 at 12:06:58PM +0800, lishan wrote:
> AIO read/write. The size of iocb->aio_nbytes in the kernel cannot exceed UIO_MAXIOV = 1024.
> max_segments read from the block device layer may be greater than UIO_MAXIOV,
> this causes the ioq_submit interface to return a -22(-EINVAL) error result.
> ---
>  block/file-posix.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index d81e15efa4..137e27e47b 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1273,7 +1273,8 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  
>          ret = hdev_get_max_segments(s->fd, &st);
>          if (ret > 0) {
> -            bs->bl.max_iov = ret;
> +            /* The maximum segment size allowed by the kernel is UIO_MAXIOV = 1024. */
> +            bs->bl.max_iov = MIN(ret, IOV_MAX);

This change matches a bug fix we've done downstream for QEMU, but it
was suggested that the upstream patch would be taking a different
approach for a more comprehensive fix.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


