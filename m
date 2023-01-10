Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AA8664E91
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 23:14:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFMsJ-0008HM-FK; Tue, 10 Jan 2023 17:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFMsH-0008GH-3a; Tue, 10 Jan 2023 17:13:41 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFMsF-0006VH-Aj; Tue, 10 Jan 2023 17:13:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t611igvwRjiSo36WS/aRnVzTzJfmoT3k8TwWiH9/3AE=; b=bhFr+fmkKTeqtrbqsX8/EuOIc/
 CEVEjFLGprhB9OonD7S8yeqEV4VQa3lyN7LAy2TqolSpTpN2kVI6iUA2uWOh9rIn1vPU4LoSFQ4KM
 uvKgG9V1ovDIqdVZwa7Gdq82gX6QRsfAY2UeufWQ3zb0Bkuw5jdUnk5jRskiKommXi2k2rJjvMF/Z
 sqNgxNow/QKz/B4t+juAmd1a5QLY0nciNmjG3JRJW9xp1ZejKe2DmtO3DrauzIPSv7m7TvmE1POzT
 YWasQMQkJbMBH8jgHhweA/PDMmw2baTYCVkJwVHZzj+29tuF2kIdaT0LjPfLX+RhhPEEdjOC7D5lu
 HadtUy4PITRdjXezY9BC3HT5ohmGGZ3vKHZmYehH8Z6SVRjF3OsPDJ7wSJDCP2lWtb8DBnyIbe2h6
 cc3WLUk/wv4Q9DTrzIT6buEdvarwRrbY/F6xHHTVEgGfkopPIw+OuCJXWHZNQWdnuesgPAHwEHc8y
 Ne9gAIXzQAuBBviUbHksOYOKnVoISKWrIaGDoKFHf2hGJBiN1JUZae6+lcBf2SDgDMpi+vAA756YE
 Ih2OLIm2OkjJkh+IuciVmb65x1t6xZbZWeTQyswXd5Csrmpfsh22HXncvKKNGliWQbL8EZRipDRSL
 QcCtNV1dxCgiI8jD9FPoF7i4kFZnEYS1s2vBOvJvk=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFMro-0008S5-GM; Tue, 10 Jan 2023 22:13:16 +0000
Message-ID: <90dc466e-14ba-6f31-83d9-d0ee92edb829@ilande.co.uk>
Date: Tue, 10 Jan 2023 22:13:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <719299533b89aa4516966065eae05c75744f50d3.1672868854.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <719299533b89aa4516966065eae05c75744f50d3.1672868854.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v7 2/7] mac_{old, new}world: Use local variable instead of
 qdev_get_machine()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 04/01/2023 21:59, BALATON Zoltan wrote:

> We already have machine in a local variable so no need to use
> qdev_get_machine(), also remove now unneded line break.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 3 +--
>   hw/ppc/mac_oldworld.c | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 601ea518f8..460c14b5e3 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -466,8 +466,7 @@ static void ppc_core99_init(MachineState *machine)
>       fw_cfg = FW_CFG(dev);
>       qdev_prop_set_uint32(dev, "data_width", 1);
>       qdev_prop_set_bit(dev, "dma_enabled", false);
> -    object_property_add_child(OBJECT(qdev_get_machine()), TYPE_FW_CFG,
> -                              OBJECT(fw_cfg));
> +    object_property_add_child(OBJECT(machine), TYPE_FW_CFG, OBJECT(fw_cfg));
>       s = SYS_BUS_DEVICE(dev);
>       sysbus_realize_and_unref(s, &error_fatal);
>       sysbus_mmio_map(s, 0, CFG_ADDR);
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 558c639202..5a7b25a4a8 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -303,8 +303,7 @@ static void ppc_heathrow_init(MachineState *machine)
>       fw_cfg = FW_CFG(dev);
>       qdev_prop_set_uint32(dev, "data_width", 1);
>       qdev_prop_set_bit(dev, "dma_enabled", false);
> -    object_property_add_child(OBJECT(qdev_get_machine()), TYPE_FW_CFG,
> -                              OBJECT(fw_cfg));
> +    object_property_add_child(OBJECT(machine), TYPE_FW_CFG, OBJECT(fw_cfg));
>       s = SYS_BUS_DEVICE(dev);
>       sysbus_realize_and_unref(s, &error_fatal);
>       sysbus_mmio_map(s, 0, CFG_ADDR);

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

