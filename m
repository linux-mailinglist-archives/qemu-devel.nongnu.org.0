Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084C9477B3D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 19:03:24 +0100 (CET)
Received: from localhost ([::1]:48216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxv6B-0003ud-53
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 13:03:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1mxv4F-0001u1-FZ; Thu, 16 Dec 2021 13:01:23 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:48352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1mxv4D-00005K-J8; Thu, 16 Dec 2021 13:01:23 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5FE3761D50;
 Thu, 16 Dec 2021 18:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB80C36AE5;
 Thu, 16 Dec 2021 18:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639677671;
 bh=PGMPsTLiVx1jInyjYi2wPFbdi+zQoG6FZ1rj9wTd7UI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PyxgjOQgB8usf2QTi/6A5sClKTSVhX+twPptT3mVCNUnJ2/etnU15IW9fss65bSRH
 SuUfKO0cdGR5SfIy1MlsH23inMaLOU+Xls8Vjt7QpUbrzPmeEvinUmETebFA12lpCI
 n8HJVEROaa6fj5zIUW9BnOlORhSsz1qi/uu5ndnP8zqkglDMFVgS5sf5CHFHAp8+oN
 oo4hysr1NtnDdxNtUpubwP3ZEJoChLxoiOJ5y/2CfizAul7cNqTiwOewFBCQh4vl/D
 hjhx3MMEF8l32zZmPX99Hpniwsy1Z4ZxN6tM5YKuYSbJI1V0VqXGPCBzeT7Kctdte2
 GmFVtOX6MNfog==
Date: Thu, 16 Dec 2021 10:01:08 -0800
From: Keith Busch <kbusch@kernel.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/2] hw/nvme/ctrl: Do not ignore DMA access errors
Message-ID: <20211216180108.GA4165702@dhcp-10-100-145-180.wdc.com>
References: <20211216175510.884749-1-philmd@redhat.com>
 <20211216175510.884749-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211216175510.884749-2-philmd@redhat.com>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=kbusch@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16, 2021 at 06:55:09PM +0100, Philippe Mathieu-Daudé wrote:
> dma_buf_read/dma_buf_write() return a MemTxResult type.
> Do not discard it, propagate the DMA error to the caller.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

