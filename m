Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CAB6FE350
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 19:37:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwnk2-0001ja-LW; Wed, 10 May 2023 13:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwnk0-0001jK-Kv
 for qemu-devel@nongnu.org; Wed, 10 May 2023 13:36:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwnjy-0001nv-Sl
 for qemu-devel@nongnu.org; Wed, 10 May 2023 13:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683740198;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+iNskIQy7f5u1PptDng9hqhkCGL5+WU7ocBTah5Wn08=;
 b=f/qNwhGMwvplHE6K9wV5mQioL6ikjrmThKjiUQdFGrEYlVJ5kLI3Rb2Bs06Bm5A1+CdUdy
 FCvxr9kAVhO140R6D5WsQU0l7Pjww5pplMKt9px5KP0ENqvxCiGsTS8K0V364aKPf5nfvC
 fSUz86fDjuLDdij5WPqQYW55leq8a2E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-Qdn4KvnVMjOuEPMUOmINzg-1; Wed, 10 May 2023 13:36:36 -0400
X-MC-Unique: Qdn4KvnVMjOuEPMUOmINzg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f42bcef2acso9660265e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 10:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683740195; x=1686332195;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+iNskIQy7f5u1PptDng9hqhkCGL5+WU7ocBTah5Wn08=;
 b=D3+SeqQ7OFWODnyNQoWCDiLiAGxB2OLaupniCZa4Q7g4jXfSJWhK2CBw/fhepEoLIz
 YzrqyI14sZ6+2o7SmBcuwOw/qSGebDlCD7I32ZYV8w0rxAjbDSammu8bHxZZNG0bqFtn
 n9mFADTUDkGN+OM4yGs31O826B1pqVncOceD4QHGmmZ0Rw7ztnx7mb1JugxH6cNAEYX3
 jZtv6+Ox8yu98k16S48Wq71OiZZQ25tx+kJt4quzShQwGoUxxeySwnfLiA7EfkHKK3LL
 PpYkOgUlTs/GUQUudb4KL5Iz2+Iz2k10LoB2PrFllw361APFwPwhNvKTPOxACZaOJjiX
 k3XQ==
X-Gm-Message-State: AC+VfDxrf9GPSd2dvk52WqHmbTleUUPahfcDP/tjBx4mzInnY3rV1YRT
 ncC45N/1WpOSt0y/65zCU0KhHJj0w72zeMAgQhd7bDjvJ27NRXTn8IGOM0b01n4o1rmvZ32FTvJ
 ZFKsm32cO3zIpJ1k=
X-Received: by 2002:a1c:4c04:0:b0:3f4:2148:e8c5 with SMTP id
 z4-20020a1c4c04000000b003f42148e8c5mr9688369wmf.1.1683740195010; 
 Wed, 10 May 2023 10:36:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4JpPBVd0ISn3X6RBSnhRfEwghnRUbcZ3cykDaipbnYMvn3Z6MGQwrhvuRz3MGz5k9i0U2l9Q==
X-Received: by 2002:a1c:4c04:0:b0:3f4:2148:e8c5 with SMTP id
 z4-20020a1c4c04000000b003f42148e8c5mr9688355wmf.1.1683740194704; 
 Wed, 10 May 2023 10:36:34 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 n23-20020a7bc5d7000000b003ee74c25f12sm23384738wmk.35.2023.05.10.10.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 10:36:34 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Andrei Gudkov <gudkov.andrei@huawei.com>
Cc: <qemu-devel@nongnu.org>,  <eblake@redhat.com>,  <armbru@redhat.com>,
 <berrange@redhat.com>,  <zhengchuan@huawei.com>
Subject: Re: [PATCH v2 2/4] migration/calc-dirty-rate: detailed stats in
 sampling mode
In-Reply-To: <22436421241c49c9b6d9b9120d166392c40fb991.1682598010.git.gudkov.andrei@huawei.com>
 (Andrei Gudkov's message of "Thu, 27 Apr 2023 15:42:58 +0300")
References: <cover.1682598010.git.gudkov.andrei@huawei.com>
 <22436421241c49c9b6d9b9120d166392c40fb991.1682598010.git.gudkov.andrei@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 10 May 2023 19:36:33 +0200
Message-ID: <875y906qce.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Andrei Gudkov <gudkov.andrei@huawei.com> wrote:
> Collect number of dirty pages for progresseively increasing time
> periods starting with 125ms up to number of seconds specified with
> calc-dirty-rate. Report through qmp and hmp: 1) vector of dirty page
> measurements, 2) page size, 3) total number of VM pages, 4) number
> of sampled pages.
>
> Signed-off-by: Andrei Gudkov <gudkov.andrei@huawei.com>
> ---
>  migration/dirtyrate.c | 165 +++++++++++++++++++++++++++++-------------
>  migration/dirtyrate.h |  25 ++++++-
>  qapi/migration.json   |  24 +++++-

