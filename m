Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D18036C7F5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 16:49:53 +0200 (CEST)
Received: from localhost ([::1]:51732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbP27-0007Yb-N6
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 10:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbP0o-0006wD-0h
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:48:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbP0k-0006hv-Mh
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619534905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YR1SHOI/zFYYaGcZMi5EmcPrqMnaUioj8e79D1yDzAs=;
 b=MjjOgJf0GAD2rzYITdKVg8o+4iSkHxHqxJ0E1Xs1sbOpDbxE/yKhGnrKxu3BEtLGOQAY5l
 uF52o60WYMR92XyAEF8g4y5n+oBYEXMRHkpa56vQC85TQUCdaTOvpjFfNtLLXLBmxdQEdS
 u6CPQqMX/5N3uLths3sWBkc6W8P6iHk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-Pzp30SNIPKybGGjQp1PoRA-1; Tue, 27 Apr 2021 10:48:23 -0400
X-MC-Unique: Pzp30SNIPKybGGjQp1PoRA-1
Received: by mail-ed1-f69.google.com with SMTP id
 c13-20020a05640227cdb0290385526e5de5so14962634ede.21
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 07:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YR1SHOI/zFYYaGcZMi5EmcPrqMnaUioj8e79D1yDzAs=;
 b=R2aq9bYZn4sRJ6Ogc681ihhCJcQ96wpPPyCj7LqDACaAifUlhBAncpwqNw8w6pPjGT
 2jadLbqfvOeB6Q8758U7Zve+J8uToRDhUu/6BQwGN3kZPx49sp2MNHNlP1LPyO2HH+x1
 aEdP5jHxTlrn1LQhqigoMDWMh6n/yggac24xmEz+RulV4ldNIN6lKWjgqfF2U3Lmzi7Z
 2978ep6xCW/F5KvQ2qcuEtV05P3pdPZ7pz44FkSg73gwefw174byHQqgm8rxlHFDU7pH
 rMkVuZ8VcuzfDWf87ohVo5KQe85Mqvtip/HyvdNnhTpTiZTFcGzZp+3fkIkiFgdKE+bD
 07BA==
X-Gm-Message-State: AOAM530iN55l7dck1EkDK482vAiZ51gLEF49khD0C/G3ALjqrJWzNF13
 SRAkKuxqAAu7ilPnrDWWdESynlpZEF6rvEqapkld4VntomipEw/CHyFvRxWLHoRa3YQqM3TKJyr
 lxcEq47Rz6XgiUpU=
X-Received: by 2002:a17:906:2808:: with SMTP id
 r8mr23884823ejc.140.1619534902369; 
 Tue, 27 Apr 2021 07:48:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtxREmkNTxj4aOVTt3Kpyj4wVPj1YPtAAY5GG0053kbDlThXe3bhdnfWAfgeE62hdeTwfwpQ==
X-Received: by 2002:a17:906:2808:: with SMTP id
 r8mr23884800ejc.140.1619534902147; 
 Tue, 27 Apr 2021 07:48:22 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id da25sm2602185edb.38.2021.04.27.07.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 07:48:21 -0700 (PDT)
Date: Tue, 27 Apr 2021 16:48:19 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH RESEND v2 0/6] target/arm: Add nested virtualization
 support
Message-ID: <20210427144819.fiecdpdgre7tznvq@gator.home>
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <CAFEAcA8a53rCGBGVr_mb0fVJPXFaCShGTJE0bh=L5Nvw6ATz6A@mail.gmail.com>
 <20210427095458.3hbckyqbmfztcmge@gator.home>
 <CAFEAcA82VJqgD+B4gCr1M0n5oV869rBdoTzNS6xSs0f2f8iFvw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA82VJqgD+B4gCr1M0n5oV869rBdoTzNS6xSs0f2f8iFvw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 27, 2021 at 01:15:24PM +0100, Peter Maydell wrote:
> On Tue, 27 Apr 2021 at 10:55, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Tue, Apr 27, 2021 at 10:42:18AM +0100, Peter Maydell wrote:
> > > Why are we making the UI for "enable EL2 guest with KVM" different
> > > from that for "enable EL2 guest with TCG" ? Currently an EL2
> > > TCG guest is set up with "-M virt,virtualization=on", which then
> > > does everything it needs to enable virtualization on all the
> > > components on the board including the CPU.
> > >
> > > Unless there's a strong technical reason why KVM EL2 has to
> > > be different, I think we should use the same switch.
> >
> > I agree we should use the same switch, but I think I'd prefer it be the
> > CPU switch instead of the machine switch, as it's a CPU feature. There are
> > some board properties too, like the maintenance interrupt, but we tend to
> > call a feature a CPU feature when it shows up in the CPU manual, e.g. the
> > PMU is also a CPU feature, even though it has a PPI.
> 
> This is mostly not how we've generally opted to handle this kind of thing on
> the virt board where there is something that is not merely a CPU feature
> but also has effects on the wider system: look at 'virtualization',
> 'secure' and 'mte'. Granted, the effects of 'virtualization' on the wider
> system are less significant than those of 'secure' or 'mte' -- but I think
> we implemented 'virtualization' on the same pattern as 'secure'.
> 
> If you want to propose changing how we handle those things, including
> a backward-compatibility setup so we don't break existing command lines,
> I guess we can have that discussion. But we should either *first* do that
> change-of-course and *then* implement KVM EL2 to fit into that, or we should
> just implement KVM EL2 to fit into the design we have today (and then do
> the redesign later if we decide to do that). I don't think we should add
> KVM EL2 support's command line switches using a new design that we haven't
> committed to and which leaves it completely out of line with what the TCG
> handling of the exact same feature is. And I don't feel strongly enough
> that our current approach is wrong that I want to impose a "first do this
> big rework" precondition on landing the KVM EL2 support.
>

Since these types of features seem to blur the line between being a CPU
and board property, then I think I'd prefer we call them CPU properties,
as they come from the CPU manual.

Also, if we'd rather not rework 'virtualization' to be a CPU property,
then we'll need libvirt to learn how to probe and set it, whereas if
it's a CPU property we just need to add it to
cpu_model_advertised_features[].

Whichever way we go, we should commit to it, at least for the foreseeable
future, otherwise libvirt and users will have to flipflop their approaches
as well (I'm assuming there have been limited users of this feature
without KVM and libvirt support, so less users would flipflop now than
later.)

I suggest we rework 'virtualization' now with this KVM support series and
'mte' with the series that brings its KVM support too. 'secure' doesn't
currently work with KVM, so it can probably wait until its KVM support
series comes along to be reworked.

Thanks,
drew


