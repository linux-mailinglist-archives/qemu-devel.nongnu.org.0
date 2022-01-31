Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95844A4C3C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:34:37 +0100 (CET)
Received: from localhost ([::1]:44858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZdU-0003k6-QG
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:34:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nEZJx-0007AP-NP
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:14:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nEZJt-0006xy-5Y
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 11:14:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643645659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0x5o2QnHWXm5yA5/PaYEhVjvHCo0b+hjq8lw5LsJ9VY=;
 b=TdT96g7VvvdBT8HIdFVPGna+eWN1fkT+D4uWWvpPXjZAgth/zONi906LMtQfZ7Iaor2YcP
 ZerRYbf5VOI/PatIu69HtFh1Ia/IOvycRg8F2L14vTGP5rr0YfZHt/auVzt4ivvxlMPJ5X
 4wMmUSQO/e/aN8ZgjMw7HmPnOapCJ/U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-KU20Kd1AM2elxwOpeBVFUQ-1; Mon, 31 Jan 2022 11:14:12 -0500
X-MC-Unique: KU20Kd1AM2elxwOpeBVFUQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 f21-20020a50d555000000b00407a8d03b5fso7145038edj.9
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 08:14:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0x5o2QnHWXm5yA5/PaYEhVjvHCo0b+hjq8lw5LsJ9VY=;
 b=7QrjVf86Jy0P7X89BXOMpEIO3kExc0yVPM1UuTqwLlijpOqA1gY2lR10R6CsQcsi//
 7AbP2odhTw7Mgd1WRpwjEGaMCc0pTn4rmkxEFp1gLJPAbi+yoCVqaDGZmT+bYPBFhWZd
 059m1L6m4DfR2VgeIGA1rsv6Y9cuBPvzDqJ6U2ao0PIY/GHqxDPOFSNok7SrBeD8J0QJ
 G3VDOplJ2hUX6PmC1YV15z61LYpeSWO3pxv29eb9vi0BVyJl7ZZ8mk159iie/aCQpP4L
 pGnIyFyWd5il3fBK639BYdaTY+ATzDKo3HCbJ1Z6wdb3gFO8i+1ZpB/Y0fXMr6RiXlcJ
 XboA==
X-Gm-Message-State: AOAM531uoryE61CcnmfbFKJTqeQ90oBtEsifMsy34IyXksp0765saK0v
 c5ixfM8QqKtfAdqkA1vzpFu4fgLlNDWQ/0ua7VwCBccQe2jTTRPHnBWpwaGc13Fiq6YAqkUEQPZ
 0+4so9Ynb8sAgEu8=
X-Received: by 2002:a17:906:498b:: with SMTP id
 p11mr17510285eju.119.1643645651651; 
 Mon, 31 Jan 2022 08:14:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjXxYHM2htxm3STgHXmpdgiP/iiI7ZDnnJ5sYiq8Olietc7GZ2+LSRUimrZANBi83eKUNtGA==
X-Received: by 2002:a17:906:498b:: with SMTP id
 p11mr17510254eju.119.1643645651338; 
 Mon, 31 Jan 2022 08:14:11 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id c2sm18017580edj.24.2022.01.31.08.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 08:14:10 -0800 (PST)
Date: Mon, 31 Jan 2022 17:14:08 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/2] tests/qtest: Special case sbsa-ref and
 xlnx-versal-virt if !CONFIG_ARM_GIC_TCG
Message-ID: <20220131161408.py2ncvkkxxhbkpjj@gator>
References: <20220131154531.429533-1-eric.auger@redhat.com>
 <20220131154531.429533-3-eric.auger@redhat.com>
 <20220131155936.lm7jn32ihb2ndsf7@gator>
 <CAFEAcA-K3cAPMiAfHNCOaceRN2csH26W4w9RDOUUVhpKPMNh2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-K3cAPMiAfHNCOaceRN2csH26W4w9RDOUUVhpKPMNh2Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 04:05:06PM +0000, Peter Maydell wrote:
> On Mon, 31 Jan 2022 at 15:59, Andrew Jones <drjones@redhat.com> wrote:
> > Hmm, if these machine types completely depend on userspace gicv3
> > emulation, i.e. no way to use in-kernel gic or another tcg gic
> > model, then I guess they shouldn't be built at all when ARM_GIC_TCG
> > isn't configured. I.e.
> >
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 2e0049196d6c..d7cc028b049d 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -209,6 +209,7 @@ config REALVIEW
> >
> >  config SBSA_REF
> >      bool
> > +    depends on ARM_GIC_TCG
> >      imply PCI_DEVICES
> >      select AHCI
> >      select ARM_SMMUV3
> > @@ -378,6 +379,7 @@ config XLNX_ZYNQMP_ARM
> >
> >  config XLNX_VERSAL
> >      bool
> > +    depends on ARM_GIC_TCG
> >      select ARM_GIC
> >      select PL011
> >      select CADENCE
> 
> I kind of agree, but isn't this kind of mixing two things?

How about two dependencies?

> 
> (1) Both these machines require a GICv3 and a GICv2 won't do,
> so they should do something that says "if you want this
> machine type, you need a GICv3 device"

depends on ARM_GIC_TCG   (IMO, could use a rename to be gicv3 specific)

> 
> (2) Both these machines don't work with KVM or hvf, so if we're
> not building TCG then there's no point configuring in these
> machine models (a property they share with every other arm
> machine type except "virt", currently)

depends on TCG

Thanks,
drew


