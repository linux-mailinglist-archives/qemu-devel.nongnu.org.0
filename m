Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B333D720A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 11:31:57 +0200 (CEST)
Received: from localhost ([::1]:32782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8JRM-00033y-Lr
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 05:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m8JQA-0002IO-D3
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 05:30:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m8JQ8-0002iN-I9
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 05:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627378239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53MhhRr4ec4yG4/6bOptih40UdyBB8hPPeQ/fvRIaEY=;
 b=MuA0jiiYe1FY5sWN7vKDarQs825vfmcmY8WeFQZSr9JZoT+J7OijnrWLkjWSUkmW1q65To
 xL9aNYo54ksylhxZcaOHISRuxxQsz/Xl+8UK8LfTP7zep3WMFeGWb4h2MsvFsnpoVqe8ug
 356ySlrVxkyxM/KHAtjNp62dSxLLBvI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-nWBngfSAOsmwfnREVe5Zhw-1; Tue, 27 Jul 2021 05:30:36 -0400
X-MC-Unique: nWBngfSAOsmwfnREVe5Zhw-1
Received: by mail-ed1-f71.google.com with SMTP id
 a23-20020a50ff170000b02903b85a16b672so6305366edu.1
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 02:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=53MhhRr4ec4yG4/6bOptih40UdyBB8hPPeQ/fvRIaEY=;
 b=kcugSixboU9vdcIcrdj7GuScvJA6asowtTgTq1Htr+qsgLd6T4gkgh3DKywYsNNbk9
 Fset+V4ccqwZd8lM3Evdzglph5EDY6iFh9Pz20qexpUGdcZ29cyRJCCfF1Vq1TW4Mm77
 gnfJgV1xfwm5I+DVlGoVEbNTCmK9ha4Qg+CXHOokZqWzGrcQtKTKv+2RFHP0fW6yG3ri
 xk8ENJ5UpaQtzHvAn8ExFU/cQNBdJSIhejkrNVPteSLW/XBKc6CEOv1Nrc+hMK8ZtFnL
 kRKApeB/Vo3ERzUxJkgtj8kd4qOwSmGpkfXjY53NjEWsIlLPphLZ5ITLMddeINtKXL04
 Dbwg==
X-Gm-Message-State: AOAM5336+5K0aOYtBDXdxLB/UUHculqv8BdibvfuBx1YctTWDZktCTHE
 VjN1Ji2nEjQjGlQLoNSaeZXKdRL1gSyC6Ov4nDAiTwcxQnX7cKQL1mRHaAL0X9eSHC2/5SsyZvz
 lbdvfPZWvfuvlM2s=
X-Received: by 2002:a17:906:3699:: with SMTP id
 a25mr20725518ejc.452.1627378235062; 
 Tue, 27 Jul 2021 02:30:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2F8H5urTAkqAQZsIoXP/boAFl6v4NMdX2yt6IVlHAf+thyODCjoF2GCmwsMHfjL2XyhVxwg==
X-Received: by 2002:a17:906:3699:: with SMTP id
 a25mr20725488ejc.452.1627378234828; 
 Tue, 27 Jul 2021 02:30:34 -0700 (PDT)
Received: from redhat.com ([2.55.128.141])
 by smtp.gmail.com with ESMTPSA id dh8sm428852edb.14.2021.07.27.02.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 02:30:32 -0700 (PDT)
Date: Tue, 27 Jul 2021 05:30:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
Message-ID: <20210727052516-mutt-send-email-mst@kernel.org>
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
 <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
 <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
 <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
 <20210727004401-mutt-send-email-mst@kernel.org>
 <f526c655-3d25-bf66-8f96-cef55c9f6fa3@roeck-us.net>
 <CAMj1kXEx1wqGJqTsNDNpBNLhFzn=kXmKFJ8m6AqZCPhfF1WC1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMj1kXEx1wqGJqTsNDNpBNLhFzn=kXmKFJ8m6AqZCPhfF1WC1g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Jiahui Cen <cenjiahui@huawei.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>, qemu-devel@nongnu.org,
 Bjorn Helgaas <bhelgaas@google.com>, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 27, 2021 at 09:04:20AM +0200, Ard Biesheuvel wrote:
> On Tue, 27 Jul 2021 at 07:12, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 7/26/21 9:45 PM, Michael S. Tsirkin wrote:
> > > On Mon, Jul 26, 2021 at 06:00:57PM +0200, Ard Biesheuvel wrote:
> > >> (cc Bjorn)
> > >>
> > >> On Mon, 26 Jul 2021 at 11:08, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> > >>>
> > >>> On 7/26/21 12:56 AM, Guenter Roeck wrote:
> > >>>> On 7/25/21 3:14 PM, Michael S. Tsirkin wrote:
> > >>>>> On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote:
> > >>>>>> Hi all,
> > >>>>>>
> > >>>>>> starting with qemu v6.0, some of my aarch64 efi boot tests no longer
> > >>>>>> work. Analysis shows that PCI devices with IO ports do not instantiate
> > >>>>>> in qemu v6.0 (or v6.1-rc0) when booting through efi. The problem affects
> > >>>>>> (at least) ne2k_pci, tulip, dc390, and am53c974. The problem only
> > >>>>>> affects
> > >>>>>> aarch64, not x86/x86_64.
> > >>>>>>
> > >>>>>> I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Inform os to
> > >>>>>> keep firmware resource map"). Since this commit, PCI device BAR
> > >>>>>> allocation has changed. Taking tulip as example, the kernel reports
> > >>>>>> the following PCI bar assignments when running qemu v5.2.
> > >>>>>>
> > >>>>>> [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
> > >>>>>> [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> > >>>>>> [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
> > >>
> > >> IIUC, these lines are read back from the BARs
> > >>
> > >>>>>> [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107f]
> > >>>>>> [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem
> > >>>>>> 0x10000000-0x1000007f]
> > >>>>>>
> > >>
> > >> ... and this is the assignment created by the kernel.
> > >>
> > >>>>>> With qemu v6.0, the assignment is reported as follows.
> > >>>>>>
> > >>>>>> [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
> > >>>>>> [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
> > >>>>>> [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
> > >>>>>>
> > >>
> > >> The problem here is that Linux, for legacy reasons, does not support
> > >> I/O ports <= 0x1000 on PCI, so the I/O assignment created by EFI is
> > >> rejected.
> > >>
> > >> This might make sense on x86, where legacy I/O ports may exist, but on
> > >> other architectures, this makes no sense.
> > >
> > >
> > > Fixing Linux makes sense but OTOH EFI probably shouldn't create mappings
> > > that trip up existing guests, right?
> > >
> >
> > I think it is difficult to draw a line. Sure, maybe EFI should not create
> > such mappings, but then maybe qemu should not suddenly start to enforce
> > those mappings for existing guests either.
> >
> 
> EFI creates the mappings primarily for itself, and up until DSM #5
> started to be enforced, all PCI resource allocations that existed at
> boot were ignored by Linux and recreated from scratch.
> 
> Also, the commit in question looks dubious to me. I don't think it is
> likely that Linux would fail to create a resource tree. What does
> happen is that BARs get moved around, which may cause trouble in some
> cases: for instance, we had to add special code to the EFI framebuffer
> driver to copy with framebuffer BARs being relocated.
> 
> > For my own testing, I simply reverted commit 0cf8882fd0 in my copy of
> > qemu. That solves my immediate problem, giving us time to find a solution
> > that is acceptable for everyone. After all, it doesn't look like anyone
> > else has noticed the problem, so there is no real urgency.
> >
> 
> I would argue that it is better to revert that commit. DSM #5 has a
> long history of debate and misinterpretation, and while I think we
> ended up with something sane, I don't think we should be using it in
> this particular case.

I think revert might make sense, however:

0: No (The operating system shall not ignore the PCI configuration that firmware has done
at boot time. However, the operating system is free to configure the devices in this hierarchy
that have not been configured by the firmware. There may be a reduced level of hot plug
capability support in this hierarchy due to resource constraints. This situation is the same as
the legacy situation where this _DSM is not provided.)

^^^^ does not this imply that reporting a 0 as we currently do
     should be mostly a NOP?


1: Yes (The operating system may ignore the PCI configuration that the firmware has done
at boot time, and reconfigure/rebalance the resources in the hierarchy.)


So I am debating with myself whether this should be a plain revert or
return 1 here:
     /*
      * 0 - The operating system must not ignore the PCI configuration that
      *     firmware has done at boot time.
      */
     aml_append(ifctx1, aml_return(aml_int(0)));
-    aml_append(ifctx, ifctx1);
+    aml_append(ifctx1, aml_return(aml_int(1)));
     aml_append(method, ifctx);



Guenter what happens if we return 1? Do things work well?

-- 
MST


