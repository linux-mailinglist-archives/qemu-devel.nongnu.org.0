Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CA96DD2F7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 08:37:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm7cq-00078L-9v; Tue, 11 Apr 2023 02:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pm7co-000789-2p
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 02:37:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pm7cm-0001Hw-8Y
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 02:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681195022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdOOIdLPVhTg6JcufQ6uxwZ2P+r6EqgyrQxqnHUOpPI=;
 b=TWMVe9l8RKT7YjOZ5ZnRgsty8XGcnsuslkNE6bQxOlLb3k/fDOl7hpH7Hoa497ZyeOxmGB
 ZrqKR7dPhiOaLdmWwn9dyxyVkhE/EzHpBlfhDpLEqU5IATsM/TOYdCyOTu6HiBOUszRImH
 GdKFiRtdNimI+cLTFc2bBC1v9nyDdO4=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-QthCAhyPOCO99hfRAkz7Lw-1; Tue, 11 Apr 2023 02:36:59 -0400
X-MC-Unique: QthCAhyPOCO99hfRAkz7Lw-1
Received: by mail-ot1-f69.google.com with SMTP id
 s6-20020a056830124600b006a037b882d8so2065700otp.16
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 23:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681195018; x=1683787018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xdOOIdLPVhTg6JcufQ6uxwZ2P+r6EqgyrQxqnHUOpPI=;
 b=DR1uz6vw2e5+ZhZ05nNJA7RVHmp13AE5ujUycWjM/6k74459N0g4eCm27NjcbO5KPr
 m4GXTF0tEO+UuSravzvQM06OgvRuXh90bxlyUtZcKC85Ptc+tNykFwGzOKbmjO0zgywW
 4gQpNRFlgWdZmo0PTintyYKD+iidYXl8e0hHBbXoQJP6VKRaeNkPmV4w7qhzIiQWdyQ3
 Fa4mX9GKRMyvzpLbx4S79lud6y2WJmor/64W5I4CbXj0V9wjpN7+SRNifQi/+dXMraeB
 5L+731yKwONbvrQ1joAtDt+OSlNrNDnRWF8QN/A4aXyxvHk+3CyJroOK4f7JBoYoCjml
 w4tg==
X-Gm-Message-State: AAQBX9dFGoep5yQPkVhBOF112XvQA5lPA1k7b07tyIUWjcUvxG1J3Qf9
 1VQ+3jwabVCszDsLKDAIHckEHloxarqqE1pRFRgiJ6WWsyhiPWKho8uo7oTfqjL2qn+O6+2rOCS
 aWwCxuJAD8C9/1BYSPZlKEThWoRsvKCA=
X-Received: by 2002:a05:6870:4192:b0:17f:1723:fc82 with SMTP id
 y18-20020a056870419200b0017f1723fc82mr795817oac.9.1681195018371; 
 Mon, 10 Apr 2023 23:36:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zp19lZ+Yr5JuBubuIMd+Kj2p80Q6MEhne9dt/tN7YtIfHSaeaUMAbx8TSenZXgb6733Weafkwj+O922rSq8Qc=
X-Received: by 2002:a05:6870:4192:b0:17f:1723:fc82 with SMTP id
 y18-20020a056870419200b0017f1723fc82mr795814oac.9.1681195018161; Mon, 10 Apr
 2023 23:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaqyWdV6pKP0SVZciMiu_HN86aJriZh0HBiwHNkO7+yErXnBA@mail.gmail.com>
 <CACGkMEuPo_hyQayJDN=VjaV_BAX3B9hBcxFquVSXPu8nBP21Aw@mail.gmail.com>
 <16c48190-bc4d-3001-3460-d7dfa6041919@huawei.com>
 <CACGkMEsRqsOEVsLeiMxTXBJeN2f+92ZEhTvn6yq+b-V4P_CnSA@mail.gmail.com>
 <CAJaqyWdB-1+ZLe1S1jqzhtz0S+urvJXp2F-pQpH-iq0=GN9SGQ@mail.gmail.com>
 <CACGkMEsP_CTz9Mapps9bkUSfU2yMuBQd6jFxpRbLVcvfDh_awA@mail.gmail.com>
 <CAJaqyWcF6NMBB+MmgmMnnpKovMDYLoUaDAmVharW33FPmebaMQ@mail.gmail.com>
