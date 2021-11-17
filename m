Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61587454E32
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 20:53:58 +0100 (CET)
Received: from localhost ([::1]:48562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnR0H-0001IQ-Gm
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 14:53:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <valesini@yandex-team.ru>)
 id 1mnPRF-0007t8-Df
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 13:13:41 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:38838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <valesini@yandex-team.ru>)
 id 1mnPRA-0005X0-86
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 13:13:39 -0500
Received: from vla1-a78d115f8d22.qloud-c.yandex.net
 (vla1-a78d115f8d22.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:2906:0:640:a78d:115f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id B82742E0A7B;
 Wed, 17 Nov 2021 21:13:29 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-a78d115f8d22.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 pPZeSmzklO-DTs4KLL7; Wed, 17 Nov 2021 21:13:29 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1637172809; bh=9sb75ePJBbBa1u4Svh3n0jdjj5xDaPi+Qv8xUIgle0s=;
 h=In-Reply-To:References:Date:From:To:Subject:Message-ID:Cc;
 b=QUM5XyG11woehA2g+EcuMwcB1M7asDnPMXQbbgiomJ8ROHMk/ePrWvpsvWceSxjWe
 0x11ozjIQ0Anpuz07GPGDIqoxpxFLAzTffrCNOdMMqXqW1fK6vHZdIAr7LhV69nHBK
 XZbXj+JCoyiD2TXA/YIqKfZerehjJJBfpKrp2hIc=
Authentication-Results: vla1-a78d115f8d22.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from [IPv6:2a02:6b8:b081:1306::1:16] (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1306::1:16])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 VGgtTALyYy-DTxabmb9; Wed, 17 Nov 2021 21:13:29 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Subject: Re: [PATCH v1] hw/i386/amd_iommu: clean up broken event logging
To: Daniil Tatianin <d-tatianin@yandex-team.ru>, qemu-devel@nongnu.org
References: <20211117144641.837227-1-d-tatianin@yandex-team.ru>
From: Valentin Sinitsyn <valesini@yandex-team.ru>
Message-ID: <76c294d0-37fb-cdbb-98e4-9363ba5f66ee@yandex-team.ru>
Date: Wed, 17 Nov 2021 23:13:27 +0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211117144641.837227-1-d-tatianin@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=valesini@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 17 Nov 2021 14:50:58 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, yc-core@yandex-team.ru, ehabkost@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 17.11.2021 19:46, Daniil Tatianin wrote:
> - Don't create evt buffer in every function where we want to log,
>    instead make amdvi_log_event construct the buffer in-place using the
>    arguments it was given.
> 
> - Correctly place address & info in the event buffer. Previously both
>    would get shifted to incorrect bit offsets leading to evt containing
>    uninitialized event type and address.
> 
> - Reduce buffer size from 32 to 16 bytes, which is the amount of bytes
>    actually needed for event storage.
> 
> - Remove amdvi_encode_event & amdvi_setevent_bits, as they are no longer
>    needed.
> 
> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> ---
>   hw/i386/amd_iommu.c | 62 ++++++++++-----------------------------------
>   1 file changed, 14 insertions(+), 48 deletions(-)
> 
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index fd75cae024..44b995be91 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -164,8 +164,14 @@ static void amdvi_generate_msi_interrupt(AMDVIState *s)
>       }
>   }
>   
> -static void amdvi_log_event(AMDVIState *s, uint64_t *evt)
> +static void amdvi_log_event(AMDVIState *s, uint16_t devid,
> +                            hwaddr addr, uint16_t info)
>   {
> +    uint64_t evt[2] = {
> +        devid | ((uint64_t)info << 48),
> +        addr
> +    };
> +
>       /* event logging not enabled */
>       if (!s->evtlog_enabled || amdvi_test_mask(s, AMDVI_MMIO_STATUS,
>           AMDVI_MMIO_STATUS_EVT_OVF)) {
> @@ -190,27 +196,6 @@ static void amdvi_log_event(AMDVIState *s, uint64_t *evt)
>       amdvi_generate_msi_interrupt(s);
>   }
>   
> -static void amdvi_setevent_bits(uint64_t *buffer, uint64_t value, int start,
> -                                int length)
> -{
> -    int index = start / 64, bitpos = start % 64;
> -    uint64_t mask = MAKE_64BIT_MASK(start, length);
> -    buffer[index] &= ~mask;
> -    buffer[index] |= (value << bitpos) & mask;
> -}
> -/*
> - * AMDVi event structure
> - *    0:15   -> DeviceID
> - *    55:63  -> event type + miscellaneous info
> - *    63:127 -> related address
Did you mean 64:127? Fields shouldn't overlap, and 65-bit address looks 
suspicious.

> - */
> -static void amdvi_encode_event(uint64_t *evt, uint16_t devid, uint64_t addr,
> -                               uint16_t info)
> -{
> -    amdvi_setevent_bits(evt, devid, 0, 16);
> -    amdvi_setevent_bits(evt, info, 55, 8);
> -    amdvi_setevent_bits(evt, addr, 63, 64);
> -}
>   /* log an error encountered during a page walk
>    *
>    * @addr: virtual address in translation request
> @@ -218,11 +203,8 @@ static void amdvi_encode_event(uint64_t *evt, uint16_t devid, uint64_t addr,
>   static void amdvi_page_fault(AMDVIState *s, uint16_t devid,
>                                hwaddr addr, uint16_t info)
>   {
> -    uint64_t evt[4];
> -
>       info |= AMDVI_EVENT_IOPF_I | AMDVI_EVENT_IOPF;
> -    amdvi_encode_event(evt, devid, addr, info);
> -    amdvi_log_event(s, evt);
> +    amdvi_log_event(s, devid, addr, info);
>       pci_word_test_and_set_mask(s->pci.dev.config + PCI_STATUS,
>               PCI_STATUS_SIG_TARGET_ABORT);
>   }
> @@ -232,14 +214,10 @@ static void amdvi_page_fault(AMDVIState *s, uint16_t devid,
>    *  @info : error flags
>    */
>   static void amdvi_log_devtab_error(AMDVIState *s, uint16_t devid,
> -                                   hwaddr devtab, uint16_t info)
> +                                   hwaddr addr, uint16_t info)
>   {
> -    uint64_t evt[4];
> -
>       info |= AMDVI_EVENT_DEV_TAB_HW_ERROR;
> -
> -    amdvi_encode_event(evt, devid, devtab, info);
> -    amdvi_log_event(s, evt);
> +    amdvi_log_event(s, devid, addr, info);
>       pci_word_test_and_set_mask(s->pci.dev.config + PCI_STATUS,
>               PCI_STATUS_SIG_TARGET_ABORT);
>   }
> @@ -248,10 +226,7 @@ static void amdvi_log_devtab_error(AMDVIState *s, uint16_t devid,
>    */
>   static void amdvi_log_command_error(AMDVIState *s, hwaddr addr)
>   {
> -    uint64_t evt[4], info = AMDVI_EVENT_COMMAND_HW_ERROR;
> -
> -    amdvi_encode_event(evt, 0, addr, info);
> -    amdvi_log_event(s, evt);
> +    amdvi_log_event(s, 0, addr, AMDVI_EVENT_COMMAND_HW_ERROR);
>       pci_word_test_and_set_mask(s->pci.dev.config + PCI_STATUS,
>               PCI_STATUS_SIG_TARGET_ABORT);
>   }
> @@ -261,11 +236,8 @@ static void amdvi_log_command_error(AMDVIState *s, hwaddr addr)
>   static void amdvi_log_illegalcom_error(AMDVIState *s, uint16_t info,
>                                          hwaddr addr)
>   {
> -    uint64_t evt[4];
> -
>       info |= AMDVI_EVENT_ILLEGAL_COMMAND_ERROR;
> -    amdvi_encode_event(evt, 0, addr, info);
> -    amdvi_log_event(s, evt);
> +    amdvi_log_event(s, 0, addr, info);
>   }
>   /* log an error accessing device table
>    *
> @@ -276,11 +248,8 @@ static void amdvi_log_illegalcom_error(AMDVIState *s, uint16_t info,
>   static void amdvi_log_illegaldevtab_error(AMDVIState *s, uint16_t devid,
>                                             hwaddr addr, uint16_t info)
>   {
> -    uint64_t evt[4];
> -
>       info |= AMDVI_EVENT_ILLEGAL_DEVTAB_ENTRY;
> -    amdvi_encode_event(evt, devid, addr, info);
> -    amdvi_log_event(s, evt);
> +    amdvi_log_event(s, devid, addr, info);
>   }
>   /* log an error accessing a PTE entry
>    * @addr : address that couldn't be accessed
> @@ -288,11 +257,8 @@ static void amdvi_log_illegaldevtab_error(AMDVIState *s, uint16_t devid,
>   static void amdvi_log_pagetab_error(AMDVIState *s, uint16_t devid,
>                                       hwaddr addr, uint16_t info)
>   {
> -    uint64_t evt[4];
> -
>       info |= AMDVI_EVENT_PAGE_TAB_HW_ERROR;
> -    amdvi_encode_event(evt, devid, addr, info);
> -    amdvi_log_event(s, evt);
> +    amdvi_log_event(s, devid, addr, info);
>       pci_word_test_and_set_mask(s->pci.dev.config + PCI_STATUS,
>                PCI_STATUS_SIG_TARGET_ABORT);
>   }
> 

-- 
Best,
Valentine Sinitsyn

