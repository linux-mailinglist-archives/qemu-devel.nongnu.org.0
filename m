Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AED831D363
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 01:21:27 +0100 (CET)
Received: from localhost ([::1]:37980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCAaq-0006Dn-N4
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 19:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lCAZR-0005bB-E7; Tue, 16 Feb 2021 19:19:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:47812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lCAZP-0006r1-Kw; Tue, 16 Feb 2021 19:19:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E25864DA8;
 Wed, 17 Feb 2021 00:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613521193;
 bh=R03YuExg7w2m0MoltlHzM4gfpRM2+ia2Ng4jXDbzDbY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mQqmAlr5OQFiFmRqRXq39oofOPmOxagHU+SJMPPLbFOyLeMlxWK42fIQAE3nIeMpj
 qigb0zZeMYjpAlKSgPwwlariag61itx+ZIG7WZjl94TzZK+ywdDawc9OXx1RWRXaiq
 Wi5FbC3bh/Qfwj69iUgodxQphfGAA8aQoEc8Hv1URUbjqhRytYb2gYbJlvQkC4WM/Q
 +lHhyvTO3o0R0R+GjzYvLlL/9c14EnxuxeZpEcPMQMvsa24h2yVlidE9DpXAjOr1OJ
 bsY8Bpq7iFvdKkaKPstxCv2y0kiPBaNEATWfUnS3blwSyOFlzVrEx9JpyETA43lbik
 hRppBWQdSnGxQ==
Date: Tue, 16 Feb 2021 16:19:50 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC v3 00/12] hw/block/nvme: metadata and end-to-end data
 protection support
Message-ID: <20210217001950.GH2708768@dhcp-10-100-145-180.wdc.com>
References: <20210214230240.301275-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210214230240.301275-1-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 12:02:28AM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> This is RFC v3 of a series that adds support for metadata and end-to-end data
> protection.
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

Patches 1 - 8 look good to me:

Reviewed-by: Keith Busch <kbusch@kernel.org>

I like the LBA format and protection info support too, but might need
some minor changes.

The verify implementation looked fine, but lacking a generic backing for
it sounds to me the use cases aren't there to justify taking on this
feature.

