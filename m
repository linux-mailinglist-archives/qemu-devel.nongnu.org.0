Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE741696DF8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:33:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS132-0000q2-G0; Tue, 14 Feb 2023 14:33:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS130-0000pn-Lm
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:33:02 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pS12z-0007no-1m
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:33:02 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 1C4716291A;
 Tue, 14 Feb 2023 22:32:55 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6407::1:7] (unknown
 [2a02:6b8:b081:6407::1:7])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 pWp2g20RWSw1-dRqH9aEu; Tue, 14 Feb 2023 22:32:54 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676403174; bh=p8Knob2ZdRiEsfWL3Ecyrh488URUuzQ8BRtD62otQyk=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=So7gYKXmwCJprFMpDpeY6RUZTd5FmwfQcoXSbF4wrvLOpQuRXQWDtaB+aaNcmnQUD
 kdtvr7HsgLxspOLpkyX0oY7ej+wfcDZlKj8DnCege1GUC+qJHPQpgo+1QHY9ALaS/p
 99dHXPxJPstwoAQr0kxy1xTpwEGBN6irRB5iCIdo=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <7339eb35-1fe1-c0bb-34e5-df5946e7e400@yandex-team.ru>
Date: Tue, 14 Feb 2023 21:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 02/16] pci/shpc: change shpc_get_status() return type
 to uint8_t
Content-Language: en-US, ru-RU
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, den-plotnikov@yandex-team.ru
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-3-vsementsov@yandex-team.ru>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <20230213140103.1518173-3-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 13/02/2023 16:00, Vladimir Sementsov-Ogievskiy wrote:
> The result of the function is always one byte. The result is always
> assigned to uint8_t variable. Also, shpc_get_status() should be
> symmetric to shpc_set_status() which has uint8_t value argument.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   hw/pci/shpc.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
> index 1b3f619dc9..5d71569b13 100644
> --- a/hw/pci/shpc.c
> +++ b/hw/pci/shpc.c
> @@ -123,10 +123,13 @@
>   #define SHPC_PCI_TO_IDX(pci_slot) ((pci_slot) - 1)
>   #define SHPC_IDX_TO_PHYSICAL(slot) ((slot) + 1)
>   
> -static uint16_t shpc_get_status(SHPCDevice *shpc, int slot, uint16_t msk)
> +static uint8_t shpc_get_status(SHPCDevice *shpc, int slot, uint16_t msk)
>   {
>       uint8_t *status = shpc->config + SHPC_SLOT_STATUS(slot);
> -    return (pci_get_word(status) & msk) >> ctz32(msk);
> +    uint16_t result = (pci_get_word(status) & msk) >> ctz32(msk);
> +
> +    assert(result <= UINT8_MAX);
> +    return result;
>   }
>   
>   static void shpc_set_status(SHPCDevice *shpc,
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>

