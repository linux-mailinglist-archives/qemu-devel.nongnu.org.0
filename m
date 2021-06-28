Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581133B69BF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 22:37:15 +0200 (CEST)
Received: from localhost ([::1]:60534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxy0I-0000MO-D4
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 16:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lxxyp-00077l-4u; Mon, 28 Jun 2021 16:35:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:59992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lxxyj-0001uY-9E; Mon, 28 Jun 2021 16:35:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05E6261CD5;
 Mon, 28 Jun 2021 20:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624912535;
 bh=GGsZ4txnD8MZ9TK6ZxhvMqgLAQ3KChszbQ6nwvzcdXM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DbuDN+Jknuj1NFsiR2M0eBuNlXrzCF85GXyh9oQLALo3xgqlFdQ89b+XO/GaTfltr
 tX0eubLtEjEqUw62Y2Lpts64cT1cqSz8ojVJExQzDMu1mCX/oBwq+3zRzflZ6gxD5+
 xON92cJaU9PlpSTIEQv52fkx5sw5CPf96HQLHENTRwnnnobglaXtORtXOW1WEzgUd8
 dy4+0c3+Shvb8C7ipIfxYtb9d1uUGRTeZbDFfyUHfX+UmrgFTuQfa9lYoKcNezCLy/
 pCw5A4Ul5bbFx+oVmWigBHa3GEM9uz2ZrcSzaySX4iX8zW3DCQvdMwlJ/xNmKUwvF+
 gNhK+cNTfaYYg==
Date: Mon, 28 Jun 2021 13:35:33 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2] hw/nvme: fix pin-based interrupt behavior (again)
Message-ID: <20210628203533.GC2822061@dhcp-10-100-145-180.wdc.com>
References: <20210617185542.106252-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210617185542.106252-1-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: Jakub =?utf-8?B?SmVybcOhxZk=?= <jakub.jermar@kernkonzept.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 08:55:42PM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Jakub noticed[1] that, when using pin-based interrupts, the device will
> unconditionally deasssert when any CQEs are acknowledged. However, the
> pin should not be deasserted if other completion queues still holds
> unacknowledged CQEs.
> 
> The bug is an artifact of commit ca247d35098d ("hw/block/nvme: fix
> pin-based interrupt behavior") which fixed one bug but introduced
> another. This is the third time someone tries to fix pin-based
> interrupts (see commit 5e9aa92eb1a5 ("hw/block: Fix pin-based interrupt
> behaviour of NVMe"))...
> 
> Third time's the charm, so fix it, again, by keeping track of how many
> CQs have unacknowledged CQEs and only deassert when all are cleared.
> 
>   [1]: <20210610114624.304681-1-jakub.jermar@kernkonzept.com>
> 
> Fixes: ca247d35098d ("hw/block/nvme: fix pin-based interrupt behavior")
> Reported-by: Jakub Jermář <jakub.jermar@kernkonzept.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

