Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2A5328CB7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 19:59:57 +0100 (CET)
Received: from localhost ([::1]:42638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGnlr-0004ZC-QI
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 13:59:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lGnka-0003qi-Pu; Mon, 01 Mar 2021 13:58:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:45884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lGnkZ-0003ZK-4u; Mon, 01 Mar 2021 13:58:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07380600EF;
 Mon,  1 Mar 2021 18:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614625113;
 bh=HrSxsIq6ga2ysWJ0T70aPuOloVq4RodJi1vBKH/zssc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Se+XucYm/Vmivi8xxy1UOflED9VbDmQQO51UDr9ciCqNJVsVKSI4AjnPYGItbWTpM
 rP8Nc8G6VmoLdnJx0Gz+upY9COBq0CP0f9HYVGadaHdMJ4mhW5CjlXbd8UCr/Q8E9H
 xnyJudl+T3veFnbFxZ0a0BpqCCJw7ZZuYOjxp6A+/LR0ayu0gty7rB61ATIUgPvr2A
 2mNQWYBufPioJt9iJiO//UhfsX+u2Pjt1SU1WMxBHQn3BvXXnPW5NVqNwPoC/INPZQ
 US2CMG/oswyyaPFBS2hyI6SlPM0VystAtgq9i+9yCnFw4MiRuYqKo2MjzA8eimrglE
 Yi0Ibmc06+0oA==
Date: Tue, 2 Mar 2021 03:58:25 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v4 00/12] hw/block/nvme: metadata and end-to-end data
 protection support
Message-ID: <20210301185825.GD17228@redsun51.ssa.fujisawa.hgst.com>
References: <20210301140047.106261-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301140047.106261-1-its@irrelevant.dk>
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 03:00:35PM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> This is v4 (RFC removed) of a series that adds support for metadata and
> end-to-end data protection.
> 
> First, on the subject of metadata, in v1, support was restricted to
> extended logical blocks, which was pretty trivial to implement, but
> required special initialization and broke DULBE. In v2, metadata is
> always stored continuously at the end of the underlying block device.
> This has the advantage of not breaking DULBE since the data blocks
> remains aligned and allows bdrv_block_status to be used to determinate
> allocation status. It comes at the expense of complicating the extended
> LBA emulation, but on the other hand it also gains support for metadata
> transfered as a separate buffer.
> 
> The end-to-end data protection support blew up in terms of required
> changes. This is due to the fact that a bunch of new commands has been
> added to the device since v1 (zone append, compare, copy), and they all
> require various special handling for protection information. If
> potential reviewers would like it split up into multiple patches, each
> adding pi support to one command, shout out.
> 
> The core of the series (metadata and eedp) is preceeded by a set of
> patches that refactors mapping (yes, again) and tries to deal with the
> qsg/iov duality mess (maybe also again?).
> 
> Support fro metadata and end-to-end data protection is all joint work
> with Gollu Appalanaidu.

Looks fine.

Reviewed-by: Keith Busch <kbusch@kernel.org>

