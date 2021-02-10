Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A43317372
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:36:07 +0100 (CET)
Received: from localhost ([::1]:40482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9y5e-0002kO-0F
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:36:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9xxV-0005yD-V6; Wed, 10 Feb 2021 17:27:41 -0500
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:32989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9xxT-0001GE-Ps; Wed, 10 Feb 2021 17:27:41 -0500
Received: by mail-il1-x130.google.com with SMTP id e1so3433716ilu.0;
 Wed, 10 Feb 2021 14:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gTkbfYUcuUiVouijs9yk+VkfpGAFhLKzlnUlTCv2vNc=;
 b=LtjKRvF47ZtV6rqj6sls5HzxtDVMGpsI3TPwDZOrVx8qnCFFweieVg8mp/oYrLAbUr
 Dks8CpnflNtlD5ggwv6Th6LqbMMnK0rxqrdgq0+LJvsybHqchrDZkJEw12K1yvemnRNz
 YPq6LvVzLsRQ8jigKqBXBGfPqwzsMGG7c3ijJ2RAbbvf80unLiLxbw595rZv9invuapb
 ynWTmMmY77nSlPBvKSDSsAA9y/wAf9tlijkL91mS1QEaRMb2tSGXpq0ssB2431Wp71j/
 2juTtkxTVUpPtUKj1U3JQAc8t1cttfvF+GjzpkCV6B8V0XnoYV0eMSC6oBw7TPB6p5MI
 tDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gTkbfYUcuUiVouijs9yk+VkfpGAFhLKzlnUlTCv2vNc=;
 b=o6Gjc2tQj7hyPfh77RFBHTu5fkin9Kk3pCZwlmQX9hC2eLD5foOctJNne9rXQzujkn
 4orq4qldePWUZYK8NYVq/a0zl3C63wBSpkCX9G9XBRGDg64MqXsAvyfZjljiwYJkwr/Y
 k4zuispBsmt/BvY1fmPaaBUzXTvc1t1jBXEs54MSDTAIPpu06qBEdO8ekX5tWljBfsKT
 ktaIr0Q4+zbpsieYsiBPFnf2HtcIqaTIMzoYWVE9AG5gU7O68bSnxiMg6nbo6w6FMhvI
 qdtY2xuvDzByHjYLfvJkLz3K0xYFhyb1uxAE4YnGdZeiTWhbHXVuXoO49KG6ulUHFd7T
 EEXg==
X-Gm-Message-State: AOAM531zNtT5Yf5VtrQSiRSNpnEhMBbf/LeKgKWborTUFAqKk2yDhO0y
 iZgyv5//Aw0dwLMW3wTTNggP6RqdxK9Zd9qxo7U=
X-Google-Smtp-Source: ABdhPJyP4IXuzg9HKtfsUho7nCLzWDGC02ixGmHcMq3E5+deehU78+MDDrMUOcKc18FE9VlifqEJEKMXtTQSbpgCh0o=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr3055041ild.267.1612996057992; 
 Wed, 10 Feb 2021 14:27:37 -0800 (PST)
MIME-Version: 1.0
References: <1612868085-72809-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1612868085-72809-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 10 Feb 2021 14:27:03 -0800
Message-ID: <CAKmqyKPLD68GXeMyU_LTVYjv8YUXex4wvyAnHkOgu=PK48pP7w@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: sdhci: Do not transfer any data when command fails
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org, Li Qiang <liq3ea@163.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 9, 2021 at 2:55 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
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

Isn't this already fixed?

> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
>

