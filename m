Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5AC6024D0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 08:59:02 +0200 (CEST)
Received: from localhost ([::1]:42082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okgZ2-0006LN-Id
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 02:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1okg2D-0004jH-Cu
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:25:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1okg28-0000TA-Aw
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666074299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qkiR2OlluvO5MPO5pd4aNU+uE26kjikg9yIllS5ePFo=;
 b=Jw8sLf6rRfRuMPT2B5rEKXcuZ5f65Do8hTCs4dXhreHEdPvLtyzfOligxPwPJeHchrAaNk
 /F+EDyvPrwrzFq5BG2cifDb2smb+2ybXcwexBk6BQ2GjYzimPu95qktOOhvbFRHpbpxRp9
 LFeGGzoiz5vPkc8UWhCXNAdxKkqXZiY=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-217-fIHjuTUUOZS4l9oLx2P5CQ-1; Tue, 18 Oct 2022 02:24:57 -0400
X-MC-Unique: fIHjuTUUOZS4l9oLx2P5CQ-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-13305999f45so5576053fac.18
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 23:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qkiR2OlluvO5MPO5pd4aNU+uE26kjikg9yIllS5ePFo=;
 b=gEuUJ1eRXcvjWJGo0bxxySMrCaLpp0utV3AmtgmOfGoZEc3qBZkeCBSWkTRGppLg1h
 lu1v3oJz+9KMjxI0Dj/vJtoXBpMZUyakFmoh1/lygKb9eqDiKrRMSxgZnfuzkQMKd4cd
 hzGVpxr2tO4buRUoMpCIe3VOIBKg26r0xupqkc9+b6+GyI5LN6ERTrSdqMZEOZHnJAaZ
 36NzhSynLvNhghlnYJeEqQ6CiSikZRMabMGaEWirKPcq7w3CWuHkKBtj1D2OTRaJrF+I
 zwtrUVlokVAVFYFEUiMUjH4SvfQlRjMDgf6nl1+61CiLTPFupCowjn4R1lroGamNzdOJ
 20gg==
X-Gm-Message-State: ACrzQf00TWUePPOJuXDZhIbUE8dxmLkB/wdsCc693cttc507V+NRtySv
 VQ+V6ww/gnpzIRTw3Szfefbm3igtoI8bdMjEsPbWu7MN7xMFnu7S3uIxryGM17V1zFJZjzWYIF2
 lLPG8quifvJt7JumYqr0Ov/guT6k8u/g=
X-Received: by 2002:a05:6808:1483:b0:354:a36e:5b with SMTP id
 e3-20020a056808148300b00354a36e005bmr14736847oiw.35.1666074297153; 
 Mon, 17 Oct 2022 23:24:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM50rB1WX4B/Mr6hlAGaJAY0Y0iUoS8rmalX5C5JlRSyh3lq12A2235tf3KoSLu+j0y5R9eTb/PfCSl6JYOlx2s=
X-Received: by 2002:a05:6808:1483:b0:354:a36e:5b with SMTP id
 e3-20020a056808148300b00354a36e005bmr14736839oiw.35.1666074296975; Mon, 17
 Oct 2022 23:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221009054835.1540-1-jasowang@redhat.com>
 <20221009054835.1540-5-jasowang@redhat.com> <Y0mLrAQDCj48jsJW@x1n>
 <CACGkMEt2c5jjEMJjpdRawi_L-rrgq3VWQ=DjQojFf1z6OPMLqQ@mail.gmail.com>
 <Y01xC/44lITmJtpu@x1n>
In-Reply-To: <Y01xC/44lITmJtpu@x1n>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 18 Oct 2022 14:24:45 +0800
Message-ID: <CACGkMEurk9VkLgQUO7u_qSgE280+LpM-t6SjjWA0VckE=ZqY7Q@mail.gmail.com>
Subject: Re: [PATCH V3 4/4] intel-iommu: PASID support
To: Peter Xu <peterx@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, yi.l.liu@intel.com, 
 yi.y.sun@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Mon, Oct 17, 2022 at 11:13 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Oct 17, 2022 at 03:52:46PM +0800, Jason Wang wrote:
>
> [...]
>
> > > > +struct vtd_iotlb_key {
> > > > +    uint16_t sid;
> > > > +    uint32_t pasid;
> > > > +    uint64_t gfn;
> > > > +    uint32_t level;
> > > >  };
> > >
> > > Nit: maybe re-arrange it a bit?
> > >
> > >    struct vtd_iotlb_key {
> > >        uint64_t gfn;
> > >        uint32_t pasid;
> > >        uint32_t level;
> > >        uint16_t sid;
> > >    } __attribute__((__packed__));
> > >
> > > "packed" should save us 6 bytes for each in this case, maybe also
> > > worthwhile but not strongly as we have a limit of 1k objs.
> >
> > I think it should be fine to rearrange but for 'packed', would this
> > cause alignment issues that may cause troubles on some arches?
>
> Do you mean the gfn reading can be split into 2 * 4 bytes?

Somehow, e.g the gfn is not at the 8-byte boundary which may result in
non-aligned access. Which will trigger an exception on some arch
(arm).

>  Would that
> still work as long as we're protected with a lock when accessing iotlb
> (even though it may be slower than aligned access)?

Probably not, since we have code to access the full uint64_t gfn.

>
> But at least I think you're right it's not always a benefit, so no strong
> opinion here to have it packed.

Ok, so I will not use packed in the next version.

>
> >
> > >
> > > The name "gfn" seems a bit unfortunate - would "iova" be more suitable?  I
> > > do see we used it elsewhere too, so we can also leave that for later.
> >
> > Right, it has been used for VTDIOTLBEntry before this patch. If
> > possible I would leave it to be done on top with a separate patch.
>
> Definitely.
>
> Thanks,

Thanks

>
> --
> Peter Xu
>


