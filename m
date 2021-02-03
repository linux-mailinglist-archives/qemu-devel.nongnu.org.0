Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417AC30E14B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:42:04 +0100 (CET)
Received: from localhost ([::1]:50710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MAF-0007Dt-96
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:42:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l7LqV-0005jn-Qm; Wed, 03 Feb 2021 12:21:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:57808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l7LqQ-0004CI-Qm; Wed, 03 Feb 2021 12:21:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 253D664E4A;
 Wed,  3 Feb 2021 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612372889;
 bh=xk1qsTIup7UIA40sdlwBMb/ApWZqkge6CqlAfVcz+Jc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pCSBR8z82ZjbP3tV4O3NhG99m+sbCoHufm7O+JAscUeK9XcxdmVnVS0CBvgyw4aDb
 x6HDvKQzLN2562C4hrGy4qRK8BTkta3tIhgNt93ewMTyVvYJs24N7NEVedyLSisLuv
 gFf01I0u9oDUxfYF2s2gt9NYyQjhPwut294tRoMbauIJUUsFwWBjUmnj7tQ/i4W4gL
 vULrpZ1GNuN9M9AycJfujwP/92B5OzmzVHdTjOagK+jotePJJOeX9C7AFWvPKc0iHX
 dsH559Vw+dRy6nPi4UQS8k3FGB1z009Ntl+NvzBANyRLmQKqr7GyvU28DqbqKMZd7V
 6lhU4Ouk1mSRQ==
Date: Wed, 3 Feb 2021 09:21:26 -0800
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v5 4/5] nvme: updated shared header for copy command
Message-ID: <20210203172126.GC2182779@dhcp-10-100-145-180.wdc.com>
References: <20210129091541.566330-1-its@irrelevant.dk>
 <20210129091541.566330-5-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129091541.566330-5-its@irrelevant.dk>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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

On Fri, Jan 29, 2021 at 10:15:40AM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add new data structures and types for the Simple Copy command.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/block/nvme.h | 45 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index e4b918064df9..5977bcf0308a 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -579,6 +579,7 @@ enum NvmeIoCommands {
>      NVME_CMD_COMPARE            = 0x05,
>      NVME_CMD_WRITE_ZEROES       = 0x08,
>      NVME_CMD_DSM                = 0x09,
> +    NVME_CMD_COPY               = 0x19,
>      NVME_CMD_ZONE_MGMT_SEND     = 0x79,
>      NVME_CMD_ZONE_MGMT_RECV     = 0x7a,
>      NVME_CMD_ZONE_APPEND        = 0x7d,
> @@ -724,6 +725,35 @@ typedef struct QEMU_PACKED NvmeDsmRange {
>      uint64_t    slba;
>  } NvmeDsmRange;
>  
> +enum {
> +    NVME_COPY_FORMAT_0 = 0x0,
> +};
> +
> +typedef struct NvmeCopyCmd {
> +    uint8_t     opcode;
> +    uint8_t     flags;
> +    uint16_t    cid;
> +    uint32_t    nsid;
> +    uint32_t    rsvd2[4];
> +    NvmeCmdDptr dptr;
> +    uint64_t    sdlba;
> +    uint32_t    cdw12;
> +    uint32_t    cdw13;

Can we find better names for the fields within cdw's 12 and 13?
Something like:

    uint8_t nr;
    uint8_t control[3];
    uint16_t rsvd13;
    uint16_t dspec;

