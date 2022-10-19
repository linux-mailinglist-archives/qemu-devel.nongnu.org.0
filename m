Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2863B603C5A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 10:46:10 +0200 (CEST)
Received: from localhost ([::1]:54666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol4iG-0007qe-AN
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 04:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ol4Vh-0008Cz-Pw
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 04:33:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ol4VR-0002F9-B1
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 04:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666168371;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qpOKuP+e8Eb5jBjMbSZySJHpVCQtUQK5cy2j1mzQtKU=;
 b=HXHDxnFMaGCAk/y2Q1ysksqUWPbJFwboSw11GoXg23gyUMWGRdyWGMKzBaffDFNybaSjGg
 RvbW49QKMkejRpBJC4ksb4JVr1D4rRwzf9j1MhaYqb1TCgkIfUUFeXEEpZuwMGCSn3WZkO
 FJAptB38qQy1H3Y4xrfa7PnBDHChZL8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-ByZSd2SaOOOWRmXzNItksQ-1; Wed, 19 Oct 2022 04:32:48 -0400
X-MC-Unique: ByZSd2SaOOOWRmXzNItksQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F309F811E84;
 Wed, 19 Oct 2022 08:32:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C7C6111E3FF;
 Wed, 19 Oct 2022 08:32:46 +0000 (UTC)
Date: Wed, 19 Oct 2022 09:32:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 2/3] util/main-loop: Avoid adding the same HANDLE twice
Message-ID: <Y0+2LOluAkuIN0BF@redhat.com>
References: <20220824085231.1630804-1-bmeng.cn@gmail.com>
 <20220824085231.1630804-2-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220824085231.1630804-2-bmeng.cn@gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, Aug 24, 2022 at 04:52:30PM +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Fix the logic in qemu_add_wait_object() to avoid adding the same
> HANDLE twice, as the behavior is undefined when passing an array
> that contains same HANDLEs to WaitForMultipleObjects() API.

Have you encountered this problem in the real world, or is this
just a flaw you spotted through code inspection ?

Essentially I'm wondering if there's any known caller that is
making this mistake of adding it twice ?

> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> Changes in v3:
> - new patch: avoid adding the same HANDLE twice
> 
>  include/qemu/main-loop.h |  2 ++
>  util/main-loop.c         | 10 ++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index c50d1b7e3a..db8d380550 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -157,6 +157,8 @@ typedef void WaitObjectFunc(void *opaque);
>   * in the main loop's calls to WaitForMultipleObjects.  When the handle
>   * is in a signaled state, QEMU will call @func.
>   *
> + * If the same HANDLE is added twice, this function returns -1.
> + *
>   * @handle: The Windows handle to be observed.
>   * @func: A function to be called when @handle is in a signaled state.
>   * @opaque: A pointer-size value that is passed to @func.
> diff --git a/util/main-loop.c b/util/main-loop.c
> index cb018dc33c..dae33a8daf 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -373,10 +373,20 @@ static WaitObjects wait_objects = {0};
>  
>  int qemu_add_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
>  {
> +    int i;
>      WaitObjects *w = &wait_objects;
> +
>      if (w->num >= MAXIMUM_WAIT_OBJECTS) {
>          return -1;
>      }
> +
> +    for (i = 0; i < w->num; i++) {
> +        /* check if the same handle is added twice */
> +        if (w->events[i] == handle) {
> +            return -1;
> +        }
> +    }
> +
>      w->events[w->num] = handle;
>      w->func[w->num] = func;
>      w->opaque[w->num] = opaque;
> -- 
> 2.34.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


