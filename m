Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997BF2C9721
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 06:47:45 +0100 (CET)
Received: from localhost ([::1]:60134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjyVs-0000D2-LC
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 00:47:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kjyUV-00087i-MZ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 00:46:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kjyUT-0004td-Mz
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 00:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606801576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jSX6ST2LZIAUeOeeBMfKnkZp1UJg0esRKKUjwkqITVg=;
 b=g/LXfv2RAiqat87cAt/7Qsf2pqPF6fAQxOHYgeOjtHOtxvO2xM/iErWAorzagzvCuhVWJ2
 4n+mAX6Pgto+fnAmw772Nspxi7A76ID7HB49K16h8H0KDvn6uYIqRbH7nApiECZZX/nNbC
 +/MxKSf+taKzncrSs/MQO9axDnKtpPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-6IKPlKCPNeyE8fQcz8lP_Q-1; Tue, 01 Dec 2020 00:46:14 -0500
X-MC-Unique: 6IKPlKCPNeyE8fQcz8lP_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 244CE1E7C8;
 Tue,  1 Dec 2020 05:46:13 +0000 (UTC)
Received: from [10.72.13.167] (ovpn-13-167.pek2.redhat.com [10.72.13.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F55460BE2;
 Tue,  1 Dec 2020 05:46:10 +0000 (UTC)
Subject: Re: [PATCH] hw/net/dp8393x: fix integer underflow in
 dp8393x_do_transmit_packets()
To: Mauro Matteo Cascella <mcascell@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20201124092445.658647-1-mcascell@redhat.com>
 <48d8ae85-3292-921a-f249-3b88a1141cc9@amsat.org>
 <CAA8xKjXJq00HtKNJc0HVAhXXftFHEGLj_KXaiy7M9_2WvgNRrQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cc15cf81-aaf9-0886-b988-61b6314648b9@redhat.com>
Date: Tue, 1 Dec 2020 13:46:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAA8xKjXJq00HtKNJc0HVAhXXftFHEGLj_KXaiy7M9_2WvgNRrQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pgn@zju.edu.cn, QEMU Developers <qemu-devel@nongnu.org>,
 Finn Thain <fthain@telegraphics.com.au>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/30 下午8:11, Mauro Matteo Cascella wrote:
> On Mon, Nov 30, 2020 at 11:44 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> +Laurent/Finn
>>
>> On 11/24/20 10:24 AM, Mauro Matteo Cascella wrote:
>>> An integer underflow could occur during packet transmission due to 'tx_len' not
>>> being updated if SONIC_TFC register is set to zero. Check for negative 'tx_len'
>>> when removing existing FCS.
>>>
>>> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1899722
>>> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
>>> Reported-by: Gaoning Pan <pgn@zju.edu.cn>
>>> ---
>>>   hw/net/dp8393x.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
>>> index 674b04b354..205c0decc5 100644
>>> --- a/hw/net/dp8393x.c
>>> +++ b/hw/net/dp8393x.c
>>> @@ -495,6 +495,10 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
>>>           } else {
>>>               /* Remove existing FCS */
>>>               tx_len -= 4;
>>> +            if (tx_len < 0) {
>>> +                SONIC_ERROR("tx_len is %d\n", tx_len);
>>> +                break;
>>> +            }
>>>           }
>>>
>>>           if (s->regs[SONIC_RCR] & (SONIC_RCR_LB1 | SONIC_RCR_LB0)) {
>>>
>> Doesn't it make more sense to check 'tx_len >= 4'
>> and skip tx/rx when 'tx_len == 0'?
>>
> Yes, it makes sense. I thought that skipping tx/rx in case of null
> 'tx_len' could lead to potential inconsistencies when writing the
> status or reading the footer of the packet. but I'm not really sure. I
> can send a new version of the patch if needed, otherwise feel free to
> apply your changes. Thank you.


I think we can go with this patch first and tweak on top consider it's 
near the release. So:

Acked-by: Jason Wang <jasowang@redhat.com>

Peter, do you want to merge this patch?

Thanks


>
>> -- >8 --
>> @@ -488,25 +488,29 @@ static void
>> dp8393x_do_transmit_packets(dp8393xState *s)
>>               }
>>           }
>>
>> -        /* Handle Ethernet checksum */
>> -        if (!(s->regs[SONIC_TCR] & SONIC_TCR_CRCI)) {
>> -            /* Don't append FCS there, to look like slirp packets
>> -             * which don't have one */
>> -        } else {
>> -            /* Remove existing FCS */
>> -            tx_len -= 4;
>> +        if (tx_len >= 4) {
>> +            /* Handle Ethernet checksum */
>> +            if (!(s->regs[SONIC_TCR] & SONIC_TCR_CRCI)) {
>> +                /* Don't append FCS there, to look like slirp packets
>> +                 * which don't have one */
>> +            } else {
>> +                /* Remove existing FCS */
>> +                tx_len -= 4;
>> +            }
>>           }
>>
>> -        if (s->regs[SONIC_RCR] & (SONIC_RCR_LB1 | SONIC_RCR_LB0)) {
>> -            /* Loopback */
>> -            s->regs[SONIC_TCR] |= SONIC_TCR_CRSL;
>> -            if (nc->info->can_receive(nc)) {
>> -                s->loopback_packet = 1;
>> -                nc->info->receive(nc, s->tx_buffer, tx_len);
>> +        if (tx_len > 0) {
>> +            if (s->regs[SONIC_RCR] & (SONIC_RCR_LB1 | SONIC_RCR_LB0)) {
>> +                /* Loopback */
>> +                s->regs[SONIC_TCR] |= SONIC_TCR_CRSL;
>> +                if (nc->info->can_receive(nc)) {
>> +                    s->loopback_packet = 1;
>> +                    nc->info->receive(nc, s->tx_buffer, tx_len);
>> +                }
>> +            } else {
>> +                /* Transmit packet */
>> +                qemu_send_packet(nc, s->tx_buffer, tx_len);
>>               }
>> -        } else {
>> -            /* Transmit packet */
>> -            qemu_send_packet(nc, s->tx_buffer, tx_len);
>>           }
>>           s->regs[SONIC_TCR] |= SONIC_TCR_PTX;
>>
>> ---
>>
> Regards,


