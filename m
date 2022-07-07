Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D60556A736
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 17:44:03 +0200 (CEST)
Received: from localhost ([::1]:35674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Tfd-0002C4-Om
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 11:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9Ta0-00050C-8v
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:38:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9TZv-0001Xg-PY
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657208285;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mgZEtcJqWah1MC6Xk/84jfJA7jA09sA9goWzW6703Zw=;
 b=ifQFTWw+VSBrqZBhELivauXep/N8fGpadPApt2y8xFjV0rd6B2DSgSpMpvbXrJGjvBv3lV
 9Bw0T5NqdG938/JDkA5WO5kt9OIJ2IYcN/z5hTnPDpUvZvSkPzznZNCwWYzXP2Lugv8crp
 8ip8ZedJcDGeP1/H5TZOOgwy2lCmAW8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-kabq8KtHMYeIgSoOPJNwWw-1; Thu, 07 Jul 2022 11:38:02 -0400
X-MC-Unique: kabq8KtHMYeIgSoOPJNwWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1C443806656;
 Thu,  7 Jul 2022 15:38:01 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76E9E1121315;
 Thu,  7 Jul 2022 15:38:00 +0000 (UTC)
Date: Thu, 7 Jul 2022 16:37:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 peter.maydell@linaro.org
Subject: Re: [RFC PATCH] qobject: Rewrite implementation of QDict for
 in-order traversal
Message-ID: <Ysb91P/X8WO7y3h+@redhat.com>
References: <20220705095421.2455041-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220705095421.2455041-1-armbru@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

On Tue, Jul 05, 2022 at 11:54:21AM +0200, Markus Armbruster wrote:
> QDict is implemented as a simple hash table of fixed size.  Observe:
> 
> * Slow for large n.  Not sure this matters.

I presume you're referring qdict_find() here, which would
ideally be O(1).

Our bucket size is 512, so for hash tables less than say
2000, it is close enough to O(1) that it likely doesn't
matter (except for our deterministic hash function which
can be abused to overfill specific buckets).

Ignoring the latter attack though, the fixed hash bucket
count isn't likely a speed issue for normal usage as our
QDict element counts are just not that big typically. So
it is mostly a memory wastage issue.


Historically QEMU's JSON input has come from sources that
are more trusted than QEMU itself, so didn't matter. As
we split up QEMU into co-operating processes with potentially
varying privileges, this may cease to be a safe assumption.

For pre-emptive robustness though I'd favour a guaranteed
O(1) impl, which would mean a dynamically resizing bucket
count, along with a non-deterministic (ideally cryptographically
strong) key hash function.

> * A QDict with n entries takes 4120 + n * 32 bytes on my box.  Wastes
>   space for small n, which is a common case.

So effectively 8k usage for every QDict instance at a minimum.
This is not so great with widespread QDict usage.

> * Order of traversal depends on the hash function and on insertion
>   order, because it iterates first over buckets, then collision
>   chains.
> 
> * Special code ensures qdict_size() takes constant time.
> 
> Replace the hash table by a linked list.  Observe:
> 
> * Even slower for large n.  Might be bad enough to matter.

Guaranteed O(n) every time, even for small values of 'n'.
Just feels like a bad idea to me.

> * A QDict with n entries takes 32 + n * 24 bytes.
> 
> * Traversal is in insertion order.
> 
> * qdict_size() is linear in the number of entries.
> 
> This is an experiment.  Do not commit to master as is.

Two alternative ideas.

 * Implement it is both a hashtable and a linked list.
   Hashtable to get O(1) lookup, linked list to get
   stable iteration order based on insertion order.
   Makes the insert/delete operations more expensive,
   and slightly greater memory overhead.

 * Merely change the users to apply the ordering they
   require when iterating.

In both those cases, I'd suggest we consider use of GHashTable, to give
us a more dynamic hash table impl with resizing buckets, so it is more
memory efficient and stronger guarantee of O(1) lookups. It also quite
simple to iterate over the keys in a fixed order, as you can get a GList
of keys, and invoke g_list_sort with any comparator. While we could add
more APIs to do this with QDict and QLIST, re-inventing the wheel feels
dubious unless there's a compelling benefit to our existing impl.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


