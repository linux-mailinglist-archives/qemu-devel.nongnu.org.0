Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312CC672FEC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 05:04:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIM9a-0008AU-Dh; Wed, 18 Jan 2023 23:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pIM9U-00089b-8f; Wed, 18 Jan 2023 23:03:48 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pIM9S-00077K-OY; Wed, 18 Jan 2023 23:03:48 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3A053B81EE2;
 Thu, 19 Jan 2023 04:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A25AC433D2;
 Thu, 19 Jan 2023 04:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674101022;
 bh=KxsuZGddcB452Yes1i3k8mwKgzNHRz9ATAsQtGq3Orc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BN+y6eEoyIUSGR4brJQkT73rJiO/kbi6cHH88z3gEDuBWP73XXW4M6XsW7VWUN/pv
 q31dki1nfZvM8GtPZyLD2ozjhnNTHNuDHkVgEVUudiT7DtMkWWCmgF07+DntjmqGTM
 TzKcAeX8SWLtEeZyxmwLeNj66A4VbPi82llUnbPQ+LDYn7xDCfsiaJWxDMML7Em1gP
 BAp3ICixmRLYq4smI/7DxFAa6zS3vfbKmkALZ8d635q84rxmlcR+1rdZczL7fyd6uc
 JN5NsKveLouofU5j0E7sqovOsiq4gvPMp7tOZeyJOzHyTAHdWHNxhzX7KpROR/0YxA
 65U/a0qHdj2vA==
Date: Wed, 18 Jan 2023 21:03:39 -0700
From: Keith Busch <kbusch@kernel.org>
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Klaus Jensen <its@irrelevant.dk>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8jBG/j8w2R43kYd@kbusch-mbp>
References: <Y8Yq5faCjAKzMa9O@kbusch-mbp>
 <20230117160933.GB3091262@roeck-us.net>
 <CAFEAcA9pS7P=SvKsOtRHPtkrNAD8LF2ZpFJ870G3B-rhWYap4g@mail.gmail.com>
 <20230117192115.GA2958104@roeck-us.net>
 <CAFEAcA_T8QqSg4SzszP+wR3pR1P1WTZg4f7mHHBGRw4UrTw+DQ@mail.gmail.com>
 <Y8gfQXPYdHKd1v4I@kbusch-mbp> <Y8h7aOuVfCb+RsAP@kbusch-mbp>
 <CAKmqyKMHs_-RgagMDYE7vn3MHEP2caBc+RERjaK0DNJw4hFYiA@mail.gmail.com>
 <Y8iulgdgOdVCjuKE@kbusch-mbp>
 <CAKmqyKMveR=RD6fgnzY0SV39tofD+Ws_AbrSZXE_o4m=M6GZHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmqyKMveR=RD6fgnzY0SV39tofD+Ws_AbrSZXE_o4m=M6GZHg@mail.gmail.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=kbusch@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 19, 2023 at 01:10:57PM +1000, Alistair Francis wrote:
> On Thu, Jan 19, 2023 at 12:44 PM Keith Busch <kbusch@kernel.org> wrote:
> >
> > Further up, it says the "interrupt gateway" is responsible for
> > forwarding new interrupt requests while the level remains asserted, but
> > it doesn't look like anything is handling that, which essentially turns
> > this into an edge interrupt. Am I missing something, or is this really
> > not being handled?
> 
> Yeah, that wouldn't be handled. In QEMU the PLIC relies on QEMUs
> internal GPIO lines to trigger an interrupt. So with the current setup
> we only support edge triggered interrupts.

Thanks for confirming!

Klaus,
I think we can justify introducing a work-around in the emulated device
now. My previous proposal with pci_irq_pulse() is no good since it does
assert+deassert, but it needs to be the other way around, so please
don't considert that one.

Also, we ought to revisit the intms/intmc usage in the linux driver for
threaded interrupts.

