Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88008587EA5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 17:10:58 +0200 (CEST)
Received: from localhost ([::1]:58692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oItXr-0003vv-Cx
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 11:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org>)
 id 1oItTe-0008UV-Lx
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:06:34 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:59746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org>)
 id 1oItTc-0003al-QB
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:06:34 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D3BF61313;
 Tue,  2 Aug 2022 15:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2ECC433C1;
 Tue,  2 Aug 2022 15:06:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="eOWAAy47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659452787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OGtDjw+jGhIv3vWIthbB73kE3mAfIKFTpr2M7t5UtDQ=;
 b=eOWAAy476UebdL0OBHYg+JkoUo5k+bTl/8ji8tG6TEJumkmO4iQcVAoMv0ym4+NEikDuTW
 dwiouhTN89AahM6EtApwDuuEUxMydALBT6t6gUgecIHMle52ukbJw8i/LzlL/XEl8tM5A2
 2swVTn+ZZd7PriQ6xFC2ttxytJDyjiI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6f2dcaf9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 2 Aug 2022 15:06:27 +0000 (UTC)
Date: Tue, 2 Aug 2022 17:06:19 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=83=C2=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PULL 9/9] hw/i386: pass RNG seed via setup_data entry
Message-ID: <Yuk9a0v+CNnzAX37@zx2c4.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-10-pbonzini@redhat.com>
 <dae86884-6cfa-a428-374c-60c42900aade@intel.com>
 <Yukk0YOFgkPwcTzG@zx2c4.com>
 <a3ddd211-a569-4348-c3bb-2ff509fd6ccf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a3ddd211-a569-4348-c3bb-2ff509fd6ccf@intel.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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

Hi Xiaoyao,

On Tue, Aug 02, 2022 at 10:53:07PM +0800, Xiaoyao Li wrote:
> yes, with >= 7.1, pcmc->legacy_no_rng_seed = false by default, and RNG 
> seed is used.

This is intended behavior. Being on by default is basically the whole
point of it. Otherwise it's useless.

> 
> > Either way, this shouldn't cause boot failures.
> 
> It does fail booting OVMF with #PF. Below diff can fix the #PF for me.

Huh, interesting. Sounds like maybe there's a bug I need to fix. Can you
send me some repro instructions, and I'll look into it right away.

Jason

