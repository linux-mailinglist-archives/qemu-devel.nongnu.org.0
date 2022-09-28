Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5177B5EE678
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:15:32 +0200 (CEST)
Received: from localhost ([::1]:45946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddSt-0003rE-5t
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oddQm-0001k8-6A
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:13:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oddQh-00043T-N2
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:13:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664395994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HjPM0GddDUNccZtyKafLrOocOBG+1aptWYa63qJR94U=;
 b=hX+nrm5NaHn8oNoiBKmiw1e+UQm2p9sqeO2bWtjTb+enpn7b1dgZYTh0cHoutuISvBFPGq
 1GnRToWx8Igq1adBDf4A92p37WRPuy8YotZk/9H+dcCcFbF62/Rkye9aLswvIwKMYhxwUf
 PExyvlvc3/zuqU0r3eeRG8mcQGhjDEo=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-367-y94auoCiM--yLDUVB_Nsmw-1; Wed, 28 Sep 2022 16:13:13 -0400
X-MC-Unique: y94auoCiM--yLDUVB_Nsmw-1
Received: by mail-io1-f71.google.com with SMTP id
 e14-20020a6b500e000000b006a13488a320so8388697iob.12
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 13:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=HjPM0GddDUNccZtyKafLrOocOBG+1aptWYa63qJR94U=;
 b=CmDGNzUtL9ymUYiGilUF9pU37VpAXxJ1dbw/ll8BIqx7zS/2/eDTDDdk2rjSro8pJD
 hQtGkjthfH3H5NFpLcQByD4dGm0FreFML3O5v/2gRR8WOejf/0GaB4SaoFp8T9e05ecV
 g2pWxbWiuSFC7V0nImpIX7njCnt7exlGu/MVqNB7hcDzGl6ecmjB5fes2lqr2H7O/yDT
 u8nr7SvUedg+zTmPkRvcKgE7N2B2kSZtYSYG20P0CcL+SoBzNAPmpciBKloe8fyhT4C2
 xiRdh6MymJrJqng1S/c+o7/eHj9BdBjbEoex3z3hTCQzd8mvFKPWB4dCwuJgeG6/p45O
 5v3g==
X-Gm-Message-State: ACrzQf3d99esQnJRxj/wdSVCVt1jHmp4f14GBjlLvKkAFvZY7BvGKGUn
 GYQLS8MYbID1VV/OAMNFZo2tGUxn1ScodqHE5MYNT3IjLq5bV3ObQvdo4Z3y2ExJJur1mEy3gl5
 petTglv9+iCFMj2+pe7kdkjsWH3XFDa8=
X-Received: by 2002:a05:6638:22c5:b0:35a:88fa:3d3a with SMTP id
 j5-20020a05663822c500b0035a88fa3d3amr18580125jat.115.1664395992730; 
 Wed, 28 Sep 2022 13:13:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4WaOZsxzCxY2yM/5nzA2NG1fnTtODCoM91RXHtdlOe8ht2Oc1jMOSOLIeCz/W65u31PAjERm4KzgZjXOQoZls=
X-Received: by 2002:a05:6638:22c5:b0:35a:88fa:3d3a with SMTP id
 j5-20020a05663822c500b0035a88fa3d3amr18580109jat.115.1664395992574; Wed, 28
 Sep 2022 13:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220927193431.22302-1-stefanha@redhat.com>
 <20220927193431.22302-12-stefanha@redhat.com>
 <YzSex5t0UIAT+LPU@fedora>
In-Reply-To: <YzSex5t0UIAT+LPU@fedora>
From: Alberto Campinho Faria <afaria@redhat.com>
Date: Wed, 28 Sep 2022 21:12:36 +0100
Message-ID: <CAELaAXyURC9YJvtjY3O5iXsA5Q0WCTxM21++iqJ__pna9CSNOQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/12] blkio: implement BDRV_REQ_REGISTERED_BUF
 optimization
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>, 
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, 
 "Denis V. Lunev" <den@openvz.org>, Xie Changlong <xiechanglong.d@gmail.com>, 
 Eric Blake <eblake@redhat.com>, integration@gluster.org, 
 David Hildenbrand <david@redhat.com>, Wen Congyang <wencongyang2@huawei.com>, 
 Laurent Vivier <lvivier@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, sgarzare@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 8:21 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> On Tue, Sep 27, 2022 at 03:34:30PM -0400, Stefan Hajnoczi wrote:
> > +    ret = blkio_get_bool(s->blkio,
> > +                         "mem-regions-pinned",
> > +                         &s->mem_regions_pinned);
> > +    if (ret < 0) {
> > +        /* Be conservative (assume pinning) if the property is not supported */
> > +        s->mem_regions_pinned = true;
>
> This is too conservative :). It can be changed to:
>
>   s->mem_regions_pinned = s->needs_mem_regions;
>
> That way we avoid ram_block_discard_disable() for libblkio drivers (like
> io_uring in libblkio 1.0) that don't use memory regions and don't
> support the "mem-regions-pinned" property yet.

Even if a driver doesn't _need_ memory regions to be mapped before
use, it may still do something special with the ones that _are_
mapped, so we may have no choice but to set s->mem_regions_pinned =
true.

(Unless we are assuming that all future libblkio versions will either
not have such drivers, or will provide a "mem-regions-pinned"
property, but that feels brittle.)

Alberto


