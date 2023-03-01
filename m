Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8566A6DC6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:04:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXN2V-0003Io-0B; Wed, 01 Mar 2023 09:02:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXN1g-0003EE-33; Wed, 01 Mar 2023 09:02:08 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXN18-0004t2-L8; Wed, 01 Mar 2023 09:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jS7lDM92dIKHNaL0YrT6rmdbt4vCYbiz2mpbUOSShC4=; b=eJPw9jigxv43pFWXbcPkv0RflD
 C2dwcXGWtTAcZJHWrol99jiTDtROlf28AXcvPvy5IaY77tMteL75iwbaFsAYiN6FJ6rP0u7Cq1q24
 CO5JYQbvumZezgR+vc8r8RErPj7OVBGdWV0yRta58CLmtnVqMr+ID4x3EeZpl17SypKU5UAMJv9kr
 9CwNc2z1Bs5cTox2RxJUnMjXkIWs+LfiRdkOnmSZbkAxizSlzEHc4ixdOtfDA06yfHtLP/UfQtEjw
 Z9kEZx1MV/RyF65QbUcXpIt9PkPc0zl8rU6d2Ir62wivy57phJXfNzRpf2fykzt+cvRxoLQf6uNYm
 fmPzCM15jTiGTMNF3Xko+Du5letVNaNp/8QKqhovx26j3cepcNTuZL3NCapLtJ5fSnkD3wHSWXBfM
 DSeOgR7OcWrmBalP68vAKR8Xz8oQvY0l4NhDVkUOpEGmRPOt3LNsG1DtyUD9KjqvnDpctGDzvREq1
 yYxcCRMkYrAS+sFpA3Q2NfrfGn96liystwZ+pM1obAmTAL98neTSifiJNOsDQY2vDyDOLFd/daOgb
 VZ1aVR3Em/y17lGEoTg70QdExAAIEpNa6PRbAWXHaMGmwb5rlkBxbf/TCxXchWvWHlOaOzHKbAyCx
 SRzoCQ9WKm3UuRtM3DCnrse3KGEDpufnLaFX9h7/k=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXN0R-0001LF-EN; Wed, 01 Mar 2023 14:00:35 +0000
Message-ID: <3513d735-23e9-35ce-3511-1acccac7ac5c@ilande.co.uk>
Date: Wed, 1 Mar 2023 14:01:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20230223202053.117050-1-shentey@gmail.com>
 <20230223202053.117050-2-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230223202053.117050-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/5] hw/ppc/pegasos2: Initialize VT8231 PCI IRQ router
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 23/02/2023 20:20, Bernhard Beschow wrote:

> The firmware of the real PegasosII board routes all PIRQx to IRQ9, so do
> the same in QEMU. The PCI_INTERRUPT_LINE registers of the respective
> internal PCI functions are already initialized with IRQ9 which are
> currently used for routing.
> 
> Note that the PCI interrupt router isn't implemented yet in the VIA
> south bridges. This change has therefore no effect until this happens.
> 
> Inspired-by:
> <c046d77c20875c8cd8bfdc79b4619a98ffd0bf33.1677004415.git.balaton@eik.bme.hu>
> ("hw/ppc/pegasos2: Fix PCI interrupt routing")
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/pegasos2.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index a9563f4fb2..41688699eb 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -268,6 +268,12 @@ static void pegasos2_machine_reset(MachineState *machine, ShutdownCause reason)
>                                 PCI_INTERRUPT_LINE, 2, 0x9);
>       pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
>                                 0x50, 1, 0x2);
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
> +                              0x55, 1, 0x90);
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
> +                              0x56, 1, 0x99);
> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
> +                              0x57, 1, 0x90);
>   
>       pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
>                                 PCI_INTERRUPT_LINE, 2, 0x109);

The patch looks okay, but I think the commit message doesn't quite represent why it 
is required. I presume this configures the PCI IRQ router in the same way as the 
firmware so that it is possible to launch Linux directly with -kernel?


ATB,

Mark.

