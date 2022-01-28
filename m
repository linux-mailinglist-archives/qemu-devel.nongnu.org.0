Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345EF49F28C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 05:36:56 +0100 (CET)
Received: from localhost ([::1]:48078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDJ0J-000661-At
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 23:36:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nDIOV-0008WQ-3y
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:57:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nDIOQ-00047C-Qg
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643342265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jWvHlR7f12xl5QlYdeCb5wE6G0pG1QFlh+7tBOuNAe4=;
 b=U+0OT13JbEDquBVk2jeBkvHemBDceFRjbwhSsTcDuPhXTYMbusxHQtvJw687grWfJ1Hl9f
 ta0VnVVTPXKmj424K3NLZ4P8dF0XHMDDsbidaToaIQdW29tqxDXiAdUD+NMoFz8IP/Dz1P
 KRPVQekG6xWKa2ix33VdN6QgzFhExlM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-gRhpA2mXOTyDOQyJyMZI0w-1; Thu, 27 Jan 2022 22:57:44 -0500
X-MC-Unique: gRhpA2mXOTyDOQyJyMZI0w-1
Received: by mail-wr1-f69.google.com with SMTP id
 g17-20020adfa591000000b001da86c91c22so1754450wrc.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 19:57:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jWvHlR7f12xl5QlYdeCb5wE6G0pG1QFlh+7tBOuNAe4=;
 b=8B5BNMCk8FovyZPmPl+t/uoBCq6epItV2SDhvK4BlfmNB6tnvtsSqLd8KVNnHgXPrY
 9QW9D2AlAQCBJJcBGvUX9Qr12veaRPMMSXD68IYx9f+9j6FrAEJSmcKGKhEW9oq08TFq
 THdMeC7t12Nl5mwoVhiM6fHfXwGdHCEmHOO1u4t+5hMzsRhuzoUQOWiI0Aqh3ebvvKFx
 N0cB4H2t1ZjtXYnj6vEi09OquDavOlyahnxkL26bOzoIQ8/NmmhU/TkXGMlsHhisLtgy
 OTzSf7TE+oqqNti8on6GwN8ZLjxUqPVMps7bwvIMz8D/YO70AjXfrZhq6gAmP2im/vm8
 mpsA==
X-Gm-Message-State: AOAM5320hKOqumX/by/PphOIsmJfiPsoApMVB7r1CWymsXleG36fheOb
 QHDNjvI35sI0f+y4snRgZ8AuMGxvgfgjcfR9S9pZ/u4rQ2fzMHdLVPfK0ncSqh3izC3UeLXAwNF
 5oAqBs9YlzYnXwiY=
X-Received: by 2002:a05:6000:1869:: with SMTP id
 d9mr5410547wri.432.1643342262988; 
 Thu, 27 Jan 2022 19:57:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwf5IuzSvJxcgfQuZPBSRPgkHI3ACKszhhRY9oImVHXp/pw0dSLnOrDNR2IlDXGR3OHU8Bbrg==
X-Received: by 2002:a05:6000:1869:: with SMTP id
 d9mr5410528wri.432.1643342262784; 
 Thu, 27 Jan 2022 19:57:42 -0800 (PST)
Received: from xz-m1.local ([64.64.123.9])
 by smtp.gmail.com with ESMTPSA id u14sm946742wmq.24.2022.01.27.19.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 19:57:42 -0800 (PST)
Date: Fri, 28 Jan 2022 11:57:32 +0800
From: Peter Xu <peterx@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH 21/31] util: Add iova_tree_alloc
Message-ID: <YfNprA3OLUqj8LSG@xz-m1.local>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-22-eperezma@redhat.com>
 <Ye4r7tKFhP9VaT5/@xz-m1.local>
 <CAJaqyWf--wbNZz5ZzbpixD9op_fO5fV01kbYXzG097c_NkqYrw@mail.gmail.com>
 <Ye6IhLCe6NDKO6+E@xz-m1.local>
 <CAJaqyWcdpTr2X4VuAN2NLmpviCjDoAaY269+VQGZ7-F6myOhSw@mail.gmail.com>
 <YfJSezhQv1kXa1x8@xz-m1.local>
 <CAJaqyWczZ7C_vbwugyN9bEgOVuRokGqVMb_g5UK_R4F8O+qKOA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWczZ7C_vbwugyN9bEgOVuRokGqVMb_g5UK_R4F8O+qKOA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 27, 2022 at 10:24:27AM +0100, Eugenio Perez Martin wrote:
> On Thu, Jan 27, 2022 at 9:06 AM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Tue, Jan 25, 2022 at 10:40:01AM +0100, Eugenio Perez Martin wrote:
> > > So I think that the first step to remove complexity from the old one
> > > is to remove iova_begin and iova_end.
> > >
> > > As Jason points out, removing iova_end is easier. It has the drawback
> > > of having to traverse all the list beyond iova_end, but a well formed
> > > iova tree should contain none. If the guest can manipulate it, it's
> > > only hurting itself adding nodes to it.
> > >
> > > It's possible to extract the check for hole_right (or this in Jason's
> > > proposal) as a special case too.
> > >
> > > But removing the iova_begin parameter is more complicated. We cannot
> > > know if it's a valid hole without knowing iova_begin, and we cannot
> > > resume traversing. Could we assume iova_begin will always be 0? I
> > > think not, the vdpa device can return anything through syscall.
> >
> > Frankly I don't know what's the syscall you're talking about,
> 
> I meant VHOST_VDPA_GET_IOVA_RANGE, which allows qemu to know the valid
> range of iova addresses. We get a pair of uint64_t from it, that
> indicates the minimum and maximum iova address the device (or iommu)
> supports.
> 
> We must allocate iova ranges within that address range, which
> complicates this algorithm a little bit. Since the SVQ iova addresses
> are not GPA, qemu needs extra code to be able to allocate and free
> them, creating a new custom iova as.
> 
> Please let me know if you want more details or if you prefer me to
> give more context in the patch message.

That's good enough, thanks.

> 
> > I mean this one:
> >
> > https://lore.kernel.org/qemu-devel/20211029183525.1776416-24-eperezma@redhat.com/
> >
> > Though this time I have some comments on the details.
> >
> > Personally I like that one (probably with some amendment upon the old version)
> > more than the current list-based approach.  But I'd like to know your thoughts
> > too (including Jason).  I'll further comment in that thread soon.
> >
> 
> Sure, I'm fine with whatever solution we choose, but I'm just running
> out of ideas to simplify it. Reading your suggestions on old RFC now.
> 
> Overall I feel list-based one is both more convenient and easy to
> delete when qemu raises the minimal glib version, but it adds a lot
> more code.
> 
> It could add less code with this less elegant changes:
> * If we just put the list entry in the DMAMap itself, although it
> exposes unneeded implementation details.
> * We force the iova tree either to be an allocation-based or an
> insertion-based, but not both. In other words, you can only either use
> iova_tree_alloc or iova_tree_insert on the same tree.

Yeah, I just noticed it yesterday that there's no easy choice on it.  Let's go
with either way; it shouldn't block the rest of the code.  It'll be good if
Jason or Michael share their preferences too.

> 
> I have a few tests to check the algorithms, but they are not in the
> qemu test format. I will post them so we all can understand better
> what is expected from this.

Sure.  Thanks.

-- 
Peter Xu


