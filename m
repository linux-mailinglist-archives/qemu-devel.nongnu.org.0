Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70DA4C29D4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 11:46:47 +0100 (CET)
Received: from localhost ([::1]:46736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNBe2-0008AF-VB
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 05:46:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org>)
 id 1nNBbW-0006m9-9B
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:44:10 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:57164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org>)
 id 1nNBbS-0004bY-LV
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:44:09 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C239FCE1DBF
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 10:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A4AC340EB
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 10:43:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="aA5wG47c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645699433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sL/kUSLvWygB2PavSQ97uF3uxu/r6EDQi5d4jb1S2zQ=;
 b=aA5wG47c2lh8t6hZNg1Q+cys1VOtxBvH+eG8osg/gqGS56Lj0LpNmxcLD4SOX2YzPRVhlG
 VGmW3G12lBzd7xR02TM5GlFLz+MBrOWgbpeI5sltt2hVVLGj6lWbC/5L0aNSYREBnV10rH
 IWnXhG3aRPY5gCC/cZL+L8qrmAdnSgo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4b5cd2fd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 24 Feb 2022 10:43:53 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id j2so3008948ybu.0
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 02:43:52 -0800 (PST)
X-Gm-Message-State: AOAM532e4PE2P/M44H34TSa8wBQyt2TDEBfYKf0dPVXleFgBKJ/Qy+wv
 ahN5QCEWvVbGAe5pY/lmTGEb3iA3YzGUndPfqs4=
X-Google-Smtp-Source: ABdhPJyD6AgYJgfomnQ4h/8Dt+RdkCcpIpTKOhmvVM8csH9TSR/juMBC9kj7EYCe29IQJZix5mE0qLTy0v0jwO0zL24=
X-Received: by 2002:a25:b905:0:b0:61e:23e4:949f with SMTP id
 x5-20020a25b905000000b0061e23e4949fmr1827124ybj.373.1645699431569; Thu, 24
 Feb 2022 02:43:51 -0800 (PST)
MIME-Version: 1.0
References: <20220223131231.403386-1-Jason@zx2c4.com>
 <CAHmME9ogH_mx724n_deFfva7-xPCmma1-=2Mv0JdnZ-fC4JCjg@mail.gmail.com>
 <2653b6c7-a851-7a48-f1f8-3bde742a0c9f@redhat.com>
In-Reply-To: <2653b6c7-a851-7a48-f1f8-3bde742a0c9f@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 24 Feb 2022 11:43:40 +0100
X-Gmail-Original-Message-ID: <CAHmME9ogtK-iS7Szodbf47iGGJJ7TAxtico4P_-VRRYkUtUKgw@mail.gmail.com>
Message-ID: <CAHmME9ogtK-iS7Szodbf47iGGJJ7TAxtico4P_-VRRYkUtUKgw@mail.gmail.com>
Subject: Re: [PATCH RFC v1 0/2] VM fork detection for RNG
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.73.55;
 envelope-from=SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org;
 helo=sin.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: linux-s390@vger.kernel.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
 KVM list <kvm@vger.kernel.org>, adrian@parity.io, Jann Horn <jannh@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ben@skyportsystems.com,
 "Weiss, Radu" <raduweis@amazon.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 "Catangiu, Adrian Costin" <acatan@amazon.com>, graf@amazon.com,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, Colm MacCarthaigh <colmmacc@amazon.com>,
 "Singh, Balbir" <sblbir@amazon.com>, "Woodhouse, David" <dwmw@amazon.co.uk>,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Lazlo,

Thanks for your reply.

On Thu, Feb 24, 2022 at 9:23 AM Laszlo Ersek <lersek@redhat.com> wrote:
> QEMU's related design is documented in
> <https://git.qemu.org/?p=qemu.git;a=blob;f=docs/specs/vmgenid.txt>.

I'll link to this document on the 2/2 patch next to the other ones.

> "they can also use the data provided in the 128-bit identifier as a high
> entropy random data source"
>
> So reinitializing an RNG from it is an express purpose.

It seems like this is indeed meant to be used for RNG purposes, but
the Windows 10 RNG document says: "Windows 10 on a Hyper-V VM will
detect when the VM state is reset, retrieve a unique (not random)
value from the hypervisor." I gather from that that it's not totally
clear what the "quality" of those 128 bits are. So this patchset mixes
them into the entropy pool, but does not credit it, which is
consistent with how the RNG deals with other data where the conclusion
is, "probably pretty good but maybe not," erring on the side of
caution. Either way, it's certainly being used -- and combined with
what was there before -- to reinitialize the RNG following a VM fork.

>
> More info in the libvirt docs (see "genid"):
>
> https://libvirt.org/formatdomain.html#general-metadata

Thanks, noted in the 2/2 patch too.

> QEMU's interpretation of the VMGENID specifically as a UUID (which I
> believe comes from me) has received (valid) criticism since:
>
> https://github.com/libguestfs/virt-v2v/blob/master/docs/vm-generation-id-across-hypervisors.txt
>
> (This document also investigates VMGENID on other hypervisors, which I
> think pertains to your other message.)

Thank you very much for this reference! You're absolutely right here.
v3 will treat this as just an opaque 128-bit binary blob. There's no
point, anyway, in treating it as a UUID in the kernel, since it never
should be printed or exposed to anywhere except random.c (and my gifs,
of course :-P).

>
> > (It appears there's a bug in QEMU which prevents
> > the GUID from being reinitialized when running `loadvm` without
> > quitting first; I suppose this should be discussed with QEMU
> > upstream.)
>
> That's not (necessarily) a bug; see the end of the above-linked QEMU
> document:
>
> "There are no known use cases for changing the GUID once QEMU is
> running, and adding this capability would greatly increase the complexity."

I read that, and I think I might disagree? If you're QEMUing with the
monitor and are jumping back and forth and all around between saved
snapshots, probably those snapshots should have their RNG
reinitialized through this mechanism, right? It seems like doing that
would be the proper behavior for `guid=auto`, but not for
`guid={some-fixed-thing}`.

> > So that's very positive. But I would appreciate hearing from some
> > ACPI/Virt/Amazon people about this.
>
> I've only made some random comments; I didn't see a question so I
> couldn't attempt to answer :)

"Am I on the right track," I guess, and your reply has been very
informative. Thanks for your feedback. I'll have a v3 sent out not
before long.

Jason

