Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE3B5987A2
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:42:08 +0200 (CEST)
Received: from localhost ([::1]:47614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOheo-0006ou-6H
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=cnMf=YW=zx2c4.com=Jason@kernel.org>)
 id 1oOhcP-0002qR-L6
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:39:37 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:46206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=cnMf=YW=zx2c4.com=Jason@kernel.org>)
 id 1oOhcN-0004Va-PA
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:39:37 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9DF6B821E5;
 Thu, 18 Aug 2022 15:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A10CC433C1;
 Thu, 18 Aug 2022 15:39:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="a2TM+cdz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1660837169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AxVollThZflidyMWlG1yGCIJSrXTMk2GpfqSLmwBL2w=;
 b=a2TM+cdz3TTHX4lkfNW1P2RYi1PnEkfL4mD+V02vjr8Chg8UMVzD0EnN3mKq4cRuTCu1l4
 QhRAHstSb06pitOPBXiNIL/OGq/FpBhozDSX6wgKyWrz/r9C/QPJlORuRGH48QLuoFlkRJ
 LrINg2+43NfedTrd1bpUibudqvgrLus=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6f83b7a5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 18 Aug 2022 15:39:29 +0000 (UTC)
Date: Thu, 18 Aug 2022 17:39:26 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Sergio Lopez <slp@redhat.com>
Subject: Re: [PULL 05/10] x86: disable rng seeding via setup_data
Message-ID: <Yv5dLl8UOaE+VpfD@zx2c4.com>
References: <20220817161342.240674-1-mst@redhat.com>
 <20220817161342.240674-6-mst@redhat.com>
 <52a9fe51-335c-c3a1-a4ed-53d5f46b4fd8@redhat.com>
 <20220818115614.olhzz6nai5vware5@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220818115614.olhzz6nai5vware5@sirius.home.kraxel.org>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=cnMf=YW=zx2c4.com=Jason@kernel.org;
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

Hi Gerd, Michael, Paolo,

On Thu, Aug 18, 2022 at 01:56:14PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > > index 3a35193ff7..2e5dae9a89 100644
> > > --- a/hw/i386/pc_q35.c
> > > +++ b/hw/i386/pc_q35.c
> > > @@ -376,6 +376,7 @@ static void pc_q35_7_1_machine_options(MachineClass *m)
> > >       pc_q35_machine_options(m);
> > >       m->alias = "q35";
> > >       pcmc->default_cpu_version = 1;
> > > +    pcmc->legacy_no_rng_seed = true;
> > >   }
> > >   DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
> > > @@ -386,7 +387,6 @@ static void pc_q35_7_0_machine_options(MachineClass *m)
> > >       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> > >       pc_q35_7_1_machine_options(m);
> > >       m->alias = NULL;
> > > -    pcmc->legacy_no_rng_seed = true;
> > >       pcmc->enforce_amd_1tb_hole = false;
> > >       compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
> > >       compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
> > 
> > Why not just revert the whole patch?
> 
> Tried that first.  Plain revert not working, there are conflicts.
> So just disabling the code looked simpler and safer to me.

Yea, this is fine with me. This commit will be easy enough to revert in
7.2 when things are hopefully working properly in all circumstances.

Jason

