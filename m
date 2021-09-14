Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F3740B071
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:18:50 +0200 (CEST)
Received: from localhost ([::1]:60570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9Gr-0003EH-4u
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQ9EP-0001eV-AW
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:16:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQ9EL-0007xV-98
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631628968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3E9hV/fdOLebq1xQ5F99k1enU3axJGsYsqSWFXKSLI=;
 b=FdxmrKwkviNj0BOd9UfEJ0iS3SD+4lBwNkYXnEWbz73vVzW1+V9RDZBiNzntmfiA57SVDK
 bkWBmgBcfUGwjrcYVO0zN0UnUwAFiojIwFcel5XjABPHuPAvl+8t9J7BC8eRcHabm5cHWt
 YZ64Kfr5v37qhMRddHjn5CuOh2cuk5k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-IcbKuWCWNGa9qKEWW7bJyA-1; Tue, 14 Sep 2021 10:16:05 -0400
X-MC-Unique: IcbKuWCWNGa9qKEWW7bJyA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r9-20020a5d4989000000b0015d0fbb8823so3818078wrq.18
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=O3E9hV/fdOLebq1xQ5F99k1enU3axJGsYsqSWFXKSLI=;
 b=WWjQa135qzU06lVHfTMJb1vpPJFnkjN1sPicJ55GboMGwK+hD3XeU6+uEl+lbZEL0w
 YRjHparp5edHKsHf1vk3K2JAGHtoT+39Ptjuj4njKsjGRir8yx4KVhsWQEFdXBS9tpZO
 gp8dE3sUB42GgpQnDgrBKsXYywqjFnhTUumkACcKYCp7DTRryfmtWVOLl5vLSStA69/C
 cT2Koixzedtd6VFbr2DEqGAGMF9xvixYSkrWzV/nc8kREHI7D606XxsgpUt/MFlOYaIx
 MpL/1B1OMAAI787VX2EKcNW5b047Q2zmbeOBGXspH3oXDU0M4qjeU39BH+cQYjs1G2aX
 lJPQ==
X-Gm-Message-State: AOAM5319fpmuOMoSKvPnRu4Qb9nUPJSSduyGJVmv8MNUgTp1bdlg4p/u
 CfV7Wr40g8JyKM810/Cx6G40W+Zjqzuhs46gGB9tTkkm4RQxfSeKSK6ofmdLWS6EKempqK/mIgF
 q+kaKqSDDwQbYHmU=
X-Received: by 2002:a5d:650b:: with SMTP id x11mr18979492wru.350.1631628964730; 
 Tue, 14 Sep 2021 07:16:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwv5U12U3sOll2urufDUEkFO/UFA2yqTmbiH9YFWwA6lBSRE8gQNA2vKOANb/hchoAAL/BkAA==
X-Received: by 2002:a5d:650b:: with SMTP id x11mr18979455wru.350.1631628964444; 
 Tue, 14 Sep 2021 07:16:04 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id l15sm1154997wms.38.2021.09.14.07.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:16:03 -0700 (PDT)
Date: Tue, 14 Sep 2021 15:16:01 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] virtio-balloon: Fix page-poison subsection name
Message-ID: <YUCuoRxfy03eBHd8@work-vm>
References: <20210914131716.102851-1-dgilbert@redhat.com>
 <535891c6-237b-6d37-7492-ef8c1e19e6ca@redhat.com>
 <YUCj3i2BK1HzuztT@work-vm> <YUCqoJzt8VjkcNin@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YUCqoJzt8VjkcNin@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexander Duyck <alexander.duyck@gmail.com>, mst@redhat.com,
 qemu-devel@nongnu.org, stefanha@redhat.com,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Tue, Sep 14, 2021 at 02:30:06PM +0100, Dr. David Alan Gilbert wrote:
> > * David Hildenbrand (david@redhat.com) wrote:
> > > On 14.09.21 15:17, Dr. David Alan Gilbert (git) wrote:
> > > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > > 
> > > > The subsection name for page-poison was typo'd as:
> > > > 
> > > >    vitio-balloon-device/page-poison
> > > > 
> > > > Note the missing 'r' in virtio.
> > > > 
> > > > When we have a machine type that enables page poison, and the guest
> > > > enables it (which needs a new kernel), things fail rather unpredictably.
> > > > 
> > > > The fallout from this is that most of the other subsections fail to
> > > > load, including things like the feature bits in the device, one
> > > > possible fallout is that the physical addresses of the queues
> > > > then get aligned differently and we fail with an error about
> > > > last_avail_idx being wrong.
> > > > It's not obvious to me why this doesn't produce a more obvious failure,
> > > > but virtio's vmstate loading is a bit open-coded.
> > > > 
> > > > Fixes: 7483cbbaf82 ("virtio-balloon: Implement support for page poison reporting feature")
> > > > bz: https://bugzilla.redhat.com/show_bug.cgi?id=1984401
> > > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > > ---
> > > >   hw/virtio/virtio-balloon.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > > > index 5a69dce35d..c6962fcbfe 100644
> > > > --- a/hw/virtio/virtio-balloon.c
> > > > +++ b/hw/virtio/virtio-balloon.c
> > > > @@ -852,7 +852,7 @@ static const VMStateDescription vmstate_virtio_balloon_free_page_hint = {
> > > >   };
> > > >   static const VMStateDescription vmstate_virtio_balloon_page_poison = {
> > > > -    .name = "vitio-balloon-device/page-poison",
> > > > +    .name = "virtio-balloon-device/page-poison",
> > > >       .version_id = 1,
> > > >       .minimum_version_id = 1,
> > > >       .needed = virtio_balloon_page_poison_support,
> > > > 
> > > 
> > > Oh, that's very subtle. I wasn't even aware that the prefix really has to
> > > match the actual device ... I thought the whole idea of the prefix here was
> > > just to make the string unique ...
> > 
> > Subsection naming is *very* critical; the logic is something like:
> >   'we're loading the X device'
> > a subsection arrives for 'N/P'
> > if 'X==N' then it looks in X for subsection P.
> > If 'X!=N' then it assumes we've finished loading X
> > and P is really for an outer device that X is part of.
> > This is horrible.
> 
> Is there value in making this more explicit via a code convention
> for .name field initializers. eg instead of
> 
>    .name = "virtio-balloon-device/page-poison",
> 
> Prefer
> 
>    .name = TYPE_VIRTIO_BALLOON "/page-poison"
> 
> ?

I think it might be better to see if the vmstate code can check it and
error during saving; certainly this case feels detectable, but I need
to keep an eye open for all the other weird cases.

Dave

> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


