Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C30434652
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 09:56:01 +0200 (CEST)
Received: from localhost ([::1]:54878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md6S8-0001su-3M
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 03:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1md6Qu-0001Cz-JN
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:54:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1md6Qs-0007vm-74
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634716481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5g+N4vvd7G7dffvmnTFb4SVz+9oHrsP7hHXKlWpFX5k=;
 b=c2eAfuULl9GAD08/a2IrbNauuUHRWMholCwHUbGyl8QmJuYJjwcZ7kTz64Jtt8PJHbduG1
 49kd3fpkKDaXP2yadpsZHAb1OTAhXBZWnYSedfamdIdvwly9u12w/h8aSBdM9LB/Tl01Ow
 d2Kv1IJzzJOWM2RToeL6dHWAbrZ8igc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-cFT8PyOBPaOUXxGRfajZqw-1; Wed, 20 Oct 2021 03:54:39 -0400
X-MC-Unique: cFT8PyOBPaOUXxGRfajZqw-1
Received: by mail-qv1-f71.google.com with SMTP id
 p9-20020a05621421e900b003830bb235fbso2122715qvj.14
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 00:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5g+N4vvd7G7dffvmnTFb4SVz+9oHrsP7hHXKlWpFX5k=;
 b=gr+1gle8JvU1xn5QwDrbsUoIFsJP2+CemuxsBQOnyeT4GFdMR9XISULI4NvW/viw5m
 LNNTrF8Ijv2jR3so9QYlhA9l4BDVIUuifZCYH4lLfMzIfMCq7r/6mlqgXTIVWbcPDCnz
 uodP6jlVbCLqoY9cKi7igINaqD32aDksyY7o3Enfb6NWDINbyUXeaz+D2iSJRr/Sf2tX
 0TRUS30+ojoHmHglCemjAjXXHzdeydousCnRsFGBORlGrlbIJ5YOvG1d2aMFjC9KnadE
 kpGsqfkbkWCJmIvqziPvBXh5aIpHSgIdXhvKpQQq+1gSLGQPVdvzz06j5SLcja0RNh9M
 /rtw==
X-Gm-Message-State: AOAM532WCcSvJOWr7rn+thrkAkBOIwC0+Ry/9FgJTPk5r2CJJpU2yBHl
 CwbtMnw+7jimQ4ZUrvgqndmtprU7wPa9lzLPRzz6fOuG0ajkf0EbuE52/N6zCCfNydwe0L56mp0
 4ZRuNATo9CBCR0hFFYJOU/B79A+LJ8d0=
X-Received: by 2002:ac8:7d13:: with SMTP id g19mr5375991qtb.178.1634716479190; 
 Wed, 20 Oct 2021 00:54:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzg2DhaATkGuDPhxVhye70mSLYWhJbi3NBu4ojlx2i0LO/cj5Q6buNbLgsMbEFGRqKX659+SbJOW6CzgxN5JY=
X-Received: by 2002:ac8:7d13:: with SMTP id g19mr5375981qtb.178.1634716478986; 
 Wed, 20 Oct 2021 00:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-19-eperezma@redhat.com>
 <79905c11-e313-ad60-17dc-1a47d35f12cc@redhat.com>
 <CACGkMEtc6tw5xauzw=1zSFUfC0oSRfokZbA6QsR7nEe5T7-4_A@mail.gmail.com>
In-Reply-To: <CACGkMEtc6tw5xauzw=1zSFUfC0oSRfokZbA6QsR7nEe5T7-4_A@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 20 Oct 2021 09:54:02 +0200
Message-ID: <CAJaqyWfvT36tbnSRhMoQcWXCYhjdkaOs_E3yKisPhv-o0oajCQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 18/20] vhost: Add VhostIOVATree
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:23 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Oct 19, 2021 at 4:32 PM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:06, Eugenio P=C3=A9rez =E5=86=
=99=E9=81=93:
> > > This tree is able to look for a translated address from an IOVA addre=
ss.
> > >
> > > At first glance is similar to util/iova-tree. However, SVQ working on
> > > devices with limited IOVA space need more capabilities, like allocati=
ng
> > > IOVA chunks or perform reverse translations (qemu addresses to iova).
> >
> >
> > I don't see any reverse translation is used in the shadow code. Or
> > anything I missed?
>
> Ok, it looks to me that it is used in the iova allocator. But I think
> it's better to decouple it to an independent allocator instead of
> vhost iova tree.
>

Reverse translation is used every time a buffer is made available,
since buffers content are not copied, only the descriptors to SVQ
vring.

At this point all the limits are copied to vhost iova tree in the next
revision I will send, defined at its creation at
vhost_iova_tree_new(). They are outside of util/iova-tree, only sent
to the latter at allocation time.

Since vhost_iova_tree has its own vhost_iova_tree_alloc(), that wraps
the iova_tree_alloc() [1], limits could be kept in vhost-vdpa and make
them an argument of vhost_iova_tree_alloc. But I'm not sure if it's
what you are proposing or I'm missing something.

Either way, I think it is harder to talk about this specific case
without code, since this one still does not address the limits. Would
you prefer me to send another RFC in WIP quality, with *not* all
comments addressed? I would say that there is not a lot of pending
work to send the next one, but it might be easier for all of us.

Thanks!

[1] This util/iova-tree method will be proposed in the next series,
and vhost_iova_tree wraps it since it needs to keep in sync both
trees: iova->qemu vaddr for iova allocation and the reverse one to
translate available buffers.

> Thanks
>


