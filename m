Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED58131EC98
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:55:51 +0100 (CET)
Received: from localhost ([::1]:45530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCmal-0002m9-0O
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCmVz-0007sA-IC; Thu, 18 Feb 2021 11:50:55 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:51018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCmVx-00011d-Fj; Thu, 18 Feb 2021 11:50:55 -0500
Received: by mail-wm1-x32d.google.com with SMTP id a132so4420506wmc.0;
 Thu, 18 Feb 2021 08:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7C6qso++VDSuj9jeutB1WD2L4QbyyPQ1oLUxtQ6j1I4=;
 b=afOPG18PNjfr3BhhKWVb/aI+Ugmpv1lrCX833RkZOKpeNGqAmDiVS7HLIaXIjcQhOF
 xOt2UwLszu7M2TsyPR6JKBIInAIjY43o7DbsEcbGqIo0v6T6ceK4qe5H7qK8+onsN9lx
 wY0H+drJPTW/3wbChliWL9ARmvSPENxz5W2Sg6wG9oMgaUtK8eud90WX4B72MgKdgjWO
 Ejx+WvtdP3SpCEriblYFjM+Crb2JUylf9ij9ihcczg3SzltcSLnYZk7L2dScpAuMu8br
 lcHh6aPM3K2gwDhOmet2X2otZVEwWflQJ4l5OYqRXRn0XGUD7AbIzb4+ygJ8iNGDOaxH
 DwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7C6qso++VDSuj9jeutB1WD2L4QbyyPQ1oLUxtQ6j1I4=;
 b=C8Ud/DsVt8A3FeWI8zx8Lkaj7/v5j6Er8z+eTn+9fpuHZrtHPnCCeLIrN4lD8pmFn3
 oEFb9ske3GCST2xcK/LqtdGhKKcY8/UGQFB2PASoyOfOCWr7A+KZfGkV+RpSTjgmrO1v
 RijwCMXIzR/aCoClljxw8pNGt6KMhfZIdFM3UFzxhWbtpbHXU9LHKwHOSDkFu0l74u3z
 xLuJr1LuxasMao43il59W9y4NLuZFz3ug03X2m8ivYgIm3lhlla+noVv7W2g5x7m0TKT
 6jXUBSm4QIhpCmAr19bUtFtLQBVYfy2c5RITlZaYkmaIOhTUjQVFxry7x9olnNKBiqn/
 9V1g==
X-Gm-Message-State: AOAM53043HN3PnsQbAezB/cgWqVVPDuJcbOs4dGL11tXsVmvYnbrGK/J
 cjbPTqtqKaBn92XVaeZYSoud+jK57sw=
X-Google-Smtp-Source: ABdhPJxAEuVWN+WXl+4u68d3wc6g213fYv8kot8jK9cvmCa3RQFaVhi3jOwyXRXDKyzIuqBQb/waWA==
X-Received: by 2002:a1c:9843:: with SMTP id a64mr4378165wme.44.1613667050933; 
 Thu, 18 Feb 2021 08:50:50 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v9sm4479518wrn.86.2021.02.18.08.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 08:50:50 -0800 (PST)
Subject: Re: [PATCH v2 3/6] hw/sd: sdhci: Correctly set the controller status
 for ADMA
To: Bin Meng <bmeng.cn@gmail.com>, Mauro Matteo Cascella
 <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
 <1613447214-81951-4-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <33ba8b77-7057-6c49-4897-be568f70426d@amsat.org>
Date: Thu, 18 Feb 2021 17:50:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1613447214-81951-4-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 4:46 AM, Bin Meng wrote:
> When an ADMA transfer is started, the codes forget to set the
> controller status to indicate a transfer is in progress.
> 
> With this fix, the following 2 reproducers:
> 
> https://paste.debian.net/plain/1185136
> https://paste.debian.net/plain/1185141
> 
> cannot be reproduced with the following QEMU command line:
> 
> $ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
>       -nodefaults -device sdhci-pci,sd-spec-version=3 \
>       -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
>       -device sd-card,drive=mydrive -qtest stdio
> 
> Cc: qemu-stable@nongnu.org
> Fixes: CVE-2020-17380
> Fixes: CVE-2020-25085
> Fixes: CVE-2021-3409
> Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Reported-by: Cornelius Aschermann (Ruhr-University Bochum)
> Reported-by: Muhammad Ramdhan
> Reported-by: Sergej Schumilo (Ruhr-University Bochum)
> Reported-by: Simon Wrner (Ruhr-University Bochum)
> Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
> Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
> (no changes since v1)
> 
>  hw/sd/sdhci.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 05cb281..0b0ca6f 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -769,7 +769,9 @@ static void sdhci_do_adma(SDHCIState *s)
>  
>          switch (dscr.attr & SDHC_ADMA_ATTR_ACT_MASK) {
>          case SDHC_ADMA_ATTR_ACT_TRAN:  /* data transfer */
> +            s->prnsts |= SDHC_DATA_INHIBIT | SDHC_DAT_LINE_ACTIVE;
>              if (s->trnmod & SDHC_TRNS_READ) {
> +                s->prnsts |= SDHC_DOING_READ;
>                  while (length) {
>                      if (s->data_count == 0) {
>                          sdbus_read_data(&s->sdbus, s->fifo_buffer, block_size);
> @@ -797,6 +799,7 @@ static void sdhci_do_adma(SDHCIState *s)
>                      }
>                  }
>              } else {
> +                s->prnsts |= SDHC_DOING_WRITE;
>                  while (length) {
>                      begin = s->data_count;
>                      if ((length + begin) < block_size) {

Nice fix.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

