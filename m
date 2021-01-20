Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56ED2FC5AB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 01:22:20 +0100 (CET)
Received: from localhost ([::1]:42278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l21GN-00046n-Dh
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 19:22:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l21EP-0003Tf-TH; Tue, 19 Jan 2021 19:20:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:38470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l21EO-0003DI-1U; Tue, 19 Jan 2021 19:20:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B7A12253A;
 Wed, 20 Jan 2021 00:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611102014;
 bh=L1dd6oJsCW8v4e4/wM3CH1VP3rnG+kI0F6xbSkQRR20=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JrIB44RKj3Bx1vnip1bPp9KBwPSZTCgmpWYeNSeuwMsUNEq8qEUnS2Y5qQz4Jf8/O
 zQ1PdEF3uNOX5ukF4UUB+VR+TPy2t27MDAi3LQwJsfUtNUqBaSsQISpOdNuP3Anqqc
 9/6RoywDCzWB0TcFoH9aT7KM/bNTnyhnLHLeBr0YQ2pWH/XQituMRlImxfCJDEDaOZ
 iKUoZjwZUrVcjgN/H0/G2oMgSqtisnz7gWgpddTPH+DVtsXqXFcAuVFGl3XuMXjJZQ
 CbocGELD5iE/1uVJvN0B8DddyXz06HQXupQiUtkMcHjDSyz7lQDzsH0BAqzMJ/NvyG
 NQhSfnXBM/uSA==
Date: Wed, 20 Jan 2021 09:20:07 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v3 00/12] hw/block/nvme: misc cmb/pmr patches and bump to
 v1.4
Message-ID: <20210120002007.GB23238@redsun51.ssa.fujisawa.hgst.com>
References: <20210119101504.231259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119101504.231259-1-its@irrelevant.dk>
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
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 11:14:52AM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> This is a resend of "hw/block/nvme: allow cmb and pmr to coexist" with
> some more PMR work added (PMR RDS/WDS support).
> 
> This includes a resurrection of Andrzej's series[1] from back July.
> 
> Andrzej's main patch basically moved the CMB from BAR 2 into an offset
> in BAR 4 (located after the MSI-X table and PBA). Having an offset on
> the CMB causes a bunch of calculations related to address mapping to
> change.
> 
> So, since I couldn't get the patch to apply cleanly I took a stab at
> implementing the suggestion I originally came up with: simply move the
> MSI-X table and PBA from BAR 4 into BAR 0 (up-aligned to a 4 KiB
> boundary after the main NVMe controller registers). This way we can keep
> the CMB at offset zero in its own BAR and free up BAR 4 for use by PMR.
> This makes the patch simpler and does not impact any of the existing
> address mapping code.
> 
>   [1]: https://lore.kernel.org/qemu-devel/20200729220107.37758-1-andrzej.jakowski@linux.intel.com/

Klaus,

Series looks good to me.

Reviewed-by: Keith Busch <kbusch@kernel.org>

