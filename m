Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FE2273822
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 03:35:47 +0200 (CEST)
Received: from localhost ([::1]:59506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKXDe-0000A2-7v
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 21:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1kKXCs-00086J-KT; Mon, 21 Sep 2020 21:34:58 -0400
Received: from relay64.bu.edu ([128.197.228.104]:39488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1kKXCq-00076t-Oj; Mon, 21 Sep 2020 21:34:58 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 08M1YBf6015794
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 21 Sep 2020 21:34:14 -0400
Date: Mon, 21 Sep 2020 21:34:11 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Li Qiang <liq3ea@163.com>
Subject: Re: [PATCH] hw: ide: check the pointer before do dma memory unmap
Message-ID: <20200922013411.auucs5t2hhw4romx@mozz.bu.edu>
References: <20200815072052.73228-1-liq3ea@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200815072052.73228-1-liq3ea@163.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 21:34:55
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: liq3ea@gmail.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 200815 0020, Li Qiang wrote:
> In 'map_page' we need to check the return value of
> 'dma_memory_map' to ensure the we actully maped something.
> Otherwise, we will hit an assert in 'address_space_unmap'.
> This is because we can't find the MR with the NULL buffer.
> This is the LP#1884693:
> 
> -->https://bugs.launchpad.net/qemu/+bug/1884693
> 
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Li Qiang <liq3ea@163.com>

I'm not very familiar with the IDE code, but this seems like a simple
null-ptr check, and Li has not received a response in over a month.

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

> ---
>  hw/ide/ahci.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
> index 009120f88b..63e9fccdbe 100644
> --- a/hw/ide/ahci.c
> +++ b/hw/ide/ahci.c
> @@ -250,6 +250,11 @@ static void map_page(AddressSpace *as, uint8_t **ptr, uint64_t addr,
>      }
>  
>      *ptr = dma_memory_map(as, addr, &len, DMA_DIRECTION_FROM_DEVICE);
> +
> +    if (!*ptr) {
> +        return;
> +    }
> +
>      if (len < wanted) {
>          dma_memory_unmap(as, *ptr, len, DMA_DIRECTION_FROM_DEVICE, len);
>          *ptr = NULL;
> -- 
> 2.17.1
> 

