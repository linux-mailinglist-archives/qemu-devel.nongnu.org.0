Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D56ECAB8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 12:53:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqtnf-0000cB-W7; Mon, 24 Apr 2023 06:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqtnb-0000bV-Os
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 06:52:00 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqtnK-0006LO-Dn
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 06:51:58 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1a526aa3dd5so47744985ad.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 03:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682333497; x=1684925497;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1gS4+HhLobTVLCW9dOsLjvzd0rgj/bnyjMeWVEZpIY8=;
 b=QFwlAo8hBx6CHyD6WoizeTdVjwAYsrcxvfC1jDN/i40YaaiL8H64Btl/X1bEVpbzB3
 iZb8Lfez3jFmgaev/7YRtsIWjAv1JnIHYo95r9Ja56ehxam6NnY1EEvo/TBRnPWH0a2A
 BkroxyM7fsZFKYLj5i7ZmmzTlJ/+D7DYzar2NgmNcl4dW8DPPu4g4nWh0PDUN+K7td/W
 GV0jLPPgzaZnh1F9m7DofBuGcmrwDhu/0d1giMzAKa/bdi7+VLPORV203kt+WWyzZ539
 UAh+lP7vXXJN6oXoIYW4ep+lQW+vigFEfKSAKryqMGwoM2fyo6aZ022t7Jfijo2iikzH
 fQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682333497; x=1684925497;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1gS4+HhLobTVLCW9dOsLjvzd0rgj/bnyjMeWVEZpIY8=;
 b=Se+8v+v1uKsaIAMsQyET0kQmhP9tTD7I7/8gnZmSSDF2eGgF1Y/QDiHILkHTOmqs6t
 Y3uhahP8D8sxxY5eRMCmBGUx2ouK+OQjEMxxjR09p4FPbPeUx/RD7Sv4aqLYK2hnRCYa
 SUhzDtoo2NFuScxQfCxdjCNYeQyv83HiDfCKysCIg2vAyVg/RJ9twrRD72ISJ7u3JmXq
 0PN8bWUgA2wcn3Cv4TofPwwSG6QAcABkOanfJKjdV1g9YuMdM6hIsNacaI2YkKasVI5a
 qDCExKQs6+kqIIcRh3p3Kz7VPfEbmixbpm84WXeEYUi5WXAWdN2jiMpy2KALlLFw8211
 flnQ==
X-Gm-Message-State: AAQBX9eu9gzZkW+kU5LYf4tUxZ33KTNMC4flaMKmmCoBDnJiVlb8BSQD
 7ttHPPCKlZzhiGeIszSbJamMEg==
X-Google-Smtp-Source: AKy350bLI9R4ya2c/KM2ci0CODkTClZ4pxNII8EMiff+vpFxcnkI1F3MifrZDEiP6dxEaRx5e2hdVQ==
X-Received: by 2002:a17:902:f651:b0:1a2:85f0:e73d with SMTP id
 m17-20020a170902f65100b001a285f0e73dmr14419067plg.33.1682333496702; 
 Mon, 24 Apr 2023 03:51:36 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 ga21-20020a17090b039500b0023b4d4ca3a9sm6126180pjb.50.2023.04.24.03.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 03:51:36 -0700 (PDT)
Message-ID: <410c76a1-8d1d-1835-6676-83e913f5ae24@daynix.com>
Date: Mon, 24 Apr 2023 19:51:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 06/47] igb: Clear IMS bits when committing ICR access
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
 <20230423041833.5302-7-akihiko.odaki@daynix.com>
 <DBBP189MB1433159BD5A688E92C00BA8595679@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <DBBP189MB1433159BD5A688E92C00BA8595679@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-2.143, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2023/04/24 18:29, Sriram Yagnaraman wrote:
>> -----Original Message-----
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Sent: Sunday, 23 April 2023 06:18
>> Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>; Jason Wang
>> <jasowang@redhat.com>; Dmitry Fleytman <dmitry.fleytman@gmail.com>;
>> Michael S . Tsirkin <mst@redhat.com>; Alex Bennée
>> <alex.bennee@linaro.org>; Philippe Mathieu-Daudé <philmd@linaro.org>;
>> Thomas Huth <thuth@redhat.com>; Wainer dos Santos Moschetta
>> <wainersm@redhat.com>; Beraldo Leal <bleal@redhat.com>; Cleber Rosa
>> <crosa@redhat.com>; Laurent Vivier <lvivier@redhat.com>; Paolo Bonzini
>> <pbonzini@redhat.com>; qemu-devel@nongnu.org; Tomasz Dzieciol
>> <t.dzieciol@partner.samsung.com>; Akihiko Odaki
>> <akihiko.odaki@daynix.com>
>> Subject: [PATCH v3 06/47] igb: Clear IMS bits when committing ICR access
>>
>> The datasheet says contradicting statements regarding ICR accesses so it is not
>> reliable to determine the behavior of ICR accesses. However, e1000e does
>> clear IMS bits when reading ICR accesses and Linux also expects ICR accesses
>> will clear IMS bits according to:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/
>> net/ethernet/intel/igb/igb_main.c?h=v6.2#n8048
>>
>> Fixes: 3a977deebe ("Intrdocue igb device emulation")
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   hw/net/igb_core.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c index
>> 96a118b6c1..eaca5bd2b6 100644
>> --- a/hw/net/igb_core.c
>> +++ b/hw/net/igb_core.c
>> @@ -2452,16 +2452,16 @@ igb_set_ims(IGBCore *core, int index, uint32_t
>> val)  static void igb_commit_icr(IGBCore *core)  {
>>       /*
>> -     * If GPIE.NSICR = 0, then the copy of IAM to IMS will occur only if at
>> +     * If GPIE.NSICR = 0, then the clear of IMS will occur only if at
>>        * least one bit is set in the IMS and there is a true interrupt as
>>        * reflected in ICR.INTA.
>>        */
>>       if ((core->mac[GPIE] & E1000_GPIE_NSICR) ||
>>           (core->mac[IMS] && (core->mac[ICR] & E1000_ICR_INT_ASSERTED))) {
>> -        igb_set_ims(core, IMS, core->mac[IAM]);
>> -    } else {
>> -        igb_update_interrupt_state(core);
>> +        igb_clear_ims_bits(core, core->mac[IAM]);
>>       }
>> +
>> +    igb_update_interrupt_state(core);
>>   }
>>
>>   static void igb_set_icr(IGBCore *core, int index, uint32_t val)
>> --
>> 2.40.0
> 
> Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> 
> An additional question, should ICR be cleared if an actual interrupt was asserted?
> (According to 7.3.2.11 GPIE: Non Selective Interrupt clear on read: When set, every read of ICR clears it. When this bit is cleared, an ICR read causes it to be cleared only if an actual interrupt was asserted or IMS = 0b.)
> Something like this?

That is handled in igb_commit_icr(), which is renamed to igb_nsicr() in 
patch "igb: Notify only new interrupts".

> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index eaca5bd2b6..aaaf80e4a3 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -2529,6 +2529,9 @@ igb_mac_icr_read(IGBCore *core, int index)
>       } else if (core->mac[IMS] == 0) {
>           trace_e1000e_irq_icr_clear_zero_ims();
>           core->mac[ICR] = 0;
> +    } else if (core->mac[ICR] & E1000_ICR_INT_ASSERTED) {
> +        e1000e_irq_icr_clear_iame();
> +        core->mac[ICR] = 0;
>       } else if (!msix_enabled(core->owner)) {
>           trace_e1000e_irq_icr_clear_nonmsix_icr_read();
>           core->mac[ICR] = 0;

