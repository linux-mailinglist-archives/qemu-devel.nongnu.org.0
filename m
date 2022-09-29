Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F55F0148
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 01:20:38 +0200 (CEST)
Received: from localhost ([::1]:47876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe2pY-0002zm-LB
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 19:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=kpRN=2A=zx2c4.com=Jason@kernel.org>)
 id 1oe2nz-0001BZ-BN; Thu, 29 Sep 2022 19:18:59 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:40834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=kpRN=2A=zx2c4.com=Jason@kernel.org>)
 id 1oe2nx-0007vA-5y; Thu, 29 Sep 2022 19:18:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D465B8267F;
 Thu, 29 Sep 2022 23:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB8FC433C1;
 Thu, 29 Sep 2022 23:18:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ZhXtdz51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664493530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hF9rYpsMRu8iOlbcHGs9P0pihfhi1JnBQIDJPmBi7NA=;
 b=ZhXtdz51ay/cKdp/0jcr2iIwNciYY0Ki1+5GOwUYR9kbtuLPOubOjkchkOBi8R02JPngtE
 5ot4xYYPyiGnxc5SGzumOo4HgOK1FHGeXN17ItVlC5FHmUlKBBS2kEzLvV4QD1a+CwsJHg
 GERqKOMplnc9UrVyJZukU1UwRSJA5HY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2906c4f9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 29 Sep 2022 23:18:50 +0000 (UTC)
Date: Fri, 30 Sep 2022 01:18:48 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] arm: re-randomize rng-seed on reboot
Message-ID: <YzYn2EJPpfF1HbV4@zx2c4.com>
References: <20220927160742.1773167-1-Jason@zx2c4.com>
 <YzYGsjlGBwh4Hi78@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YzYGsjlGBwh4Hi78@zx2c4.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=kpRN=2A=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 29, 2022 at 10:57:22PM +0200, Jason A. Donenfeld via wrote:
> Hi Peter,
> 
> On Tue, Sep 27, 2022 at 06:07:42PM +0200, Jason A. Donenfeld wrote:
> > When the system reboots, the rng-seed that the FDT has should be
> > re-randomized, so that the new boot gets a new seed. Since the FDT is in
> > the ROM region at this point, we add a hook right after the ROM has been
> > added, so that we have a pointer to that copy of the FDT. When the
> > reboot happens, we then look for RNG seeds and replace their contents
> > with new random data.
> > 
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> 
> Just FYI, I'm waiting for your feedback on this approach, first, before
> I add a similar thing for other architectures (at which point perhaps
> rerandomize_fdt_seeds will be moved into device_tree.c or something).

Actually, I think I'll generalize it now, and then we can evaluate it
all together. It actually looks a bit nicer split into patches. So I'll
have a replacement series for you shortly.

Jason

