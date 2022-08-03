Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0CC58944B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 00:10:42 +0200 (CEST)
Received: from localhost ([::1]:56754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJMZd-00070j-HO
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 18:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hVua=YH=zx2c4.com=Jason@kernel.org>)
 id 1oJMXL-0003pM-PZ
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 18:08:21 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:51690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hVua=YH=zx2c4.com=Jason@kernel.org>)
 id 1oJMXJ-0006sT-L6
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 18:08:19 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1D204B823B7;
 Wed,  3 Aug 2022 22:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4540C433D6;
 Wed,  3 Aug 2022 22:08:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="lnJOos9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659564490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dfl0PfVGfULnD2y0stwSh4NZHHnI+KP8Pcdvv0c+pxs=;
 b=lnJOos9BU77KvpZS6HZlzcoBne4TM2Ye/tTtcn9ThuDotGJA1NSPxKLhCkNmib4qs18ECO
 8StWYVeTESTkd1EDlZOZyoLIgdkMsDBbnEZVU16A3HsQHaNR1sASwxTYy3Dr8OcVekQDV8
 TWzdYUuZlXZJCfDfifEYricNwhlKJwM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 543413a2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 3 Aug 2022 22:08:10 +0000 (UTC)
Date: Thu, 4 Aug 2022 00:08:07 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=83=C2=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 9/9] hw/i386: pass RNG seed via setup_data entry
Message-ID: <Yurxx0OZ+mfWdZ5M@zx2c4.com>
References: <dae86884-6cfa-a428-374c-60c42900aade@intel.com>
 <Yukk0YOFgkPwcTzG@zx2c4.com>
 <a3ddd211-a569-4348-c3bb-2ff509fd6ccf@intel.com>
 <Yuk9a0v+CNnzAX37@zx2c4.com>
 <CAHmME9qDNmX7TYio3TxgP_xFL1LGUoKrT6w=OG_1c688ZSdvKg@mail.gmail.com>
 <YupTaZlkyy1/9FUC@redhat.com> <Yup0FIOLLo0thP8u@zx2c4.com>
 <Yup5TG2kZs+TifEJ@zx2c4.com> <YuqraGAFyCibc1h6@zx2c4.com>
 <20220803180115-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220803180115-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=hVua=YH=zx2c4.com=Jason@kernel.org;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On Wed, Aug 03, 2022 at 06:03:20PM -0400, Michael S. Tsirkin wrote:
> On Wed, Aug 03, 2022 at 07:07:52PM +0200, Jason A. Donenfeld wrote:
> > On Wed, Aug 03, 2022 at 03:34:04PM +0200, Jason A. Donenfeld wrote:
> > > On Wed, Aug 03, 2022 at 03:11:48PM +0200, Jason A. Donenfeld wrote:
> > > > Thanks for the info. Very helpful. Looking into it now.
> > > 
> > > So interestingly, this is not a new issue. If you pass any type of setup
> > > data, OVMF appears to be doing something unusual and passing 0xffffffff
> > > for all the entries, rather than the actual data. The reason this isn't
> > > new is: try passing `-dtb any/dtb/at/all/from/anywhere` and you get the
> > > same page fault, on all QEMU versions. The thing that passes the DTB is
> > > the thing that passes the RNG seed. Same mechanism, same bug.
> > > 
> > > I'm looking into it...
> > 
> > Fixed with: https://lore.kernel.org/all/20220803170235.1312978-1-Jason@zx2c4.com/
> > 
> > Feel free to join into the discussion there. I CC'd you.
> > 
> > Jason
> 
> Hmm I don't think this patch will make it in 7.1 given the
> timeframe. I suspect we should revert the patch for now.
> 
> Which is where you maybe begin to see why we generally
> prefer doing it with features - one can then work around
> bugs by turning the feature on and off.

The bug actually precedes this patch. Just boot with -dtb on any qemu
version and you'll trigger it. We're still at rc0; there should be time
enough for a bug fix. Please do chime in on that thread and maybe we can
come up with something reasonable fast enough.

Jason

