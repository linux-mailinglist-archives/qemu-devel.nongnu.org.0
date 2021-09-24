Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7E7417A6E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 20:03:52 +0200 (CEST)
Received: from localhost ([::1]:35710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTpY7-0004e6-9B
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 14:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mTpFF-0005vV-P1
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:44:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mTpFD-0002MG-UO
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 13:44:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632505459;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=GFVt9d3ddoom3pnlch+7K8uOMJ+F5px993/UQwC4e24=;
 b=dbgmEcRCekFnvoNaIZ3ewHgFL74aw2rOhPBNHgQXTKWC+D6m2Y6FWKriUkYtdyc+lqaIUH
 fC0xnDTmocLzLkcWFzQ20sWSiI3lw5X2+i4YXvIMinGkuxWWgBlAj88uLz0hRAQnpZuIed
 NNT/941FjGgzXCU48clMfv1xiJr5lDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-P1E4Y2S7MPOPl4lJlsDcfw-1; Fri, 24 Sep 2021 13:44:17 -0400
X-MC-Unique: P1E4Y2S7MPOPl4lJlsDcfw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCE7B1084681
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 17:44:16 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB36E60622;
 Fri, 24 Sep 2021 17:43:51 +0000 (UTC)
Date: Fri, 24 Sep 2021 18:43:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v3 3/3] multifd: Send using asynchronous write on nocomp
 to send RAM pages.
Message-ID: <YU4OVZLo8oSpGrdI@redhat.com>
References: <20210922222423.644444-1-leobras@redhat.com>
 <20210922222423.644444-4-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210922222423.644444-4-leobras@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 07:24:23PM -0300, Leonardo Bras wrote:
> Change multifd nocomp version to use asynchronous write for RAM pages, and
> benefit of MSG_ZEROCOPY when it's available.
> 
> The asynchronous flush happens on cleanup only, before destroying the QIOChannel.
> 
> This will work fine on RAM migration because the RAM pages are not usually freed,
> and there is no problem on changing the pages content between async_send() and
> the actual sending of the buffer, because this change will dirty the page and
> cause it to be re-sent on a next iteration anyway.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/multifd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 377da78f5b..d247207a0a 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -105,7 +105,7 @@ static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
>   */
>  static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
>  {
> -    return qio_channel_writev_all(p->c, p->pages->iov, used, errp);
> +    return qio_channel_async_writev_all(p->c, p->pages->iov, used, errp);
>  }

This needs to be made conditional so zeroopy is only used if rquested
by the mgmt app, and it isn't going to work in all cases (eg TLS) so
silently enabling it is not good.

>  
>  /**
> @@ -546,6 +546,7 @@ void multifd_save_cleanup(void)
>          MultiFDSendParams *p = &multifd_send_state->params[i];
>          Error *local_err = NULL;
>  
> +        qio_channel_async_flush(p->c, NULL);
>          socket_send_channel_destroy(p->c);
>          p->c = NULL;
>          qemu_mutex_destroy(&p->mutex);

This isn't reliable beucase qio_channel_async_flush will return early
even if not everything is flushed.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


