Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42209318B05
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:42:55 +0100 (CET)
Received: from localhost ([::1]:55364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABJ4-0001ml-Cw
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1lABBa-0003OJ-4i; Thu, 11 Feb 2021 07:35:06 -0500
Received: from mail.csgraf.de ([85.25.223.15]:41068 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1lABBX-0006o5-NC; Thu, 11 Feb 2021 07:35:05 -0500
Received: from Alexanders-Mac-mini.local (unknown [188.138.100.120])
 by csgraf.de (Postfix) with UTF8SMTPSA id 65A406080F85;
 Thu, 11 Feb 2021 13:35:00 +0100 (CET)
Message-ID: <280b4e29-1337-dac7-071c-1feeab182294@csgraf.de>
Date: Thu, 11 Feb 2021 13:34:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:86.0)
 Gecko/20100101 Thunderbird/86.0
Subject: Re: [PATCH] hw/block/nvme: fix legacy namespace registration
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210211105451.937713-1-its@irrelevant.dk>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20210211105451.937713-1-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.119,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11.02.21 11:54, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Moving namespace registration to the nvme-ns realization function had
> the unintended side-effect of breaking legacy namespace registration.
> Fix this.
>
> Fixes: 15d024d4aa9b ("hw/block/nvme: split setup and register for namespace")
> Reported-by: Alexander Graf <agraf@csgraf.de>
> Cc: Minwoo Im <minwoo.im.dev@gmail.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>


I can confirm that this fixes the upstream regression. Thanks a lot. 
Please work on a way with Peter to pull this into the tree as quickly as 
possible, so that we maintain a working master branch with NVMe.

Tested-by: Alexander Graf <agraf@csgraf.de>


Thanks!

Alex


> ---
>   hw/block/nvme.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 5ce21b7100b3..d36e14fe13e2 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -4507,6 +4507,12 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>           if (nvme_ns_setup(ns, errp)) {
>               return;
>           }
> +
> +        if (nvme_register_namespace(n, ns, errp)) {
> +            error_propagate_prepend(errp, local_err,
> +                                    "could not register namespace: ");
> +            return;
> +        }
>       }
>   }
>   

