Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A406A8493
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 15:49:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXkEW-0003Fa-CM; Thu, 02 Mar 2023 09:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pXkER-0003EQ-2O
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:48:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pXkEO-0007wT-JM
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 09:48:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677768506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4KKO9Qt4vdKV35M6bBt6ZUfoc2v4IDNJGbrnhmhVsuY=;
 b=XuZtFBL6QPwQzWRrxK70mPJbFG7T5Pzp5uAIL93GklwklqOMYQZxl8ba98NXm9f3J9H8Nh
 0PrjUiUI+F3y6wZtDDXDxX3LJ+c1hCVjzEDS9DhSElQ50q0QeWv/VNm62nUteH+sK84btE
 EPyMEEzsEVXT6+wELwkSiU5KKZ2z/fo=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-uDWPglYmMLasV5l2WZj-Cg-1; Thu, 02 Mar 2023 09:48:25 -0500
X-MC-Unique: uDWPglYmMLasV5l2WZj-Cg-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-536bf635080so320862517b3.23
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 06:48:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677768505;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4KKO9Qt4vdKV35M6bBt6ZUfoc2v4IDNJGbrnhmhVsuY=;
 b=bxJZrPv2RK7ap+jAsEvWRU2mTl2Ayw6fr/GStg/XVkBS1X/cZ12lSMUbmYvXEC0say
 lz0Bd0KhrI1psKZ2ABBSa49+zZQXhcIfVsrsAIuLTaa8ufICBaOQK4qKG2xZJtg3cTKU
 ajEVEssqgtgUpxSbIVkeYWub3u0r8DOvzle5DFRLLi525MiVGffUmsawstk2MjC577td
 yjXzrJX+yi9KiWQIjRbuuPk6qAVSTb8Snum22aItcP5C2tirbPxd92BZqg8jfkf07992
 HY7TPbH6bfIkum6tZOtPTliPchfkFbQ1wEhG5De64gGBQVFew66go0p0GhnNXrLgAdAV
 eQOg==
X-Gm-Message-State: AO0yUKVWu2Dm0cllBznpcVR1tF++9weO8Yn8r3sMIazISaKmldz/lwro
 m4ypFYNnvvn1/OEf7HWS3cxS6+YYx1W7DyKHBzqNU7ul+F4tUm/jjzdoSI6xZNYfJMyeT0WThKw
 iaVH8LvQ5x/SBF7+eqTycvzt7jnvDKow=
X-Received: by 2002:a81:ae23:0:b0:535:18be:4126 with SMTP id
 m35-20020a81ae23000000b0053518be4126mr6395562ywh.6.1677768504869; 
 Thu, 02 Mar 2023 06:48:24 -0800 (PST)
X-Google-Smtp-Source: AK7set98rW6WAY3E+kHPgyDZZLvlKqK7Us+Pj5tJlSzOSNX+GWe297iSAr+R76vGZ5EyKGVArewYLtnZGgbfD2X7gT4=
X-Received: by 2002:a81:ae23:0:b0:535:18be:4126 with SMTP id
 m35-20020a81ae23000000b0053518be4126mr6395550ywh.6.1677768504640; Thu, 02 Mar
 2023 06:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20230213191929.1547497-1-eperezma@redhat.com>
 <CACGkMEsQe=zcfmK=rMH=u6RgHkkBFs+tJO7gT0v_bWwJ_N+z6Q@mail.gmail.com>
 <CAJaqyWfsBLvsJNF=RvhbirwNypzjfaO7thyK22s-nCjdaNs4yQ@mail.gmail.com>
 <20230214024736-mutt-send-email-mst@kernel.org>
 <CAJaqyWc8JON+QhJbqQCFx+q+qxb5LqjgsHS2wZ7R3v37uVU_sw@mail.gmail.com>
 <20230301163325-mutt-send-email-mst@kernel.org>
 <CAJaqyWfpbeoLfe1-GcoR=rtJMg1DGezMe8pjSNPQjBG4BzqMrA@mail.gmail.com>
 <20230302064234-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230302064234-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 2 Mar 2023 15:47:48 +0100
Message-ID: <CAJaqyWe0=R8OKXec1xvCWPrQOdum-Jp4V1_MCevi8nB4J7+kgA@mail.gmail.com>
Subject: Re: [PATCH] vhost: accept VIRTIO_F_ORDER_PLATFORM as a valid SVQ
 feature
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, 
 Gautam Dawar <gdawar@xilinx.com>, Parav Pandit <parav@mellanox.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, 
 Eli Cohen <eli@mellanox.com>, alvaro.karsz@solid-run.com, 
 Lei Yang <leiyang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Thu, Mar 2, 2023 at 12:43 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Mar 02, 2023 at 12:30:52PM +0100, Eugenio Perez Martin wrote:
> > > You need to pass this to guest. My point is that there is no reason to
> > > get it from the kernel driver. QEMU can figure out whether the flag is
> > > needed itself.
> > >
> >
> > Ok, I can see now how the HW device does not have all the knowledge to
> > offer this flag or not. But I'm not sure how qemu can know either.
> >
> > If qemu opens /dev/vhost-vdpa-N, how can it know it? It has no way to
> > tell if the device is sw or hw as far as I know. Am I missing
> > something?
> >
> > Thanks!
>
> This is what I said earlier.  You can safely assume vdpa needs this
> flag. Only exception is vduse and we don't care about performance there.
>

Ok now I get your point, thanks for explaining.

But I'm missing why it is wrong to start using it properly from the
kernel. I didn't test vDPA in non x86 / PCI, but if it does not work
because of the lack of this feature flag the right fix would be to
offer it, not to start assuming it in qemu, isn't it?

I can see how "assume VIRTIO_F_ORDER_PLATFORM from qemu" may need code
comments and extra explanations, but to start offering it properly
from the device is expected somehow.

Thanks!


