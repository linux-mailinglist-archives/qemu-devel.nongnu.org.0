Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B433A3B48FB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:50:28 +0200 (CEST)
Received: from localhost ([::1]:51200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwquJ-0008AF-Hb
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lwqrz-0007HF-AD; Fri, 25 Jun 2021 14:48:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:57754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1lwqrx-0005I3-5U; Fri, 25 Jun 2021 14:48:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DCDC6195B;
 Fri, 25 Jun 2021 18:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624646878;
 bh=1GAl91k8Nz7S9PSzdpiH94qMrBLWb3A3bueTaOpDgQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NZrMOMrEMtPqmTinY8ls8gN/qE1Z5aNb64r+WuS7u9JQb9GZ+yJhP7xgmn5iQsNXR
 +vTprjlc8Dd17mHrtTCrDS8GjvKGKy1fVUIQAVYR9Wbvpdoa35vySHHWkzekHnjG/B
 86sopTezUvp4Ob3s3UZTmSwIIeTTdLGo6eBtw04zwPg3JFPRtD5iUsscpgKWAMpjvM
 V+U/hH/hDMDQFPbLCuFRpCLqOxYXrWvNnRicUE++TrXSZ26waPewxT7N5+3jKRbu5n
 2FdfHPk2CMaEGkvGRgTEy+QZJcdQx3ISGbO8PfxdvZ2bpOTtkrX1IT9G0fhwSIygUl
 2gS5zDDYFwawg==
Date: Fri, 25 Jun 2021 11:47:55 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 00/11] hw/nvme: reimplement all multi-aio commands
 with custom aiocbs
Message-ID: <20210625184755.GB2818622@dhcp-10-100-145-180.wdc.com>
References: <20210617190657.110823-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617190657.110823-1-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 09:06:46PM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> This series reimplements flush, dsm, copy, zone reset and format nvm to
> allow cancellation. I posted an RFC back in March ("hw/block/nvme:
> convert ad-hoc aio tracking to aiocb") and I've applied some feedback
> from Stefan and reimplemented the remaining commands.
> 
> The basic idea is to define custom AIOCBs for these commands. The custom
> AIOCB takes care of issuing all the "nested" AIOs one by one instead of
> blindly sending them off simultaneously without tracking the returned
> aiocbs.


Klaus,

THis series looks good to me.

Reviewed-by: Keith Busch <kbusch@kernel.org>

