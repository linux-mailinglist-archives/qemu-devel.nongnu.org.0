Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29D45132CC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:48:19 +0200 (CEST)
Received: from localhost ([::1]:44538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2d8-0004Qd-WF
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=yuO2=VG=zx2c4.com=Jason@kernel.org>)
 id 1nk28q-0001un-OX
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 07:17:04 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:59468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=yuO2=VG=zx2c4.com=Jason@kernel.org>)
 id 1nk28o-0007xG-Mi
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 07:17:00 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B17BBB82C97;
 Thu, 28 Apr 2022 11:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5483C385A0;
 Thu, 28 Apr 2022 11:16:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="AFISBV20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651144613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wZt/PgkKwXTXAqwOl4KKM7MUuS9UOAFNQeMWZUUJCdQ=;
 b=AFISBV20YzQvFEl0QeYDno5OEzzztEe2UkmQeVyeWgL5Psdxmr0+MAFU7wNZqwRw2KpDRf
 LEbfw5D4imYpzT6uC2kjhUM1CU2cyn+sofNRnLXfRT0HV2rZcVSkGcMEZSoVRGHyKEVsvw
 NoQa2A0aDJfsYtRQfIgEE2ssrkWnJ9I=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4d9a994e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 28 Apr 2022 11:16:52 +0000 (UTC)
Date: Thu, 28 Apr 2022 13:16:51 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 2/7] target/openrisc: add shutdown logic
Message-ID: <Ymp3owBiSQIimgSy@zx2c4.com>
References: <cover.1492384862.git.shorne@gmail.com>
 <fb69c137317a365dcb549dfef1ecd2fbff48e92c.1492384862.git.shorne@gmail.com>
 <YmmA4li384azQ2i9@zx2c4.com>
 <CAFEAcA9FZZzzZJaCHrepni+5oUELxW1TtZ3gZHxSUdfKdx+ghQ@mail.gmail.com>
 <Ymm6K3DjesAZR0OY@antec> <YmnaDUpVI5ihgvg6@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YmnaDUpVI5ihgvg6@zx2c4.com>
Received-SPF: pass client-ip=145.40.68.75;
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

Hey again,

On Thu, Apr 28, 2022 at 02:04:29AM +0200, Jason A. Donenfeld wrote:
> By the way, would this also help the reboot case? That's
> `reboot(RB_AUTOBOOT);`, which does:
> 
> machine_restart() ->
>   do_kernel_restart() ->
>     atomic_notifier_chain_register(&restart_handler_list, nb) ->
>       ???
> 
> As far as I can tell, nothing is wired into the reboot case for
> OpenRISC. Is this something that could be fixed in the kernel without
> having to patch QEMU? If so, then I could effectively get shutdown for
> my CI with the -no-reboot option, which is what I'm already doing for a
> few platforms.

I added 13 for this: https://lists.librecores.org/pipermail/openrisc/2022-April/003884.html

When you go add these nops to the specification, please remember to add
one for reboot too. Then, once that kernel code is merged and the
specification published, it'll be sensible to add shutdown and reboot
support to QEMU, per Peter's description.

Jason

