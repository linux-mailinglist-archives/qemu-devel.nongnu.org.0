Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5F631CDD2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:17:54 +0100 (CET)
Received: from localhost ([::1]:55428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC32v-00070J-D9
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lC2zd-00041O-Ex; Tue, 16 Feb 2021 11:14:29 -0500
Received: from relay64.bu.edu ([128.197.228.104]:42401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lC2zZ-0001ZO-2j; Tue, 16 Feb 2021 11:14:27 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 11GGDEwh006816
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 16 Feb 2021 11:13:17 -0500
Date: Tue, 16 Feb 2021 11:13:14 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 0/6] hw/sd: sdhci: Fixes to CVE-2020-17380,
 CVE-2020-25085, CVE-2021-3409
Message-ID: <20210216161314.qsjexqy5bu36teem@mozz.bu.edu>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
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

Hi Bin,
For this series,
Tested-by: Alexander Bulekov <alxndr@bu.edu>

Thank you
-Alex



On 210216 1146, Bin Meng wrote:
> This series includes several fixes to CVE-2020-17380, CVE-2020-25085
> and CVE-2021-3409 that are heap-based buffer overflow issues existing
> in the sdhci model.
> 
> These CVEs are pretty much similar, and were filed using different
> reproducers. With this series, current known reproducers I have
> cannot be reproduced any more.
> 
> The implementation of this model still has some issues, e.g.: some codes
> do not seem to strictly match the spec, but since this series only aimes
> to address CVEs, such issue should be fixed in a separate series in the
> future, if I have time :)
> 
> Changes in v2:
> - new patch: sdhci: Limit block size only when SDHC_BLKSIZE register is writable
> - new patch: sdhci: Reset the data pointer of s->fifo_buffer[] when a different block size is programmed
> 
> Bin Meng (6):
>   hw/sd: sdhci: Don't transfer any data when command time out
>   hw/sd: sdhci: Don't write to SDHC_SYSAD register when transfer is in
>     progress
>   hw/sd: sdhci: Correctly set the controller status for ADMA
>   hw/sd: sdhci: Simplify updating s->prnsts in
>     sdhci_sdma_transfer_multi_blocks()
>   hw/sd: sdhci: Limit block size only when SDHC_BLKSIZE register is
>     writable
>   hw/sd: sdhci: Reset the data pointer of s->fifo_buffer[] when a
>     different block size is programmed
> 
>  hw/sd/sdhci.c | 60 ++++++++++++++++++++++++++++++++++++++---------------------
>  1 file changed, 39 insertions(+), 21 deletions(-)
> 
> -- 
> 2.7.4
> 

