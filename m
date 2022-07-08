Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5EB56B84B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 13:19:45 +0200 (CEST)
Received: from localhost ([::1]:35148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9m1Q-0006dl-Ic
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 07:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9ljr-0001sS-8r
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 07:01:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9ljo-00033G-8j
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 07:01:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657278091;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CqGPGiN7JbNPOhgwQS2plm8OVZgUFcP5lYUQHjl+4cs=;
 b=PauvlpoxJlBeZHRvGbk0ACgEy51RbIKLvINilT6HTAMPW/nlPkaNUW7CeHzYRHLQbF0iLB
 JKJZlfDhlLe9Km4GMcTL7wRA8iVXlXSGK5hlNVzpJy1rmfwx2KzXH9rEypR6msDB2qSQ5g
 8ppaMnwh2RS1eFN3vB39lgp0f8oN+Fw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-6KHl8vSWNsyKIxdx3UWk1Q-1; Fri, 08 Jul 2022 07:01:28 -0400
X-MC-Unique: 6KHl8vSWNsyKIxdx3UWk1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE0EC3C0ED61;
 Fri,  8 Jul 2022 11:01:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 000ED40C141D;
 Fri,  8 Jul 2022 11:01:26 +0000 (UTC)
Date: Fri, 8 Jul 2022 12:01:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 peter.maydell@linaro.org
Subject: Re: [RFC PATCH] qobject: Rewrite implementation of QDict for
 in-order traversal
Message-ID: <YsgOhJLpbyODJCGG@redhat.com>
References: <20220705095421.2455041-1-armbru@redhat.com>
 <87wncqmq2t.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87wncqmq2t.fsf@pond.sub.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 06, 2022 at 01:35:22PM +0200, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
> > QDict is implemented as a simple hash table of fixed size.  Observe:
> >
> > * Slow for large n.  Not sure this matters.
> >
> > * A QDict with n entries takes 4120 + n * 32 bytes on my box.  Wastes
> >   space for small n, which is a common case.
> >
> > * Order of traversal depends on the hash function and on insertion
> >   order, because it iterates first over buckets, then collision
> >   chains.
> >
> > * Special code ensures qdict_size() takes constant time.
> >
> > Replace the hash table by a linked list.  Observe:
> >
> > * Even slower for large n.  Might be bad enough to matter.
> >
> > * A QDict with n entries takes 32 + n * 24 bytes.
> >
> > * Traversal is in insertion order.
> >
> > * qdict_size() is linear in the number of entries.
> >
> > This is an experiment.  Do not commit to master as is.
> 
> Forgot to mention: see also
> 
>         Subject: Re: [PULL 14/15] qdev: Base object creation on QDict rather than QemuOpts
>         Message-ID: <87wnctzdl9.fsf@pond.sub.org>
>         https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg00358.html

What alternative options do we have for addressing this scenario.

I can think of

  - Auto-create array elements, if seeing an element set before length.

    This is based on the theory that 'len-PROP' field is largely
    redundant. It is only needed if you want to create a sparse
    array, with empty elements /after/ the last one explicitly
    set, or if you want to get error reporting for an app setting
    element 3 after saying it wanted a 2 element list. IMHO the
    error reporting benefit is dubious, because the error scenario
    only exists because we made the app set this redundant 'len-PROP'
    attribute. Does anything actually need the 'sparse array'
    facility ?

  - Special case array properties

    Modify object_set_properties_from_qdict, so that it has a special
    case first iterating over any properties with 'len-' prefix in
    their name, then iterating over everything else.

    Assuming this 'len-' property is the only case where we genuinely
    have ordering dependancies between properties, this is quite a
    simple fix, and avoid imposes ordering requirements on either
    clients or QEMU in general.


  - Insertion order preserving QDict

    What you've done here, pushing the ordering problem off to be
    the caller's responsibility to get right. The caller could
    easily have the same problem though. For example, for CLI args
    these days, libvirt will populate a data structure based on
    QAPI, and then serialize that to CLI args. I don't know offhand
    if our code is insertion order preserving, or will hit this
    exact same problem. Luckily we don't support the 'rocker'
    object so havent hit this precise issue.


  - Any other options ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


