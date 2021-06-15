Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1123A8702
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:00:47 +0200 (CEST)
Received: from localhost ([::1]:37602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCQe-0003X8-SO
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltCO1-0000jw-AV
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:58:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ltCNy-00010b-UR
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623776277;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DA9iMZKKxhlAwe+2lYHJFfGwU94ISlk5DdpCjgDFOT8=;
 b=B5Zw3bBAJP3dwFgs/tAKqlb99uYxr7D59F4V7/fCvpohgJQaVNiz9083J9HGGm+OeWP2E3
 FkywmKGY+D0p3sB/2mTdYoKayJWVUvzXx1fSoHlTmErQZ9qFQROtFuACu+19+N/7BRRzdj
 fwmXOQ+fs3qx3csLACDZ6DBR9bPGUek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-hD7EMNV7MAqAknZGqOSNvQ-1; Tue, 15 Jun 2021 12:57:55 -0400
X-MC-Unique: hD7EMNV7MAqAknZGqOSNvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 901321054F92;
 Tue, 15 Jun 2021 16:57:54 +0000 (UTC)
Received: from redhat.com (ovpn-115-226.ams2.redhat.com [10.36.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1291A5C1C2;
 Tue, 15 Jun 2021 16:57:51 +0000 (UTC)
Date: Tue, 15 Jun 2021 17:57:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v3 7/7] block: detect DKIOCGETBLOCKCOUNT/SIZE before use
Message-ID: <YMjcDS5wWclfrQTx@redhat.com>
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-8-pbonzini@redhat.com>
 <f3a13026-8542-ef8f-c95d-c01698ce86d7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f3a13026-8542-ef8f-c95d-c01698ce86d7@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Joelle van Dyne <j@getutm.app>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 15, 2021 at 06:50:57PM +0200, Max Reitz wrote:
> On 03.06.21 15:37, Paolo Bonzini wrote:
> > From: Joelle van Dyne <j@getutm.app>
> > 
> > iOS hosts do not have these defined so we fallback to the
> > default behaviour.
> > 
> > Co-authored-by: Warner Losh <imp@bsdimp.com>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > Message-Id: <20210315180341.31638-4-j@getutm.app>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >   block/file-posix.c | 21 +++++++++------------
> >   1 file changed, 9 insertions(+), 12 deletions(-)
> > 
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 5821e1afed..4e2f7cf508 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -2322,8 +2322,11 @@ static int64_t raw_getlength(BlockDriverState *bs)
> >   again:
> >   #endif
> >       if (!fstat(fd, &sb) && (S_IFCHR & sb.st_mode)) {
> > +        size = 0;
> >   #ifdef DIOCGMEDIASIZE
> > -        if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
> > +        if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size)) {
> 
> Pre-existing, but I feel compelled to express my unease about this cast.

We set -D_FILE_OFFSET_BITS=64, so IIUC,  off_t should be 64-bits
on both 32 and 64 bit build hosts. IIUC, it is defined to be a
signed integer.  So while off_t may not have the same typedef
as int64_t, it should be the same size and signedness. I expect
we have other code with this same assumption about off-t/int64_t
interchangeability.

We could assert sizeof(int64_t) == sizeof(off_t) in a header
somewhere if we want to be super paranoid.

> 
> > +            size = 0;
> > +        }
> >   #elif defined(DIOCGPART)
> >           {
> >                   struct partinfo pi;
> > @@ -2332,9 +2335,7 @@ again:
> >                   else
> >                           size = 0;
> >           }
> > -        if (size == 0)
> > -#endif
> > -#if defined(__APPLE__) && defined(__MACH__)
> > +#elif defined(DKIOCGETBLOCKCOUNT) && defined(DKIOCGETBLOCKSIZE)
> 
> As far a I can tell, before this patch, if the DIOCGMEDIASIZE ioctl failed,
> we fell back to this DKIOCGETBLOCKCOUNT/SIZE block (if compiled in). Now
> this is an #elif and so will not be used if DIOCGMEDIASIZE was defined. Is
> that intentional?
> 
> This may be fine, and apart from that, this patch looks good to me, but this
> change in behavior wasn’t mentioned in the commit message, hence me asking.
> 
> >           {
> >               uint64_t sectors = 0;
> >               uint32_t sector_size = 0;
> > @@ -2342,19 +2343,15 @@ again:
> >               if (ioctl(fd, DKIOCGETBLOCKCOUNT, &sectors) == 0
> >                  && ioctl(fd, DKIOCGETBLOCKSIZE, &sector_size) == 0) {
> >                   size = sectors * sector_size;
> > -            } else {
> > -                size = lseek(fd, 0LL, SEEK_END);
> > -                if (size < 0) {
> > -                    return -errno;
> > -                }
> >               }
> >           }
> > -#else
> > -        size = lseek(fd, 0LL, SEEK_END);
> > +#endif
> > +        if (size == 0) {
> > +            size = lseek(fd, 0LL, SEEK_END);
> > +        }
> >           if (size < 0) {
> >               return -errno;
> >           }
> > -#endif
> >   #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
> >           switch(s->type) {
> >           case FTYPE_CD:
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


