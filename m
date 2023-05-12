Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2E1700900
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 15:20:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxSfM-0005JM-Hy; Fri, 12 May 2023 09:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1pxSfJ-0005HJ-BZ
 for qemu-devel@nongnu.org; Fri, 12 May 2023 09:18:33 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1pxSfA-0006Vn-Rp
 for qemu-devel@nongnu.org; Fri, 12 May 2023 09:18:28 -0400
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QHq6521bHz67GB6;
 Fri, 12 May 2023 21:16:29 +0800 (CST)
Received: from localhost (10.199.58.101) by lhrpeml500004.china.huawei.com
 (7.191.163.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 12 May
 2023 14:18:09 +0100
Date: Fri, 12 May 2023 16:18:04 +0300
To: Juan Quintela <quintela@redhat.com>
CC: Andrei Gudkov <gudkov.andrei@huawei.com>, <qemu-devel@nongnu.org>,
 <eblake@redhat.com>, <armbru@redhat.com>, <berrange@redhat.com>,
 <zhengchuan@huawei.com>
Subject: Re: [PATCH v2 2/4] migration/calc-dirty-rate: detailed stats in
 sampling mode
Message-ID: <ZF47+rkmPdTKIaH8@DESKTOP-0LHM7NF.china.huawei.com>
References: <cover.1682598010.git.gudkov.andrei@huawei.com>
 <22436421241c49c9b6d9b9120d166392c40fb991.1682598010.git.gudkov.andrei@huawei.com>
 <875y906qce.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <875y906qce.fsf@secure.mitica>
X-Originating-IP: [10.199.58.101]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=gudkov.andrei@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  <gudkov.andrei@huawei.com>
From: gudkov.andrei--- via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, May 10, 2023 at 07:36:33PM +0200, Juan Quintela wrote:
> Andrei Gudkov <gudkov.andrei@huawei.com> wrote:
> > Collect number of dirty pages for progresseively increasing time
> > periods starting with 125ms up to number of seconds specified with
> > calc-dirty-rate. Report through qmp and hmp: 1) vector of dirty page
> > measurements, 2) page size, 3) total number of VM pages, 4) number
> > of sampled pages.
> >
> > Signed-off-by: Andrei Gudkov <gudkov.andrei@huawei.com>
> > ---
> >  migration/dirtyrate.c | 165 +++++++++++++++++++++++++++++-------------
> >  migration/dirtyrate.h |  25 ++++++-
> >  qapi/migration.json   |  24 +++++-
> 
> You need the equivalent of this in your .git/config file.
> 
> [diff]
> 	orderFile = scripts/git.orderfile
> 
> In particular:
> *json files cames first
> *.h second
> *.c third
> 
> >  3 files changed, 160 insertions(+), 54 deletions(-)
> >
> > diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> > index acba3213a3..4491bbe91a 100644
> > --- a/migration/dirtyrate.c
> > +++ b/migration/dirtyrate.c
> > @@ -224,6 +224,7 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
> >      info->calc_time = DirtyStat.calc_time;
> >      info->sample_pages = DirtyStat.sample_pages;
> >      info->mode = dirtyrate_mode;
> > +    info->page_size = TARGET_PAGE_SIZE;
> 
> I thought we exported this trough ""info migrate"
> but we do it only if we are in the middle of a migration.  Perhaps we
> should print it always.

So, which one do you prefer? To keep it here or to make "info migrate" print it always (or both)?

