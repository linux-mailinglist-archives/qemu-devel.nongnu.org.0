Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE862FF866
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 00:05:59 +0100 (CET)
Received: from localhost ([::1]:53850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2j1a-0001MT-4r
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 18:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l2izR-0000YN-8g; Thu, 21 Jan 2021 18:03:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:50670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1l2izP-0002Kx-AN; Thu, 21 Jan 2021 18:03:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1A8E23A3A;
 Thu, 21 Jan 2021 23:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611270221;
 bh=x2Q11khQ3FjYsvFuqF1aVIg4KfBCp/YKJI5k3MjnysY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pZwFpF5++GDiovSF4Ijndm9f/sb2m5clRipeExGS2uZEz6qruTcGJSmXIHx7M/Rkr
 GES7Y1DO8iwH68CRAHSjmejJCL/SXgb0yFiZON5p763NbBMarnyRDKdBNz7ZmpzT+1
 F2HmF1CdE9DVfqqRhxn48Vv1ATskQKL1vO4cEo8CBGmxVLznBrZVVhTgFDb0uUnwWq
 ebTEQcXdUBLFmC+Dqgi6vJGsIFY/EoRhi7fTw++UR4sLeU3NMU7Kkt8pBzuoGzYFwb
 H2+gUF/Tu/71LZ4ZygFuBhxFVQ+JsrePOeguebpzXpBHhL5u8afBQsL03yVUD/l9ox
 pIB5Um3+n0nsQ==
Date: Thu, 21 Jan 2021 15:03:38 -0800
From: Keith Busch <kbusch@kernel.org>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V4 2/6] hw/block/nvme: support to map controller to a
 subsystem
Message-ID: <20210121230338.GC1727271@dhcp-10-100-145-180.wdc.com>
References: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
 <20210121220908.14247-3-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121220908.14247-3-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 22, 2021 at 07:09:04AM +0900, Minwoo Im wrote:
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -23,6 +23,7 @@
>   *              max_ioqpairs=<N[optional]>, \
>   *              aerl=<N[optional]>, aer_max_queued=<N[optional]>, \
>   *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]> \
> + *              ,subsys=<subsys_id> \

For consistency, the ',' goes in the preceeding line.

>   *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
>   *              zoned=<true|false[optional]>
>   *      -device nvme-subsys,id=<subsys_id>

> @@ -4404,11 +4412,25 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
>      return 0;
>  }
>  
> +static void nvme_init_subnqn(NvmeCtrl *n)
> +{
> +    NvmeSubsystem *subsys = n->subsys;
> +    NvmeIdCtrl *id = &n->id_ctrl;
> +    char *subnqn;
> +
> +    if (!subsys) {
> +        subnqn = g_strdup_printf("nqn.2019-08.org.qemu:%s", n->params.serial);
> +        strpadcpy((char *)id->subnqn, sizeof(id->subnqn), subnqn, '\0');
> +        g_free(subnqn);

    snprintf(id->subnqn, sizeof(id->subnqn), "nqn.2019-08.org.qemu:%s", n->params.serial);

> +    } else {
> +        pstrcpy((char *)id->subnqn, sizeof(id->subnqn), (char*)subsys->subnqn);
> +    }
> +}

