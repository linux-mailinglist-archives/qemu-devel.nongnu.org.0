Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFD367FD16
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 07:17:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM0z2-0006bR-51; Sun, 29 Jan 2023 01:16:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pM0z0-0006bE-4i
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 01:16:06 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pM0yv-0004hz-3v
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 01:16:05 -0500
Received: by mail-pj1-x1032.google.com with SMTP id 88so8410549pjo.3
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 22:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IwkTKhZhmr2X/flFUBjfexZWg4rmUF71CWk3X1lpFgE=;
 b=2q/QHnnLJAy+UAzm6050hLGF78zAVLGQVWhDbHpHDC6aqpn62X1vmxXbi86ZBc5tjv
 OlXr8iZtC3leoiwULAW3t1MAa9oqDFgFJ54EyYqv60ed8ffoxEocnNo3CqUAu53B8NfE
 NEzuzhsM/slA6O01DCRoZHp72qAZ0HLy+hY8ES/n6AWqW9JP5RDW2L53oXAg1zWd4U32
 KrcaL6FIzh2o6vrMbhd8KK5hoccb48apQiBLsHKK5UZmxp6jz6VEN1Vxqumqj4LR6hOr
 qTp117ZzVbXrzDDhltIHgWGQRH5wD8vXOUryrYS2NNxZ6FskFac5T6sy64bCy0fOHsxi
 2p5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IwkTKhZhmr2X/flFUBjfexZWg4rmUF71CWk3X1lpFgE=;
 b=A3HvayXShwV554bRtM9lm/cxj/Jgp5nJyud/sN3QESKrDGcQmlLbIs5rcLbtzngwkq
 CLGvcYl3wh0Q89V/F57snQftyRI4dtYP450lT9qz1I+6gXUrwnbS7ihP88v88L6mGvJJ
 kRe61PiVsSZhfn3wgUPF/K5gumODRZFNL9JbFZGO5uN5cF72mBUfV9ZDgUfXWt8DN45a
 vC5Y/tntVCNdK92eidCW9VKrJVMbobQgSfmA4diXUwdNTL5Wpu/6ajHhtdMhnLMQ8JvF
 /LR2cJRasakEvd4C8NuZP4TXmg9vzKeH+Kb6Vq8dCq3u5h3GFZGSc5gZJCmJ9/J9Hano
 IyjQ==
X-Gm-Message-State: AO0yUKVdTrJTgPC5+75iXJfAwvHBQVKnLXf/0ABQji99prOEHJeq1roO
 TpI4Ixm9Xtc2OytyE0pWcnBcqg==
X-Google-Smtp-Source: AK7set9j/wN4y1QhXPqKNmwotzBHSrNZDFjm5KPZDy9lbPHGYc49uU/uzkszFDVu4bQUd3F2QDlUQA==
X-Received: by 2002:a17:903:41c1:b0:196:7c15:cada with SMTP id
 u1-20020a17090341c100b001967c15cadamr1124371ple.4.1674972959290; 
 Sat, 28 Jan 2023 22:15:59 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a170902b10500b00192740bb02dsm5423542plr.45.2023.01.28.22.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 22:15:58 -0800 (PST)
Message-ID: <714504e4-fb71-495f-13af-3514b66ef4c1@daynix.com>
Date: Sun, 29 Jan 2023 15:15:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/9] igb: handle PF/VF reset properly
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
 <20230128134633.22730-3-sriram.yagnaraman@est.tech>
 <0d67b3aa-fd43-b445-8fdc-68f965c143d1@daynix.com>
In-Reply-To: <0d67b3aa-fd43-b445-8fdc-68f965c143d1@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/01/29 14:58, Akihiko Odaki wrote:
> On 2023/01/28 22:46, Sriram Yagnaraman wrote:
>> Use PFRSTD to reset RSTI bit for VFs, and raise VFLRE interrupt when VF
>> is reset.
>>
>> Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
>> ---
>>   hw/net/e1000x_regs.h |  1 +
>>   hw/net/igb_core.c    | 33 +++++++++++++++++++++------------
>>   hw/net/trace-events  |  2 ++
>>   3 files changed, 24 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h
>> index fb5b861135..bb3fb36b8d 100644
>> --- a/hw/net/e1000x_regs.h
>> +++ b/hw/net/e1000x_regs.h
>> @@ -548,6 +548,7 @@
>>   #define E1000_CTRL_EXT_ASDCHK  0x00001000 /* auto speed detection 
>> check */
>>   #define E1000_CTRL_EXT_EE_RST  0x00002000 /* EEPROM reset */
>> +#define E1000_CTRL_EXT_PFRSTD  0x00004000 /* PF reset done indication */
>>   #define E1000_CTRL_EXT_LINK_EN 0x00010000 /* enable link status from 
>> external LINK_0 and LINK_1 pins */
>>   #define E1000_CTRL_EXT_DRV_LOAD 0x10000000 /* Driver loaded bit for 
>> FW */
>>   #define E1000_CTRL_EXT_EIAME   0x01000000
>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
>> index abeb9c7889..9bd53cc25f 100644
>> --- a/hw/net/igb_core.c
>> +++ b/hw/net/igb_core.c
>> @@ -1902,14 +1902,6 @@ static void igb_set_eims(IGBCore *core, int 
>> index, uint32_t val)
>>       igb_update_interrupt_state(core);
>>   }
>> -static void igb_vf_reset(IGBCore *core, uint16_t vfn)
>> -{
>> -    /* TODO: Reset of the queue enable and the interrupt registers of 
>> the VF. */
>> -
>> -    core->mac[V2PMAILBOX0 + vfn] &= ~E1000_V2PMAILBOX_RSTI;
>> -    core->mac[V2PMAILBOX0 + vfn] = E1000_V2PMAILBOX_RSTD;
>> -}
>> -
>>   static void mailbox_interrupt_to_vf(IGBCore *core, uint16_t vfn)
>>   {
>>       uint32_t ent = core->mac[VTIVAR_MISC + vfn];
>> @@ -1987,6 +1979,17 @@ static void igb_set_vfmailbox(IGBCore *core, 
>> int index, uint32_t val)
>>       }
>>   }
>> +static void igb_vf_reset(IGBCore *core, uint16_t vfn)
>> +{
>> +    /* disable Rx and Tx for the VF*/
>> +    core->mac[VFTE] &= ~BIT(vfn);
>> +    core->mac[VFRE] &= ~BIT(vfn);
>> +    /* indicate VF reset to PF */
>> +    core->mac[VFLRE] |= BIT(vfn);
>> +    /* VFLRE and mailbox use the same interrupt cause */
>> +    mailbox_interrupt_to_pf(core);
>> +}
>> +
> 
> Please do not move the function unless you have a legitimate reason for 
> that.

I got it. It is necessary to refer mailbox_interrupt_to_pf().

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

> 
>>   static void igb_w1c(IGBCore *core, int index, uint32_t val)
>>   {
>>       core->mac[index] &= ~val;
>> @@ -2241,14 +2244,20 @@ igb_set_status(IGBCore *core, int index, 
>> uint32_t val)
>>   static void
>>   igb_set_ctrlext(IGBCore *core, int index, uint32_t val)
>>   {
>> -    trace_e1000e_link_set_ext_params(!!(val & E1000_CTRL_EXT_ASDCHK),
>> -                                     !!(val & E1000_CTRL_EXT_SPD_BYPS));
>> -
>> -    /* TODO: PFRSTD */
>> +    trace_igb_link_set_ext_params(!!(val & E1000_CTRL_EXT_ASDCHK),
>> +                                  !!(val & E1000_CTRL_EXT_SPD_BYPS),
>> +                                  !!(val & E1000_CTRL_EXT_PFRSTD));
>>       /* Zero self-clearing bits */
>>       val &= ~(E1000_CTRL_EXT_ASDCHK | E1000_CTRL_EXT_EE_RST);
>>       core->mac[CTRL_EXT] = val;
>> +
>> +    if (core->mac[CTRL_EXT] & E1000_CTRL_EXT_PFRSTD) {
>> +        for (int vfn = 0; vfn < IGB_MAX_VF_FUNCTIONS; vfn++) {
>> +            core->mac[V2PMAILBOX0 + vfn] &= ~E1000_V2PMAILBOX_RSTI;
>> +            core->mac[V2PMAILBOX0 + vfn] |= E1000_V2PMAILBOX_RSTD;
>> +        }
>> +    }
>>   }
>>   static void
>> diff --git a/hw/net/trace-events b/hw/net/trace-events
>> index 2f791b9b57..e94172e748 100644
>> --- a/hw/net/trace-events
>> +++ b/hw/net/trace-events
>> @@ -281,6 +281,8 @@ igb_core_mdic_read_unhandled(uint32_t addr) "MDIC 
>> READ: PHY[%u] UNHANDLED"
>>   igb_core_mdic_write(uint32_t addr, uint32_t data) "MDIC WRITE: 
>> PHY[%u] = 0x%x"
>>   igb_core_mdic_write_unhandled(uint32_t addr) "MDIC WRITE: PHY[%u] 
>> UNHANDLED"
>> +igb_link_set_ext_params(bool asd_check, bool speed_select_bypass, 
>> bool pfrstd) "Set extended link params: ASD check: %d, Speed select 
>> bypass: %d, PF reset done: %d"
>> +
>>   igb_rx_desc_buff_size(uint32_t b) "buffer size: %u"
>>   igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* 
>> source, uint32_t len) "addr: 0x%"PRIx64", offset: %u, from: %p, 
>> length: %u"

