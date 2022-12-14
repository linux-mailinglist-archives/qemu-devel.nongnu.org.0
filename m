Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97E564C633
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 10:44:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5OIb-0004pH-Ch; Wed, 14 Dec 2022 04:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1p5OIW-0004or-Ie
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 04:43:34 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1p5OIS-0008S1-HR
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 04:43:32 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id AF9CD44330;
 Wed, 14 Dec 2022 10:43:17 +0100 (CET)
Message-ID: <f71d7c3e-fb0a-a425-6193-a4956015e2be@proxmox.com>
Date: Wed, 14 Dec 2022 10:43:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] hw/net/vmxnet3: allow VMXNET3_MAX_MTU itself as a value
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fleytman@gmail.com, jasowang@redhat.com, pj.pandit@yahoo.co.in
References: <20220825092910.23922-1-f.ebner@proxmox.com>
In-Reply-To: <20220825092910.23922-1-f.ebner@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 25.08.22 um 11:29 schrieb Fiona Ebner:
> Currently, VMXNET3_MAX_MTU itself (being 9000) is not considered a
> valid value for the MTU, but a guest running ESXi 7.0 might try to
> set it and fail the assert [0].
> 
> In the Linux kernel, dev->max_mtu itself is a valid value for the MTU
> and for the vmxnet3 driver it's 9000, so a guest running Linux will
> also fail the assert when trying to set an MTU of 9000.
> 
> VMXNET3_MAX_MTU and s->mtu don't seem to be used in relation to buffer
> allocations/accesses, so allowing the upper limit itself as a value
> should be fine.
> 
> [0]: https://forum.proxmox.com/threads/114011/
> 
> Fixes: d05dcd94ae ("net: vmxnet3: validate configuration values during activate (CVE-2021-20203)")
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> ---
> 
> Feel free to adapt the commit message as you see fit.
> 
> v1 -> v2:
>     * Add commit message with some rationale.
> 
>  hw/net/vmxnet3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index 0b7acf7f89..a2037583bf 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -1441,7 +1441,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>      vmxnet3_setup_rx_filtering(s);
>      /* Cache fields from shared memory */
>      s->mtu = VMXNET3_READ_DRV_SHARED32(d, s->drv_shmem, devRead.misc.mtu);
> -    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu < VMXNET3_MAX_MTU);
> +    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu <= VMXNET3_MAX_MTU);
>      VMW_CFPRN("MTU is %u", s->mtu);
>  
>      s->max_rx_frags =

Ping


