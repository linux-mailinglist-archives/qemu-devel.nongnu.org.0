Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F74257CAC3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:40:14 +0200 (CEST)
Received: from localhost ([::1]:50386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEVTR-0006qA-A7
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oEVPI-00012S-EB
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:35:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oEVPF-00060N-EJ
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658406951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wPrNvc/NysRuGm+EA56Z3ofp3/QNh63qs+LQSe97mCk=;
 b=e3nvyanbEfYqox+AiFT6n21lRwEMqT91RgMtjWuGRFdLB/yX8+s0+2i56LCrAUgRtRW7uv
 M/lNnma5RpJNGDQVcQAGU7kHG8oeQGvg1ybl9YPR4r0ve79sySLg9Xr/eHPxzM647HaPE0
 9sT480FYju92W9La5hJdglvmsVrGQdY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-xS6aMHX_NDSTShgXlqSyDw-1; Thu, 21 Jul 2022 08:35:49 -0400
X-MC-Unique: xS6aMHX_NDSTShgXlqSyDw-1
Received: by mail-wr1-f71.google.com with SMTP id
 c7-20020adfc6c7000000b0021db3d6961bso307107wrh.23
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 05:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wPrNvc/NysRuGm+EA56Z3ofp3/QNh63qs+LQSe97mCk=;
 b=t8NwBvh+qmg3AGMeuvyWEkeNi4UV2mPbwuR5JdANJD2kP7PdccRE2MTKrSip97iO8n
 7oiuxpkDL+mPThcX34irNPwIOKci+2KxivHcSVMf7pMgSIrDNCnVoc7osncpKULcIdpd
 MdS7F98Z3CvjbE04w10xUd2qIkhi0Q81i2qdCVYcdj9uTMxkjgCke59iEimBRTi/7j1j
 osZiK2QS6SzeLU9kDIYa837M1yBA7qYdtvFls03fAQfp9vubv8LEQ5jDPEtiFf6gj0Se
 DPXnUK3jCNfIFjolF2Cl2LnZos88rP63OBGhd/q/QKWo2lZ4G+bw2lF9rsorucRqGywX
 eQzg==
X-Gm-Message-State: AJIora8bN9FbydAjqyuCNFju+bwrRLpScxD5OpL1AYrmaNhKiS44J3R8
 5zF28ML37jLhGJpecC5ht2O3B6juIFeJjLh37/rFMfWf8tCXIAEwBFDm1nvMbj0PQp/MwMVU3if
 yrEfPmwqLz5A6a3U=
X-Received: by 2002:adf:a51a:0:b0:21d:86b9:f41e with SMTP id
 i26-20020adfa51a000000b0021d86b9f41emr34630839wrb.217.1658406948583; 
 Thu, 21 Jul 2022 05:35:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vcLIKZiNjuzCGx1nCvjxmZM1zpLnPKBashw0HEOQN58BHno5Z8egoqpiAcZ4y4H3T9N3nDxg==
X-Received: by 2002:adf:a51a:0:b0:21d:86b9:f41e with SMTP id
 i26-20020adfa51a000000b0021d86b9f41emr34630811wrb.217.1658406948206; 
 Thu, 21 Jul 2022 05:35:48 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 ib13-20020a05600ca14d00b003a31ba538c2sm1641967wmb.40.2022.07.21.05.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 05:35:47 -0700 (PDT)
Date: Thu, 21 Jul 2022 13:35:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PULL 06/35] hw/acpi: refactor acpi hp modules so that targets
 can just use what they need
Message-ID: <YtlIIbR5i3St3B0c@work-vm>
References: <20210904213506.486886-1-mst@redhat.com>
 <20210904213506.486886-7-mst@redhat.com>
 <CAFEAcA9WBo2Kn9BPz1y2JCxpBGnBWDOtgLFiu31V4PL2m6b7bQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2207201132430.9370@anisinha-lenovo>
 <CAFEAcA8-ufAM2sg8-WkCPV3ksBZ=RU_1M2aq-wUBij82ot7iUw@mail.gmail.com>
 <alpine.DEB.2.22.394.2207201450430.17070@anisinha-lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2207201450430.17070@anisinha-lenovo>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Ani Sinha (ani@anisinha.ca) wrote:
> 
> 
> On Wed, 20 Jul 2022, Peter Maydell wrote:
> 
> > On Wed, 20 Jul 2022 at 19:37, Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > >
> > >
> > > On Tue, 19 Jul 2022, Peter Maydell wrote:
> > >
> > > > On Sat, 4 Sept 2021 at 22:36, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > How is this intended to work? The obvious fix from my point
> > > > of view would just be to say "piix4.c requires pcihp.c"
> > > > and cause CONFIG_ACPI_PIIX4 to pull in CONFIG_ACPI_PCIHP,
> > > > but that seems like it would be rather undoing the point
> > > > of this change.
> > >
> > > Yes. From the commit log and the vague recollection I have about this
> > > change :
> > >
> > > > For example, mips only needs support for PIIX4 and does not
> > > > need acpi pci hotplug support or cpu hotplug support or memory hotplug
> > > support
> > > > etc
> > >
> > > So does malta really need acpi hotplug? If not, then the stubbing out of
> > > the vmstate struct is correct.
> >
> > It's not, because the vmstate struct is actually used when you
> > savevm/loadvm a malta machine. If the malta shouldn't have
> > acpi hotplug then we need to arrange for the hotplug code
> > to be avoided at an earlier point, not just stub in the
> > vmstate struct field.
> 
> yes I think that would be more appropriate fix, I agree. Since mst added
> that vmstate, maybe he can comment on this.

Can't we just change the stub to be a valid vmstate structure?

Dave
(I coincidentally found this today because I'd been cc'd on
https://gitlab.com/qemu-project/qemu/-/issues/995 a few months back
and only just noticed)

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


