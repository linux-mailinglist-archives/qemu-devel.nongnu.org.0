Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3AD601291
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 17:15:14 +0200 (CEST)
Received: from localhost ([::1]:54456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okRph-0005cw-2W
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 11:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1okRnx-0003Jo-Cc
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 11:13:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1okRnv-0003tA-2e
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 11:13:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666019599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m358YSRLfTXccSS3APayaPBcT5r2prWVFSxDHkdfJW0=;
 b=SacdGP2BQGrsLFxd2F6XEeL2bOknJ76AL4NoJwOWtmkl/vlCBHbwByBFLjyV18fEYQTEZb
 F9snvJac/hFovwm96EgCwlSh3dThpoKE+TS8D4gof3Sn78Ofg8mIhJegGqpgXqIfAQn8Am
 LV1hBtmtC5sDmSMuegTuXkKou87rfDA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-E-QeYIkPO_ur19JyUIUqkw-1; Mon, 17 Oct 2022 11:13:17 -0400
X-MC-Unique: E-QeYIkPO_ur19JyUIUqkw-1
Received: by mail-qk1-f199.google.com with SMTP id
 x22-20020a05620a259600b006b552a69231so9788531qko.18
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 08:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m358YSRLfTXccSS3APayaPBcT5r2prWVFSxDHkdfJW0=;
 b=7QNz4T4WrprS7xC6bu5GQTETaHqapVy+NJU3ZuGvKZsScR1brCmnG6vsGMooJcV7c7
 2RoRkipzYW9L2r4fm9Q2DQQArd1GTfk+I+0PnRbEmw+ShocMVxRuafm48xM0/ONYudXm
 8YN+MoZ1C5cnqvxHw2+2P7h99uI+ZGmerPRIteN2MQIBCvNIbBR+5W6AyPPdvpzRO2tn
 pIUyEj6quKENlqW99u7y5IxKUcckyE2nfVcAbRPoRwXstgCbxrF1nNUNI0fIsVUGZpeb
 Mhp7hPPUzQXfIACmLHnmsF9QzY7U0PEzFYkZb60JX4Kyb9NRfyRXkKvbpLmskb2Afwig
 03ng==
X-Gm-Message-State: ACrzQf19SEuio7EedU41L2Q/xoINkqUWN5yqqHrIz1yhrX/D/IUmB0Rq
 p+baT3S5UcfUPhhb6WvvZv/3x2iDw3o0oLgUjdI+MfswRhkuYKQ1yKtQDi3bMyRA9/BDnp/8XIh
 Qmzc/aXcd3H6WKP4=
X-Received: by 2002:ac8:7c55:0:b0:39c:e345:9cc6 with SMTP id
 o21-20020ac87c55000000b0039ce3459cc6mr8161643qtv.679.1666019597378; 
 Mon, 17 Oct 2022 08:13:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6cmW5GiP568kEA8NlxJu4HP3+vhC1CHdBKpI1GaHRHkMpeVdssW8ulYRGsD3P6a3conTFlwA==
X-Received: by 2002:ac8:7c55:0:b0:39c:e345:9cc6 with SMTP id
 o21-20020ac87c55000000b0039ce3459cc6mr8161625qtv.679.1666019597154; 
 Mon, 17 Oct 2022 08:13:17 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05620a408b00b006eeb51bb33dsm15053qko.78.2022.10.17.08.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 08:13:16 -0700 (PDT)
Date: Mon, 17 Oct 2022 11:13:15 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, yi.l.liu@intel.com,
 yi.y.sun@linux.intel.com
Subject: Re: [PATCH V3 4/4] intel-iommu: PASID support
Message-ID: <Y01xC/44lITmJtpu@x1n>
References: <20221009054835.1540-1-jasowang@redhat.com>
 <20221009054835.1540-5-jasowang@redhat.com> <Y0mLrAQDCj48jsJW@x1n>
 <CACGkMEt2c5jjEMJjpdRawi_L-rrgq3VWQ=DjQojFf1z6OPMLqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACGkMEt2c5jjEMJjpdRawi_L-rrgq3VWQ=DjQojFf1z6OPMLqQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 17, 2022 at 03:52:46PM +0800, Jason Wang wrote:

[...]

> > > +struct vtd_iotlb_key {
> > > +    uint16_t sid;
> > > +    uint32_t pasid;
> > > +    uint64_t gfn;
> > > +    uint32_t level;
> > >  };
> >
> > Nit: maybe re-arrange it a bit?
> >
> >    struct vtd_iotlb_key {
> >        uint64_t gfn;
> >        uint32_t pasid;
> >        uint32_t level;
> >        uint16_t sid;
> >    } __attribute__((__packed__));
> >
> > "packed" should save us 6 bytes for each in this case, maybe also
> > worthwhile but not strongly as we have a limit of 1k objs.
> 
> I think it should be fine to rearrange but for 'packed', would this
> cause alignment issues that may cause troubles on some arches?

Do you mean the gfn reading can be split into 2 * 4 bytes?  Would that
still work as long as we're protected with a lock when accessing iotlb
(even though it may be slower than aligned access)?

But at least I think you're right it's not always a benefit, so no strong
opinion here to have it packed.

> 
> >
> > The name "gfn" seems a bit unfortunate - would "iova" be more suitable?  I
> > do see we used it elsewhere too, so we can also leave that for later.
> 
> Right, it has been used for VTDIOTLBEntry before this patch. If
> possible I would leave it to be done on top with a separate patch.

Definitely.

Thanks,

-- 
Peter Xu


