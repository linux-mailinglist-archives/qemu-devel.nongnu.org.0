Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782DE69F8FC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 17:29:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUryq-0004eW-PL; Wed, 22 Feb 2023 11:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUryo-0004dT-9Y
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:28:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUrym-0005jJ-4A
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677083307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IGAtyuxFicNsXiWT3ZlgqLkSqNNC1646BuaJiQKZ000=;
 b=c6+IBmaMOgimnKbbCd9KPo+ZWglL6ds3Q/RnmRh5CgmTMMhODp9f0qHYduQkB97juyOfOW
 GvtzXr7qQg7vqgNPHkEskMCWMCIpYbvVuNW/uK1G+EMdMPGA/b8zgk+ld0bH4h7bFfCCy+
 Oyhea08zCfIHVIIU3SAIuDByO8zXjsI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-V6OKPaerPCO9DjXnEV4f4g-1; Wed, 22 Feb 2023 11:28:25 -0500
X-MC-Unique: V6OKPaerPCO9DjXnEV4f4g-1
Received: by mail-wr1-f69.google.com with SMTP id
 c14-20020adffb0e000000b002bfda39265aso2027792wrr.13
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 08:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IGAtyuxFicNsXiWT3ZlgqLkSqNNC1646BuaJiQKZ000=;
 b=733pU/pksObv0Qt/UJBsNYFfXphT/pdY4qDBDBfPMmTotW0o3zm04mnf7hdpKCz3L+
 RvnZn0Lq/JrupbvhdKj/0IYQYU92CfqHIAyIMOymnxiarLHJ3nRRpFL1A/djUk/CA27t
 +ZlCww8yHsm/zn/dDfPbzpeSrX0hK40yXwqwbrVV84DjgzbtMnmWxiDkpJ9yPEe0kA7J
 ZGXlDXwjK1mdkDdMJrHt/xaeh822L301biqz7s7fFawBGbAlaE4VcyGVvJI669e0QpkD
 hze28jPQ8i3CIDyttxrLqW+ybP8Qjjn8uDQl3BFUJ6Lcb0Yiu7kb1lG4HvzJ1qvnDjcZ
 xqkw==
X-Gm-Message-State: AO0yUKW2D1BHzeLPOmlWkJIq0Tt2r7WRLdDduOEO8Nc8QsgqPQ8ofagI
 6825yXNxTNhuSk1lZU3wcJ0rmD6++XUIKav2T13IlfUgV69mprNMNwa8u+u67ht1lxeIuV8TVlE
 /0ucb2xFc/cQe+JU=
X-Received: by 2002:a05:600c:328a:b0:3e1:f8af:7941 with SMTP id
 t10-20020a05600c328a00b003e1f8af7941mr6202413wmp.20.1677083304418; 
 Wed, 22 Feb 2023 08:28:24 -0800 (PST)
X-Google-Smtp-Source: AK7set902K0RCzx7AUkRFWjBD8qrkAVYI/x5US/5EO+0PXbfUxEc/75C7ryzLruWRqMS/kewFHLvww==
X-Received: by 2002:a05:600c:328a:b0:3e1:f8af:7941 with SMTP id
 t10-20020a05600c328a00b003e1f8af7941mr6202401wmp.20.1677083304065; 
 Wed, 22 Feb 2023 08:28:24 -0800 (PST)
Received: from redhat.com ([2.52.2.78]) by smtp.gmail.com with ESMTPSA id
 m26-20020a7bca5a000000b003e20a6fd604sm7695164wml.4.2023.02.22.08.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 08:28:23 -0800 (PST)
Date: Wed, 22 Feb 2023 11:28:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 5/5] hw: Remove mentions of NDEBUG
Message-ID: <20230222112755-mutt-send-email-mst@kernel.org>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-6-philmd@linaro.org>
 <20230222070529-mutt-send-email-mst@kernel.org>
 <3544bf56-4d5c-174d-5bfd-a67c9689ca37@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3544bf56-4d5c-174d-5bfd-a67c9689ca37@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Feb 22, 2023 at 05:11:36PM +0100, Philippe Mathieu-Daudé wrote:
> On 22/2/23 13:05, Michael S. Tsirkin wrote:
> > On Wed, Feb 22, 2023 at 12:25:20AM +0100, Philippe Mathieu-Daudé wrote:
> > > Since commit 262a69f428 ("osdep.h: Prohibit disabling
> > > assert() in supported builds") 'NDEBUG' can not be defined.
> > > 
> > > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > 
> > this exactly says NDEBUG is not allowed. why are you removing this?
> 
> The project can not be built with NDEBUG. There is no point in
> mentioning it in each individual function.

the reason we mention it is because there are security implications
if we don't.

> > > ---
> > >   hw/scsi/mptsas.c   | 2 --
> > >   hw/virtio/virtio.c | 2 --
> > >   2 files changed, 4 deletions(-)
> > > 
> > > diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
> > > index c485da792c..5b373d3ed6 100644
> > > --- a/hw/scsi/mptsas.c
> > > +++ b/hw/scsi/mptsas.c
> > > @@ -1240,8 +1240,6 @@ static void *mptsas_load_request(QEMUFile *f, SCSIRequest *sreq)
> > >       n = qemu_get_be32(f);
> > >       /* TODO: add a way for SCSIBusInfo's load_request to fail,
> > >        * and fail migration instead of asserting here.
> > > -     * This is just one thing (there are probably more) that must be
> > > -     * fixed before we can allow NDEBUG compilation.
> > >        */
> > >       assert(n >= 0);
> > > 
> > > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > > index f35178f5fc..c6b3e3fb08 100644
> > > --- a/hw/virtio/virtio.c
> > > +++ b/hw/virtio/virtio.c
> > > @@ -1898,8 +1898,6 @@ void *qemu_get_virtqueue_element(VirtIODevice *vdev, QEMUFile *f, size_t sz)
> > >       /* TODO: teach all callers that this can fail, and return failure instead
> > >        * of asserting here.
> > > -     * This is just one thing (there are probably more) that must be
> > > -     * fixed before we can allow NDEBUG compilation.
> > >        */
> > >       assert(ARRAY_SIZE(data.in_addr) >= data.in_num);
> > >       assert(ARRAY_SIZE(data.out_addr) >= data.out_num);
> > > -- 
> > > 2.38.1
> > 


