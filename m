Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7ED48D24A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 07:20:03 +0100 (CET)
Received: from localhost ([::1]:48536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7tSr-00045a-Od
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 01:20:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n7tPu-0002z8-Jm
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 01:16:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n7tPr-0004Je-5L
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 01:16:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642054613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P9T4s153fP28I4Z0I3TdMxw5gjhKxqH9VdyhsD6szVA=;
 b=Y8jb/zTrOiL+acNH1dhmKjUSnq3aq6qshR/muBDXIcMULrulkzHZX2HGtwC1aiCBrWEmMb
 48mwn1blqtOWBcK6bL4zjV5j7KGBle3FYbNTOlcX4O4vZX9smL8ukkc4DfNSv9xGmxF3mH
 0QbXbXrvkpbte0iJzZFPhxf49SR5vjo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-JsMWHBELPNeQmRphfy3fsQ-1; Thu, 13 Jan 2022 01:16:49 -0500
X-MC-Unique: JsMWHBELPNeQmRphfy3fsQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 c7-20020ac24147000000b0042ac92336d1so3249068lfi.2
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 22:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P9T4s153fP28I4Z0I3TdMxw5gjhKxqH9VdyhsD6szVA=;
 b=0Y9E0jFyJ/IRA1lzXzOfk9x1M9+dy5ICPGuOfPmXQGLMTgpi396bQjhP8HnodLjIR9
 OKbrOhIBrbrmx+5V9Cd8hLU6qHCK7xxUB5pJZEs4nh4XnbH2KARHChMEQqAkfZq0ErUs
 vYbezaA4tTgHknuWGp7CypRDZtFXGfoHc9OENabcjxOMLzihgStUe6jOrOfsu/jo/w/U
 hJWNhO3k1ewTw1D1mxOS74e5ed5rvLFOieXnfiyijIWYwtA8Th7iHR+JLJD02KsEMMRo
 s4EZ9KrPtOdMYdGJebLqUNpER9pTwzpRD0y8b5eR94eurxjMc5tzhBotd+waPQ5en6E3
 smKQ==
X-Gm-Message-State: AOAM532V/Fo1DrFMAXI1iiScA13V840zrw2uXV1HuUv8wu+L3oNq7ylE
 G5KKtbqOd65c8LscaC6Af1HfvE+0RaIGuhP9895/UcgTZ6KcNLdnoBc+Hx/Dv5Y5O9tePVsTp3w
 tI1L6oQ2x5YIc4vPhriGgiDjieXMLOT0=
X-Received: by 2002:a19:760f:: with SMTP id c15mr2239663lff.498.1642054607799; 
 Wed, 12 Jan 2022 22:16:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqw7FfCmEYYWg07oyzOYzGLQwo6wMWhDjL2PZSzjxnC0gsDf/EJFj2zI0PvzCXEb/pWTTYQoMpuSg5AKqliKA=
X-Received: by 2002:a19:760f:: with SMTP id c15mr2239652lff.498.1642054607559; 
 Wed, 12 Jan 2022 22:16:47 -0800 (PST)
MIME-Version: 1.0
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-3-jasowang@redhat.com>
 <Yd+d9ydZl7tLYWBj@xz-m1.local>
In-Reply-To: <Yd+d9ydZl7tLYWBj@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 13 Jan 2022 14:16:35 +0800
Message-ID: <CACGkMEvuqneYVyP2s=OnJpZPr5Cx11AA4fiFcC2=TTZzJLOzHA@mail.gmail.com>
Subject: Re: [PATCH 1/3] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Thu, Jan 13, 2022 at 11:35 AM Peter Xu <peterx@redhat.com> wrote:
>
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

I want to be consistent with vtd_as_pt_enabled() where we don't even
have error_report_once().

Thanks

>
> Thanks,
>
> --
> Peter Xu
>


