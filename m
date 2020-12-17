Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E754D2DDAB1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 22:16:52 +0100 (CET)
Received: from localhost ([::1]:42358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq0do-0001og-2E
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 16:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kq0bq-0000mk-Cm; Thu, 17 Dec 2020 16:14:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:48960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kq0bo-0003uT-2M; Thu, 17 Dec 2020 16:14:49 -0500
Date: Thu, 17 Dec 2020 13:14:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608239683;
 bh=danwhvRHSn8FFR3H+DAwgN8RDLYbBiKSfcwP43pGNZc=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQByENDVpRv334gnfc76LCuy3B79Le6E3hegKs9upFI58OWsGJGmtppcb+xZ65yse
 wztvFEnJ9OW3j5VMjeaCQA2hGkHUvTKtpwFkIZ4xXm13XEgIy8Z9QpcSyDreqRyivb
 IDx4iAd/cK81oaQB0CKDbyFmmcMnVyXRQDHsyCIPXYAM48P39s5Fr8yV1M7puHIitO
 z8thZRHep/PY4krm7LjN72SKHvgD478gDrXO/Uo3kC1C6BSkIzDgFuu+II7Vq9uDVb
 YnoucqzPpwwcfd7fl7Mvb5dJWtBgjfArfCZZh5dZzCe8UPv6r9dxwzttxmqBcA/yZe
 iE8eIoGltt24Q==
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC 0/3] hw/block/nvme: dif-based end-to-end data
 protection support
Message-ID: <20201217211440.GA502315@dhcp-10-100-145-180.wdc.com>
References: <20201217210222.779619-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217210222.779619-1-its@irrelevant.dk>
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

On Thu, Dec 17, 2020 at 10:02:19PM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> This series adds support for extended LBAs and end-to-end data
> protection. Marked RFC, since there are a bunch of issues that could use
> some discussion.
> 
> Storing metadata bytes contiguously with the logical block data and
> creating a physically extended logical block basically breaks the DULBE
> and deallocation support I just added. Formatting a namespace with
> protection information requires the app- and reftags of deallocated or
> unwritten blocks to be 0xffff and 0xffffffff respectively; this could be
> used to reintroduce DULBE support in that case, albeit at a somewhat
> higher cost than the block status flag-based approach.
> 
> There is basically three ways of storing metadata (and maybe a forth,
> but that is probably quite the endeavour):
> 
>   1. Storing metadata as extended blocks directly on the blockdev. That
>      is the approach used in this RFC.
> 
>   2. Use a separate blockdev. Incidentially, this is also the easiest
>      and most straightforward solution to support MPTR-based "separate
>      metadata". This also allows DULBE and block deallocation to be
>      supported using the existing approach.
> 
>   3. A hybrid of 1 and 2 where the metadata is stored contiguously at
>     the end of the nvme-ns blockdev.
> 
> Option 1 obviously works well with DIF-based protection information and
> extended LBAs since it maps one to one. Option 2 works flawlessly with
> MPTR-based metadata, but extended LBAs can be "emulated" at the cost of
> a bunch of scatter/gather operations.

Are there any actual users of extended metadata that we care about? I'm
aware of only a few niche places that can even access an extended
metadata format. There's not kernel support in any major OS that I know
of.

Option 2 sounds fine.

If option 3 means that you're still using MPTR, but just sequester space
at the end of the backing block device for meta-data purposes, then that
is fine too. You can even resize it dynamically if you want to support
different metadata sizes.

> The 4th option is extending an existing image format (QCOW2) or create
> something on top of RAW to supports metadata bytes per block. But both
> approaches require full API support through the block layer. And
> probably a lot of other stuff that I did not think about.

It definitely sounds appealing to push the feature to a lower level if
you're really willing to see that through.

In any case, calculating T10 CRCs is *really* slow unless you have
special hardware and software support for it.

