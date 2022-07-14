Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0015752B0
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:24:38 +0200 (CEST)
Received: from localhost ([::1]:49818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC1dl-00009C-LX
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oC1Pi-0008Cu-8m
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:10:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oC1Pe-0006H9-JK
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:10:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657815000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OK0behKCener34sbhKKKAzyixW2wRrVIOmmZ4P7HtaE=;
 b=TLo9u7tN5zcdBZM+QKwsAKYBt++rmIzKAWyqNHHO9avAIyqDVWAk4b/CRL7PoaRoS7r+j2
 5AIdy/JK4h0VAXKT+BsBqXA8wxaei0Dq+GjnROoYO4Mmqd+usDIOJfhdaxldcxFEK1eY1t
 wo9y9Zw0hCqIdE7NDOOGQzJNTanXmEc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-kdLlx-clOU-XYykXZDvEcA-1; Thu, 14 Jul 2022 12:09:58 -0400
X-MC-Unique: kdLlx-clOU-XYykXZDvEcA-1
Received: by mail-wm1-f71.google.com with SMTP id
 i184-20020a1c3bc1000000b003a026f48333so831200wma.4
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 09:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OK0behKCener34sbhKKKAzyixW2wRrVIOmmZ4P7HtaE=;
 b=a5LaRn0NWn+LuQ/Y0uV9S9544VQr47U/3nKgz9SSq0ykkxvcBp4NWx5Vw+EvcI7doi
 oTUSrvmRxrfRLppWj3JKRh1LWEsAfALzxCXR1zshkZfiPgTI09juEnaNJvOGr4RKb0A3
 semlQJ5wtNS6Gr+dUwULh8iLz+HZ3yFsaohqeqxPe1ZVzARYx0pgTPmc17VD2cxqFYrc
 aHt46VjaYef1jSFlR+a8lEa4PWb/H1enCaISO3ciSdSV62CDnkVn0tgOj9VvfjZHt+t/
 cECCEBoN+Ft0e1y59pP4bIMSStNyh2M27Otf/rkrnWF+ZpyAGUXNb353i7j0UdHX4uJR
 wuhg==
X-Gm-Message-State: AJIora+vtzsptPxJb7ZZm7o+WxZujyUfPXj+xD4eq7WDgaAP7qO2Vq9/
 Xh8w01mhTxdASz7yuZsnszyzMbKhwM6cXeAgbvb/152BFl7Ua7nYw6meE7Iw2eKnge5IucPj6Mm
 SdCho1fayk+72V28=
X-Received: by 2002:a7b:cb10:0:b0:3a0:312c:fd3c with SMTP id
 u16-20020a7bcb10000000b003a0312cfd3cmr10164359wmj.52.1657814996787; 
 Thu, 14 Jul 2022 09:09:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uCRM6/AoOYsqYp8RlGAVD7nBIncc9wWiuAIzFcgc+jpgE8YG6SQ/5RvzdoIpnkV3WFA5VcFw==
X-Received: by 2002:a7b:cb10:0:b0:3a0:312c:fd3c with SMTP id
 u16-20020a7bcb10000000b003a0312cfd3cmr10164336wmj.52.1657814996567; 
 Thu, 14 Jul 2022 09:09:56 -0700 (PDT)
Received: from redhat.com ([2.52.24.42]) by smtp.gmail.com with ESMTPSA id
 n9-20020a5d4c49000000b002167efdd549sm1773400wrt.38.2022.07.14.09.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 09:09:55 -0700 (PDT)
Date: Thu, 14 Jul 2022 12:09:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Alexander Graf <agraf@suse.de>
Subject: Re: [PULL 00/54] virtio,pc,pci: fixes,cleanups,features
Message-ID: <20220714120715-mutt-send-email-mst@kernel.org>
References: <20220610075631.367501-1-mst@redhat.com>
 <CAFEAcA8u8jm7b+JD_t0qMNMy+WSJPOw=qxqptZpwTp=TkcXrhg@mail.gmail.com>
 <20220714134146.23617610@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714134146.23617610@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 14, 2022 at 01:41:46PM +0200, Igor Mammedov wrote:
> On Thu, 14 Jul 2022 10:16:34 +0100
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
> > On Fri, 10 Jun 2022 at 08:57, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > ----------------------------------------------------------------
> > > virtio,pc,pci: fixes,cleanups,features
> > >
> > > more CXL patches
> > > VIOT
> > > Igor's huge AML rework
> > > fixes, cleanups all over the place  
> > 
> > Hi. On my macos machine (an x86 one), 'make check' output for
> > the bios-tables-test for both i386 and x86-64 guests now includes
> > a warning message:
> > 
> > qemu-system-i386: -device isa-applesmc: warning: Using AppleSMC with invalid key
> > 
> > I have not bisected but I rather suspect that this is the result of
> > the applesmc test changes in this pullreq.
> 
> Like warning says, test case doesn't have SMC key after which
> QEMU uses some made up default.
> 
> It can't suppressed with 'qtest_enabled()' since QEMU in test
> doesn't use qtest as accelerator.
> 
> I'm more inclined to removing warning.


yes:

    if (!s->osk || (strlen(s->osk) != 64)) {
        warn_report("Using AppleSMC with invalid key");
        s->osk = default_osk;
    }

I would say the incorrect length is right in producing the
warning, but the !s->osk case shouldn't warn.

Alex what do you think?


-- 
MST


