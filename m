Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696EF6DEBB6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 08:20:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmTp4-0001xY-0Z; Wed, 12 Apr 2023 02:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pmTp1-0001wm-Gn
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 02:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pmToz-0007F8-JF
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 02:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681280348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E9M2fK9qHvAJ/wGWvQU80ss07O4iwQZzTXM7ASOAZsk=;
 b=M7Mo2RjwRmVFZBbp99wJmPWeuvfRWqVPLQu5kFm2r0hxIMLuJ49crvrNq3zYIBn/hL4F2z
 vjM0vzFTm/HVXIFhBZHaxiWqnajAxF8P1E/CVUCOd87NIMjP5VYci+RPRxXM9FgYgYF/Fs
 ACNDlwNjXExy81N/vWycRqxTKNNWGbM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-oU_06JzmPV-mcd5HQ-J6Jw-1; Wed, 12 Apr 2023 02:19:06 -0400
X-MC-Unique: oU_06JzmPV-mcd5HQ-J6Jw-1
Received: by mail-qk1-f197.google.com with SMTP id
 q79-20020a374352000000b007484744a472so5349905qka.22
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 23:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681280346; x=1683872346;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E9M2fK9qHvAJ/wGWvQU80ss07O4iwQZzTXM7ASOAZsk=;
 b=QwSY8tDPXytZ25Yb3darcOO3wDH3nYUKEgCdKKIH+SjfL4mfRhA6TdCGzbDhD1hJex
 aIBSfytMVABk+mq3BGF7DtM8Ro9LKuLxNX4qs0SEvYHs6iPs2p191nzE2XyQaSCUvhg1
 5gqN2av0kWpC93tYrKHs9fKTR5STJXkOjfWn9olYL0iU+vd3c85VG3T7FcJU66RaM6+L
 sGZzd64BARp7OQqDUBsk6w0XyG96MOPymYFDf6TPUP0Zj4q4lbSttYca1VlAa2Y7RBRW
 hQleU/4W1YVCFSOqhZjgOhDV/aeXEtU/ApBKlctWl9tuOkD/bOyCXTtNcAuKnxUxsz51
 koog==
X-Gm-Message-State: AAQBX9fjhxQf5Nikgp/iv/I8/NX6U7jAAnBluWkmAlMJoxiwbnJtOOTY
 CkTft3Qb+z3MhW5I3g0MPMFITximTNvO9Z60I1qZCkedkC3JTRCZIZOPz1EtGx1pKI/Am+gosMF
 EBphuKk8LM+J9tTCXxV3ibyqOdAt2gh8=
X-Received: by 2002:ad4:5913:0:b0:5ef:41e3:3cba with SMTP id
 ez19-20020ad45913000000b005ef41e33cbamr249896qvb.3.1681280346290; 
 Tue, 11 Apr 2023 23:19:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350bMnxauVPSSSkFoRUvBtc3Yf6uk41RJ/f15Ifo0vdRai9fSts3zZi9KzejHyk1wQxQ+SP/ANDg9GgxgPrqGuHU=
X-Received: by 2002:ad4:5913:0:b0:5ef:41e3:3cba with SMTP id
 ez19-20020ad45913000000b005ef41e33cbamr249886qvb.3.1681280345988; Tue, 11 Apr
 2023 23:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaqyWdV6pKP0SVZciMiu_HN86aJriZh0HBiwHNkO7+yErXnBA@mail.gmail.com>
 <CAJaqyWceWu5EpwAZjEAe5EkJ=SQ4bVYXohCjgqpkFtKiSb+OHQ@mail.gmail.com>
 <CACGkMEu0PYQ=dS=VcfOCX32153emzB9R++8K3HGXnyt2x8BDpQ@mail.gmail.com>
In-Reply-To: <CACGkMEu0PYQ=dS=VcfOCX32153emzB9R++8K3HGXnyt2x8BDpQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 12 Apr 2023 14:18:54 +0800
Message-ID: <CACGkMEsvgv-nrjpLo67hFUf+5tau7kPgUu9TBh8PU5QruagMVQ@mail.gmail.com>
Subject: Re: Reducing vdpa migration downtime because of memory pin / maps
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Longpeng <longpeng2@huawei.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <elic@nvidia.com>, 
 Parav Pandit <parav@nvidia.com>, Juan Quintela <quintela@redhat.com>, 
 David Gilbert <dgilbert@redhat.com>
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

On Wed, Apr 12, 2023 at 1:56=E2=80=AFPM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Tue, Apr 11, 2023 at 8:34=E2=80=AFPM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Wed, Apr 5, 2023 at 1:37=E2=80=AFPM Eugenio Perez Martin <eperezma@r=
edhat.com> wrote:
> > >
> > > Hi!
> > >
> > > As mentioned in the last upstream virtio-networking meeting, one of
> > > the factors that adds more downtime to migration is the handling of
> > > the guest memory (pin, map, etc). At this moment this handling is
> > > bound to the virtio life cycle (DRIVER_OK, RESET). In that sense, the
> > > destination device waits until all the guest memory / state is
> > > migrated to start pinning all the memory.
> > >
> > > The proposal is to bind it to the char device life cycle (open vs
> > > close), so all the guest memory can be pinned for all the guest / qem=
u
> > > lifecycle.
> > >
> > > This has two main problems:
> > > * At this moment the reset semantics forces the vdpa device to unmap
> > > all the memory. So this change needs a vhost vdpa feature flag.
> > > * This may increase the initialization time. Maybe we can delay it if
> > > qemu is not the destination of a LM. Anyway I think this should be
> > > done as an optimization on top.
> > >
> >
> > Expanding on this we could reduce the pinning even more now that vring
> > supports VA [1] with the emulated CVQ.
>
> Note that VA for hardware means the device needs to support page fault
> through either PRI or vendor specific interface.
>
> >
> > Something like:
> > - Add VHOST_VRING_GROUP_CAN_USE_VA ioctl to check if a given VQ group
> > capability. Passthrough devices with emulated CVQ would return false
> > for the dataplane and true for the control vq group.

We don't even need this actually, since the pinning is not visible to
the userspace. Userspace can only see the IOTLB abstraction actually.

We can invent a group->use_va, then when we attach AS to a group that
can use va, we can avoid the pinning.

Thanks

> > - If that is true, qemu does not need to map and translate addresses
> > for CVQ but to directly provide VA for buffers. This avoids pinning,
> > translations, etc in this case.
>
> For CVQ yes, but we only avoid the pinning for CVQ not others.
>
> Thanks
>
> >
> > Thanks!
> >
> > [1] https://lore.kernel.org/virtualization/20230404131326.44403-2-sgarz=
are@redhat.com/
> >


