Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 225023F5596
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 03:49:28 +0200 (CEST)
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mILZ7-0006AQ-NU
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 21:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1mILXj-0005M6-Np; Mon, 23 Aug 2021 21:47:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:33616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1mILXg-00032U-M7; Mon, 23 Aug 2021 21:47:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DFD561042;
 Tue, 24 Aug 2021 01:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629769673;
 bh=SC94jOA6r5jKeRjTmTIVT7ssy7GNOuu1Jxz05Np3/zc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XoayFTxPs1lnsVcMe8TXchbqS1OcpXLJULya2rpqdmOc+ueXkhA5J8GggEBxI9JmH
 LEsU8Zi0Qcq7XjMEX0bLvRS2Un/4+MzGUtNjBZ/xH4CBlEmA+7smxMZISZiIqGpsUw
 EFPve8fDWEDmxORKELNW7Yi7YdQPFHbQVyRgD+4lwIHDuPfpylpHM+JwFqe3j+EJNI
 /g45KWulBQgGoljttyeFJpRYtfGC7zDPgS+XX2nurAdt7Hp+AXG6J/5s2XWP0Mau+/
 PwI8HPinmhOeHXBtx+slHTlqtGnURrpyWizFNxXYaykUPPSxmqr9LzDDfZZMWsgm/W
 0zJ+mHGltbb4g==
Date: Mon, 23 Aug 2021 19:47:48 -0600
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/nvme: fix validation of ASQ and ACQ
Message-ID: <20210824014748.GA64408@C02WT3WMHTD6>
References: <20210823122018.401370-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823122018.401370-1-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 02:20:18PM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Address 0x0 is a valid address. Fix the admin submission and completion
> queue address validation to not error out on this.

Indeed, there are environments that can use that address. It's a host error if
the controller was enabled with invalid queue addresses anyway. The controller
only needs to verify the lower bits are clear, which we do later.

Reviewed-by: Keith Busch <kbusch@kernel.org>

