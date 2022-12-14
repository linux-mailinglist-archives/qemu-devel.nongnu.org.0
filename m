Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBD664CF79
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 19:35:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5WaM-0006um-B7; Wed, 14 Dec 2022 13:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1p5WaJ-0006uA-V3; Wed, 14 Dec 2022 13:34:28 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1p5WaI-0000Dg-5p; Wed, 14 Dec 2022 13:34:27 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8F13BB819F4;
 Wed, 14 Dec 2022 18:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B04C433D2;
 Wed, 14 Dec 2022 18:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671042862;
 bh=VhjG3Ux48BEICPkmQ26snXNvJCRxgeJ7HAgxY4hWJGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bO2wNu5aaJcxxFJ8AYx4BKn4XnGzZOYBExoD7UeeFvi5GXcBpp2VcATKrTC+hAjPT
 VUG+dt2dpy14htNCbhlKX5xpzpmSWmuUwh3178/XXRzzeDKgEoe8OU5ou6VyXfthw9
 2yWOLKDaix7SSGD6Nh+TrCqXOwHPobD6bbey2kc1VaL2j4TXDspkg8gRyaQ+qv5WhH
 tiB1Zd43fAPRAM8fE2At5g0XX4HfUqfMPBNMN/3dQ/nG4SaVhOyN4Cd8WahmAYwHzh
 +V9I4ew5X5ZMZmlFrN5Tx6IhhUTkDmadssSENpnPx5biNZzVNDpwbGUfrK1kG8UbMW
 6VBkbj2C12B6g==
Date: Wed, 14 Dec 2022 11:34:19 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Guenter Roeck <linux@roeck-us.net>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-stable@nongnu.org
Subject: Re: [PATCH v4 3/4] hw/nvme: fix missing endian conversions for
 doorbell buffers
Message-ID: <Y5oXKz8VEoJH5Xdj@kbusch-mbp.dhcp.thefacebook.com>
References: <20221212114409.34972-1-its@irrelevant.dk>
 <20221212114409.34972-4-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212114409.34972-4-its@irrelevant.dk>
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

On Mon, Dec 12, 2022 at 12:44:08PM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The eventidx and doorbell value are not handling endianness correctly.
> Fix this.
> 
> Fixes: 3f7fe8de3d49 ("hw/nvme: Implement shadow doorbell buffer support")
> Cc: qemu-stable@nongnu.org
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

