Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D456E6AA9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 19:13:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poosA-0005IT-Ap; Tue, 18 Apr 2023 13:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1poos2-0005Gh-CW
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 13:11:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1poort-0002SG-QA
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 13:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681837908;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=D57aciwdUKjFSnkbwYXiaMHfEHuciAp+0n0Ntj2LGbw=;
 b=D1qNYYYfDUct4lojtnG9S/VkGel7+ZDt7g+A/fV4S7Y3WRnpuZwxwYJ87l0N2gZCabgJFi
 N060mDUDd8qG8vXNjF6IPqcngWgn+NFAI2I+scXWM3mVccQfztdWOm8UUsSoyLT1Ffhaem
 UW6KwNZI/9VKDEH+yY8tRdo+1dXRfGQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-E4CrSEDgNdWWElFnuZEJhw-1; Tue, 18 Apr 2023 13:11:46 -0400
X-MC-Unique: E4CrSEDgNdWWElFnuZEJhw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82FFA1C05147;
 Tue, 18 Apr 2023 17:11:46 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB2612958;
 Tue, 18 Apr 2023 17:11:45 +0000 (UTC)
Date: Tue, 18 Apr 2023 18:11:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrei Gudkov <gudkov.andrei@huawei.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com
Subject: Re: [PATCH 1/2] migration/calc-dirty-rate: new metrics in sampling
 mode
Message-ID: <ZD7PT/p57Gliq2eB@redhat.com>
References: <cover.1677589218.git.gudkov.andrei@huawei.com>
 <dfd184b23d062a6ea92a2cc6237e6b76301f37b9.1677589218.git.gudkov.andrei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dfd184b23d062a6ea92a2cc6237e6b76301f37b9.1677589218.git.gudkov.andrei@huawei.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 28, 2023 at 04:16:02PM +0300, Andrei Gudkov via wrote:
> * Collect number of all-zero pages
> * Collect vector of number of dirty pages for different time periods
> * Report total number of pages, number of sampled pages and page size
> * Replaced CRC32 with xxHash for performance reasons

I'd suggest that the CRC32 -> xxHash change should be a separate
commit from the newly reported statistics, since they're independant
functional changes.

> 
> Signed-off-by: Andrei Gudkov <gudkov.andrei@huawei.com>
> ---
>  migration/dirtyrate.c | 219 +++++++++++++++++++++++++++++++++---------
>  migration/dirtyrate.h |  26 ++++-
>  qapi/migration.json   |  25 +++++
>  3 files changed, 218 insertions(+), 52 deletions(-)

> diff --git a/qapi/migration.json b/qapi/migration.json
> index c84fa10e86..1a1d7cb30a 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1830,6 +1830,25 @@
>  # @mode: mode containing method of calculate dirtyrate includes
>  #        'page-sampling' and 'dirty-ring' (Since 6.2)
>  #
> +# @page-size: page size in bytes
> +#
> +# @n-total-pages: total number of VM pages
> +#
> +# @n-sampled-pages: number of sampled pages
> +#
> +# @n-zero-pages: number of observed zero pages among all sampled pages.
> +#                Normally all pages are zero when VM starts, but
> +#                their number progressively goes down as VM fills more
> +#                and more memory with useful data.
> +#                Migration of zero pages is optimized: only their headers
> +#                are copied but not the (zero) data.
> +#
> +# @periods: array of time periods expressed in milliseconds for which
> +#           dirty-sample measurements are collected
> +#
> +# @n-dirty-pages: number of pages among all sampled pages that were observed
> +#                 as changed after respective time period
> +#

Each field addition needs a "(Since ....)" tag with QEMU version

The docs probably ought to be explicit that the size of @periods
array is the same as @n-dirty-pages array.

>  # @vcpu-dirty-rate: dirtyrate for each vcpu if dirty-ring
>  #                   mode specified (Since 6.2)
>  #
> @@ -1842,6 +1861,12 @@
>             'calc-time': 'int64',
>             'sample-pages': 'uint64',
>             'mode': 'DirtyRateMeasureMode',
> +           'page-size': 'int64',
> +           '*n-total-pages': 'int64',
> +           '*n-sampled-pages': 'int64',
> +           '*n-zero-pages': 'int64',
> +           '*periods': ['int64'],
> +           '*n-dirty-pages': ['int64'],
>             '*vcpu-dirty-rate': [ 'DirtyRateVcpu' ] } }
>  
>  ##
> -- 
> 2.30.2
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


