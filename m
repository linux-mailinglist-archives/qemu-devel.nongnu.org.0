Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E43156A5CD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 16:47:51 +0200 (CEST)
Received: from localhost ([::1]:57778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9SnF-0001dE-Gw
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 10:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9Sjb-0007kP-A7
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 10:44:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9SjW-00016o-NI
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 10:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657205034;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=og01h/Qo5TOUmsOV9Y8CzPB+tj1+EPwTRYciIbutTl4=;
 b=eiwWJhmyn95IM+qWi/k5VLcf5aFdiYgXsF1beVgb7Kp72QEPsTs6YBiY1AshnEAsjfFOQj
 1u1qOxVITjPhxb/w7gARAIpcevv7LpqpiRtScR+1MzMwjnxG9c+3jN7x+sefyXhVdLWnDW
 UkOq0BXwcssMRb2OOPFk9/negkAovIE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-_MJSvkYOOryBf6u18Liydg-1; Thu, 07 Jul 2022 10:43:50 -0400
X-MC-Unique: _MJSvkYOOryBf6u18Liydg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FB7C1019C91;
 Thu,  7 Jul 2022 14:43:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F4842026D2D;
 Thu,  7 Jul 2022 14:43:49 +0000 (UTC)
Date: Thu, 7 Jul 2022 15:43:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 peter.maydell@linaro.org
Subject: Re: [RFC PATCH] qobject: Rewrite implementation of QDict for
 in-order traversal
Message-ID: <YsbxIw01VsafRuqG@redhat.com>
References: <20220705095421.2455041-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220705095421.2455041-1-armbru@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
> 
> * A QDict with n entries takes 4120 + n * 32 bytes on my box.  Wastes
>   space for small n, which is a common case.
> 
> * Order of traversal depends on the hash function and on insertion
>   order, because it iterates first over buckets, then collision
>   chains.
> 
> * Special code ensures qdict_size() takes constant time.
> 
> Replace the hash table by a linked list.  Observe:
> 
> * Even slower for large n.  Might be bad enough to matter.
> 
> * A QDict with n entries takes 32 + n * 24 bytes.
> 
> * Traversal is in insertion order.
> 
> * qdict_size() is linear in the number of entries.
> 
> This is an experiment.  Do not commit to master as is.
> 
> The change of traversal order affects expected test output.  I updated
> only the tests covered by "make check" so far.  I expect some more to
> hide under tests/qemu-iotests/.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qapi/qmp/qdict.h              |  15 +-
>  qobject/qdict.c                       | 104 +--
>  tests/unit/check-qdict.c              |   2 +-
>  tests/unit/check-qobject.c            |   2 +-
>  tests/qemu-iotests/043.out            |  22 +-
>  tests/qemu-iotests/060.out            |  16 +-
>  tests/qemu-iotests/061.out            |  52 +-
>  tests/qemu-iotests/071.out            |   4 +-
>  tests/qemu-iotests/099.out            |   4 +-
>  tests/qemu-iotests/108.out            |  14 +-
>  tests/qemu-iotests/117.out            |   2 +-
>  tests/qemu-iotests/120.out            |   2 +-
>  tests/qemu-iotests/127.out            |  20 +-
>  tests/qemu-iotests/140.out            |   4 +-
>  tests/qemu-iotests/141.out            |  76 +--
>  tests/qemu-iotests/143.out            |   2 +-
>  tests/qemu-iotests/156.out            |  20 +-
>  tests/qemu-iotests/161.out            |  28 +-
>  tests/qemu-iotests/176.out            |  16 +-
>  tests/qemu-iotests/184.out            | 170 ++---
>  tests/qemu-iotests/186.out            |  82 +--
>  tests/qemu-iotests/190.out            |   4 +-
>  tests/qemu-iotests/191.out            | 868 +++++++++++++-------------
>  tests/qemu-iotests/195.out            |   4 +-
>  tests/qemu-iotests/229.out            |  14 +-
>  tests/qemu-iotests/244.out            |  12 +-
>  tests/qemu-iotests/249.out            |  18 +-
>  tests/qemu-iotests/tests/qsd-jobs.out |   8 +-
>  28 files changed, 776 insertions(+), 809 deletions(-)


> diff --git a/tests/qemu-iotests/061.out b/tests/qemu-iotests/061.out
> index 139fc68177..6a05d67378 100644
> --- a/tests/qemu-iotests/061.out
> +++ b/tests/qemu-iotests/061.out

>  === Testing version downgrade with external data file ===
> @@ -525,13 +525,13 @@ virtual size: 64 MiB (67108864 bytes)
>  cluster_size: 65536
>  Format specific information:
>      compat: 1.1
> -    compression type: COMPRESSION_TYPE
> -    lazy refcounts: false
> -    refcount bits: 16
>      data file: TEST_DIR/t.IMGFMT.data
>      data file raw: false
> -    corrupt: false
>      extended l2: false
> +    lazy refcounts: false
> +    corrupt: false
> +    refcount bits: 16
> +    compression type: COMPRESSION_TYPE
>  No errors were found on the image.

For this qemu-immg info output, I'd suggest that both the original
and new output orderings are undesirable.

Given it is human targetted, it would be better if this was emitted
in alphabetical order. This ought to be addressed in a separate
stanadlone patch though, since its unrelated to the QDict ordering,
just a pre-existing flaw.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


