Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD52A604CD3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 18:12:01 +0200 (CEST)
Received: from localhost ([::1]:37088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBfd-0001IS-2c
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 12:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1olBST-0000S8-L0
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:58:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1olBSO-0000fw-0X
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666195090;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=iRnlB8kXCZEFF8GkMhD0+xXcb49Eju+WDNBiM3rxI1U=;
 b=aGbrMY8eSoco4BV6Rf1cecQK5QoIGuBpB899hnLaZnoYcLd30UOkcw9NA7bzm+DyKJ7xj0
 xh4+Lk4jjeDU153Fo1ndwaMHz6kuE0TGOVRFQz+VOeD7bV0JZsK+le1gVDNp96WRKG7jJc
 zFQ8bQQ33ef9QMeDDQ5ACqErm8w+BJo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-Ix7MvLAuOpmnN0yYFDRIlw-1; Wed, 19 Oct 2022 11:58:09 -0400
X-MC-Unique: Ix7MvLAuOpmnN0yYFDRIlw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E11A91C0A585;
 Wed, 19 Oct 2022 15:58:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21ACF40C94EC;
 Wed, 19 Oct 2022 15:57:58 +0000 (UTC)
Date: Wed, 19 Oct 2022 16:57:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/2] util/log: Derive thread id from getpid() on hosts
 w/o gettid() syscall
Message-ID: <Y1AeglCfb6SHaf4N@redhat.com>
References: <20221019151651.334334-1-groug@kaod.org>
 <20221019151651.334334-2-groug@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221019151651.334334-2-groug@kaod.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Oct 19, 2022 at 05:16:50PM +0200, Greg Kurz wrote:
> A subsequent patch needs to be able to differentiate the main QEMU
> thread from other threads. An obvious way to do so is to compare
> log_thread_id() and getpid(), based on the fact that they are equal
> for the main thread on systems that have the gettid() syscall (e.g.
> linux).
> 
> Adapt the fallback code for systems without gettid() to provide the
> same assumption.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  util/log.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/util/log.c b/util/log.c
> index d6eb0378c3a3..e1c2535cfcd2 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -72,8 +72,13 @@ static int log_thread_id(void)
>  #elif defined(SYS_gettid)
>      return syscall(SYS_gettid);
>  #else
> +    static __thread int my_id = -1;
>      static int counter;
> -    return qatomic_fetch_inc(&counter);
> +
> +    if (my_id == -1) {
> +        my_id = getpid() + qatomic_fetch_inc(&counter);
> +    }
> +    return my_id;

This doesn't look safe for linux-user when we fork, but don't exec.

The getpid() will change after the fork, but counter won't be
reset, so a thread in the parent could clash with a thread
in the forked child.

I feel like if we want to check for the main thread, we should
be using pthread_self(), and compare result against the value
cached from main. Or cache in a __constructor__ function in
log.c to keep it isolated from main().


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


