Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB45671283
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 05:18:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHztG-0006Ys-88; Tue, 17 Jan 2023 23:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pHztE-0006YN-P3; Tue, 17 Jan 2023 23:17:32 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1pHztD-0003Gq-3k; Tue, 17 Jan 2023 23:17:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0B9076160E;
 Wed, 18 Jan 2023 04:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC96C433EF;
 Wed, 18 Jan 2023 04:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674015448;
 bh=mT2FPPtzp7PINgPtB7zdvXfPGfCFTcpMzIEVwBGXBq4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KrY2mfxs0YdjoAI82ox0vEsIMbXdNsF15A7M1xkOFwvZMOo+O6kl0xlaMPWnVzAZI
 gvYhcuHvlC2nos1AtuDkGr7pLHi6eHdoSckkJKDTr3l0sOKcyy8fE3FaGGAI+DSxDn
 d+u7oB8SessmF6J0K8FIcnsxRq0tp1dtdKs6+b0EKOToNb7Iim+RGvs5LO4KAn5yLo
 sWL/oYnhokJHVHkx22nDuPuvrTCONZ0kPLKpApxUS465d6kofxxfek4Z7X8AJDocWa
 BPTPYolb70V2nluDktP5WEFMJhbAgTaaTdNYJb1E+CQYLQJwiSTDpghpXD0im88GbB
 tbnXwXOjjd14A==
Date: Tue, 17 Jan 2023 21:17:25 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8dy1Qv3Z/9LDjUs@kbusch-mbp>
References: <Y8AG21o/9/3eUMIg@cormorant.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8AG21o/9/3eUMIg@cormorant.local>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=kbusch@kernel.org; helo=dfw.source.kernel.org
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

On Thu, Jan 12, 2023 at 02:10:51PM +0100, Klaus Jensen wrote:
> Hi all (linux-nvme, qemu-devel, maintainers),
> 
> On QEMU riscv64, which does not use MSI/MSI-X and thus relies on
> pin-based interrupts, I'm seeing occasional completion timeouts, i.e.
> 
>   nvme nvme0: I/O 333 QID 1 timeout, completion polled

I finally got a riscv setup recreating this, and I am not sure how
you're getting a "completion polled" here. I find that the polling from
here progresses the request state to IDLE, so the timeout handler moves
on to aborting because it's expecting COMPLETED. The driver should not
be doing that, so I'll fix that up while also investigating why the
interrupt isn't retriggering as expected.

