Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E44E6FEB9F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 08:16:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwzZV-0004l6-R9; Thu, 11 May 2023 02:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwzZT-0004kO-PN
 for qemu-devel@nongnu.org; Thu, 11 May 2023 02:14:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwzZR-0005v0-Vq
 for qemu-devel@nongnu.org; Thu, 11 May 2023 02:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683785672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C/xzHOqOLuyEobGcCjc1Eq1CbSuC3b24/RmI8E7cl4U=;
 b=h563ITiVmjGTtZvIaMPiECZld8miT4TPgp4E+KQVpW5sDlGsH/28kilFc7+dwzNumfxz19
 YtTihl7+hpuF8iPQcbTSy/FFP8jK2CpckMxPLF7RZsuaVlz6aPQm0u+PNYXQNXcXAiNZm+
 M+I9CQFx/jmK3fMQuA8gyPpWlueuhAM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-m3uK5tKhPVmpDUSRd3UAUQ-1; Thu, 11 May 2023 02:14:31 -0400
X-MC-Unique: m3uK5tKhPVmpDUSRd3UAUQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0597280269A;
 Thu, 11 May 2023 06:14:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1A302026D16;
 Thu, 11 May 2023 06:14:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 60E4E21E6924; Thu, 11 May 2023 08:14:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrei Gudkov via <qemu-devel@nongnu.org>
Cc: Andrei Gudkov <gudkov.andrei@huawei.com>,  <quintela@redhat.com>,
 <eblake@redhat.com>,  <berrange@redhat.com>,  <zhengchuan@huawei.com>
Subject: Re: [PATCH v2 2/4] migration/calc-dirty-rate: detailed stats in
 sampling mode
References: <cover.1682598010.git.gudkov.andrei@huawei.com>
 <22436421241c49c9b6d9b9120d166392c40fb991.1682598010.git.gudkov.andrei@huawei.com>
Date: Thu, 11 May 2023 08:14:29 +0200
In-Reply-To: <22436421241c49c9b6d9b9120d166392c40fb991.1682598010.git.gudkov.andrei@huawei.com>
 (Andrei Gudkov via's message of "Thu, 27 Apr 2023 15:42:58 +0300")
Message-ID: <877ctfo0my.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Andrei Gudkov via <qemu-devel@nongnu.org> writes:

> Collect number of dirty pages for progresseively increasing time
> periods starting with 125ms up to number of seconds specified with
> calc-dirty-rate. Report through qmp and hmp: 1) vector of dirty page
> measurements, 2) page size, 3) total number of VM pages, 4) number
> of sampled pages.
>
> Signed-off-by: Andrei Gudkov <gudkov.andrei@huawei.com>

[...]

> diff --git a/qapi/migration.json b/qapi/migration.json
> index 2c35b7b9cf..f818f51e0e 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1805,6 +1805,22 @@
   ##
   # @DirtyRateInfo:
   #
   # Information about current dirty page rate of vm.
   #
   # @dirty-rate: an estimate of the dirty page rate of the VM in units
   #     of MB/s, present only when estimating the rate has completed.
   #
   # @status: status containing dirtyrate query status includes
   #     'unstarted' or 'measuring' or 'measured'

Not this patch's fault, but here goes anyway:

0. "dirtyrate" isn't a word.  Spell it "dirty rate".  Many more
   instances elsewhere.

1. "status containing status"... what has the poor English language done
   to us that we torture it so?

2. "includes 'unstarted' or 'measuring' or 'measured' is confusing and
   entirely redundant with the type.  @status doesn't "include" these,
   these are the possible values, and all of them.

Suggest:

     @status: dirty rate measuring status

I do understand how difficult writing good English is for non-native
speakers.  This is mainly a failure of patch review.

   #
   # @start-time: start time in units of second for calculation
   #
   # @calc-time: time in units of second for sample dirty pages
   #
   # @sample-pages: page count per GB for sample dirty pages the default
   #     value is 512 (since 6.1)
   #
   # @mode: mode containing method of calculate dirtyrate includes
   #     'page-sampling' and 'dirty-ring' (Since 6.2)

Still not this patch's fault:

1. "mode containing method": more torture :)

2. "includes 'page-sampling' and 'dirty-ring'" is confusing.

   When it was added in commit 0e21bf24608, it was confusing and
   redundant like the text for @status above.

   Then commit 826b8bc80cb added value 'dirty-bitmap' without updating
   the member doc here.

Suggest:

     @mode: dirty rate measuring mode

   #
   # @vcpu-dirty-rate: dirtyrate for each vcpu if dirty-ring mode
   #     specified (Since 6.2)
   #
> +# @page-size: page size in bytes (since 8.1)
> +#
> +# @n-total-pages: [page-sampling] total number of VM pages (since 8.1)
> +#
> +# @n-sampled-pages: [page-sampling] number of sampled VM pages (since 8.1)
> +#
> +# @periods: [page-sampling] array of time periods expressed in milliseconds
> +#           for which dirty-sample measurements were collected (since 8.1)
> +#
> +# @n-dirty-pages: [page-sampling] number of pages among all sampled pages
> +#                 that were observed as changed during respective time period.
> +#                 i-th element of this array corresponds to the i-th element
> +#                 of the @periods array, i.e. @n-dirty-pages[i] is the number
> +#                 of dirtied pages during period of @periods[i] milliseconds
> +#                 after the initiation of calc-dirty-rate (since 8.1)
> +#

Changed doc comment conventions landed yesterday (merge commit
568992e3440).  Please format like this:

   # @page-size: page size in bytes (since 8.1)
   #
   # @n-total-pages: [page-sampling] total number of VM pages (since 8.1)
   #
   # @n-sampled-pages: [page-sampling] number of sampled VM pages (since
   #     8.1)
   #
   # @n-zero-pages: [page-sampling] number of observed all-zero pages
   #     among all sampled pages (since 8.1)
   #
   # @periods: [page-sampling] array of time periods expressed in
   #     milliseconds for which dirty-sample measurements were collected
   #     (since 8.1)
   #
   # @n-dirty-pages: [page-sampling] number of pages among all sampled
   #     pages that were observed as changed during respective time
   #     period.  i-th element of this array corresponds to the i-th
   #     element of the @periods array, i.e. @n-dirty-pages[i] is the
   #     number of dirtied pages during period of @periods[i]
   #     milliseconds after the initiation of calc-dirty-rate (since 8.1)

The meaning of "[page-sampling]" is unclear.  What are you trying to
express?

For better or worse, we try to avoid abbreviations in QMP.  The "n-"
prefix is one.  What does it stand for?

It's quite unclear how all these numbers relate to each other.  What's
the difference between @n-sampled-pages and @sample-pages?  I think
we're missing an overview of the dirty rate measurement feature.

>  # Since: 5.2
>  ##
>  { 'struct': 'DirtyRateInfo',
> @@ -1814,7 +1830,13 @@
>             'calc-time': 'int64',
>             'sample-pages': 'uint64',
>             'mode': 'DirtyRateMeasureMode',
> -           '*vcpu-dirty-rate': [ 'DirtyRateVcpu' ] } }
> +           '*vcpu-dirty-rate': [ 'DirtyRateVcpu' ],
> +           'page-size': 'int64',

Shouldn't this be of type 'size'?

> +           '*n-total-pages': 'int64',
> +           '*n-sampled-pages': 'int64',
> +           '*periods': ['int64'],
> +           '*n-dirty-pages': ['int64'] } }

'uint64', like @sample-pages?

> +
>  
>  ##
>  # @calc-dirty-rate:


