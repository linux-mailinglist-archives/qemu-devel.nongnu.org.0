Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C895127EE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 02:07:33 +0200 (CEST)
Received: from localhost ([::1]:48512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njrgy-0007Ry-6c
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 20:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=yuO2=VG=zx2c4.com=Jason@kernel.org>)
 id 1njreD-0006UR-VR
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 20:04:42 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:53566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=yuO2=VG=zx2c4.com=Jason@kernel.org>)
 id 1njreA-0007hV-KO
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 20:04:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 10F82B82B35;
 Thu, 28 Apr 2022 00:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503BFC385A7;
 Thu, 28 Apr 2022 00:04:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="mpnRn+5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651104271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kd7wAoTuj7nXl1XjSRaT3ZKgb9iGFejdoNr2nUKHfiY=;
 b=mpnRn+5sOmMTx98ZwUVbP0fHbXRjRdsDPsrijeWrk6VSt8PKNYVsimorXdBCJ9RShH6B8Y
 UFjyLF3UlJyeky5Oo3Sm9UMITa06jS2UKqZauCEZKTqCBs3ZWtZYqugX45hTFxhgJo2IH0
 j++GaRCOoBM6TZAqeMv9m5QVI+OaQ3k=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 40756fb9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 28 Apr 2022 00:04:31 +0000 (UTC)
Date: Thu, 28 Apr 2022 02:04:29 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 2/7] target/openrisc: add shutdown logic
Message-ID: <YmnaDUpVI5ihgvg6@zx2c4.com>
References: <cover.1492384862.git.shorne@gmail.com>
 <fb69c137317a365dcb549dfef1ecd2fbff48e92c.1492384862.git.shorne@gmail.com>
 <YmmA4li384azQ2i9@zx2c4.com>
 <CAFEAcA9FZZzzZJaCHrepni+5oUELxW1TtZ3gZHxSUdfKdx+ghQ@mail.gmail.com>
 <Ymm6K3DjesAZR0OY@antec>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Ymm6K3DjesAZR0OY@antec>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=yuO2=VG=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
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
Cc: Peter Maydell <peter.maydell@linaro.org>, openrisc@lists.librecores.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stafford,

On Thu, Apr 28, 2022 at 06:48:27AM +0900, Stafford Horne wrote:
> On Wed, Apr 27, 2022 at 07:47:33PM +0100, Peter Maydell wrote:
> > On Wed, 27 Apr 2022 at 18:46, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >
> > > Hey Stafford,
> > >
> > > On Mon, Apr 17, 2017 at 08:23:51AM +0900, Stafford Horne wrote:
> > > > In openrisc simulators we use hooks like 'l.nop 1' to cause the
> > > > simulator to exit.  Implement that for qemu too.
> > > >
> > > > Reported-by: Waldemar Brodkorb <wbx@openadk.org>
> > > > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > >
> > > I'm curious as to why this never got merged. I noticed I'm entirely able
> > > to shutdown or to reboot (which is mostly what I care about) Linux from
> > > OpenRISC. It just hangs.
> > 
> > This kind of thing needs to be either:
> >  (1) we're modelling real hardware and that real hardware has a
> > device or other mechanism guest code can prod to cause a power-off
> > or reboot. Then we model that device, and guest code triggers a
> > shutdown or reboot exactly as it would on the real hardware.
> >  (2) there is an architecturally defined ABI for simulators, debug
> > stubs, etc, that includes various operations typically including
> > an "exit the simulator" function. (Arm semihosting is an example
> > of this.) In that case we can implement that functionality,
> > guarded by and controlled by the appropriate command line options.
> > (This is generally not as nice as option 1, because the guest code
> > has to be compiled to have support for semihosting and also because
> > turning it on is usually also giving implicit permission for the
> > guest code to read and write arbitrary host files, etc.)
> > 
> > Either way, undocumented random hacks aren't a good idea, which
> > is why this wasn't merged.
> 
> Yes, this is what was brought up before.  At that time semihosting was mentioned
> and I tried to understand what it was but didn't really understand it as a general
> concept.  Is this something arm specific?
> 
> Since the qemu or1k-sim defines our "simulator", I suspect I could add a
> definition of our simulator ABI to the OpenRISC architecture specification.  The
> simulation uses of l.nop N as ABI hooks is a de-facto standard for OpenRISC.
> From the way you describe this now I take it if we document this as a
> architecture simulation ABI the patch would be accepted.

If that's what it takes, then that'd make sense.

By the way, would this also help the reboot case? That's
`reboot(RB_AUTOBOOT);`, which does:

machine_restart() ->
  do_kernel_restart() ->
    atomic_notifier_chain_register(&restart_handler_list, nb) ->
      ???

As far as I can tell, nothing is wired into the reboot case for
OpenRISC. Is this something that could be fixed in the kernel without
having to patch QEMU? If so, then I could effectively get shutdown for
my CI with the -no-reboot option, which is what I'm already doing for a
few platforms.

Jason

