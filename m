Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587E831DCA5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 16:47:21 +0100 (CET)
Received: from localhost ([::1]:35656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCP2t-0000YQ-WD
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 10:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lCP1M-0008DQ-Mu; Wed, 17 Feb 2021 10:45:44 -0500
Received: from relay68.bu.edu ([128.197.228.73]:47091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lCP1K-0001JR-TR; Wed, 17 Feb 2021 10:45:44 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 11HFdFGb025590
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 17 Feb 2021 10:39:18 -0500
Date: Wed, 17 Feb 2021 10:39:15 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 4/6] hw/sd: sdhci: Simplify updating s->prnsts in
 sdhci_sdma_transfer_multi_blocks()
Message-ID: <20210217153915.p4std4g2tjgouzyw@mozz.bu.edu>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
 <1613447214-81951-5-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613447214-81951-5-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org, Li Qiang <liq3ea@163.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210216 1146, Bin Meng wrote:
> s->prnsts is updated in both branches of the if () else () statement.
> Move the common bits outside so that it is cleaner.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

> ---
> 
> (no changes since v1)
> 
>  hw/sd/sdhci.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 0b0ca6f..7a2003b 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -598,9 +598,9 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
>          page_aligned = true;
>      }
>  
> +    s->prnsts |= SDHC_DATA_INHIBIT | SDHC_DAT_LINE_ACTIVE;
>      if (s->trnmod & SDHC_TRNS_READ) {
> -        s->prnsts |= SDHC_DOING_READ | SDHC_DATA_INHIBIT |
> -                SDHC_DAT_LINE_ACTIVE;
> +        s->prnsts |= SDHC_DOING_READ;
>          while (s->blkcnt) {
>              if (s->data_count == 0) {
>                  sdbus_read_data(&s->sdbus, s->fifo_buffer, block_size);
> @@ -627,8 +627,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
>              }
>          }
>      } else {
> -        s->prnsts |= SDHC_DOING_WRITE | SDHC_DATA_INHIBIT |
> -                SDHC_DAT_LINE_ACTIVE;
> +        s->prnsts |= SDHC_DOING_WRITE;
>          while (s->blkcnt) {
>              begin = s->data_count;
>              if (((boundary_count + begin) < block_size) && page_aligned) {
> -- 
> 2.7.4
> 

