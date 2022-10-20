Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE63660664D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:54:20 +0200 (CEST)
Received: from localhost ([::1]:51058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYnu-0004fy-JZ
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:54:00 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYno-0004X0-UW
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1olYYY-0000eT-R4; Thu, 20 Oct 2022 12:38:12 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:34230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1olYYV-00026d-8d; Thu, 20 Oct 2022 12:38:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6EAEFB82764;
 Thu, 20 Oct 2022 16:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1429C433D6;
 Thu, 20 Oct 2022 16:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666283872;
 bh=dH0VgKyVt9aRZlIN7RtCjrBq+tI05iokslIhXJuSFIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vNHwnfcasnYCoe8+XVyz6cYHSuw27aZaBS9G6nkJzhRfruK+bjxl4gnAdwOlOMvi6
 Klj99QUuBY1AuKvLLdv0vrXaBVEalndqzVvAPsGJVpdyuUJ8Iszb7V6XoZ8FCYnRGh
 iuElYbjwRQ2FExApKSJVbDbbKUFHsrBVlkonaiLcchotRLFNtEecguYCMXhc6/em6s
 mWOXcXd9uC5sBTpRGFS6n6Dh0+x1TnSj/VCdF+N28Gn+qRxqYgA1Qkc50iWg0nV94v
 GAjmKFXAXORkBNPpkd6jya2Yh3gbYTqJYvy2Wv+H2zbugAHjhj4kBfPIhMAVXONQoa
 KlbDVXmkcW7aQ==
Date: Thu, 20 Oct 2022 10:37:49 -0600
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH] hw/nvme: reenable cqe batching
Message-ID: <Y1F5XUSpgWVsK4pF@kbusch-mbp.dhcp.thefacebook.com>
References: <20221020113538.36526-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020113538.36526-1-its@irrelevant.dk>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=kbusch@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 20, 2022 at 01:35:38PM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Commit 2e53b0b45024 ("hw/nvme: Use ioeventfd to handle doorbell
> updates") had the unintended effect of disabling batching of CQEs.
> 
> This patch changes the sq/cq timers to bottom halfs and instead of
> calling nvme_post_cqes() immediately (causing an interrupt per cqe), we
> defer the call.

Nice change, looks good! Timers never did seem to be the best fit for
this.

Reviewed-by: Keith Busch <kbusch@kernel.org>

