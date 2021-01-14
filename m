Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15A12F6F22
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 00:51:08 +0100 (CET)
Received: from localhost ([::1]:40496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0COR-0002dE-Ue
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 18:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l0CNH-00026H-6Q; Thu, 14 Jan 2021 18:49:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:36766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l0CNF-0001T5-Jj; Thu, 14 Jan 2021 18:49:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4ADA123A3B;
 Thu, 14 Jan 2021 23:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610668191;
 bh=T6yh3k+5oLPB7uOKNOpYTvte15PZ4CuqnOm9yxpGc/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jyE/SSIvUxVkIByA7EBY8efQP/9lkfR3sZfhvh1i8k6/22uRtAgAusgD9WCNoXMB5
 Ma4Bk8h1wYeDK80ada3vBU+zhBmQBx68UsOK9G7WX5n6ekY2xWZWHBebg2bXhlnoHF
 E1Xrv2ho79TzEGADcojvSSGnqDvbTK1GD6XovcPjhWoUzhe/h5Z+1fpALDAlakodAg
 x1nho7EHhg7B4Va26nyW5NmMnjGMN619eQ7876FQQNy4QQEJ/WokCiUpW8mIqWV7Lx
 QjpFC7fb8sXtL2ktniu0xvvbIf1IcvhEvw2udqvj+8KTN2Br4Ks4TA/kwVG0OX8xVz
 W/+pR4Q7p2btQ==
Date: Thu, 14 Jan 2021 15:49:49 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 1/6] hw/block/nvme: fix shutdown/reset logic
Message-ID: <20210114234949.GG1511902@dhcp-10-100-145-180.wdc.com>
References: <20210111123223.76248-1-its@irrelevant.dk>
 <20210111123223.76248-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111123223.76248-2-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 11, 2021 at 01:32:18PM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> A shutdown is only about flushing stuff. It is the host that should
> delete any queues, so do not perform a reset here.
> 
> Also, on shutdown, make sure that the PMR is flushed if in use.
> 
> Fixes: 368f4e752cf9 ("hw/block/nvme: Process controller reset and shutdown differently")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Yes, and exiting a controller shutdown state requires a controller
reset, so a functioning host shouldn't require the controller behave the
way it's currently done.

Reviewed-by: Keith Busch <kbusch@kernel.org>

