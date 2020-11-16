Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453912B4ECF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:04:52 +0100 (CET)
Received: from localhost ([::1]:33284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keirz-0005t6-Ab
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1keipH-0004AQ-V4; Mon, 16 Nov 2020 13:02:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:44648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1keipG-00051o-2V; Mon, 16 Nov 2020 13:02:03 -0500
Received: from dhcp-10-100-145-180.wdc.com (unknown [199.255.45.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76E7720776;
 Mon, 16 Nov 2020 18:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605549720;
 bh=fRIgWxf7Fj+hshUfVm49Etclc1AGD98E1Qo+1a1XN/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mJmAqsE89ew3hooDaQ1SJzRUXjesT5YpbBrGv2UdrZHJichYBITRyaFuRWMDzl2da
 ZqRndyYX1ATU/5yj/cWvZMPqL2JkSgqJZRGw7JAHa25bQceFJ17wpehixJELD96dRt
 HSzoMLOFcjkAsN1FlCXmrbln4w15Scbd8lvvpUjs=
Date: Mon, 16 Nov 2020 10:01:57 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v8 5/5] hw/block/nvme: add the dataset management command
Message-ID: <20201116180157.GC2715864@dhcp-10-100-145-180.wdc.com>
References: <20201112195945.819915-1-its@irrelevant.dk>
 <20201112195945.819915-6-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112195945.819915-6-its@irrelevant.dk>
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

On Thu, Nov 12, 2020 at 08:59:45PM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add support for the Dataset Management command and the Deallocate
> attribute. Deallocation results in discards being sent to the underlying
> block device. Whether of not the blocks are actually deallocated is
> affected by the same factors as Write Zeroes (see previous commit).
> 
>      format | discard | dsm (512B)  dsm (4KiB)  dsm (64KiB)
>     --------------------------------------------------------
>       qcow2    ignore   n           n           n
>       qcow2    unmap    n           n           y
>       raw      ignore   n           n           n
>       raw      unmap    n           y           y
> 
> Again, a raw format and 4KiB LBAs are preferable.
> 
> In order to set the Namespace Preferred Deallocate Granularity and
> Alignment fields (NPDG and NPDA), choose a sane minimum discard
> granularity of 4KiB. If we are using a passthru device supporting
> discard at a 512B granularity, user should set the discard_granularity
> property explicitly. NPDG and NPDA will also account for the
> cluster_size of the block driver if required (i.e. for QCOW2).
> 
> See NVM Express 1.3d, Section 6.7 ("Dataset Management command").

Looks good to me.

Reviewed-by: Keith Busch <kbusch@kernel.org>

