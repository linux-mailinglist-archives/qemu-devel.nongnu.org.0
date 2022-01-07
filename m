Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1E4487060
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 03:28:43 +0100 (CET)
Received: from localhost ([::1]:38560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5ezi-0002pa-Dr
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 21:28:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5ett-00051C-La
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 21:22:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5etq-0001PS-AM
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 21:22:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641522157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ta2YfgxmDIy+92ovE4Whq1V49+hjKqppKmX72/kr0no=;
 b=YOR7AT5iClASBlztut1CABx682HmUAzB/pFaodKZeZkPQc5qunX2KW0VM9FWWL+ritstWM
 C/EwyTLcthKw3Ljld4DB6ky/AB2mb6wzZMVdK+daSlRQMSchtx+jCDPuoZxCD7QsJROggX
 dEe3ZmWsw2olPkCi9DV2WBu35mcQlEE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-4q0zgWJoOyOG-_Cq1uNYXA-1; Thu, 06 Jan 2022 21:22:35 -0500
X-MC-Unique: 4q0zgWJoOyOG-_Cq1uNYXA-1
Received: by mail-lf1-f72.google.com with SMTP id
 u4-20020a056512128400b0042abc4f4f9aso1281062lfs.15
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 18:22:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ta2YfgxmDIy+92ovE4Whq1V49+hjKqppKmX72/kr0no=;
 b=WG91fyMIcFdKr7OaxqtJYdKLBGkP++romu0ha3lvGik7t5sXep7Hjxky+Tt6j4P381
 TuOC1OokJbqhoBG+cxnQ36zWMbSAFuJsoEjQkE5+xxdTywlD7/tzweLduXHuRhs39NfC
 ruOE0Q0UGh7DO8JcGuH3BU2P9p5vQDKg87TOMKEKPqrqbKtsvcDwiNEo+j/F/lD8rfQP
 Xit5q8QehDNwSd6e1Tv2xEroQCC2srozdD5jE2rbaDvdMW9eHPmmyzCch36ZBbBu67Yk
 rxRN14DbLPLWZWrs7vdqyXIwMGtRTcidZIib/7TEiD6369YxVw8rC+Ni1BC/Fi8Vjbqb
 fhqQ==
X-Gm-Message-State: AOAM5330zIsAbh8fvYxl0oa5+kbC+sSywWIPi4Guln9kXrjidT4HipKM
 q9CwtuPt0GeWe3V9wqe/XJuCGf3L91PZdkjh2q1p0dsw7Bjsk1UAF0ahIzWnbfZtW0Obk6yhBPU
 marMyuRbSuqAF0nCbjBtfOzqTU92zWzI=
X-Received: by 2002:a2e:9183:: with SMTP id f3mr49316298ljg.277.1641522154213; 
 Thu, 06 Jan 2022 18:22:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmbyqWSAGJlyhyVfz9Un6ZqeQ2nVXesKL8rwHfjU+NlPf+OSeIBByXhtv7A023HIJZyHpPppX7wyrMztRpuwQ=
X-Received: by 2002:a2e:9183:: with SMTP id f3mr49316276ljg.277.1641522153992; 
 Thu, 06 Jan 2022 18:22:33 -0800 (PST)
MIME-Version: 1.0
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-4-longpeng2@huawei.com>
 <YdVpgaq/mFEZQpT7@stefanha-x1.localdomain>
 <21147b9ccec84deabbd1dcf32f19f05e@huawei.com>
 <YdbRmqnh1GYDtCR8@stefanha-x1.localdomain>
In-Reply-To: <YdbRmqnh1GYDtCR8@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 7 Jan 2022 10:22:23 +0800
Message-ID: <CACGkMEvOzu368OexsNdhEZhPx8cXq+2_hFXGL5g8_bBWB8hRFA@mail.gmail.com>
Subject: Re: [RFC 03/10] vdpa: add the infrastructure of vdpa-dev
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 6, 2022 at 7:25 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Thu, Jan 06, 2022 at 01:22:19AM +0000, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
> >
> >
> > > -----Original Message-----
> > > From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
> > > Sent: Wednesday, January 5, 2022 5:49 PM
> > > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > > <longpeng2@huawei.com>
> > > Cc: mst@redhat.com; jasowang@redhat.com; sgarzare@redhat.com;
> > > cohuck@redhat.com; pbonzini@redhat.com; Gonglei (Arei)
> > > <arei.gonglei@huawei.com>; Yechuan <yechuan@huawei.com>; Huangzhichao
> > > <huangzhichao@huawei.com>; qemu-devel@nongnu.org
> > > Subject: Re: [RFC 03/10] vdpa: add the infrastructure of vdpa-dev
> > >
> > > On Wed, Jan 05, 2022 at 08:58:53AM +0800, Longpeng(Mike) wrote:
> > > > +static const VirtioPCIDeviceTypeInfo vhost_vdpa_device_pci_info = {
> > > > +    .base_name               = TYPE_VHOST_VDPA_DEVICE_PCI,
> > > > +    .generic_name            = "vhost-vdpa-device-pci",
> > > > +    .transitional_name       = "vhost-vdpa-device-pci-transitional",
> > > > +    .non_transitional_name   = "vhost-vdpa-device-pci-non-transitional",
> > >
> > > Does vDPA support Transitional VIRTIO devices?
> > >
> > > I expected this device to support Modern devices only.
> > >
> >
> > There's already a 0.95 vdpa driver (Alibaba ENI) in the kernel source and
> > supporting 0.95 devices is necessary for some older GuestOS.
> >
> > I'm OK if other guys also approve of supporting 1.0+ devices only :)
>
> If vDPA supports Transitional VIRTIO devices then it's fine to keep this
> code unchanged in this patch series.

Right, and I think that's the plan.

Thanks

>
> Stefan


