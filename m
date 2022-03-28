Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E95F4E8C36
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 04:33:12 +0200 (CEST)
Received: from localhost ([::1]:51324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYfBv-0004NO-Em
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 22:33:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nYfAK-0003hD-1h
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 22:31:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nYfAI-0005M1-Ff
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 22:31:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648434688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qqUnf1P7XytgxBT1WsfoTD55cLQVPFJuYO5wZ/nwCdo=;
 b=Pljyvtj79GuQEkZV8YFPjG5BayEo5E5quC25D75XOJ+3IQafCGEXc/fFKUv2pwSgidIbiC
 mVxGCHhR9U9QlJ1kV5B4Fy3Zf9sE6zPi1ARnY+ba0OBkpxntNExMA2rkASEvZv+E0i+sBR
 tZNdkens3WbdYZ59SyJb2xse7h9NGI8=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-N10YW1l8N7GVtPviL3fI-g-1; Sun, 27 Mar 2022 22:31:27 -0400
X-MC-Unique: N10YW1l8N7GVtPviL3fI-g-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-2e9e838590dso39928087b3.5
 for <qemu-devel@nongnu.org>; Sun, 27 Mar 2022 19:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qqUnf1P7XytgxBT1WsfoTD55cLQVPFJuYO5wZ/nwCdo=;
 b=0AYnWeE6zf+qR4yM56rJFQzy24IKOFJSBG8i/dYnsuKAEYVL9Q0do+uaJdypZGy1XY
 SIpG6vSLg2OgwZttJUZFCjH9MLHNWIfwYGXSv3/MjhWdcF5wvJgdqQRWeFB3mx3O0UjM
 MnOwgVRktzBqfdMKcuOqT+mfcYeoZe8bRxRpduhW4SDcoEcphi8QrYD16wWZaEY+SMJj
 0/Fh2dkHP8LgJ0qikrKRjVL0aNlCxLHXi7daj3bslcOOzBaPqPSIsoiSWHPe6bJFvh+Y
 /gyc0BR1X+YeIgQDCtQ3HByYyatCxP2yVD9+bTM7901wbHP2MqgDMmEcAJP6bDUb0TKc
 zc8Q==
X-Gm-Message-State: AOAM533UpThVy2BoQdk9OefEnbpRqvWaFm3v3BZXEIWGvYDIALGD+6WV
 OF6PaA7aWw8t8jPme6/HBt5CMPs6QhdBkB5wVMMJp+HY4VTQ2ho2yd8fRA+FLlDduQuP7EnUXns
 koxO6k2Z1YgB9XS4gmAF1YhlcUBxDB0c=
X-Received: by 2002:a81:d50c:0:b0:2e5:8836:fd3c with SMTP id
 i12-20020a81d50c000000b002e58836fd3cmr23365958ywj.152.1648434686947; 
 Sun, 27 Mar 2022 19:31:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzH4pCFojMhJ8hfyRgt0w6ko3yC1kwLjUsycMHA76Lq+nelCrp5gJ3R4ce0u0SgXQKtfidON+GHctBqsPLrTUw=
X-Received: by 2002:a81:d50c:0:b0:2e5:8836:fd3c with SMTP id
 i12-20020a81d50c000000b002e58836fd3cmr23365945ywj.152.1648434686731; Sun, 27
 Mar 2022 19:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
 <BN9PR11MB52762D1CDE8F5417370762CE8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB52762D1CDE8F5417370762CE8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 28 Mar 2022 10:31:15 +0800
Message-ID: <CACGkMEtr5byTaRFQT-ut6=ziyOTKBgne_Xa2qu4Nu9Z7sDDmBg@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] intel-iommu: PASID support
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

On Thu, Mar 24, 2022 at 4:54 PM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Jason Wang
> > Sent: Monday, March 21, 2022 1:54 PM
> >
> > This patch introduce ECAP_PASID via "x-pasid-mode". Based on the
> > existing support for scalable mode, we need to implement the following
> > missing parts:
> >
> > 1) tag VTDAddressSpace with PASID and support IOMMU/DMA translation
> >    with PASID
> > 2) tag IOTLB with PASID
>
> and invalidate desc to flush PASID iotlb, which seems missing in this patch.

It existed in the previous version, but it looks like it will be used
only for the first level page table which is not supported right now.
So I deleted the codes.

>
> > 3) PASID cache and its flush
> > 4) Fault recording with PASID
> >
> > For simplicity:
> >
> > 1) PASID cache is not implemented so we can simply implement the PASID
> > cache flush as a nop.
> > 2) Fault recording with PASID is not supported, NFR is not changed.
> >
> > All of the above is not mandatory and could be implemented in the
> > future.
>
> PASID cache is optional, but fault recording with PASID is required.

Any pointer in the spec to say something like this? I think sticking
to the NFR would be sufficient.

> I'm fine with adding it incrementally but want to clarify the concept first.

Yes, that's the plan.

>
> >
> > Note that though PASID based IOMMU translation is ready but no device
> > can issue PASID DMA right now. In this case, PCI_NO_PASID is used as
> > PASID to identify the address w/ PASID. vtd_find_add_as() has been
> > extended to provision address space with PASID which could be utilized
> > by the future extension of PCI core to allow device model to use PASID
> > based DMA translation.
>
> I didn't get the point of PCI_NO_PASID. How is it different from RID_PASID?
> Can you enlighten?
>
> >
> > This feature would be useful for:
> >
> > 1) prototyping PASID support for devices like virtio
> > 2) future vPASID work
> > 3) future PRS and vSVA work
>
> Haven't got time to look at the code in detail. stop here.

Fine.

Thanks

>
> Thanks
> Kevin
>