In-Reply-To: <CAJaqyWcF6NMBB+MmgmMnnpKovMDYLoUaDAmVharW33FPmebaMQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 11 Apr 2023 14:36:47 +0800
Message-ID: <CACGkMEtqAJ-pSix0BjR-6mAPNyUrx2g591BSScyDHT7gf+yY2A@mail.gmail.com>
Subject: Re: Reducing vdpa migration downtime because of memory pin / maps
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>,
 qemu-level <qemu-devel@nongnu.org>, 
 Michael Tsirkin <mst@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
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

On Tue, Apr 11, 2023 at 2:29=E2=80=AFPM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Apr 11, 2023 at 4:26=E2=80=AFAM Jason Wang <jasowang@redhat.com> =
wrote:
> >
> > On Mon, Apr 10, 2023 at 5:05=E2=80=AFPM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Mon, Apr 10, 2023 at 5:22=E2=80=AFAM Jason Wang <jasowang@redhat.c=
om> wrote:
> > > >
> > > > On Mon, Apr 10, 2023 at 11:17=E2=80=AFAM Longpeng (Mike, Cloud Infr=
astructure
> > > > Service Product Dept.) <longpeng2@huawei.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > =E5=9C=A8 2023/4/10 10:14, Jason Wang =E5=86=99=E9=81=93:
> > > > > > On Wed, Apr 5, 2023 at 7:38=E2=80=AFPM Eugenio Perez Martin <ep=
erezma@redhat.com> wrote:
> > > > > >>
> > > > > >> Hi!
> > > > > >>
> > > > > >> As mentioned in the last upstream virtio-networking meeting, o=
ne of
> > > > > >> the factors that adds more downtime to migration is the handli=
ng of
> > > > > >> the guest memory (pin, map, etc). At this moment this handling=
 is
> > > > > >> bound to the virtio life cycle (DRIVER_OK, RESET). In that sen=
se, the
> > > > > >> destination device waits until all the guest memory / state is
> > > > > >> migrated to start pinning all the memory.
> > > > > >>
> > > > > >> The proposal is to bind it to the char device life cycle (open=
 vs
> > > > > >> close), so all the guest memory can be pinned for all the gues=
t / qemu
> > > > > >> lifecycle.
> > > > > >>
> > > > > >> This has two main problems:
> > > > > >> * At this moment the reset semantics forces the vdpa device to=
 unmap
> > > > > >> all the memory. So this change needs a vhost vdpa feature flag=
.
> > > > > >
> > > > > > Is this true? I didn't find any codes to unmap the memory in
> > > > > > vhost_vdpa_set_status().
> > > > > >
> > > > >
> > > > > It could depend on the vendor driver, for example, the vdpasim wo=
uld do
> > > > > something like that.
> > > > >
> > > > > vhost_vdpa_set_status->vdpa_reset->vdpasim_reset->vdpasim_do_rese=
t->vhost_iotlb_reset
> > > >
> > > > This looks like a bug. Or I wonder if any user space depends on thi=
s
> > > > behaviour, if yes, we really need a new flag then.
> > > >
> > >
> > > My understanding was that we depend on this for cases like qemu
> > > crashes. We don't do an unmap(-1ULL) or anything like that to make
> > > sure the device is clean when we bind a second qemu to the same
> > > device. That's why I think that close() should clean them.
> >
> > In vhost_vdpa_release() we do:
> >
> > vhost_vdpa_release()
> >     vhost_vdpa_cleanup()
> >         for_each_as()
> >             vhost_vdpa_remove_as()
> >                 vhost_vdpa_iotlb_unmap(0ULL, 0ULL - 1)
> >         vhost_vdpa_free_domain()
> >
> > Anything wrong here?
> >
>
> No, I think we just trusted in different pre-existing cleanup points
> "semantics".
>
> > Conceptually, the address mapping is not a part of the abstraction for
> > a virtio device now. So resetting the memory mapping during virtio
> > device reset seems wrong.
> >
>
> I agree. So then no change in the kernel should be needed but to
> revert this cleanup on device reset.

I think you meant simulator, then yes.

> I guess we should document it
> ops->reset just in case?

Probably.

Thanks

>
> Thanks!
>


