Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA072B4ED0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:05:22 +0100 (CET)
Received: from localhost ([::1]:34686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keisT-0006UJ-CV
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:05:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1keio6-0003fG-MV; Mon, 16 Nov 2020 13:00:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:44336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1keio1-0004bQ-Sb; Mon, 16 Nov 2020 13:00:49 -0500
Received: from dhcp-10-100-145-180.wdc.com (unknown [199.255.45.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EF0F2227F;
 Mon, 16 Nov 2020 18:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605549642;
 bh=u8nFqiwZqQXlUKYY53jWt2Ls4XfN3WiEM6ovmdxjTvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QmMtfRDPZblbXYFxDLYjNf9UhmtP1CQ34vK4n/AdV2jwi1tjwub03rS+H5XHsIOMh
 4vRm5JDv+ND7pZ85ANoSrydjVsoT3sgfRR3amy8CIVoPQhHlRosmVIXxLftxsQcrEW
 jHx/yg76+P4vYL95FaeDcbdW854CrGmx8mdFz9L8=
Date: Mon, 16 Nov 2020 10:00:40 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v8 3/5] hw/block/nvme: add dulbe support
Message-ID: <20201116180040.GB2715864@dhcp-10-100-145-180.wdc.com>
References: <20201112195945.819915-1-its@irrelevant.dk>
 <20201112195945.819915-4-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112195945.819915-4-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 12:57:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 12, 2020 at 08:59:43PM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add support for reporting the Deallocated or Unwritten Logical Block
> Error (DULBE).
> 
> Rely on the block status flags reported by the block layer and consider
> any block with the BDRV_BLOCK_ZERO flag to be deallocated.
> 
> Multiple factors affect when a Write Zeroes command result in
> deallocation of blocks.
> 
>   * the underlying file system block size
>   * the blockdev format
>   * the 'discard' and 'logical_block_size' parameters
> 
>      format | discard | wz (512B)  wz (4KiB)  wz (64KiB)
>     -----------------------------------------------------
>       qcow2    ignore   n          n          y
>       qcow2    unmap    n          n          y
>       raw      ignore   n          y          y
>       raw      unmap    n          y          y
> 
> So, this works best with an image in raw format and 4KiB LBAs, since
> holes can then be punched on a per-block basis (this assumes a file
> system with a 4kb block size, YMMV). A qcow2 image, uses a cluster size
> of 64KiB by default and blocks will only be marked deallocated if a full
> cluster is zeroed or discarded. However, this *is* consistent with the
> spec since Write Zeroes "should" deallocate the block if the Deallocate
> attribute is set and "may" deallocate if the Deallocate attribute is not
> set. Thus, we always try to deallocate (the BDRV_REQ_MAY_UNMAP flag is
> always set).

These all sound like reasonable constraints and consistent with the
spec.

Reviewed-by: Keith Busch <kbusch@kernel.org>

