Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59EA700A42
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:26:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxThl-00061s-Mc; Fri, 12 May 2023 10:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1pxThi-00061c-LU
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:25:06 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gudkov.andrei@huawei.com>)
 id 1pxThg-0000Wr-B8
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:25:06 -0400
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QHrb72jQgz67G90;
 Fri, 12 May 2023 22:23:15 +0800 (CST)
Received: from localhost (10.199.58.101) by lhrpeml500004.china.huawei.com
 (7.191.163.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 12 May
 2023 15:24:56 +0100
Date: Fri, 12 May 2023 17:24:50 +0300
To: Markus Armbruster <armbru@redhat.com>
CC: Andrei Gudkov via <qemu-devel@nongnu.org>, <quintela@redhat.com>,
 <eblake@redhat.com>, <berrange@redhat.com>, <zhengchuan@huawei.com>,
 <gudkov.andrei@huawei.com>
Subject: Re: [PATCH v2 2/4] migration/calc-dirty-rate: detailed stats in
 sampling mode
Message-ID: <ZF5MMv3RcvcmCZtG@DESKTOP-0LHM7NF.china.huawei.com>
References: <cover.1682598010.git.gudkov.andrei@huawei.com>
 <22436421241c49c9b6d9b9120d166392c40fb991.1682598010.git.gudkov.andrei@huawei.com>
 <877ctfo0my.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <877ctfo0my.fsf@pond.sub.org>
X-Originating-IP: [10.199.58.101]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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

On Thu, May 11, 2023 at 08:14:29AM +0200, Markus Armbruster wrote:
> Andrei Gudkov via <qemu-devel@nongnu.org> writes:
> 
> > Collect number of dirty pages for progresseively increasing time
> > periods starting with 125ms up to number of seconds specified with
> > calc-dirty-rate. Report through qmp and hmp: 1) vector of dirty page
> > measurements, 2) page size, 3) total number of VM pages, 4) number
> > of sampled pages.
> >
> > Signed-off-by: Andrei Gudkov <gudkov.andrei@huawei.com>
> 
> [...]
> 
> > diff --git a/qapi/migration.json b/qapi/migration.json
> > index 2c35b7b9cf..f818f51e0e 100644
> > --- a/qapi/migration.json
> > +++ b/qapi/migration.json
> > @@ -1805,6 +1805,22 @@
>    ##
>    # @DirtyRateInfo:
>    #
>    # Information about current dirty page rate of vm.
>    #
>    # @dirty-rate: an estimate of the dirty page rate of the VM in units
>    #     of MB/s, present only when estimating the rate has completed.
>    #
>    # @status: status containing dirtyrate query status includes
>    #     'unstarted' or 'measuring' or 'measured'
> 
> Not this patch's fault, but here goes anyway:
> 
> 0. "dirtyrate" isn't a word.  Spell it "dirty rate".  Many more
>    instances elsewhere.
> 
> 1. "status containing status"... what has the poor English language done
>    to us that we torture it so?
> 
> 2. "includes 'unstarted' or 'measuring' or 'measured' is confusing and
>    entirely redundant with the type.  @status doesn't "include" these,
>    these are the possible values, and all of them.
> 
> Suggest:
> 
>      @status: dirty rate measuring status
> 
> I do understand how difficult writing good English is for non-native
> speakers.  This is mainly a failure of patch review.
> 
>    #
>    # @start-time: start time in units of second for calculation
>    #
>    # @calc-time: time in units of second for sample dirty pages
>    #
>    # @sample-pages: page count per GB for sample dirty pages the default
>    #     value is 512 (since 6.1)
>    #
>    # @mode: mode containing method of calculate dirtyrate includes
>    #     'page-sampling' and 'dirty-ring' (Since 6.2)
> 
> Still not this patch's fault:
> 
> 1. "mode containing method": more torture :)
> 
> 2. "includes 'page-sampling' and 'dirty-ring'" is confusing.
> 
>    When it was added in commit 0e21bf24608, it was confusing and
>    redundant like the text for @status above.
> 
>    Then commit 826b8bc80cb added value 'dirty-bitmap' without updating
>    the member doc here.
> 
> Suggest:
> 
>      @mode: dirty rate measuring mode
> 
>    #
>    # @vcpu-dirty-rate: dirtyrate for each vcpu if dirty-ring mode
>    #     specified (Since 6.2)
>    #
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
> 
> Changed doc comment conventions landed yesterday (merge commit
> 568992e3440).  Please format like this:
> 
>    # @page-size: page size in bytes (since 8.1)
>    #
>    # @n-total-pages: [page-sampling] total number of VM pages (since 8.1)
>    #
>    # @n-sampled-pages: [page-sampling] number of sampled VM pages (since
>    #     8.1)
>    #
>    # @n-zero-pages: [page-sampling] number of observed all-zero pages
>    #     among all sampled pages (since 8.1)
>    #
>    # @periods: [page-sampling] array of time periods expressed in
>    #     milliseconds for which dirty-sample measurements were collected
>    #     (since 8.1)
>    #
>    # @n-dirty-pages: [page-sampling] number of pages among all sampled
>    #     pages that were observed as changed during respective time
>    #     period.  i-th element of this array corresponds to the i-th
>    #     element of the @periods array, i.e. @n-dirty-pages[i] is the
>    #     number of dirtied pages during period of @periods[i]
>    #     milliseconds after the initiation of calc-dirty-rate (since 8.1)
> 
> The meaning of "[page-sampling]" is unclear.  What are you trying to
> express?

There are two different measurements modes: page-sampling and dirty-ring.
They gather different sets of metrics. All the metrics above are
available only in page-sampling mode.

> 
> For better or worse, we try to avoid abbreviations in QMP.  The "n-"
> prefix is one.  What does it stand for?

This is the number of respective objects. I can replace it with something like
"sampled-pages-count", "zero-pages-count", etc at the cost of longer names.

> 
> It's quite unclear how all these numbers relate to each other.  What's
> the difference between @n-sampled-pages and @sample-pages?  I think
> we're missing an overview of the dirty rate measurement feature.

This looks like an easy thing to do. I will add some docs to
@calc-dirty-rate related to page-sampling mode.

> 
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
> Shouldn't this be of type 'size'?
> 
> > +           '*n-total-pages': 'int64',
> > +           '*n-sampled-pages': 'int64',
> > +           '*periods': ['int64'],
> > +           '*n-dirty-pages': ['int64'] } }
> 
> 'uint64', like @sample-pages?
> 
> > +
> >  
> >  ##
> >  # @calc-dirty-rate:

