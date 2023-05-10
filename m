Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0356FD610
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 07:15:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwc8O-0004k3-F0; Wed, 10 May 2023 01:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pwc8L-0004jn-0S
 for qemu-devel@nongnu.org; Wed, 10 May 2023 01:13:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pwc88-0007Vb-Dd
 for qemu-devel@nongnu.org; Wed, 10 May 2023 01:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683695565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6zQ1y9WGn3Qt0lNBGZQN0PF3Zq+wH9Cvrh8CrJ38qf4=;
 b=S0ZoXqqpKo0te6A/geu//BHzJgEoGWK9BruSMtwmJsz4IAesh6gXZNihYUZlONK59iki0w
 tF8TEdYOpZ8Vc7im8DTR8XFmFO9EYNJG5nPvqgq7C9mrzjwD4xp17urxVdZSJLNYrNn9tc
 kcH+3iaR2UxnYQGAQxeaJa4A8dzinwU=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-Kxw8AYwbNQyQA0k0Qv7usg-1; Wed, 10 May 2023 01:12:43 -0400
X-MC-Unique: Kxw8AYwbNQyQA0k0Qv7usg-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1aad7096521so39037655ad.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 22:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683695563; x=1686287563;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6zQ1y9WGn3Qt0lNBGZQN0PF3Zq+wH9Cvrh8CrJ38qf4=;
 b=TRpAMA1UfcKoSDhzeu/6N9XIf9doCrsNj0KcfuGs/ESsVvodK80Hov7ARmxA+9ca9B
 Z3U/c12GZtEic3ow1up3EI8pCNCslwyqOVFvg0loq0NhDQ8+0NH+y6c9pFr5LfVAK2s4
 sM3dEA+FS4DTSnqu2fNz+ZzvOxX3+ZjHRUOne6B6CZY3oHpmAknkLPIlaqwrUFK4w6Ef
 OYufx/KdwqE6TQ8I0qCcacsFAdt/UHM02Q2tKHvnA1yPYBPBTt4TvFO0nI3L6hy6ty3/
 L6TdHjZIbh4OzeioIS3q41D91ZX/y/yTM2KWBE3At78BfOuXHJmFHl1rawE8DBE3lYIb
 VKoQ==
X-Gm-Message-State: AC+VfDx4eCdwVE19ZVJFr6m3iTG+kjNonV49f5clqsuTUDhcOkOAj1Oz
 n56CK6xpOtWPpzmh4a1hD/VF3+On5aEZMPH4GaE4gJdSvRrSLJ2DAVT6e3+XphYP6oVDllUjrPd
 0SvqndTMSO8Td0tw=
X-Received: by 2002:a17:903:18d:b0:1ac:b363:83a6 with SMTP id
 z13-20020a170903018d00b001acb36383a6mr1129524plg.17.1683695563044; 
 Tue, 09 May 2023 22:12:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ56kD8dFfpbwuxtckTMrPiHCuxn47lhtPNRjt3CXEfwvrqjGDVi6aGJLnz12X+N8lqJBZuXrw==
X-Received: by 2002:a17:903:18d:b0:1ac:b363:83a6 with SMTP id
 z13-20020a170903018d00b001acb36383a6mr1129509plg.17.1683695562761; 
 Tue, 09 May 2023 22:12:42 -0700 (PDT)
Received: from [10.72.13.243] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a170902d34600b001a800e03cf9sm2619707plk.256.2023.05.09.22.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 22:12:42 -0700 (PDT)
Message-ID: <8d5415d9-b470-84d5-dbd0-01ee63647e79@redhat.com>
Date: Wed, 10 May 2023 13:12:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 1/1] e1000e: Fix tx/rx counters
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>, timothee.cocault@gmail.com,
 qemu-devel@nongnu.org
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>
References: <366bbcafdb6e0373f0deb105153768a8c0bded87.camel@gmail.com>
 <6b31f5f523af93d47cac37509caf8036e183e136.camel@gmail.com>
 <5bae2d2d-b28e-00c9-e6a3-2b0deb8e4e59@daynix.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <5bae2d2d-b28e-00c9-e6a3-2b0deb8e4e59@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


在 2023/4/10 23:33, Akihiko Odaki 写道:
> On 2023/04/11 0:27, timothee.cocault@gmail.com wrote:
>> The bytes and packets counter registers are cleared on read.
>>
>> Copying the "total counter" registers to the "good counter" registers 
>> has
>> side effects.
>> If the "total" register is never read by the OS, it only gets 
>> incremented.
>> This leads to exponential growth of the "good" register.
>>
>> This commit increments the counters individually to avoid this.
>>
>> Signed-off-by: Timothée Cocault <timothee.cocault@gmail.com>
>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>


Queued.

Thanks


>
>> ---
>>   hw/net/e1000.c         | 5 ++---
>>   hw/net/e1000e_core.c   | 5 ++---
>>   hw/net/e1000x_common.c | 5 ++---
>>   hw/net/igb_core.c      | 5 ++---
>>   4 files changed, 8 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
>> index 23d660619f..59bacb5d3b 100644
>> --- a/hw/net/e1000.c
>> +++ b/hw/net/e1000.c
>> @@ -637,9 +637,8 @@ xmit_seg(E1000State *s)
>>         e1000x_inc_reg_if_not_full(s->mac_reg, TPT);
>>       e1000x_grow_8reg_if_not_full(s->mac_reg, TOTL, s->tx.size + 4);
>> -    s->mac_reg[GPTC] = s->mac_reg[TPT];
>> -    s->mac_reg[GOTCL] = s->mac_reg[TOTL];
>> -    s->mac_reg[GOTCH] = s->mac_reg[TOTH];
>> +    e1000x_inc_reg_if_not_full(s->mac_reg, GPTC);
>> +    e1000x_grow_8reg_if_not_full(s->mac_reg, GOTCL, s->tx.size + 4);
>>   }
>>     static void
>> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
>> index c0c09b6965..cfa3f55e96 100644
>> --- a/hw/net/e1000e_core.c
>> +++ b/hw/net/e1000e_core.c
>> @@ -711,9 +711,8 @@ e1000e_on_tx_done_update_stats(E1000ECore *core, 
>> struct NetTxPkt *tx_pkt)
>>           g_assert_not_reached();
>>       }
>>   -    core->mac[GPTC] = core->mac[TPT];
>> -    core->mac[GOTCL] = core->mac[TOTL];
>> -    core->mac[GOTCH] = core->mac[TOTH];
>> +    e1000x_inc_reg_if_not_full(core->mac, GPTC);
>> +    e1000x_grow_8reg_if_not_full(core->mac, GOTCL, tot_len);
>>   }
>>     static void
>> diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
>> index b844af590a..4c8e7dcf70 100644
>> --- a/hw/net/e1000x_common.c
>> +++ b/hw/net/e1000x_common.c
>> @@ -220,15 +220,14 @@ e1000x_update_rx_total_stats(uint32_t *mac,
>>         e1000x_increase_size_stats(mac, PRCregs, data_fcs_size);
>>       e1000x_inc_reg_if_not_full(mac, TPR);
>> -    mac[GPRC] = mac[TPR];
>> +    e1000x_inc_reg_if_not_full(mac, GPRC);
>>       /* TOR - Total Octets Received:
>>       * This register includes bytes received in a packet from the 
>> <Destination
>>       * Address> field through the <CRC> field, inclusively.
>>       * Always include FCS length (4) in size.
>>       */
>>       e1000x_grow_8reg_if_not_full(mac, TORL, data_size + 4);
>> -    mac[GORCL] = mac[TORL];
>> -    mac[GORCH] = mac[TORH];
>> +    e1000x_grow_8reg_if_not_full(mac, GORCL, data_size + 4);
>>   }
>>     void
>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
>> index d733fed6cf..826e7a6cf1 100644
>> --- a/hw/net/igb_core.c
>> +++ b/hw/net/igb_core.c
>> @@ -538,9 +538,8 @@ igb_on_tx_done_update_stats(IGBCore *core, struct 
>> NetTxPkt *tx_pkt, int qn)
>>           g_assert_not_reached();
>>       }
>>   -    core->mac[GPTC] = core->mac[TPT];
>> -    core->mac[GOTCL] = core->mac[TOTL];
>> -    core->mac[GOTCH] = core->mac[TOTH];
>> +    e1000x_inc_reg_if_not_full(core->mac, GPTC);
>> +    e1000x_grow_8reg_if_not_full(core->mac, GOTCL, tot_len);
>>         if (core->mac[MRQC] & 1) {
>>           uint16_t pool = qn % IGB_NUM_VM_POOLS;
>


