Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31CE6AB522
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 04:46:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ1nw-0000pj-46; Sun, 05 Mar 2023 22:46:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZ1nt-0000pY-Pf
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 22:46:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZ1ns-00048E-2f
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 22:46:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678074383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lA6EdQFoz6/bA2IP0XD5/Z618bjisofCHFMQXSkQBA=;
 b=hsmk9PjWulcvJ2ChhcJWE7NzidH+jfrINesDPOoWD9cuwcz+muThTAWk/zcrBUDegqMKOp
 6V5vdIVXwn0Rg6qbvl5VGmcoqFHip17gKk8JVEvJ1R3qTDvcMR7stdrTftCOX3YCfJafVv
 KdOypljjSx7mTMRC0mK3e5kWGh2AMcc=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-f6cWOmlSOF-8mcPlSyOXzg-1; Sun, 05 Mar 2023 22:46:21 -0500
X-MC-Unique: f6cWOmlSOF-8mcPlSyOXzg-1
Received: by mail-ot1-f70.google.com with SMTP id
 e89-20020a9d01e2000000b0069420c0c6a8so3778254ote.12
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 19:46:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678074381;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/lA6EdQFoz6/bA2IP0XD5/Z618bjisofCHFMQXSkQBA=;
 b=TKx1iE7maCyqRqee2V38I3B9ND7TG1FfpD6crsEZCmNP0S1pkrNT8ifg+6l4S4q5M7
 ccnIWUsrI7TYiyv6DX58Rr3pmsRaH71HePZ4ePgiS57NJ6Sqftu2z4CAQIJ1tOD8Chip
 c8REA101ZoQJqHmhpd+u2yfD8GnjxA2egyBvB66QfycPtLpBgnOU94MVXLxlso2YXVY6
 MRhT0b5EuGWKYBKw9RkJ5X0q2tLc+hRQsw6O+mjLI13wg1fjg0AUEv/WKKgJ8wSz7BzT
 h3HrjClhr+Pzd3cgeBXitXZiRobK/FLk8jijBgEzC2TSK8q2IZmlllaBmliRFoehmQfX
 +c/g==
X-Gm-Message-State: AO0yUKX9LYWbf118ENjr4U4aNWEdNmXEgsv09SLBvEGh2OqnS8D619vf
 qWsPRED74H25pyQZaq3Nb4dvQ1kWTLzmk8sGbiLdPv+FJcINpKH/toJnpsbsCBItTZhtqsI1A3D
 +DM2NCQwMtQ4upibocYpA0uZ6FrTkRw8=
X-Received: by 2002:a05:6870:c79a:b0:176:6a34:52ab with SMTP id
 dy26-20020a056870c79a00b001766a3452abmr2326867oab.9.1678074381081; 
 Sun, 05 Mar 2023 19:46:21 -0800 (PST)
X-Google-Smtp-Source: AK7set+zpMoQ+14jTU7Cedx/sgtfcQ83ap2UUeLwKkaIVFGPVQ6lTA+39T+PaV+BejOQ7lnCaLZVVzc0gyBx6cD/Oas=
X-Received: by 2002:a05:6870:c79a:b0:176:6a34:52ab with SMTP id
 dy26-20020a056870c79a00b001766a3452abmr2326860oab.9.1678074380861; Sun, 05
 Mar 2023 19:46:20 -0800 (PST)
MIME-Version: 1.0
References: <20230228142514.2582-1-longpeng2@huawei.com>
 <CACGkMEtvGwCVzSa1UpXK971bynNqybPAVa3QQ9e9Hw04j-ivHQ@mail.gmail.com>
 <ZAUJUfxeqDDpRhZW@x1n>
In-Reply-To: <ZAUJUfxeqDDpRhZW@x1n>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 6 Mar 2023 11:46:09 +0800
Message-ID: <CACGkMEskbrQ2TUDH27mGCGjjmwOT5Ux1GDzGFogt5sDrBnd+EQ@mail.gmail.com>
Subject: Re: [PATCH] memory: avoid unnecessary iteration when updating
 ioeventfds
