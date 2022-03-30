Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DB34EBCE4
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 10:46:47 +0200 (CEST)
Received: from localhost ([::1]:60566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZTyY-0002wZ-Ek
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 04:46:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZTp0-0004IZ-2q
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:36:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZToy-0007Z6-24
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648629411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KObeNLNKrqs/VAgd/IuKiq9VEAYibhSvxyAcuQojKao=;
 b=ej9C6huQ4RZi9mmz2nrzNm3YIoZ6dkfhzQYZ5UGWgD3eZfT66A1XamqnrlFgX5Rr20wGvW
 ovFo6Ma3lykJZDbKKZe7QetihotTW1i7rrY1F9rniA6mHbAL3uKdMO5p5E7HrfD6Nw72mT
 qsSOWGtMrdfaJ2DnsvJZP8MG1m+xWGI=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-3AuCFLbZPu6d1AXjTI5ZOw-1; Wed, 30 Mar 2022 04:36:49 -0400
X-MC-Unique: 3AuCFLbZPu6d1AXjTI5ZOw-1
Received: by mail-lf1-f71.google.com with SMTP id
 b7-20020a056512218700b0044869874779so6244121lft.3
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 01:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KObeNLNKrqs/VAgd/IuKiq9VEAYibhSvxyAcuQojKao=;
 b=xcsZuj0vy66hh+nFFoApw7pq/ZB0bySvy5jPs1AjVC65hhDA1WQOPCoP/+pXKHS6qw
 EONieFeHuJrGPoVrm9uJCAGGMw/hH+UnOSjgKoQUvCRB6zPHnPztrphScsAg2FIlfPC3
 /lfMwtccgcCLUaZzH/3cRYE/XR4wgwkQgQQlHcUbHB0We+o0mUz3+ThjwvGScFqSYllG
 JxmO6OI7qzE5xZL1H7ymvsfanRRLBDB1a+SefXAOIXfJD28QGtwSM88ouFLTkEwIuFIl
 x2eOReSuXGu7wJv8d+m1UfPloMysK0292pkPb599vRdWcedj6GU435TDkVtM/CLZ/QWb
 UGMw==
X-Gm-Message-State: AOAM530UizP07KpfsUt5H5GDIRzGgCI4mtBcVP5tqPuQnMrIpKOIMlGR
 1pJE/V7lBWotnyigxCUxc+9bnYjISJR6o/g7lKLCkaa311twizKs7ChMwqFOUGjYZqapoYKy2sC
 eXqWWjT3Q/aCB4jTAouNoymT7fOO7Zmw=
X-Received: by 2002:ac2:4189:0:b0:448:bc2b:e762 with SMTP id
 z9-20020ac24189000000b00448bc2be762mr5973395lfh.471.1648629407936; 
 Wed, 30 Mar 2022 01:36:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6+UwtUFiXjZr7JLK0QoSj7cEc8xpXavPcikfl+BjyC8kPQ0T4Nw7W7enhjZbgKkYW0kKe0DRKpQ+Rkk5V+g8=
X-Received: by 2002:ac2:4189:0:b0:448:bc2b:e762 with SMTP id
 z9-20020ac24189000000b00448bc2be762mr5973382lfh.471.1648629407727; Wed, 30
 Mar 2022 01:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-2-jasowang@redhat.com>
 <BN9PR11MB52769DCA64DCF7B107FD244B8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEsKJjnBb0qPM8oZvSHt326pMF8JCN8Fu1Qqjeu5pmdfMg@mail.gmail.com>
 <c5a0a8e8-b000-9efa-b334-93637724f49d@intel.com>
 <d04f5de3-9e66-9bdb-b268-b7b64c8489bd@redhat.com>
 <BN9PR11MB5276C1513B8DD829CC87EE898C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB5276C1513B8DD829CC87EE898C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Mar 2022 16:36:36 +0800
Message-ID: <CACGkMEt9J6Jcy7+EmgFm-JTTqd82ONt_aOYRsxnTke2ZNSaA7A@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
To: "Tian, Kevin" <kevin.tian@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 4:16 PM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, March 29, 2022 12:52 PM
> > >
> > >>>
> > >>> Currently the implementation of vtd_ce_get_rid2pasid_entry() is also
> > >>> problematic. According to VT-d spec, RID2PASID field is effective only
> > >>> when ecap.rps is true otherwise PASID#0 is used for RID2PASID. I didn't
> > >>> see ecap.rps is set, neither is it checked in that function. It
> > >>> works possibly
> > >>> just because Linux currently programs 0 to RID2PASID...
> > >>
> > >> This seems to be another issue since the introduction of scalable mode.
> > >
> > > yes. this is not introduced in this series. The current scalable mode
> > > vIOMMU support was following 3.0 spec, while RPS is added in 3.1. Needs
> > > to be fixed.
> >
> >
> > Interesting, so this is more complicated when dealing with migration
> > compatibility. So what I suggest is probably something like:
> >
> > -device intel-iommu,version=$version
> >
> > Then we can maintain migration compatibility correctly. For 3.0 we can
> > go without RPS and 3.1 and above we need to implement RPS.
>
> This is sensible. Probably a new version number is created only when
> it breaks compatibility with an old version, i.e. not necessarily to follow
> every release from VT-d spec. In this case we definitely need one from
> 3.0 to 3.1+ given RID2PASID working on a 3.0 implementation will
> trigger a reserved fault due to RPS not set on a 3.1 implementation.

3.0 should be fine, but I need to check whether there's another
difference for PASID mode.

It would be helpful if there's a chapter in the spec to describe the
difference of behaviours.

>
> >
> > Since most of the advanced features has not been implemented, we may
> > probably start just from 3.4 (assuming it's the latest version). And all
> > of the following effort should be done for 3.4 in order to productize it.
> >
>
> Agree. btw in your understanding is intel-iommu in a production quality
> now?

Red Hat supports vIOMMU for the guest DPDK path now.

For scalable-mode we need to see some use cases then we can evaluate.
virtio SVA could be a possible use case, but it requires more work e.g
PRS queue.

> If not, do we want to apply this version scheme only when it
> reaches the production quality or also in the experimental phase?

Yes. E.g if we think scalable mode is mature, we can enable 3.0.

Thanks

>
> Thanks
> Kevin