You need the equivalent of this in your .git/config file.

[diff]
	orderFile = scripts/git.orderfile

In particular:
*json files cames first
*.h second
*.c third

>  3 files changed, 160 insertions(+), 54 deletions(-)
>
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index acba3213a3..4491bbe91a 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -224,6 +224,7 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>      info->calc_time = DirtyStat.calc_time;
>      info->sample_pages = DirtyStat.sample_pages;
>      info->mode = dirtyrate_mode;
> +    info->page_size = TARGET_PAGE_SIZE;

I thought we exported this trough ""info migrate"
but we do it only if we are in the middle of a migration.  Perhaps we
should print it always.

>      if (qatomic_read(&CalculatingState) == DIRTY_RATE_STATUS_MEASURED) {
>          info->has_dirty_rate = true;
> @@ -245,6 +246,29 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>              info->vcpu_dirty_rate = head;
>          }
>  
> +        if (dirtyrate_mode == DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING)
> {

see my comment at the end about int64 vs uint64/size

> +        DirtyStat.page_sampling.n_total_pages = 0;
> +        DirtyStat.page_sampling.n_sampled_pages = 0;
> +        DirtyStat.page_sampling.n_readings = 0;
> +        DirtyStat.page_sampling.readings = g_try_malloc0_n(MAX_DIRTY_READINGS,
> +                                                          sizeof(DirtyReading));
>          break;

You do g_try_malloc0()

or you check for NULL return.

Even better, I think you can use here:

foo = g_new0(DirtyReading, MAX_DIRTY_READINGS);

MAX_DIRTY_READINGS is small enough that you can assume that there is
enough free memory.

> -    DirtyStat.dirty_rate = dirtyrate;
> +    if (DirtyStat.page_sampling.readings) {
> +        free(DirtyStat.page_sampling.readings);
> +        DirtyStat.page_sampling.readings = NULL;
> +    }

What glib gives, glib takes.

g_malloc() -> g_free()

g_free() knows how to handle the NULL case so:

        g_free(DirtyStat.page_sampling.readings);
        DirtyStat.page_sampling.readings = NULL;

Without if should be good enough.

> -static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
> +static int64_t compare_page_hash_info(struct RamblockDirtyInfo *info,
>                                    int block_count)

                                     bad indentantion.

> +static int64_t increase_period(int64_t prev_period, int64_t max_period)
> +{
> +    int64_t delta;
> +    int64_t next_period;
> +
> +    if (prev_period < 500) {
> +        delta = 125;
> +    } else if (prev_period < 1000) {
> +        delta = 250;
> +    } else if (prev_period < 2000) {
> +        delta = 500;
> +    } else if (prev_period < 4000) {
> +        delta = 1000;
> +    } else if (prev_period < 10000) {
> +        delta = 2000;
> +    } else {
> +        delta = 5000;
> +    }
> +
> +    next_period = prev_period + delta;
> +    if (next_period + delta >= max_period) {
> +        next_period = max_period;
> +    }
> +    return next_period;
> +}

Is there any reason for this to be so complicated?


int64_t periods[] = { 125, 250, 375, 500, 750, 1000, 1500, 2000, 3000, 4000, 6000, 8000, 10000,
                      15000, 20000, 25000, 30000, 35000, 40000, 45000 };

And access it in the loop?  This way you get what the values are.

You can put a limit to config.sample_period_seconds, or you want it
unlimited?


> diff --git a/qapi/migration.json b/qapi/migration.json
> index 2c35b7b9cf..f818f51e0e 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1805,6 +1805,22 @@
>  # @vcpu-dirty-rate: dirtyrate for each vcpu if dirty-ring
>  #                   mode specified (Since 6.2)
>  #
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

2 things:
a- this is exported in info migrate, so you can get it from there.
b- even if we export it here, it is as size or uint64, negative page
   size make no sense (not that I am expecting to have page that don't
   fit in a int O:-)

Same for the rest of the counters.

> +           '*n-total-pages': 'int64',
> +           '*n-sampled-pages': 'int64',
> +           '*periods': ['int64'],
> +           '*n-dirty-pages': ['int64'] } }
>  
>  ##
>  # @calc-dirty-rate:


