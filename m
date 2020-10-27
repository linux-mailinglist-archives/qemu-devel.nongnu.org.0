Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC17A29B5B2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 16:19:40 +0100 (CET)
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXQl9-0001gU-QE
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 11:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kXQQo-0002Dz-P0; Tue, 27 Oct 2020 10:58:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:43290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kXQQm-00056b-Ue; Tue, 27 Oct 2020 10:58:38 -0400
Received: from dhcp-10-100-145-180.wdc.com (unknown [199.255.45.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4BE2320780;
 Tue, 27 Oct 2020 14:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603810715;
 bh=0qnf5kpG79tAjXFqCxjFM4Fu/tdvuoyBNvNUG1IPqF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jKN0rW82wkfOaO2EUEkYbPXil2lyWpFJ+z39vLzaaX+n1EmntZx2mvwOc40L5AROj
 KlG0rCQldqe4QHpXfGUIpycTTwqfAxN0NoNstLjfdElLEH16QlRKEbxjVWoYm0S377
 xY59MjdYfJPlHZwfbJ7Ln/DbJRE0m9vL+plSgrxA=
Date: Tue, 27 Oct 2020 07:58:31 -0700
From: Keith Busch <kbusch@kernel.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 08/25] block/nvme: Simplify device reset
Message-ID: <20201027145831.GC1942271@dhcp-10-100-145-180.wdc.com>
References: <20201027135547.374946-1-philmd@redhat.com>
 <20201027135547.374946-9-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201027135547.374946-9-philmd@redhat.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 10:45:26
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 27, 2020 at 02:55:30PM +0100, Philippe Mathieu-Daud� wrote:
> Avoid multiple endianess conversion by using device endianess.
> 
> Signed-off-by: Philippe Mathieu-Daud� <philmd@redhat.com>
> ---
>  block/nvme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/nvme.c b/block/nvme.c
> index e95d59d3126..be14350f959 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -755,7 +755,7 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
>      timeout_ms = MIN(500 * NVME_CAP_TO(cap), 30000);
>  
>      /* Reset device to get a clean state. */
> -    regs->cc = cpu_to_le32(le32_to_cpu(regs->cc) & 0xFE);
> +    regs->cc &= const_le32(0xFE);

This doesn't look right. The 'regs' is an MMIO address, correct? Memory
mappings use the CPU native access.

