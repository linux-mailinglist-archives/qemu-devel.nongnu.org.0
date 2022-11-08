Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B00620BF3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 10:17:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKj0-0004Aq-6o; Tue, 08 Nov 2022 04:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1osKil-00049E-Rs
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:16:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1osKij-0001mr-Dj
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667898996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qHcMNxLE7mlfSg1OW6gGcq8hRP2zhlObXXOs+/8aFlg=;
 b=QlMf3+FpXtRb4Vn2KhkecdBpDeuf8WybynfhSv89+qjfgzi788fFs9Ug1mByJlFcvLpalz
 +kIIDIdUL7K/LonlRjdDOdvLKkdJhAWAAh4k01jB7zlGdV6lCqetNVjapt7kK4PHjdtzi0
 D+XxGuLG+JyKnoiVE6SoLQH0jLCgMts=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-5cuZZ3uYNtayoyIvs8eA-A-1; Tue, 08 Nov 2022 04:16:34 -0500
X-MC-Unique: 5cuZZ3uYNtayoyIvs8eA-A-1
Received: by mail-qk1-f197.google.com with SMTP id
 x2-20020a05620a448200b006fa7dad5c1cso11157477qkp.10
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 01:16:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qHcMNxLE7mlfSg1OW6gGcq8hRP2zhlObXXOs+/8aFlg=;
 b=LemsULxJ5vUoJqEXZ4+l9z+ZcSLUNOy7gPekHSp3ZDrS7ZpnAG988DsZ9BHGfd9bi1
 YJR1oWBVb3pW16RKFPV87sPsJfzStQNp317ke4SxpXreH58Ovs256iwbfJi8Y1g/qTPO
 5gIs20/VbB8rP6IIyqRHrDxKuux4sazs45CpAqmPPNHJzCN06HJMFSqVFsOOeLcBPN7i
 M0tdESBlTxTEGsJ6LEeLOkw7za13bMmgYfN1XBc21rFwpivTHREKOeAx3Tc8j67nC2/D
 DAsu/qcCalqK2RaVrXFrS87eWKGvu8L7ZvT0EMXx+5gDfZB2fPjrQ+FTvL4mpqw0gWM/
 /Zpw==
X-Gm-Message-State: ACrzQf3UJvD+selh7EXwL7kQhSDOYzbaNA7nC7FGDtSsMJiBJDDbsx40
 DxKdmZS50yKznvCAN/pi6Uw4hILwxWy0BmesOnOy7qjz7yAZrbHlJobZ7PfnFoSARsWp+kjVEY7
 LHJeE36qJzEV5O003lUIp/ZDreC/3Vys=
X-Received: by 2002:a05:620a:44cd:b0:6ce:d887:d448 with SMTP id
 y13-20020a05620a44cd00b006ced887d448mr38807455qkp.31.1667898993984; 
 Tue, 08 Nov 2022 01:16:33 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7J4b1Szph2pvEE6SPAx2gvbpZgfd/F8M40jr0exYSuhpnm1ph5R6HifiQWbREFmMHAAWnAkAh/tgf6D27n5MI=
X-Received: by 2002:a05:620a:44cd:b0:6ce:d887:d448 with SMTP id
 y13-20020a05620a44cd00b006ced887d448mr38807439qkp.31.1667898993762; Tue, 08
 Nov 2022 01:16:33 -0800 (PST)
MIME-Version: 1.0
References: <20221107221236.47841-1-philmd@linaro.org>
 <20221107221236.47841-2-philmd@linaro.org>
In-Reply-To: <20221107221236.47841-2-philmd@linaro.org>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Tue, 8 Nov 2022 10:16:23 +0100
Message-ID: <CAA8xKjXTknX4-sLVdhnCEKSG8wKNKa_=feykvOQ7ZFTqvvF0-A@mail.gmail.com>
Subject: Re: [PATCH-for-7.2 1/2] hw/sd/sdhci: Do not set Buf Wr Ena before
 writing block (CVE-2022-3872)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org, 
 Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, RivenDell <XRivenDell@outlook.com>, 
 Siqi Chen <coc.cyqh@gmail.com>, ningqiang <ningqiang1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Nov 7, 2022 at 11:12 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> When sdhci_write_block_to_card() is called to transfer data from
> the FIFO to the SD bus, the data is already present in the buffer
> and we have to consume it directly.
>
> See the description of the 'Buffer Write Enable' bit from the
> 'Present State' register (prnsts::SDHC_SPACE_AVAILABLE) in Table
> 2.14 from the SDHCI spec v2:
>
>   Buffer Write Enable
>
>   This status is used for non-DMA write transfers.
>
>   The Host Controller can implement multiple buffers to transfer
>   data efficiently. This read only flag indicates if space is
>   available for write data. If this bit is 1, data can be written
>   to the buffer. A change of this bit from 1 to 0 occurs when all
>   the block data is written to the buffer. A change of this bit
>   from 0 to 1 occurs when top of block data can be written to the
>   buffer and generates the Buffer Write Ready interrupt.
>
> In our case, we do not want to overwrite the buffer, so we want
> this bit to be 0, then set it to 1 once the data is written onto
> the bus.
>
> This is probably a copy/paste error from commit d7dfca0807
> ("hw/sdhci: introduce standard SD host controller").
>
> Reproducer:
> https://lore.kernel.org/qemu-devel/CAA8xKjXrmS0fkr28AKvNNpyAtM0y0B+5Fichp=
srhD+mUgnuyKg@mail.gmail.com/
>
> Fixes: CVE-2022-3872
> Reported-by: RivenDell <XRivenDell@outlook.com>
> Reported-by: Siqi Chen <coc.cyqh@gmail.com>
> Reported-by: ningqiang <ningqiang1@huawei.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/sd/sdhci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 306070c872..f230e7475f 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -954,7 +954,7 @@ static void sdhci_data_transfer(void *opaque)
>              sdhci_read_block_from_card(s);
>          } else {
>              s->prnsts |=3D SDHC_DOING_WRITE | SDHC_DAT_LINE_ACTIVE |
> -                    SDHC_SPACE_AVAILABLE | SDHC_DATA_INHIBIT;
> +                                           SDHC_DATA_INHIBIT;
>              sdhci_write_block_to_card(s);
>          }
>      }
> --
> 2.38.1
>

Tested-by: Mauro Matteo Cascella <mcascell@redhat.com>

Thank you,

--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


