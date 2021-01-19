Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6CF2FC06E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:56:29 +0100 (CET)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1x76-0005gt-SJ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l1wCm-0000rI-RU; Tue, 19 Jan 2021 13:58:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:37290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l1wCj-0004f2-7O; Tue, 19 Jan 2021 13:58:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1459020706;
 Tue, 19 Jan 2021 18:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611082688;
 bh=QhRp8jjvHvBd28jnUOvwl8u7vLvplfPYT+hkR3849Gk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=be4b/TQechvzUwAkFpjwu7ICShX0JlAYtjTEmYCawbWg+oos/9Jn97Ac/7auyknU/
 jgE27K+AshrGYRdwMasUjOL1LimI19FHPJLnGjp3GiINmdYbGE8XI4dPwcZfGcgHqF
 bGdHjSNP5Zm6YrntxfEMTnzr4BUmBTYO8NEikBjsgnKO0FEPWVLWlogpvmRWyDM9hX
 VFHNfGbQozZ4IaWjA8Xtsx1LyKxYb7ufWmbkvlN41HKXlrouVH54uAKF6U3x3C9ML5
 AKwTYtqR+JOH9XH3B2LwrGS0DdqaarWmIZbqZMGNO7HMVN6OONYEL/7loTuJ26gnpp
 8scLv5USUty6Q==
Date: Wed, 20 Jan 2021 03:58:02 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 02/12] hw/block/nvme: fix 64 bit register hi/lo split
 writes
Message-ID: <20210119185802.GA23238@redsun51.ssa.fujisawa.hgst.com>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-3-its@irrelevant.dk>
 <20210118124100.GB18718@localhost.localdomain>
 <YAWE4cDhwQOoc8NT@apples.localdomain>
 <20210118125945.GI18718@localhost.localdomain>
 <YAXnNAo/Cva7gTQx@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAXnNAo/Cva7gTQx@apples.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 18, 2021 at 08:53:24PM +0100, Klaus Jensen wrote:
> On Jan 18 21:59, Minwoo Im wrote:
> > > The spec requires aligned 32 bit accesses (or the size of the register),
> > > so maybe it's about time we actually ignore instead of falling through.
> > 
> > Agreed.
> > 
> 
> On the other hand.
> 
> The spec just allows undefined behavior if the alignment or size
> requirement is violated. So falling through is not wrong.
> 
> Keith, any thoughts on this?

If the host's access is unaligned and breaks something, the host gets
to keep both pieces.

