Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B094C4859
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 16:11:10 +0100 (CET)
Received: from localhost ([::1]:37450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNcFR-0002mC-8Y
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 10:11:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nNbhF-0003o7-HZ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:35:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nNbhC-0001qs-Sa
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645799745;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Nmdmzh1Dogp3by0aurcVM3Ow6vwPOYtiuXNm15bQhE4=;
 b=g868R1wm4/o4o98TsE/TevhvVQHQ0GCrMQN68CgkLHT5xq0MhwxNndS70gw1wS9VzQk5lx
 PiENDqA1ygJUHClUWVQISNxBEq7FLuqMF/JKm6YjD9g7lZ21t01xzVNlWCLmvFXeXiDQJf
 Npw8l2Zrgv17cNzG5ehii5yQK84Ab70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-CnvNn60HOEahhiWZZq8oow-1; Fri, 25 Feb 2022 09:35:42 -0500
X-MC-Unique: CnvNn60HOEahhiWZZq8oow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 156D0180FD71;
 Fri, 25 Feb 2022 14:35:41 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4331F6FB03;
 Fri, 25 Feb 2022 14:35:39 +0000 (UTC)
Date: Fri, 25 Feb 2022 14:35:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] qom: assert integer does not overflow
Message-ID: <YhjpOHSW9L+RIX5A@redhat.com>
References: <20220225140955.63949-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220225140955.63949-1-mst@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Victor Tom <vv474172261@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 09:10:44AM -0500, Michael S. Tsirkin wrote:
> QOM reference counting is not designed with an infinite amount of
> references in mind, trying to take a reference in a loop will overflow
> the integer. We will then eventually assert when dereferencing, but the
> real problem is in object_ref so let's assert there to make such issues
> cleaner and easier to debug.

What is the actual bug / scenario that led you to hit this problem ?

I'm surprised you saw an assert in object_unref, as that would
imply you had exactly  UINT32_MAX calls to object_ref and then
one to object_unref.

> Some micro-benchmarking shows using fetch and add this is essentially
> free on x86.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  qom/object.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/qom/object.c b/qom/object.c
> index 4f0677cca9..5db3974f04 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -1167,10 +1167,14 @@ GSList *object_class_get_list_sorted(const char *implements_type,
>  Object *object_ref(void *objptr)
>  {
>      Object *obj = OBJECT(objptr);
> +    uint32_t ref;
> +
>      if (!obj) {
>          return NULL;
>      }
> -    qatomic_inc(&obj->ref);
> +    ref = qatomic_fetch_inc(&obj->ref);
> +    /* Assert waaay before the integer overflows */
> +    g_assert(ref < INT_MAX);

Not that I expect this to hit, but why choose this lower
bound instead of g_assert(ref > 0) which is the actual
failure scenario, matching the existing object_unref
assert.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


