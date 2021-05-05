Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1043B374A37
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:34:07 +0200 (CEST)
Received: from localhost ([::1]:51738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leP9i-0002CU-2S
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1leOyk-000577-HX; Wed, 05 May 2021 17:22:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:34606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1leOyi-0002AU-PA; Wed, 05 May 2021 17:22:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68B8F613E3;
 Wed,  5 May 2021 21:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620249761;
 bh=V+nz2evI4NooDlZdZ9cVkSg+G4LsImIrvOpVq2H9Fsk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i0XOwe7e3Cs7+HAVfyQaG0W/jIBR+mUv8FjKustL0yz7mMKSaH4IvzTP/erDfguKT
 2Y6hSGz4isXPeERt6ekpH1vD958DlMCwJCzy44/S6l0HkKfUm0SQ3bdGNdbzFI/uhf
 eXQG47xEzZAbSwSNSjFyQj5CwGmq3E9wxJ1FB4/KxDSTyK1cmrkl1GOkHPYWdeW7ni
 In9zM8RUpNirabCc6O2masorFU97trEtFoPRk25JqP/098LFmahwbnz91e0L/ixHBJ
 C8Mr7d8FC9jKar+LjRgr+LEgI57ZFYb9J96peqnQ58zv5kdFbNuP7LJHmdITSFUj5z
 3uvh7vzTe5K8A==
Date: Wed, 5 May 2021 14:22:38 -0700
From: Keith Busch <kbusch@kernel.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 07/23] hw/block/nvme: Use definition to avoid dynamic
 stack allocation
Message-ID: <20210505212238.GA1186879@dhcp-10-100-145-180.wdc.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-8-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210505211047.1496765-8-philmd@redhat.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 05, 2021 at 11:10:31PM +0200, Philippe Mathieu-Daudé wrote:
> The compiler isn't clever enough to figure 'SEG_CHUNK_SIZE' is
> a constant! Help it by using a definitions instead.

I don't understand. It's labeled 'const', so any reasonable compiler
will place it in the 'text' segment of the executable rather than on the
stack. While that's compiler specific, is there really a compiler doing
something bad with this? If not, I do prefer the 'const' here if only
because it limits the symbol scope ('static const' is also preferred if
that helps).

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/block/nvme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 5fe082ec34c..2f6d4925826 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -812,7 +812,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
>       * descriptors and segment chain) than the command transfer size, so it is
>       * not bounded by MDTS.
>       */
> -    const int SEG_CHUNK_SIZE = 256;
> +#define SEG_CHUNK_SIZE 256
>  
>      NvmeSglDescriptor segment[SEG_CHUNK_SIZE], *sgld, *last_sgld;
>      uint64_t nsgld;
> -- 
> 2.26.3
> 

