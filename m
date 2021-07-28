Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5A13D8FF3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 15:59:43 +0200 (CEST)
Received: from localhost ([::1]:41838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8k61-0007za-TD
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 09:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8k37-0005NJ-My
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:56:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8k33-0003GL-If
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 09:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627480595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P52MC5zVeEBT1DGYN5q+HXtjz4BXMmrGpQMJO89I16A=;
 b=R4N2DV0TpuVpUYrj9TRimqztdlZHWiuqm9DLXCcZBRXVdBBGZVTRI1bidGHIHKWsQFSAhy
 wNo6I3xn1cE7fXkiz4tBjic+SkzjUHO+VyabQAu3tCyniG/w7TDTwlE97I6R5QYMq1Bh/x
 CCqreQ5r729pD5WS2qOAZYIYDvY1E1U=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-kfNkmxiDMDCd00a-G0LYig-1; Wed, 28 Jul 2021 09:56:32 -0400
X-MC-Unique: kfNkmxiDMDCd00a-G0LYig-1
Received: by mail-qv1-f70.google.com with SMTP id
 15-20020a0562140dcfb02902e558bb7a04so2003675qvt.10
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 06:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P52MC5zVeEBT1DGYN5q+HXtjz4BXMmrGpQMJO89I16A=;
 b=YKTZY2McQg10kBzjSQwk5+SIqnQ5LSN3hlCU+V1sUYLPF/LZkwDrDg6x67fgE6ccCT
 mf3gpz0ZhgmZ2XKhDgll1myhSFiU791YfGVcyB2sv06WpitGOB8gdxpTgbVnsczS3hEh
 ZaH0i47SkkGDUdCYPHrHxo6YuMslzf2bkIG71X0BU4FQTiWa05y8UU8lnZCWUpELOWCN
 4uM8yK9HhvEu1M77MAA4E5IxuyUSoh40d29vQtpwjycU9OoaKpK5L4EkuE+L6Qaj1wJn
 pJohcBazB6Ur+TtWlsWTaOdGwuxJcP99jkd+kWCv7CY/GLkxc16i+VyiRjXA2UlENieY
 YX+w==
X-Gm-Message-State: AOAM533b/vUw8WINpwHTsqoYVbOsG0+xRvBUaTWSPoRyXBk18LsF1ifd
 CdwivdIxLVIyCkX9Qr27p6k8m5vUKFlsL4Vc6TFhCYkTAbrffVBxUdffHWciooya0S75XdX43ZE
 o1oo1T269XIntuqM=
X-Received: by 2002:ad4:5b8a:: with SMTP id 10mr52662qvp.48.1627480592438;
 Wed, 28 Jul 2021 06:56:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJQ5rRiN0y3NppSLUQBi0mmYufQhGVgbY/wkCz89H47CgJ7Gv5H5PmIsj2MXRdE4+jBKEt+Q==
X-Received: by 2002:ad4:5b8a:: with SMTP id 10mr52641qvp.48.1627480592106;
 Wed, 28 Jul 2021 06:56:32 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id k10sm2823437qtp.76.2021.07.28.06.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 06:56:31 -0700 (PDT)
Date: Wed, 28 Jul 2021 09:56:30 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 4/9] memory: Don't do topology update in memory
 finalize()
Message-ID: <YQFiDqy7FyXabG55@t490s>
References: <20210723193444.133412-1-peterx@redhat.com>
 <20210723193444.133412-5-peterx@redhat.com>
 <1ced8a81-18a2-85fe-0323-03dbc606f73e@redhat.com>
 <YQAt/V06OZgjhpI6@t490s>
 <5fb63e79-7a75-d7bc-2c62-9149f91c5d83@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5fb63e79-7a75-d7bc-2c62-9149f91c5d83@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 28, 2021 at 02:13:17PM +0200, David Hildenbrand wrote:
> On 27.07.21 18:02, Peter Xu wrote:
> > On Tue, Jul 27, 2021 at 03:21:31PM +0200, David Hildenbrand wrote:
> > > On 23.07.21 21:34, Peter Xu wrote:
> > > > Topology update could be wrongly triggered in memory region finalize() if
> > > > there's bug somewhere else.  It'll be a very confusing stack when it
> > > > happens (e.g., sending KVM ioctl within the RCU thread, and we'll observe it
> > > > only until it fails!).
> > > > 
> > > > Instead of that, we use the push()/pop() helper to avoid memory transaction
> > > > commit, at the same time we use assertions to make sure there's no pending
> > > > updates or it's a nested transaction, so it could fail even earlier and in a
> > > > more explicit way.
> > > > 
> > > > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > > ---
> > > >    softmmu/memory.c | 23 +++++++++++++++++++++--
> > > >    1 file changed, 21 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > > > index 1a3e9ff8ad..dfce4a2bda 100644
> > > > --- a/softmmu/memory.c
> > > > +++ b/softmmu/memory.c
> > > > @@ -170,6 +170,12 @@ struct MemoryRegionIoeventfd {
> > > >        EventNotifier *e;
> > > >    };
> > > > +/* Returns whether there's any pending memory updates */
> > > > +static bool memory_region_has_pending_update(void)
> > > > +{
> > > > +    return memory_region_update_pending || ioeventfd_update_pending;
> > > > +}
> > > > +
> > > >    static bool memory_region_ioeventfd_before(MemoryRegionIoeventfd *a,
> > > >                                               MemoryRegionIoeventfd *b)
> > > >    {
> > > > @@ -1756,12 +1762,25 @@ static void memory_region_finalize(Object *obj)
> > > >         * and cause an infinite loop.
> > > >         */
> > > >        mr->enabled = false;
> > > > -    memory_region_transaction_begin();
> > > > +
> > > > +    /*
> > > > +     * Use push()/pop() instead of begin()/commit() to make sure below block
> > > > +     * won't trigger any topology update (which should never happen, but it's
> > > > +     * still a safety belt).
> > > > +     */
> > > 
> > > Hmm, I wonder if we can just keep the begin/end semantics and just do an
> > > assertion before doing the commit? Does anything speak against that?
> > 
> > That sounds working too for the case of run_on_cpu and similar, but I think
> > this patch should be able to cover more.  For example, it's possible depth==0
> > when enter memory_region_finalize(), but some removal of subregions could
> > further cause memory layout changes.  IMHO we should also bail out early for
> > those cases too.  Thanks,
> > 
> 
> Do we really have to switch to push/pop to catch these cases early? I'd
> assume we'd just have to formulate the right assertions :)

The subject and commit message was trying to tell why. :)

"memory: Don't do topology update in memory finalize()"

The root reason is errors within memory commit can be very hard to digest,
however the assertion failure is easier to understand because any memory layout
change is not expected to happen.

The push/pop (I renamed it after your other comment to depth_inc/dec) avoids
memory commit happening at all within finalize(), and make sure we always fail
at the assertion as long as there's any potential memory update (even if the
memory update won't crash qemu immediately).

Thanks,

-- 
Peter Xu


