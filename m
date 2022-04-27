Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5B05124C6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 23:49:42 +0200 (CEST)
Received: from localhost ([::1]:34580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njpXY-00083V-TV
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 17:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1njpWU-00076D-54
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 17:48:34 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1njpWS-0005i9-Jo
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 17:48:33 -0400
Received: by mail-pl1-x62c.google.com with SMTP id k4so2697720plk.7
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 14:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FOKnnxCQ0DAVONl3XqngNyqax8O1G6N9sD/nAz2EBgk=;
 b=YldZ6eZs8Bh1Cc9nhbsWjnRSrdtBiXGk6ThGW+qsTvZDTf29cF5z5yoKRLYTgsgAxJ
 zKOqMkX701m48Rln9Is13vDQ/MdGu3755kRYKlO0xPhdab5qRe4FQ8OxlgkfqLje8QCw
 DMrDdxCyWIloSDGgmcePWAL7tm0SgjSopoksTaAWcvx+4a1tklkCrkZrLkgR72ehSRA7
 JrirxEs12amkEc7q1OfOBaLGQYYxE0nNqOse63mOP4YAYKVvSqbvE4ePm7dftAizJi31
 YBhKTZeyYOLjyzOoNo0K9WTLjnui7Q1Bm2Qs0GnWnC5eNbFTyW9H8bIOl4tscETN/5cT
 1q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FOKnnxCQ0DAVONl3XqngNyqax8O1G6N9sD/nAz2EBgk=;
 b=g4cyIa7DNUArwXdd5/Fo9eNWNIaqPj7G3siblwRKL3YRM7IPI2RpWhdqrQaBSWIUzD
 OvbuSRofvJZ9k3ucco3zTrgnf0//xjOgoGBcmlANtISCiBAvwDBnn8SEwjQkJAfikZId
 LgD9SFYSoitszHlV6kRIXPZc0ATSGJLHaSw47SRs+XetQJxNElw4KUCYU/azHHwQOR2H
 6sKdumJ/pP1kNSPpoMiPPDfXjniLv+sjSvutrk8Drx+nB7T2Vz8gPbYIcNSP/tW+L4Bw
 2Kte35Bef36RUNqGv0Gd5EMM6h7ue3FNUHlYyPrLYycWDVQ3BdKJbfeAlaIFWdZuh/St
 PnOQ==
X-Gm-Message-State: AOAM532nry/rCdaPB3AteIrgd/d5HiE2bLnVEsK4YpaXDGvi4nY/aiUH
 ASk+hqGc8gU5PLMjUyFOqN4=
X-Google-Smtp-Source: ABdhPJzL4n4rDtMINCXp7DvCIqF20skSN3jDofPH84CjWyKXe6UK92NmfgfZT6xUP4w4WzKO+TeY0g==
X-Received: by 2002:a17:902:f685:b0:15e:538:3736 with SMTP id
 l5-20020a170902f68500b0015e05383736mr2329719plg.135.1651096109676; 
 Wed, 27 Apr 2022 14:48:29 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 f4-20020aa782c4000000b00505da6251ebsm19657399pfn.154.2022.04.27.14.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 14:48:29 -0700 (PDT)
Date: Thu, 28 Apr 2022 06:48:27 +0900
From: Stafford Horne <shorne@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 2/7] target/openrisc: add shutdown logic
Message-ID: <Ymm6K3DjesAZR0OY@antec>
References: <cover.1492384862.git.shorne@gmail.com>
 <fb69c137317a365dcb549dfef1ecd2fbff48e92c.1492384862.git.shorne@gmail.com>
 <YmmA4li384azQ2i9@zx2c4.com>
 <CAFEAcA9FZZzzZJaCHrepni+5oUELxW1TtZ3gZHxSUdfKdx+ghQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9FZZzzZJaCHrepni+5oUELxW1TtZ3gZHxSUdfKdx+ghQ@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, openrisc@lists.librecores.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 27, 2022 at 07:47:33PM +0100, Peter Maydell wrote:
> On Wed, 27 Apr 2022 at 18:46, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Hey Stafford,
> >
> > On Mon, Apr 17, 2017 at 08:23:51AM +0900, Stafford Horne wrote:
> > > In openrisc simulators we use hooks like 'l.nop 1' to cause the
> > > simulator to exit.  Implement that for qemu too.
> > >
> > > Reported-by: Waldemar Brodkorb <wbx@openadk.org>
> > > Signed-off-by: Stafford Horne <shorne@gmail.com>
> >
> > I'm curious as to why this never got merged. I noticed I'm entirely able
> > to shutdown or to reboot (which is mostly what I care about) Linux from
> > OpenRISC. It just hangs.
> 
> This kind of thing needs to be either:
>  (1) we're modelling real hardware and that real hardware has a
> device or other mechanism guest code can prod to cause a power-off
> or reboot. Then we model that device, and guest code triggers a
> shutdown or reboot exactly as it would on the real hardware.
>  (2) there is an architecturally defined ABI for simulators, debug
> stubs, etc, that includes various operations typically including
> an "exit the simulator" function. (Arm semihosting is an example
> of this.) In that case we can implement that functionality,
> guarded by and controlled by the appropriate command line options.
> (This is generally not as nice as option 1, because the guest code
> has to be compiled to have support for semihosting and also because
> turning it on is usually also giving implicit permission for the
> guest code to read and write arbitrary host files, etc.)
> 
> Either way, undocumented random hacks aren't a good idea, which
> is why this wasn't merged.

Yes, this is what was brought up before.  At that time semihosting was mentioned
and I tried to understand what it was but didn't really understand it as a general
concept.  Is this something arm specific?

Since the qemu or1k-sim defines our "simulator", I suspect I could add a
definition of our simulator ABI to the OpenRISC architecture specification.  The
simulation uses of l.nop N as ABI hooks is a de-facto standard for OpenRISC.
From the way you describe this now I take it if we document this as a
architecture simulation ABI the patch would be accepted.

-Stafford