> 
> >      if (qatomic_read(&CalculatingState) == DIRTY_RATE_STATUS_MEASURED) {
> >          info->has_dirty_rate = true;
> > @@ -245,6 +246,29 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
> >              info->vcpu_dirty_rate = head;
> >          }
> >  
> > +        if (dirtyrate_mode == DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING)
> > {
> 
> see my comment at the end about int64 vs uint64/size
> 
> > +        DirtyStat.page_sampling.n_total_pages = 0;
> > +        DirtyStat.page_sampling.n_sampled_pages = 0;
> > +        DirtyStat.page_sampling.n_readings = 0;
> > +        DirtyStat.page_sampling.readings = g_try_malloc0_n(MAX_DIRTY_READINGS,
> > +                                                          sizeof(DirtyReading));
> >          break;
> 
> You do g_try_malloc0()
> 
> or you check for NULL return.
> 
> Even better, I think you can use here:
> 
> foo = g_new0(DirtyReading, MAX_DIRTY_READINGS);
> 
> MAX_DIRTY_READINGS is small enough that you can assume that there is
> enough free memory.
> 
> > -    DirtyStat.dirty_rate = dirtyrate;
> > +    if (DirtyStat.page_sampling.readings) {
> > +        free(DirtyStat.page_sampling.readings);
> > +        DirtyStat.page_sampling.readings = NULL;
> > +    }
> 
> What glib gives, glib takes.
> 
> g_malloc() -> g_free()
> 
> g_free() knows how to handle the NULL case so:
> 
>         g_free(DirtyStat.page_sampling.readings);
>         DirtyStat.page_sampling.readings = NULL;
> 
> Without if should be good enough.
> 
> > -static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
> > +static int64_t compare_page_hash_info(struct RamblockDirtyInfo *info,
> >                                    int block_count)
> 
>                                      bad indentantion.
> 
> > +static int64_t increase_period(int64_t prev_period, int64_t max_period)
> > +{
> > +    int64_t delta;
> > +    int64_t next_period;
> > +
> > +    if (prev_period < 500) {
> > +        delta = 125;
> > +    } else if (prev_period < 1000) {
> > +        delta = 250;
> > +    } else if (prev_period < 2000) {
> > +        delta = 500;
> > +    } else if (prev_period < 4000) {
> > +        delta = 1000;
> > +    } else if (prev_period < 10000) {
> > +        delta = 2000;
> > +    } else {
> > +        delta = 5000;
> > +    }
> > +
> > +    next_period = prev_period + delta;
> > +    if (next_period + delta >= max_period) {
> > +        next_period = max_period;
> > +    }
> > +    return next_period;
> > +}
> 
> Is there any reason for this to be so complicated?

I think it was because I initially computed prev_period using qemu_clock_get_ms().
But now I see that I got rid of this idea, and prev_period can be only
one of the predefined values... So, you are right. I will change it to an array.

> 
> 
> int64_t periods[] = { 125, 250, 375, 500, 750, 1000, 1500, 2000, 3000, 4000, 6000, 8000, 10000,
>                       15000, 20000, 25000, 30000, 35000, 40000, 45000 };
> 
> And access it in the loop?  This way you get what the values are.
> 
> You can put a limit to config.sample_period_seconds, or you want it
> unlimited?

It cannot be unbounded. Max period can be at most
MAX_FETCH_DIRTYRATE_TIME_SEC*1000=60000 ms. It is already checked inside
qmp_calc_dirty_rate().

> 
> 
> > diff --git a/qapi/migration.json b/qapi/migration.json
> > index 2c35b7b9cf..f818f51e0e 100644
> > --- a/qapi/migration.json
> > +++ b/qapi/migration.json
> > @@ -1805,6 +1805,22 @@
> >  # @vcpu-dirty-rate: dirtyrate for each vcpu if dirty-ring
> >  #                   mode specified (Since 6.2)
> >  #
> > +# @page-size: page size in bytes (since 8.1)
> > +#
> > +# @n-total-pages: [page-sampling] total number of VM pages (since 8.1)
> > +#
> > +# @n-sampled-pages: [page-sampling] number of sampled VM pages (since 8.1)
> > +#
> > +# @periods: [page-sampling] array of time periods expressed in milliseconds
> > +#           for which dirty-sample measurements were collected (since 8.1)
> > +#
> > +# @n-dirty-pages: [page-sampling] number of pages among all sampled pages
> > +#                 that were observed as changed during respective time period.
> > +#                 i-th element of this array corresponds to the i-th element
> > +#                 of the @periods array, i.e. @n-dirty-pages[i] is the number
> > +#                 of dirtied pages during period of @periods[i] milliseconds
> > +#                 after the initiation of calc-dirty-rate (since 8.1)
> > +#
> >  # Since: 5.2
> >  ##
> >  { 'struct': 'DirtyRateInfo',
> > @@ -1814,7 +1830,13 @@
> >             'calc-time': 'int64',
> >             'sample-pages': 'uint64',
> >             'mode': 'DirtyRateMeasureMode',
> > -           '*vcpu-dirty-rate': [ 'DirtyRateVcpu' ] } }
> > +           '*vcpu-dirty-rate': [ 'DirtyRateVcpu' ],
> > +           'page-size': 'int64',
> 
> 2 things:
> a- this is exported in info migrate, so you can get it from there.
> b- even if we export it here, it is as size or uint64, negative page
>    size make no sense (not that I am expecting to have page that don't
>    fit in a int O:-)

But can you be sure that in the future you are not going to return
sentinel value like "-1"? :)

> 
> Same for the rest of the counters.

Ok, but I still insist on using 64 bit types for the page number counters.
It looks to me that 16TiB VM is a matter of near future.

> 
> > +           '*n-total-pages': 'int64',
> > +           '*n-sampled-pages': 'int64',
> > +           '*periods': ['int64'],
> > +           '*n-dirty-pages': ['int64'] } }
> >  
> >  ##
> >  # @calc-dirty-rate:
> 

