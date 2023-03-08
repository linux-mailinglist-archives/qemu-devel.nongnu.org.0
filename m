Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA866B0D4A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 16:48:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZw0h-0000wc-2E; Wed, 08 Mar 2023 10:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pZw0Q-0000vc-Hn
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 10:47:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pZw0O-0007Ey-Uo
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 10:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678290423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xmQd03E9KRYauiYwVSTsfiXXYLadvvGL25dBM4451VM=;
 b=bi4JN5HHZO66mK4uB+UkPyVepHgh+4UuuO8I9c5aVKlDj4tzNT/ib27LCNwMeABdZxL8lr
 2GbWUEuFe2v7wl1ocTq7UVklP87ChU9J+Kx0Clg2T0BsrYrC5YMbRdDyuR6vmIDMmAnPZM
 qnnYdJ4+vLtLR1BOC7GVPgFZ+6Hgl5k=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-nYGVlR6NNuWdjAvJZvBenA-1; Wed, 08 Mar 2023 10:47:02 -0500
X-MC-Unique: nYGVlR6NNuWdjAvJZvBenA-1
Received: by mail-ua1-f70.google.com with SMTP id
 c24-20020ab023d8000000b006907ba8c229so8078027uan.23
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 07:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678290422;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xmQd03E9KRYauiYwVSTsfiXXYLadvvGL25dBM4451VM=;
 b=hUCKfiecYcARxBj6ZN5NyLDI34Cfh4xEE9lTi+n32XKznU6sJ0oZ82jigoVplmXLmF
 NGjXoE3U6C1V2330EwbbOoJilrVhRYdtGPJ6nAn+JLDmING4Wxy5KweXrE5FPzlgF+sL
 t3jFwBi/R7q4q9O7/O3qZoxtnZxIrCiOeuZcU4e+OulCaP2I7i8YHCwc9MjAggFb0QUU
 8+l5LVT93xoqxi16LehGWt8GmPyG52w1zU2rT8TN5yMoUDxGlyLc/uKidkOJsanCMd9x
 lg57/5rhkGP6E0RLdXpSQqCch6/PB9YPSl9BhVMjWtcLzDalvYtJzNLxXYmxzJIyAjHU
 axaQ==
X-Gm-Message-State: AO0yUKX8gcihTt6gHd3KLQo2C0jrZCbf7Z5PjbyqbaDq/8RjAk9f9Gsl
 4o4oRrWK5dKwrtm1RWdKdu/9Ar8IFn70w8561VHbXA4IyYLTE5VzzTF1RBnFnWt+w1CnzoBj0FP
 j4ciIaIkskzQpZuw=
X-Received: by 2002:a67:be15:0:b0:421:44ed:9f4b with SMTP id
 x21-20020a67be15000000b0042144ed9f4bmr10205541vsq.3.1678290421982; 
 Wed, 08 Mar 2023 07:47:01 -0800 (PST)
X-Google-Smtp-Source: AK7set/HpYqYUpI2iypgS7A+IRXO7OmBG6Cry+K2BePeOU+jhXhZM3ObOjreJRc4wC0+teQ/HaTBOw==
X-Received: by 2002:a67:be15:0:b0:421:44ed:9f4b with SMTP id
 x21-20020a67be15000000b0042144ed9f4bmr10205522vsq.3.1678290421639; 
 Wed, 08 Mar 2023 07:47:01 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 t197-20020a3746ce000000b007417e60f621sm11792993qka.126.2023.03.08.07.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 07:47:00 -0800 (PST)
Date: Wed, 8 Mar 2023 10:46:59 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [PATCH RESEND v6 0/5] migration: reduce time of loading
 non-iterable vmstate
Message-ID: <ZAit8yypJ2Mv44BH@x1n>
References: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
 <ZAUSPo9bJO0udf9p@x1n>
 <1ea4db90-7535-1dc3-a2ae-d44113a24e29@bytedance.com>
 <ZAZRn9eNG1TEoEl1@x1n>
 <f6e36da0-d20b-af80-4239-5bb59b97f530@bytedance.com>
 <ZAdupAAJjbSbJiss@x1n>
 <CALophus_dTA6U3zGP6u0YnRr65GrhF665mBtX7SkBdLMVJKxBw@mail.gmail.com>
 <ZAiir3qXiYr/Stma@x1n>
 <827ec45d-7970-36d5-2dec-48f858369636@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <827ec45d-7970-36d5-2dec-48f858369636@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Mar 08, 2023 at 11:27:40PM +0800, Chuang Xu wrote:
> Hi, Peter,
> 
> On 2023/3/8 下午10:58, Peter Xu wrote:
> > On Wed, Mar 08, 2023 at 06:03:45AM -0800, Chuang Xu wrote:
> > > IIUC, Do you mean that different ways to get flatview are tricky?
> > Yes, and properly define when to use which.
> > 
> > > As you said, it's slightly beyond what this series does. Maybe it would be
> > > better if we discuss it in a new series and keep this series at v6?
> > > what's your take?
> > Quotting your test result:
> > 
> >                          time of loading non-iterable vmstate
> > before                                  112 ms
> > long's patch applied                    103 ms
> > my patch applied                         44 ms
> > both applied                             39 ms
> > add as_to_flat_rcu                       19 ms
> > 
> > If introducing address_space_to_flatview_rcu() can further half the time,
> > maybe still worth it?
> > 
> > The thing is the extra _rcu() doesn't bring the major complexity, IMHO.  It
> > brings some on identifying which is really safe to not reference a latest
> > flatview (it seems to me only during a commit() hook..).
> > 
> > The major complexity still comes from the nested enforced commit() during
> > address_space_to_flatview() but that is already in the patchset.
> > 
> > Thanks,
> > 
> OK, let me continue to finish v7.
> 
> Here I list some TODOs in v7:
> 
> 1. squash fix into patch1 of yours.
> 2. introduce address_space_to_flatview_rcu()
> 3. add specific comment to define when to use which as_to_flat()

This can be together with 2).

We should suggest using address_space_to_flatview() by default in the
comment, and only use _rcu() with cautions e.g. we can mention commit()
hooks as example, and also mention the possibility of seeing very old (or
purely empty flatview) if during vm load.  In that sense this can be the
last patch of your set so there's the vm load context to reference.

I hope there'll be no outliers that takes only RCU (no bql) but still
expect a very new flatview then it'll crash easily if called in a vm load.
But let's see..  I assume your test cases are already a much larger set so
covers a lot of code paths already.

> 4. Does enforce commit() need further modification or keep current status?
>    Looks like you have some new thoughts on it?

I don't.

PS: I do have some thoughts but I don't think I mentioned them..  My
thoughts were that we can actually avoid calling begin()/commit()/... hooks
during a nested do_commit() at all but only update current_map.  That'll
further avoid the _rcu() patch to be introduced, but I think that needs
more changes and may not be necessary at all.  Ignore this.

> 
> Are there any other missing points?

No from my side.

Note that 8.0 reached soft freeze.  Sorry to say so, but it seems this work
will only be possible (if no further objections coming) for 8.1 merge
windows, so the early merge will be after middle of Apirl.  Thanks for
being consistent with it already so far.

-- 
Peter Xu


