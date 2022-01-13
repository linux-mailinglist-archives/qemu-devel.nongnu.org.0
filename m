Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7E948D2B8
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 08:20:15 +0100 (CET)
Received: from localhost ([::1]:55342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7uP8-00083Q-7G
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 02:20:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n7uAX-00005s-5I
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:05:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n7uAU-0002Ns-Vb
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 02:05:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642057506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KPeByeygU1rQZbVpcwtm1piq6wKYJdztXEgKiv5en04=;
 b=abT9uVM3T70tEkwAKGs/23z7ftPjECaw2VnccJ1zkEcZS5wWsqyce9KDqOKGA963ZXv1c1
 9mZKp0SbCbUqyjHr3ihwL/A5SHDzY7VHMYUWOoYjIInLv2R7ftRA+nziclZCL8X3W6/9mK
 p+nVmxv2UeNLw/fQOda2uzTEVsu+Hxk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-a98T_qD1MRaZ9I4o6Nnc6Q-1; Thu, 13 Jan 2022 02:05:05 -0500
X-MC-Unique: a98T_qD1MRaZ9I4o6Nnc6Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 g2-20020a056402424200b003f8ee03207eso4506760edb.7
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 23:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KPeByeygU1rQZbVpcwtm1piq6wKYJdztXEgKiv5en04=;
 b=4cHqTGGqyVXI9RED5qNNcXssoTjZ04T/O1OgmPer4Ka+14AIb79z9HNt8/zqJ2WN2N
 1kArLD6Cf+AveFGQexYFbXP0oIo4pCA330yHgRqiBDF3Cart9kKWErcsF6NPOPKJxNIS
 nb5vKZzpFr6jv4FCs/8GP24151Gn0pOrHCRZweQh2dKqJKv82eRYEOsixTQFKJRfpU6L
 DUUwWOrL8mYq300dNM8X4KVy7kOo1TE8WM/tVPGyX+lZPNOTTzwwDJag+tyM5LLHnJnJ
 PLj0rFdqzOCZdCyOfpq//JntUGKdkLr3M2w+Zcv0mFGRABn5dXpll6d8cgayDRhQhe+x
 agng==
X-Gm-Message-State: AOAM531MjoSHphaUQNiUzqgyUJt2msOqI8vt3Z9mu1xdHbkl1EtO86ie
 LtUKuJJDnT5U7SaVJoP99JVOpC1M6ixrHPrdxXJolNxMyZ25pxHTKOZ44wq/LHx7nLu8zRzCrXN
 ET/znoTi3It878IM=
X-Received: by 2002:a50:d710:: with SMTP id t16mr3014366edi.50.1642057503554; 
 Wed, 12 Jan 2022 23:05:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynQfW4eGiU3UTbJx2RTYtAzQIEi3PVQFsIN4afF8ZkfxVM8H7YaVRa0nRQbJpFTnuOjlezYw==
X-Received: by 2002:a50:d710:: with SMTP id t16mr3014352edi.50.1642057503350; 
 Wed, 12 Jan 2022 23:05:03 -0800 (PST)
Received: from redhat.com ([2.55.6.51])
 by smtp.gmail.com with ESMTPSA id he35sm553378ejc.135.2022.01.12.23.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 23:05:02 -0800 (PST)
Date: Thu, 13 Jan 2022 02:05:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/3] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Message-ID: <20220113020426-mutt-send-email-mst@kernel.org>
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-3-jasowang@redhat.com>
 <Yd+d9ydZl7tLYWBj@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <Yd+d9ydZl7tLYWBj@xz-m1.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, yi.l.liu@intel.com,
 yi.y.sun@linux.intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 11:35:19AM +0800, Peter Xu wrote:
> On Wed, Jan 05, 2022 at 12:19:43PM +0800, Jason Wang wrote:
> > We use to warn on wrong rid2pasid entry. But this error could be
> > triggered by the guest and could happens during initialization. So
> > let's don't warn in this case.
> > 
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  hw/i386/intel_iommu.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index 4c6c016388..f2c7a23712 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -1524,8 +1524,10 @@ static bool vtd_dev_pt_enabled(IntelIOMMUState *s, VTDContextEntry *ce)
> >      if (s->root_scalable) {
> >          ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
> >          if (ret) {
> > -            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
> > -                              __func__, ret);
> > +            /*
> > +             * This error is guest triggerable. We should assumt PT
> > +             * not enabled for safety.
> > +             */
> >              return false;
> >          }
> >          return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
> > -- 
> > 2.25.1
> > 
> 
> No strong opinion, but the thing is mostly all error_report_once() in this file
> is guest triggerable.  If we remove this one then it's debatable on whether we
> want to remove all.
> 
> IMHO we used the _once() variant just for this: it won't go into any form of
> DoS, meanwhile we'll still get some information (as hypervisor) that the guest
> OS may not be trustworthy.
> 
> So from that pov it's still useful?  Or is this error very special in some way?
> 
> Thanks,


Well we have LOG_GUEST_ERROR for guest errors now.

> -- 
> Peter Xu


