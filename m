Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242A02D599D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:49:58 +0100 (CET)
Received: from localhost ([::1]:33216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKSK-0001Re-Ev
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1knKPv-0000if-Pd
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:47:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1knKPs-0006hs-Ks
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:47:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607600843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9gKm5v1sRzv2f2CSXVYbei/yOwHFnugpi7wKZdqwDk=;
 b=MIZr6oQWDr6u0z/duhNKa+mG6ZPzEcpW0f0YurNz5XvyYM3l2UTnlTRQzVxZmQlKKKkjAb
 B6EkqGRVteid/IrU48tSkWuhvtL+i6buTz08y/MSPLMzIcUG57xOKOmK/5+CSMvbXtZRwL
 SPsZFa/KrwTFppsOR2gOMgWTqOfI/x4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-E6PdSPZ4Ozepy-oR-y3w6g-1; Thu, 10 Dec 2020 06:47:21 -0500
X-MC-Unique: E6PdSPZ4Ozepy-oR-y3w6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 729C0100C60B;
 Thu, 10 Dec 2020 11:47:20 +0000 (UTC)
Received: from starship (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1A69100AE3F;
 Thu, 10 Dec 2020 11:47:16 +0000 (UTC)
Message-ID: <21389a95e4265f17fbc28490858bd1ec54798c63.camel@redhat.com>
Subject: Re: [PATCH v5 2/4] block: add bdrv_co_delete_file_noerr
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, 
 qemu-devel@nongnu.org
Date: Thu, 10 Dec 2020 13:47:14 +0200
In-Reply-To: <c6bcf0e0-c3b6-89d8-9587-a5e43a7ccee4@virtuozzo.com>
References: <20201209203326.879381-1-mlevitsk@redhat.com>
 <20201209203326.879381-3-mlevitsk@redhat.com>
 <c6bcf0e0-c3b6-89d8-9587-a5e43a7ccee4@virtuozzo.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-12-10 at 13:54 +0300, Vladimir Sementsov-Ogievskiy wrote:
> 09.12.2020 23:33, Maxim Levitsky wrote:
> > This function wraps bdrv_co_delete_file for the common case of removing a file,
> > which was just created by format driver, on an error condition.
> > 
> > It hides the -ENOTSUPP error, and reports all other errors otherwise.
> 
> I've looked at original commit added this logic, and didn't find exactly, why should we hide it..
> 
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > Reviewed-by: Alberto Garcia <berto@igalia.com>
> > ---
> >   block.c               | 24 ++++++++++++++++++++++++
> >   include/block/block.h |  1 +
> >   2 files changed, 25 insertions(+)
> > 
> > diff --git a/block.c b/block.c
> > index f1cedac362..5d35ba2fb8 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -704,6 +704,30 @@ int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp)
> >       return ret;
> >   }
> >   
> > +void coroutine_fn bdrv_co_delete_file_noerr(BlockDriverState *bs)
> > +{
> > +    Error *local_err = NULL;
> > +    int ret;
> > +
> > +    if (!bs) {
> > +        return;
> > +    }
> > +
> > +    ret = bdrv_co_delete_file(bs, &local_err);
> > +    /*
> > +     * ENOTSUP will happen if the block driver doesn't support
> > +     * the 'bdrv_co_delete_file' interface. This is a predictable
> > +     * scenario and shouldn't be reported back to the user.
> > +     */
> 
> It's not predictable for user: user doesn't know internal processes and interfaces.
> 
> The problem: we've left extra file on failure scenario and can't remove it. We want to warn the user that there is a wrong file left. Why not to warn, when the removement is unsupported internally by the driver?
> 
> I think, it's better to report it in any case.

This is a good point, but it is not something I changed.
I prefer this to be changed in a separate patch.


> 
> Another reason: less code and logic on failure case. Optimizing failure scenarios in different manner is seldom a good thing to do.
> 
> And finally: why to report the error at all? If we have errp parameter, it's better to add the info to it using error_append.. something like error_append(errp, " (also failed to remove unfinished file %s: %s)", file_name, error_get_pretty(local_err))

The idea behind this was to reduce code duplication in the callers of this function,
and this is why this function doesn't even have the 'errp' parameter.
I'll think about it.

> 
> 
> Probably I'm making mountains out of molehills. It should work, so take my r-b anyway:
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
> 
> Side note: I'd not split patches 02 and 03: this way it would be simpler to see the code movement.
> 
> > +    if (ret == -ENOTSUP) {
> > +        error_free(local_err);
> > +    } else if (ret < 0) {
> > +        error_report_err(local_err);
> > +    }
> > +}
> > +
> > +
> > +
> 
> three empty lines..

Will fix.
> 
> >   /**
> >    * Try to get @bs's logical and physical block size.
> >    * On success, store them in @bsz struct and return 0.
> > diff --git a/include/block/block.h b/include/block/block.h
> > index c9d7c58765..af03022723 100644
> > --- a/include/block/block.h
> > +++ b/include/block/block.h
> > @@ -428,6 +428,7 @@ int bdrv_freeze_backing_chain(BlockDriverState *bs, BlockDriverState *base,
> >                                 Error **errp);
> >   void bdrv_unfreeze_backing_chain(BlockDriverState *bs, BlockDriverState *base);
> >   int coroutine_fn bdrv_co_delete_file(BlockDriverState *bs, Error **errp);
> > +void coroutine_fn bdrv_co_delete_file_noerr(BlockDriverState *bs);
> >   
> >   
> >   typedef struct BdrvCheckResult {
> > 

Thanks a lot for the review!

Best regards,
	Maxim Levitsky

> 
> 



