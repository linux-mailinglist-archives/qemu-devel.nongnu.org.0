Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734144C18DA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 17:38:56 +0100 (CET)
Received: from localhost ([::1]:54744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMufH-0003Ns-3z
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 11:38:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org>)
 id 1nMudF-0001e6-W4
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:36:50 -0500
Received: from [2604:1380:4641:c500::1] (port=53878 helo=dfw.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org>)
 id 1nMudD-0000x0-C1
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:36:49 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 987866006F
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 16:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF603C340EB
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 16:36:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="edijnlfW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645634198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bHA9wsYJ+CM1DPnmNfQ6U6t4ARYsrAUZwd944SZ1sxQ=;
 b=edijnlfWBr0NP8LwF9hwPw60rUhaJGCvwFzj3ZlG2AlKLTGyB8ojd1cW10gh+AkFaKRCFP
 EbUutuMeksjmo5CLVMeXBSboQR3N10auxwe+KaRFWYOZR5dIPtxgW8FC4iNHxOQMLGGSUZ
 grvJaqrDSQpwus7ykusVdu37UvXeaLI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6018f941
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 23 Feb 2022 16:36:38 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-2d625082ae2so217435657b3.1
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 08:36:37 -0800 (PST)
X-Gm-Message-State: AOAM532E2bLx68CO+boX9VQgzhaArF1JB0DXONj1zTxniFQcxZd/axHB
 CI0mkMd0VmR9ZR/ZDeS+2cmuiUoQuEPQzebHOyQ=
X-Google-Smtp-Source: ABdhPJxStncU0YhKj17fIfB92poX/i/hhH2go/+XupHLqAIG9vQtznWxOa4DHx+xY4+pyQBawqCM+CsOCCrLmtJDEw8=
X-Received: by 2002:a81:184c:0:b0:2d7:607f:4b00 with SMTP id
 73-20020a81184c000000b002d7607f4b00mr423650ywy.499.1645634196037; Wed, 23 Feb
 2022 08:36:36 -0800 (PST)
MIME-Version: 1.0
References: <20220223131231.403386-1-Jason@zx2c4.com>
 <20220223131231.403386-3-Jason@zx2c4.com>
In-Reply-To: <20220223131231.403386-3-Jason@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 23 Feb 2022 17:36:25 +0100
X-Gmail-Original-Message-ID: <CAHmME9oWUJr3fYKFOy=aRdd0uE8H8ke9o+KXde0zAnAwnWUPMA@mail.gmail.com>
Message-ID: <CAHmME9oWUJr3fYKFOy=aRdd0uE8H8ke9o+KXde0zAnAwnWUPMA@mail.gmail.com>
Subject: Re: [PATCH RFC v1 2/2] drivers/virt: add vmgenid driver for
 reinitializing RNG
To: "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, 
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4641:c500::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: linux-s390@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Theodore Ts'o <tytso@mit.edu>, ehabkost@redhat.com,
 KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ben@skyportsystems.com,
 "Weiss, Radu" <raduweis@amazon.com>, lersek@redhat.com, adrian@parity.io,
 "Catangiu, Adrian Costin" <acatan@amazon.com>, graf@amazon.com,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Colm MacCarthaigh <colmmacc@amazon.com>, "Singh, Balbir" <sblbir@amazon.com>,
 "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding the Hyper-V people to this:

On Wed, Feb 23, 2022 at 2:13 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> VM Generation ID is a feature from Microsoft, described at
> <https://go.microsoft.com/fwlink/?LinkId=260709>, and supported by
> Hyper-V and QEMU. Its usage is described in Microsoft's RNG whitepaper,
> <https://aka.ms/win10rng>, as:
>
>     If the OS is running in a VM, there is a problem that most
>     hypervisors can snapshot the state of the machine and later rewind
>     the VM state to the saved state. This results in the machine running
>     a second time with the exact same RNG state, which leads to serious
>     security problems.  To reduce the window of vulnerability, Windows
>     10 on a Hyper-V VM will detect when the VM state is reset, retrieve
>     a unique (not random) value from the hypervisor, and reseed the root
>     RNG with that unique value.  This does not eliminate the
>     vulnerability, but it greatly reduces the time during which the RNG
>     system will produce the same outputs as it did during a previous
>     instantiation of the same VM state.
>
> Linux has the same issue, and given that vmgenid is supported already by
> multiple hypervisors, we can implement more or less the same solution.
> So this commit wires up the vmgenid ACPI notification to the RNG's newly
> added add_vmfork_randomness() function.
>
> This driver builds on prior work from Adrian Catangiu at Amazon, and it
> is my hope that that team can resume maintenance of this driver.

If any of you have some experience with the Hyper-V side of this
protocol, could you take a look at this and see if it matches the way
this is supposed to work? It appears to work fine with QEMU's
behavior, at least, but I know Hyper-V has a lot of additional
complexities.

Thanks,
Jason

