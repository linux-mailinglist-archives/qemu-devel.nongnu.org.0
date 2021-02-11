Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715B1319076
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 17:57:19 +0100 (CET)
Received: from localhost ([::1]:51628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFHK-0002QB-Fx
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 11:57:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lAFEs-0000c2-O1; Thu, 11 Feb 2021 11:54:46 -0500
Received: from relay64.bu.edu ([128.197.228.104]:49192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lAFEq-0002jK-RC; Thu, 11 Feb 2021 11:54:46 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 11BGruhY031721
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 11 Feb 2021 11:53:59 -0500
Date: Thu, 11 Feb 2021 11:53:56 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/sd: sdhci: Do not transfer any data when command fails
Message-ID: <20210211165351.5rr2dpzlg4eqygdn@mozz.bu.edu>
References: <1612868085-72809-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612868085-72809-1-git-send-email-bmeng.cn@gmail.com>
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

On 210209 1854, Bin Meng wrote:
> At the end of sdhci_send_command(), it starts a data transfer if
> the command register indicates a data is associated. However the
> data transfer should only be initiated when the command execution
> has succeeded.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: CVE-2020-17380
> Fixes: CVE-2020-25085
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Reported-by: Sergej Schumilo (Ruhr-University Bochum)
> Reported-by: Cornelius Aschermann (Ruhr-University Bochum)
> Reported-by: Simon Wrner (Ruhr-University Bochum)
> Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

I applied this along with <20210208193450.2689517-1-f4bug@amsat.org>
"hw/sd/sdhci: Do not modify BlockSizeRegister if transaction in progress"

I ran through the entire OSS-Fuzz corpus, and could not reproduce the
crash.

Tested-by: Alexander Bulekov <alxndr@bu.edu>

Thanks

> ---
> 
>  hw/sd/sdhci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 8ffa539..0450110 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -326,6 +326,7 @@ static void sdhci_send_command(SDHCIState *s)
>      SDRequest request;
>      uint8_t response[16];
>      int rlen;
> +    bool cmd_failure = false;
>  
>      s->errintsts = 0;
>      s->acmd12errsts = 0;
> @@ -349,6 +350,7 @@ static void sdhci_send_command(SDHCIState *s)
>              trace_sdhci_response16(s->rspreg[3], s->rspreg[2],
>                                     s->rspreg[1], s->rspreg[0]);
>          } else {
> +            cmd_failure = true;
>              trace_sdhci_error("timeout waiting for command response");
>              if (s->errintstsen & SDHC_EISEN_CMDTIMEOUT) {
>                  s->errintsts |= SDHC_EIS_CMDTIMEOUT;
> @@ -369,7 +371,7 @@ static void sdhci_send_command(SDHCIState *s)
>  
>      sdhci_update_irq(s);
>  
> -    if (s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
> +    if (!cmd_failure && s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
>          s->data_count = 0;
>          sdhci_data_transfer(s);
>      }
> -- 
> 2.7.4
> 

