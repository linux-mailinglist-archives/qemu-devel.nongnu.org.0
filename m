Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F92521185
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 11:55:56 +0200 (CEST)
Received: from localhost ([::1]:58804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noMax-00079e-Dt
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 05:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1noM4v-0005mj-02
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1noM4s-00007F-FH
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652174565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iSMGMxuiYEqoVaETiVIQUbCcQsvvlBdY3AIWqh6a274=;
 b=MnLTMI7NpzNp2FPmV2aRPN+ORpoYax8xQ1HejLH0fv71uv5rOPYA6o1aur9Ucwfu2lYPAn
 gV+Sz+RFUCmKAkMogaTiuL45Ftr7/mcngGdzUbws/WJ3et7Is1jyZUDDyMr8hTokIaipax
 Fc+swQbjv3t6li3o6pl62ISJH88EVu0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-UJaqAdTVOROMPQ5dMGqmGw-1; Tue, 10 May 2022 05:22:41 -0400
X-MC-Unique: UJaqAdTVOROMPQ5dMGqmGw-1
Received: by mail-wm1-f69.google.com with SMTP id
 q128-20020a1c4386000000b003942fe15835so5040306wma.6
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 02:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iSMGMxuiYEqoVaETiVIQUbCcQsvvlBdY3AIWqh6a274=;
 b=BrbDGTFNn2SbZLHDM7jGvrwH7pstkLKJHg75n2cEtOX6WAyaRkEMWjUAk5c8LTrZjm
 EMNSzBEPKzufdlWMicicFkoFaHsxfbO1FFKIVtgVuMXxxdr3gvNtGhuSatULY2tGmHAr
 DWkymLmUYaj2Y8UbMGBtA93EvVCfftW33v2LGHL0CwJ+hCrp3bOHFCBngd28v9s/NHm0
 A5my2WlZ8FpJU2rk20GCEctqcelxW9fKy815aUjRtvcpa3eb3/57N/AQW44oQgcs0ppq
 H84H8JkLs3NsgY/x3Z6GOfKinL47jhzbui3RnIn9EjPopj3GCwHwR/gftitgEhnSFnOP
 Xlnw==
X-Gm-Message-State: AOAM533Gjkg31mB1YLeCTPBCnb9GzydUydgW/dtgJfFS9eeXFB9aPQPk
 9fwwhFjkKE+NOcDfwr+aXs0hX+pic2/+KGcTRiJAco874w3H1V0gidBu9aST7YDWMTMxoJuYyot
 XzeyX2NsGGrj59c8=
X-Received: by 2002:a1c:7414:0:b0:394:1d5d:27f2 with SMTP id
 p20-20020a1c7414000000b003941d5d27f2mr20610039wmc.37.1652174560288; 
 Tue, 10 May 2022 02:22:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCk0GKV+j7ln5Pb9wycQvVEGl+hQN2zZ+MSJ3A6E9253bkQ85WKn40N7BKCUGOz/zp4M5yuQ==
X-Received: by 2002:a1c:7414:0:b0:394:1d5d:27f2 with SMTP id
 p20-20020a1c7414000000b003941d5d27f2mr20610010wmc.37.1652174560041; 
 Tue, 10 May 2022 02:22:40 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 l5-20020a5d5605000000b0020c5253d8d3sm13132928wrv.31.2022.05.10.02.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 02:22:39 -0700 (PDT)
Date: Tue, 10 May 2022 10:22:36 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>, muriloo@linux.ibm.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 mopsfelder@gmail.com, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 qemu-RISC-V <qemu-riscv@nongnu.org>
Subject: Re: QEMU 32-bit vs. 64-bit binaries
Message-ID: <Ynou3EnxfSmrzGT0@work-vm>
References: <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
 <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
 <87ilql9xww.fsf@linux.ibm.com>
 <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
 <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com>
 <877d6tzs2e.fsf@pond.sub.org>
 <32e5877d-ba45-ac63-d24e-1f9f8676c6bb@redhat.com>
 <CAFEAcA8Ff45KeuQm-v8MwXX_i+P51uF-ovpQvtGD3hx1bi3A9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8Ff45KeuQm-v8MwXX_i+P51uF-ovpQvtGD3hx1bi3A9g@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Tue, 10 May 2022 at 10:01, Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 10/05/2022 10.54, Markus Armbruster wrote:
> > > Thomas Huth <thuth@redhat.com> writes:
> > >
> > > [...]
> > >
> > >> I once suggested in the past already that we should maybe get rid of
> > >> the 32-bit variants in case the 64-bit variant is a full superset, so
> > >> we can save compile- and test times (which is quite a bit for QEMU),
> > >> but I've been told that the 32-bit variants are mostly still required
> > >> for supporting KVM on 32-bit host machines.
> > >
> > > Do we still care for 32-bit host machines?
> >
> > As long as the Linux kernel still supports 32-bit KVM virtualization, I
> > think we have to keep the userspace around for that, too.
> >
> > But I wonder why we're keeping qemu-system-arm around? 32-bit KVM support
> > for ARM has been removed with Linux kernel 5.7 as far as I know, so I think
> > we could likely drop the qemu-system-arm nowadays, too? Peter, Richard,
> > what's your opinion on this?
> 
> Two main reasons, I think:
>  * command-line compatibility (ie there are lots of
>    command lines out there using that binary name)
>  * nobody has yet cared enough to come up with a plan for what
>    we want to do differently for these 32-bit architectures,
>    so the default is "keep doing what we always have"
> 
> In particular, I don't want to get rid of qemu-system-arm as the
> *only* 32-bit target binary we drop. Either we stick with what
> we have or we have a larger plan for sorting this out consistently
> across target architectures.

To my mind, qemu-system-arm makes a lot of sense, and I'd rather see the
32 bit guests disappear from qemu-system-aarch64.
It's difficult to justify to someone running their aarch virt stack why
their binary has the security footprint that includes a camera or PDA.

ARM is a lot cleaner than x86; you don't suddenly find a little Cortex-M
machine with a big 64 bit core in it; yet on x86 our machines are
frankenstinian mixes with 25 year old chipsets and modern CPUs.

Dave

> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


