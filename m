Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3B8318408
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 04:39:19 +0100 (CET)
Received: from localhost ([::1]:54446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA2p4-0004Ej-2m
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 22:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lA2nX-0003kL-Hn; Wed, 10 Feb 2021 22:37:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:46056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lA2nV-0001sV-SZ; Wed, 10 Feb 2021 22:37:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E002A64E46;
 Thu, 11 Feb 2021 03:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613014658;
 bh=j1xVbOaVVUJ8FolvkJN6iMvsp/PpVJkRBaaP6PlroLA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZTuRHPVbTpvjb0k525x4iFn2EvYBleKcBU1I7oAEjZhbJPbdcb1FlHPy2XGe+Bd8l
 QnwXOXZvaZ95J12EkYSvrJPKc+QvtRFQTxMNGzZ1RR3Nz5+bmfqDzmsj/RPFNmNWyC
 1YQrsjLluWOmiSeb7D75WFfCFoLWlPJ5QwcF+qU3agBJbvpo4xzqlf9qpigK8jIWBc
 XKURl3HE2vSDQjJyd2FcH1ax1+i9nkgpybMX+tGv1tVsTwCe1DPuZo4wRePKnpfYM4
 EG+TOU57MZcA7+dxk5ya9JAqhBRI2zwq9fJG5n3MPsj7i2/y14viC7ryR2S5DA0g0Z
 CXmaxqvv8zUWg==
Date: Thu, 11 Feb 2021 12:37:32 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 2/2] hw/block/nvme: add write uncorrectable command
Message-ID: <20210211033732.GE23363@redsun51.ssa.fujisawa.hgst.com>
References: <20210210070646.730110-1-its@irrelevant.dk>
 <20210210070646.730110-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210070646.730110-3-its@irrelevant.dk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 08:06:46AM +0100, Klaus Jensen wrote:
> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> 
> Add support for marking blocks invalid with the Write Uncorrectable
> command. Block status is tracked in a (non-persistent) bitmap that is
> checked on all reads and written to on all writes. This is potentially
> expensive, so keep Write Uncorrectable disabled by default.

I really think attempting to emulate all these things is putting a
potentially unnecessary maintenance burden on this device.

The DULBE implementation started off similiar, but I suggested it
leverage support out of the backing file, and I feel it ended up better
for it.

But unlike punching and checking for holes, there's no filesystem
support for Write Uncorrectable in our qemu API, and that's probably
because this is kind of a niche feature. Is there a use case with a
real qemu guest wanting this?

