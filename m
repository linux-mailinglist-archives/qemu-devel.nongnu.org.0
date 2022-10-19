Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1871603CCD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 10:52:43 +0200 (CEST)
Received: from localhost ([::1]:35744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol4oc-0004Ml-5h
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 04:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ol4eI-0005Hm-MH
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 04:42:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ol4eH-0003TP-0I
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 04:42:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666168918;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=oKpu6qjghaKt/rFc7hi2mG/mZDYst8Vd3qySVdYyvOE=;
 b=idZVAXFpgiysl9+HyCyDnRo+Dl2tMNH13kOjyJ9VphjeR3H5QTPtlzoGRYLEF/4HxsrajG
 U3m81dOhAtQmMvTF+hxpIvGcCq8wwpOxBTGLNaweYmBiDaBhjo7TD6rsPv90fGrHqq2mFj
 jLwXoONpyHli5LVXtTc4qyMg7xrpPxY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-XZbGrYmMPwWeSMY22tyzfw-1; Wed, 19 Oct 2022 04:41:55 -0400
X-MC-Unique: XZbGrYmMPwWeSMY22tyzfw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08DE2380608E;
 Wed, 19 Oct 2022 08:41:55 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43E22112131B;
 Wed, 19 Oct 2022 08:41:52 +0000 (UTC)
Date: Wed, 19 Oct 2022 09:41:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 1/3] util/main-loop: Fix maximum number of wait
 objects for win32
Message-ID: <Y0+4TW35JBbRiorv@redhat.com>
References: <20220824085231.1630804-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220824085231.1630804-1-bmeng.cn@gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Wed, Aug 24, 2022 at 04:52:29PM +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> The maximum number of wait objects for win32 should be
> MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> Changes in v3:
> - move the check of adding the same HANDLE twice to a separete patch
> 
> Changes in v2:
> - fix the logic in qemu_add_wait_object() to avoid adding
>   the same HANDLE twice
> 
>  util/main-loop.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/util/main-loop.c b/util/main-loop.c
> index f00a25451b..cb018dc33c 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -363,10 +363,10 @@ void qemu_del_polling_cb(PollingFunc *func, void *opaque)
>  /* Wait objects support */
>  typedef struct WaitObjects {
>      int num;
> -    int revents[MAXIMUM_WAIT_OBJECTS + 1];
> -    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
> -    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS + 1];
> -    void *opaque[MAXIMUM_WAIT_OBJECTS + 1];
> +    int revents[MAXIMUM_WAIT_OBJECTS];
> +    HANDLE events[MAXIMUM_WAIT_OBJECTS];
> +    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS];
> +    void *opaque[MAXIMUM_WAIT_OBJECTS];
>  } WaitObjects;
>  
>  static WaitObjects wait_objects = {0};
> @@ -395,6 +395,9 @@ void qemu_del_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
>          if (w->events[i] == handle) {
>              found = 1;
>          }
> +        if (i == MAXIMUM_WAIT_OBJECTS - 1) {
> +            break;
> +        }

Took me a while to realize this was protecting the body
of the next if from out of bounds access. Can we redo
this to make it explicit:

>          if (found) {

   if (found &&
       i < (MAXIMUM_WAIT_OBJECTS - 1)) {

>              w->events[i] = w->events[i + 1];
>              w->func[i] = w->func[i + 1];

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