To: Peter Xu <peterx@redhat.com>
Cc: "Longpeng(Mike)" <longpeng2@huawei.com>, pbonzini@redhat.com,
 david@redhat.com, 
 philmd@linaro.org, mst@redhat.com, qemu-devel@nongnu.org, eperezma@redhat.com, 
 arei.gonglei@huawei.com, yechuan@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Mon, Mar 6, 2023 at 5:27=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Mar 01, 2023 at 04:36:20PM +0800, Jason Wang wrote:
> > On Tue, Feb 28, 2023 at 10:25=E2=80=AFPM Longpeng(Mike) <longpeng2@huaw=
ei.com> wrote:
> > >
> > > From: Longpeng <longpeng2@huawei.com>
> > >
> > > When updating ioeventfds, we need to iterate all address spaces and
> > > iterate all flat ranges of each address space. There is so much
> > > redundant process that a FlatView would be iterated for so many times
> > > during one commit (memory_region_transaction_commit).
> > >
> > > We can mark a FlatView as UPDATED and then skip it in the next iterat=
ion
> > > and clear the UPDATED flag at the end of the commit. The overhead can
> > > be significantly reduced.
> > >
> > > For example, a VM with 16 vdpa net devices and each one has 65 vector=
s,
> > > can reduce the time spent on memory_region_transaction_commit by 95%.
> > >
> > > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > > ---
> > >  include/exec/memory.h |  2 ++
> > >  softmmu/memory.c      | 28 +++++++++++++++++++++++++++-
> > >  2 files changed, 29 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > > index 2e602a2fad..974eabf765 100644
> > > --- a/include/exec/memory.h
> > > +++ b/include/exec/memory.h
> > > @@ -1093,6 +1093,8 @@ struct FlatView {
> > >      unsigned nr_allocated;
> > >      struct AddressSpaceDispatch *dispatch;
> > >      MemoryRegion *root;
> > > +#define FLATVIEW_FLAG_IOEVENTFD_UPDATED (1 << 0)
> > > +    unsigned flags;
> > >  };
> > >
> > >  static inline FlatView *address_space_to_flatview(AddressSpace *as)
> > > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > > index 9d64efca26..71ff996712 100644
> > > --- a/softmmu/memory.c
> > > +++ b/softmmu/memory.c
> > > @@ -815,6 +815,15 @@ FlatView *address_space_get_flatview(AddressSpac=
e *as)
> > >      return view;
> > >  }
> > >
> > > +static void address_space_reset_view_flags(AddressSpace *as, unsigne=
d mask)
> > > +{
> > > +    FlatView *view =3D address_space_get_flatview(as);
> > > +
> > > +    if (view->flags & mask) {
> > > +        view->flags &=3D ~mask;
> > > +    }
> > > +}
> > > +
> > >  static void address_space_update_ioeventfds(AddressSpace *as)
> > >  {
> > >      FlatView *view;
> > > @@ -825,6 +834,12 @@ static void address_space_update_ioeventfds(Addr=
essSpace *as)
> > >      AddrRange tmp;
> > >      unsigned i;
> > >
> > > +    view =3D address_space_get_flatview(as);
> > > +    if (view->flags & FLATVIEW_FLAG_IOEVENTFD_UPDATED) {
> > > +        return;
> > > +    }
> > > +    view->flags |=3D FLATVIEW_FLAG_IOEVENTFD_UPDATED;
> > > +
> >
> > Won't we lose the listener calls if multiple address spaces have the
> > same flatview?
>
> I have the same concern with Jason.  I don't think it matters in reality,
> since only address_space_io uses it so far. but it doesn't really look
> reasonable and clean.

Yes, I think in the memory core it should not assume how the eventfds are u=
sed.

>
> One other idea of optimizing ioeventfd update is we can add a per-AS
> counter (ioeventfd_notifiers), increase if any eventfd_add|del is
> registered in memory_listener_register(), and decrease when unregister.
> Then address_space_update_ioeventfds() can be skipped completely if
> ioeventfd_notifiers=3D=3D0.
>
> Side note: Jason, do you think we should drop vhost_eventfd_add|del?
> They're all no-ops right now.

I think so.

Thanks

>
> Thanks,
>
> --
> Peter Xu
>


