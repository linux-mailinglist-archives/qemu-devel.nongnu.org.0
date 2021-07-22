Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BDE3D24AE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 15:34:53 +0200 (CEST)
Received: from localhost ([::1]:50702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Yqi-00033V-Cf
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 09:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6YoM-0001mL-O0
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:32:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6YoJ-0006HB-TU
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626960741;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZDlczSNMz5EPOgf3DKOLEEgxrLLQSaG296qXRm2oNSY=;
 b=C6loP7Ctj0wuixhCg3Dht0FQaWvxVRtUbovflBUz4yt9tnAw5Ls/puyZ7UWPGzYajL8QDz
 FYRcjYrvFEjVJaBgEfdYXc+yu/cjNWWOtGYhNKPwprMlSfldrvZaTd2Kz0kFauzjsxO92z
 PdgxGyeWvzJaROJb23txtJ0iU/mxb9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-b0U0xUWePNqv_feT2pRTkQ-1; Thu, 22 Jul 2021 09:32:15 -0400
X-MC-Unique: b0U0xUWePNqv_feT2pRTkQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4688A8C8906;
 Thu, 22 Jul 2021 13:32:14 +0000 (UTC)
Received: from redhat.com (ovpn-114-245.ams2.redhat.com [10.36.114.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8819510023AF;
 Thu, 22 Jul 2021 13:31:43 +0000 (UTC)
Date: Thu, 22 Jul 2021 14:31:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 1/6] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
Message-ID: <YPlzPKCqMZ40z8zY@redhat.com>
References: <20210722123635.60608-1-david@redhat.com>
 <20210722123635.60608-2-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210722123635.60608-2-david@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 02:36:30PM +0200, David Hildenbrand wrote:
> Let's sense support and use it for preallocation. MADV_POPULATE_WRITE
> does not require a SIGBUS handler, doesn't actually touch page content,
> and avoids context switches; it is, therefore, faster and easier to handle
> than our current approach.
> 
> While MADV_POPULATE_WRITE is, in general, faster than manual
> prefaulting, and especially faster with 4k pages, there is still value in
> prefaulting using multiple threads to speed up preallocation.
> 
> More details on MADV_POPULATE_WRITE can be found in the Linux commit
> 4ca9b3859dac ("mm/madvise: introduce MADV_POPULATE_(READ|WRITE) to prefault
> page tables") and in the man page proposal [1].
> 
> [1] https://lkml.kernel.org/r/20210712083917.16361-1-david@redhat.com
> 
> This resolves the TODO in do_touch_pages().
> 
> In the future, we might want to look into using fallocate(), eventually
> combined with MADV_POPULATE_READ, when dealing with shared file
> mappings.
> 
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/qemu/osdep.h |  7 ++++
>  util/oslib-posix.c   | 88 +++++++++++++++++++++++++++++++++-----------
>  2 files changed, 74 insertions(+), 21 deletions(-)


> @@ -497,6 +493,31 @@ static void *do_touch_pages(void *arg)
>      return NULL;
>  }
>  
> +static void *do_madv_populate_write_pages(void *arg)
> +{
> +    MemsetThread *memset_args = (MemsetThread *)arg;
> +    const size_t size = memset_args->numpages * memset_args->hpagesize;
> +    char * const addr = memset_args->addr;
> +    int ret;
> +
> +    if (!size) {
> +        return NULL;
> +    }
> +
> +    /* See do_touch_pages(). */
> +    qemu_mutex_lock(&page_mutex);
> +    while (!threads_created_flag) {
> +        qemu_cond_wait(&page_cond, &page_mutex);
> +    }
> +    qemu_mutex_unlock(&page_mutex);
> +
> +    ret = qemu_madvise(addr, size, QEMU_MADV_POPULATE_WRITE);
> +    if (ret) {
> +        memset_thread_failed = true;

I'm wondering if this use of memset_thread_failed is sufficient.

This is pre-existing from the current impl, and ends up being
used to set the bool result of 'touch_all_pages'. The caller
of that then does

    if (touch_all_pages(area, hpagesize, numpages, smp_cpus)) {
        error_setg(errp, "os_mem_prealloc: Insufficient free host memory "
            "pages available to allocate guest RAM");
    }

this was reasonable with the old impl, because the only reason
we ever see 'memset_thread_failed==true' is if we got SIGBUS
due to ENOMEM.

My concern is that madvise() has a bunch of possible errno
codes returned on failure, and we're not distinguishing
them. In the past this kind of thing has burnt us making
failures hard to debug.

Could we turn 'bool memset_thread_failed' into 'int memset_thread_errno'

Then, we can make 'touch_all_pages' have an 'Error **errp'
parameter, and it can directly call

 error_setg_errno(errp, memset_thead_errno, ....some message...)

when memset_thread_errno is non-zero, and thus we can remove
the generic message from the caller of touch_all_pages.

If you agree, it'd be best to refactor the existing code to
use this pattern in an initial patch.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


