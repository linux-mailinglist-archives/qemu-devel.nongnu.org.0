Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8344020A4D9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 20:24:41 +0200 (CEST)
Received: from localhost ([::1]:54646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joWYC-00078W-28
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 14:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1joWX8-0006HY-5J; Thu, 25 Jun 2020 14:23:34 -0400
Received: from charlie.dont.surf ([128.199.63.193]:39344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1joWX6-0000YO-8P; Thu, 25 Jun 2020 14:23:33 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 21B22BF432;
 Thu, 25 Jun 2020 18:23:29 +0000 (UTC)
Date: Thu, 25 Jun 2020 20:23:26 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/block/nvme: Align I/O BAR to 4 KiB
Message-ID: <20200625182326.ookc3e6rpbcypuj3@apples.localdomain>
References: <20200625154834.367-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200625154834.367-1-philmd@redhat.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 14:23:29
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jun 25 17:48, Philippe Mathieu-Daudé wrote:
> Simplify the NVMe emulated device by aligning the I/O BAR to 4 KiB.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/block/nvme.h | 3 +++
>  hw/block/nvme.c      | 5 ++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 1720ee1d51..6d87c9c146 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -22,6 +22,8 @@ typedef struct NvmeBar {
>      uint32_t    pmrebs;
>      uint32_t    pmrswtp;
>      uint32_t    pmrmsc;
> +    uint32_t    reserved[58];
> +    uint8_t     cmd_set_specfic[0x100];
>  } NvmeBar;

This ends up as a freak mix of v1.3 and v1.4 specs. Since we already
have the PMR stuff in there, I think it makes more sense to align with
v1.4 and remove the reserved bytes.

Otherwise, LGTM.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

