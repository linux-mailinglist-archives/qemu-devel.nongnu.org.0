Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3062DE8B0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 19:06:15 +0100 (CET)
Received: from localhost ([::1]:38452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqK8s-0006gn-3M
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 13:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kqK6W-0005AY-M8; Fri, 18 Dec 2020 13:03:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:46586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kqK6U-0002OK-4h; Fri, 18 Dec 2020 13:03:48 -0500
Date: Sat, 19 Dec 2020 03:03:41 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608314624;
 bh=Wqq1EiNEs/MYMYAkJFxphHudYvIzkHrOuAYR+JtmLzQ=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yv5t2lCxErgB8a4sW82Jm48E76twm+siuX0gyAsxrQMP5AY0mWwLHqdViGsEa3fw+
 73Qb5F5lrWcvdT/SuWep+DG8xzshtDapr/vJj+iEUlaxWZRGUN5Cu8sboTGm2tLXSb
 LHh8kpHAIfhLY0EJr6hyjKtg4dPSr+4stSAj3VSspyWMcWQXApT/ONJ5JcjJgnLZZt
 d2lYQFa4vLgmJ5ydioSLZZ47/s9OpaV/j3tIgmToPwYuELR5uEbjEQCzq4ElZTy8ja
 ks/5m6aKqg/ciTFcHVx0DaRReGIUQE+rQvgI06YXdHoKDZh9V6sNNP3icJZ4zHGWNa
 dN3vof7d9tIdw==
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 0/3] hw/block/nvme: cmb enhancements and bump to v1.4
Message-ID: <20201218180341.GB8722@redsun51.ssa.fujisawa.hgst.com>
References: <20201218092308.894367-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218092308.894367-1-its@irrelevant.dk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 18, 2020 at 10:23:04AM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> This adds CMB logic from v1.4. To my knowledge, this is the last piece
> missing for v1.4 compliance, so bump the controller spec version. Please
> retort if I am jumping the gun.
> 
> Since the slow-moving (sorry, super poor attempt of humor) Linux kernel
> nvme driver does not support v1.4 CMB, this series adds a 'x-legacy-cmb'
> nvme device parameter that reverts the CMB configuration behavior to
> v1.3, thus allowing the kernel to continue using the CMB for submission
> queues.
> 
> The question here is if we should rather skip that parameter, only
> support v1.4 behavior and point the finger at the kernel nvme gang. I'm
> leaning towards this.
> 
> Keith, what is your opinion on this?

The driver may know if it's running in a VM, but it doesn't necessarily
know if its device is a passthrough vs. emulated. In the passthrough
case, we can't use the CMB at all for <= 1.3 versions since the GPA vs
HPA are not being considered. IMO, the kernel driver does need to be
updated to suppress CMB usage for pre-1.4, and it should also add the
CMBMSC capabilities for 1.4+.

Going forward with the qemu controller, I would remove legacy support
for CMB entirely since every host should be able to interop with it
without CMB support.

