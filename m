Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F1D3A1ACC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:19:20 +0200 (CEST)
Received: from localhost ([::1]:48992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0vH-0003WO-AD
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lr0lH-0005X7-VF
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:08:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lr0lE-0003Ji-MP
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623254934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+WS+IaGzl19s2POldLl138JzAs8hfNQ5NqmLdEyfYc=;
 b=UdkmALw0tDDrvJQS+ssgw5YtWcUqBxpAKwO68xk/t6IiCYDyISMLerInqoaOQVcgO23qeR
 Ee9LaihX/ZCTpOXgGYcFOJyuFoLgMBXLMtFvzoMPRgeJOeLYYxCh7FuO8+ux3gP57kMusd
 hjXwqnJILUHroKR1LbOfPDhINbjKjU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-r3xwO88rMFOb7Hv0utIZFA-1; Wed, 09 Jun 2021 12:08:51 -0400
X-MC-Unique: r3xwO88rMFOb7Hv0utIZFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEF51100C610;
 Wed,  9 Jun 2021 16:08:49 +0000 (UTC)
Received: from starship (unknown [10.40.194.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93E5A18A9E;
 Wed,  9 Jun 2021 16:08:47 +0000 (UTC)
Message-ID: <c542ac2a60adeff0cfa4d11c1749550a7c210be2.camel@redhat.com>
Subject: Re: [PATCH v4 1/7] file-posix: fix max_iov for /dev/sg devices
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-devel@nongnu.org
Date: Wed, 09 Jun 2021 19:08:46 +0300
In-Reply-To: <c8fcf5db-fe39-a2f7-08a6-95ed29619704@virtuozzo.com>
References: <20210608131634.423904-1-pbonzini@redhat.com>
 <20210608131634.423904-2-pbonzini@redhat.com>
 <c8fcf5db-fe39-a2f7-08a6-95ed29619704@virtuozzo.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 Tom Yan <tom.ty89@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-06-08 at 22:14 +0300, Vladimir Sementsov-Ogievskiy wrote:
> 08.06.2021 16:16, Paolo Bonzini wrote:
> > Even though it was only called for devices that have bs->sg set (which
> > must be character devices), sg_get_max_segments looked at /sys/dev/block
> > which only works for block devices.
> > 
> > On Linux the sg driver has its own way to provide the maximum number of
> > iovecs in a scatter/gather list, so add support for it.  The block device
> > path is kept because it will be reinstated in the next patches.
> > 
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >   block/file-posix.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> > 
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index f37dfc10b3..536998a1d6 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -1180,6 +1180,17 @@ static int sg_get_max_segments(int fd)
> >           goto out;
> >       }
> >   
> > +    if (S_ISCHR(st.st_mode)) {
> 
> Why not check "if (bs->sg) {" instead? It seems to be more consistent with issuing SG_ ioctl. Or what I miss?

I also think so. Actually the 'hdev_is_sg' has a check for character device as well, 
in addition to a few more checks that make sure that we are really 
dealing with the quirky /dev/sg character device.

> 
> > +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
> > +            return ret;
> > +        }
> > +        return -ENOTSUP;
> > +    }
> > +
> > +    if (!S_ISBLK(st.st_mode)) {
> > +        return -ENOTSUP;
> > +    }
> > +
> >       sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
> >                                   major(st.st_rdev), minor(st.st_rdev));
> >       sysfd = open(sysfspath, O_RDONLY);
> > 
> 
> 

Other than that, this is the same as the patch from Tom Yan:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg768262.html

In this version he does check if the SG_GET_SG_TABLESIZE is defined, so
you might want to do this as well.


Best regards,
	Maxim Levitsky




