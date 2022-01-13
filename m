Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BA248D26C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 07:47:01 +0100 (CET)
Received: from localhost ([::1]:59396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7tsh-0004rv-CT
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 01:46:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7tfR-0001yj-2z
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 01:33:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7tfO-0006NJ-CV
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 01:32:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642055577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uaBiCyRz1gWNDkndDPW/89zaAdvs/uvuN5QX5e6w2z4=;
 b=YjV8oRzPhuxvCIpRtfnbGe8AeapgbTnCOXgOOp2NUv3lawiwrDjSFhUhKkW1ra2xAyXmpg
 ydFMoqDtiU9cqgmDoSivs0tX16s5+QtfxYRgyxPwvTmYOJjOwbE0FlQjWoBTWa0shJ/Deb
 0Ki9BVlsVEV+4ecyMlsC+PrJ3HUvmbM=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-0RxLsd3BNlC9kWOwoEhMCw-1; Thu, 13 Jan 2022 01:32:55 -0500
X-MC-Unique: 0RxLsd3BNlC9kWOwoEhMCw-1
Received: by mail-pj1-f71.google.com with SMTP id
 j13-20020a17090a318d00b001b3e4f72bfbso5589097pjb.9
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 22:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uaBiCyRz1gWNDkndDPW/89zaAdvs/uvuN5QX5e6w2z4=;
 b=GVhtM6MTIPsh2aXGhxAgW84ZzK03+S1Yaxl0fQ2UpWKg269Cw+OcPhuds1A1wzznZU
 O5upfzC9vXSWIIXSJmgcxZ9DEL8ffHpOegXZcXg6ESvi8gPEo3hTKzQsDzwuuMgqP11u
 59Ux1FMseXcK3c7FSbwF078k8YrH4xwAF3E4m+VVuQdf9S8rVAW6P27M9HWIBKHhNhbG
 GXO2dUabCyuzKZtAgy4be8SDzFijYa6Ewh4A8AA6WNs3dXJLKU+jGY9k4hxvA3Nwf9Zs
 1Jsh8p4Ct0HSKxJ2J0m72h2SaqrEYhw+CFujv7TfjeRMQVLllCp2RAFJQF4WJXS4sala
 hauw==
X-Gm-Message-State: AOAM530P6nAiAgElIaIpqQSDvrw4Scd971Q2tVfYikQgKf+ccNnEtl7Q
 TYlx6RGGTzUaonu0AORKAsaaF64Ris3PUGTyJvAashpxizjvqMq8fm6SxBk06oQM+rDrw9cyuol
 OARjTfuKUXK5yHJI=
X-Received: by 2002:a17:90a:db0b:: with SMTP id
 g11mr13021067pjv.46.1642055574150; 
 Wed, 12 Jan 2022 22:32:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrbTy1ruVuUU4Yjvmo9XdnSjgnPjtlbWtSRMv5kKXyE//0N19B4WGlVKqPPUBbC6mqbnjI7Q==
X-Received: by 2002:a17:90a:db0b:: with SMTP id
 g11mr13021050pjv.46.1642055573889; 
 Wed, 12 Jan 2022 22:32:53 -0800 (PST)
Received: from xz-m1.local ([191.101.132.233])
 by smtp.gmail.com with ESMTPSA id 13sm1577670pfm.161.2022.01.12.22.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 22:32:53 -0800 (PST)
Date: Thu, 13 Jan 2022 14:32:48 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/3] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
Message-ID: <Yd/HkPuflaEcozKt@xz-m1.local>
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-3-jasowang@redhat.com>
 <Yd+d9ydZl7tLYWBj@xz-m1.local>
 <CACGkMEvuqneYVyP2s=OnJpZPr5Cx11AA4fiFcC2=TTZzJLOzHA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvuqneYVyP2s=OnJpZPr5Cx11AA4fiFcC2=TTZzJLOzHA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, yi.y.sun@linux.intel.com,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 02:16:35PM +0800, Jason Wang wrote:
> On Thu, Jan 13, 2022 at 11:35 AM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Wed, Jan 05, 2022 at 12:19:43PM +0800, Jason Wang wrote:
> > > We use to warn on wrong rid2pasid entry. But this error could be
> > > triggered by the guest and could happens during initialization. So
> > > let's don't warn in this case.
> > >
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > >  hw/i386/intel_iommu.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > > index 4c6c016388..f2c7a23712 100644
> > > --- a/hw/i386/intel_iommu.c
> > > +++ b/hw/i386/intel_iommu.c
> > > @@ -1524,8 +1524,10 @@ static bool vtd_dev_pt_enabled(IntelIOMMUState *s, VTDContextEntry *ce)
> > >      if (s->root_scalable) {
> > >          ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
> > >          if (ret) {
> > > -            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
> > > -                              __func__, ret);
> > > +            /*
> > > +             * This error is guest triggerable. We should assumt PT
> > > +             * not enabled for safety.
> > > +             */
> > >              return false;
> > >          }
> > >          return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
> > > --
> > > 2.25.1
> > >
> >
> > No strong opinion, but the thing is mostly all error_report_once() in this file
> > is guest triggerable.  If we remove this one then it's debatable on whether we
> > want to remove all.
> >
> > IMHO we used the _once() variant just for this: it won't go into any form of
> > DoS, meanwhile we'll still get some information (as hypervisor) that the guest
> > OS may not be trustworthy.
> >
> > So from that pov it's still useful?  Or is this error very special in some way?
> 
> I want to be consistent with vtd_as_pt_enabled() where we don't even
> have error_report_once().

According to the comments (which, I think, left over by myself..) in
vtd_as_pt_enabled() - maybe indeed it could be triggered during guest boot.
Then I assume this can indeed a special case.

Acked-by: Peter Xu <peterx@redhat.com>

Thanks.

-- 
Peter Xu


