Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C0B67DF07
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 09:26:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLK20-0003iv-8b; Fri, 27 Jan 2023 03:24:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pLK1x-0003iZ-9X; Fri, 27 Jan 2023 03:24:17 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pLK1v-0002X0-6x; Fri, 27 Jan 2023 03:24:16 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id D9EEA466D9;
 Fri, 27 Jan 2023 09:24:01 +0100 (CET)
Message-ID: <714fbcc5-524c-147c-1490-2d265e7cbac3@proxmox.com>
Date: Fri, 27 Jan 2023 09:23:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/4] block: fix detect-zeroes= with BDRV_REQ_REGISTERED_BUF
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org
References: <20230126201401.348845-1-stefanha@redhat.com>
 <20230126201401.348845-2-stefanha@redhat.com>
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <20230126201401.348845-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.15,
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

Am 26.01.23 um 21:13 schrieb Stefan Hajnoczi:
> When a write request is converted into a write zeroes request by the
> detect-zeroes= feature, it is no longer associated with an I/O buffer.
> The BDRV_REQ_REGISTERED_BUF flag doesn't make sense without an I/O
> buffer and must be cleared because bdrv_co_do_pwrite_zeroes() fails with
> -EINVAL when it's set.
> 
> Fiona Ebner <f.ebner@proxmox.com> bisected and diagnosed this QEMU 7.2
> regression where writes containing zeroes to a blockdev with
> discard=unmap,detect-zeroes=unmap fail.
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1404
> Fixes: e8b6535533be ("block: add BDRV_REQ_REGISTERED_BUF request flag")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/io.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/block/io.c b/block/io.c
> index a09a19f7a7..24a2bc42d3 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -1926,6 +1926,9 @@ static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
>          if (bs->detect_zeroes == BLOCKDEV_DETECT_ZEROES_OPTIONS_UNMAP) {
>              flags |= BDRV_REQ_MAY_UNMAP;
>          }
> +
> +        /* Can't use optimization hint with bufferless zero write */
> +        flags &= ~BDRV_REQ_REGISTERED_BUF;
>      }
>  
>      if (ret < 0) {

Tested-by: Fiona Ebner <f.ebner@proxmox.com>

CC-ing stable, because it fixes a regression.


