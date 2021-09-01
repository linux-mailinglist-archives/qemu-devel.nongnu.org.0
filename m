Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0D53FD75A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:07:21 +0200 (CEST)
Received: from localhost ([::1]:53068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLN9M-0001Nl-6B
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLN6W-00085k-1I
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:04:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLN6S-0002dm-55
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630490657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pw997ExCGCQ0m/oMw9ga/N5GyuVoT50ffK4HRp90eIY=;
 b=YCpvNK2Xw5xmS0TvTJLaUq8WDXTOm7KP37ubZCH31pZ3i4PQm7C7kiQkIiZAzJ1uTdyYp5
 USSCbD4ujBHJ2Lp0NsSjghUd8rff2sQESPA2VbCPewx7EWAdDOIYblyXywCIlHgJzQLsqM
 Yfz03J7OY4UOy/UkOel2+vMWqHPYFvc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-f3FbjeYFMO6m3lvUJcTyAA-1; Wed, 01 Sep 2021 06:04:15 -0400
X-MC-Unique: f3FbjeYFMO6m3lvUJcTyAA-1
Received: by mail-wm1-f71.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so827551wmj.6
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pw997ExCGCQ0m/oMw9ga/N5GyuVoT50ffK4HRp90eIY=;
 b=rkOHtQmSiGU2HQjNdknuKl9bxcXACx8EGGZMJnvq0iiL8mezeQ//skeGdYKW7J5nEH
 6lBT4swFRJV12wlHMWZiarQ8GUVrGHtFcLCpMtP8hEqQE+5o/10LepA0wIB4VCMc8/b0
 azlipT2ka0EUU2vn6no6n5Z4lU6ipH2zfNS+yhQXlBtzAN6Ts6lxWUqTqKp/Q6BKmobZ
 Q9pW3+i2T0Pbypy7B3lZyJCaocBVm2z4JpPsEVThg2PwB4nsi0lobQl4CbO77BLzDV6f
 6+h+hlhA7AxFtAkZa/NMR6lu9KimXgZJ1DlA4Kvz1q3RAIqbcehoHSE+rYIvpq6vKYgb
 R+pQ==
X-Gm-Message-State: AOAM531zR8fyyr3n+TclYwRMGbAHsF3TTPpJvSFT843j9CT4U0tjoP/D
 hxjTFgNwZoLva097yHRoUFBO3lqOTv2K7GsdhrKtfAq+somLqr09PPRBbzUKxfneO029lYOihVj
 1C+9SiWXVvbhRGHc=
X-Received: by 2002:a05:600c:2193:: with SMTP id
 e19mr8861933wme.40.1630490654630; 
 Wed, 01 Sep 2021 03:04:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywWi7RuqqQVWdAJeLkOu1rOsWOpcpMyTuORYXPCodrQ9xXpLCvA4z+l6g5BFMxBy4+85soJg==
X-Received: by 2002:a05:600c:2193:: with SMTP id
 e19mr8861891wme.40.1630490654290; 
 Wed, 01 Sep 2021 03:04:14 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id h11sm24918057wrx.9.2021.09.01.03.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:04:13 -0700 (PDT)
Date: Wed, 1 Sep 2021 12:04:12 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v7 10/10] tests/data/acpi/virt: Update IORT files for ITS
Message-ID: <20210901120412.7bbd27ad@redhat.com>
In-Reply-To: <CAFEAcA_vT5ox=7r245qhNOCBpYz1SGEGPzkWX5gqL=_GAGzD+w@mail.gmail.com>
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-11-shashi.mallela@linaro.org>
 <20210901100324.3ce458f6@redhat.com>
 <CAFEAcA_XGk6vh_gZ9wn1Jgu6rf7Ka8TrHnd0WsbDAWgW=67JbQ@mail.gmail.com>
 <20210901110207.13b3e34d@redhat.com>
 <CAFEAcA_vT5ox=7r245qhNOCBpYz1SGEGPzkWX5gqL=_GAGzD+w@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S.
 Tsirkin" <mst@redhat.com>, Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Sep 2021 10:45:43 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 1 Sept 2021 at 10:02, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Wed, 1 Sep 2021 09:06:41 +0100
> > Peter Maydell <peter.maydell@linaro.org> wrote:
> >  
> > > On Wed, 1 Sept 2021 at 09:03, Igor Mammedov <imammedo@redhat.com> wrote:  
> > > >
> > > > not directly related to the patch but while I was testing IORT testcase
> > > > (https://github.com/imammedo/qemu acpi-tests)
> > > > after rebase to 6.1, I get test failure due to change in MADT table vs
> > > > expected blobs made in 6.0 time and it does look like ABI change
> > > > (what is bad, it also happens to virt-6.0 machine type).
> > > > Can ARM folks check if we didn't break something?  
> > >  
> > > >  [02Ch 0044   1]                Subtable Type : 0C [Generic Interrupt Distributor]
> > > >  [02Dh 0045   1]                       Length : 18
> > > >  [02Eh 0046   2]                     Reserved : 0000
> > > >  [030h 0048   4]        Local GIC Hardware ID : 00000000
> > > >  [034h 0052   8]                 Base Address : 0000000008000000
> > > >  [03Ch 0060   4]               Interrupt Base : 00000000
> > > > -[040h 0064   1]                      Version : 02
> > > > +[040h 0064   1]                      Version : 03  
> > >
> > > This says the GIC changed from GICv2 to v3. What QEMU command line are  
> > For the test case, I'm more interested in if the rest of numbers are correct for defaut virt machine type.
> >
> > But in case of virt-6.0 we might have problem.
> >  
> > > you using here ?  
> >
> > -machine virt -accel kvm -accel tcg -nodefaults -nographic -drive if=pflash,format=raw,file=pc-bios/edk2-aarch64-code.fd,readonly=on -drive if=pflash,format=raw,file=pc-bios/edk2-arm-vars.fd,snapshot=on -cdrom tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2 -cpu host -machine virt-6.0
> >                                                                                   ^^^^^^^^  
> 
> With KVM enabled you get "whatever interrupt controller the host has",
> so the configuration is not stable across different host machines. So this
> is not a usable setup to generate or cross-check the ACPI test blobs.
> (It should get you the same configuration across QEMU versions but on
> the same host machine, though.)

Ok, I'll drop IORT test case for now and revisit it once this series is
merged.

> 
> (All the diffs you quote are interrupt-controller related in one way
> or another.)
>
> -- PMM
> 


