Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9B63BC854
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 11:10:59 +0200 (CEST)
Received: from localhost ([::1]:60744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0h6Y-0007cS-KN
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 05:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0h59-0006hT-GZ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:09:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0h56-0007SL-JR
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:09:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625562567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fjy30UfYw3/PLJcAqUGcL2rr+4JuDgRykdAA3M2k8vs=;
 b=GI8pnMCmLSTmGKHSTvzXRfPC4RvFEdAyNY1z843TiA7/WNNy+gwTxEiIBnO3eZNz50A9Ry
 /JmKsCJGpnTKl05YtLqzjgcFjM3xseirE1GJfdrduE2QKVKtFGeJ8LGhqGgTu3cOYId0UV
 /5XEUlo7Jv3jXJL/C05W8VT72Iji2so=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-RbyrodKcNtONJ4it_jQWaA-1; Tue, 06 Jul 2021 05:09:24 -0400
X-MC-Unique: RbyrodKcNtONJ4it_jQWaA-1
Received: by mail-wm1-f70.google.com with SMTP id
 p3-20020a05600c3583b02901f55d71e34aso644867wmq.4
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 02:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fjy30UfYw3/PLJcAqUGcL2rr+4JuDgRykdAA3M2k8vs=;
 b=Y2Y0GKBvclQz19rouzyBh3F2BPQLyeG1gxYpC8zxKW6hEyxABNYVO8LDDONCiXkZHg
 pHvuHNzY28wsBXacgtcGEWA1mWV5NjK/zTXkEXhsA7P6cocTfZMH2Mt9ihj54c5eb36l
 m4RpIR62p++qTfeHnPXcIHsWx7w+TAQCrTwbKa7FJuXIJBbuOYzbDcIk97BtMQKK+crj
 66uYo9zlulvDNeuI7gsHyaJfuxPFar672lMmRrzYY6RZB+wLrxhFsy3m7xMnmgasRvWh
 kkhVzkKoITcvbOaLFNUY/Pu1WKxgCyjLE9pUr9IzUVVspV3M03M5DMmtpHjf0efnALGY
 TDKQ==
X-Gm-Message-State: AOAM533OJglOJ8dH/H5iK8ijjQLGF02CBGIx6SO4DFERBf6OZT366I5r
 v8NcZsjpVaZxBzcn+A4X7cwCSD7z8Urbf4Ge3RsEzcGPSyRw2z77BBNTV3DtF1WRini1zRI4oLI
 PUFD4hvp3FTMhovY=
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr3586256wmq.179.1625562563389; 
 Tue, 06 Jul 2021 02:09:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaNgSwRW/NXH3Rb0D7da601vrNnO9cstsFbLH3KRuLxFfcqJMh/MSUYph/KHp9MPtRGPQFHA==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr3586236wmq.179.1625562563239; 
 Tue, 06 Jul 2021 02:09:23 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r13sm5558844wrt.38.2021.07.06.02.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 02:09:22 -0700 (PDT)
Subject: Re: [PATCH] hw/net: Discard overly fragmented packets
To: Mauro Matteo Cascella <mcascell@redhat.com>
References: <20210705084011.814175-1-philmd@redhat.com>
 <CAA8xKjXwrbw-xo+YG8KaU8+Jg0zV4+GXW+hNjBfLDNwN7KG-ZA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <79893227-6b00-c5f8-f0f2-4c7d554403a3@redhat.com>
Date: Tue, 6 Jul 2021 11:09:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAA8xKjXwrbw-xo+YG8KaU8+Jg0zV4+GXW+hNjBfLDNwN7KG-ZA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Melnychenko <andrew@daynix.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Thomas Huth <thuth@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mauro,

On 7/6/21 11:00 AM, Mauro Matteo Cascella wrote:
> Hello Philippe,
> 
> I think you don't need root privileges to craft such a highly
> fragmented packet from within the guest (tools like hping3 or nmap
> come to mind). Right? If so, we may consider allocating a CVE for this
> bug. If not, this is not CVE worthy - root does not need an assertion
> failure to cause damage to the system.

Thanks for worrying about CVE. I have no clue, so I'll
defer that question to Andrew, Dmitry and Jason.

Regards,

Phil.

> On Mon, Jul 5, 2021 at 10:40 AM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> Our infrastructure can handle fragmented packets up to
>> NET_MAX_FRAG_SG_LIST (64) pieces. This hard limit has
>> been proven enough in production for years. If it is
>> reached, it is likely an evil crafted packet. Discard it.
>>
>> Include the qtest reproducer provided by Alexander Bulekov:
>>
>>   $ make check-qtest-i386
>>   ...
>>   Running test qtest-i386/fuzz-vmxnet3-test
>>   qemu-system-i386: net/eth.c:334: void eth_setup_ip4_fragmentation(const void *, size_t, void *, size_t, size_t, size_t, _Bool):
>>   Assertion `frag_offset % IP_FRAG_UNIT_SIZE == 0' failed.
>>
>> Cc: qemu-stable@nongnu.org
>> Reported-by: OSS-Fuzz (Issue 35799)
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/460
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/net/net_tx_pkt.c             |   8 ++
>>  tests/qtest/fuzz-vmxnet3-test.c | 195 ++++++++++++++++++++++++++++++++
>>  MAINTAINERS                     |   1 +
>>  tests/qtest/meson.build         |   1 +
>>  4 files changed, 205 insertions(+)
>>  create mode 100644 tests/qtest/fuzz-vmxnet3-test.c
>>
>> diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
>> index 1f9aa59eca2..77e9729a7ba 100644
>> --- a/hw/net/net_tx_pkt.c
>> +++ b/hw/net/net_tx_pkt.c
>> @@ -590,6 +590,14 @@ static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
>>          fragment_len = net_tx_pkt_fetch_fragment(pkt, &src_idx, &src_offset,
>>              fragment, &dst_idx);
>>
>> +        if (dst_idx == NET_MAX_FRAG_SG_LIST && fragment_len > 0) {
>> +            /*
>> +             * The packet is too fragmented for our infrastructure
>> +             * (not enough iovec), don't even try to send.
>> +             */
>> +            return false;
>> +        }
>> +
>>          more_frags = (fragment_offset + fragment_len < pkt->payload_len);
>>
>>          eth_setup_ip4_fragmentation(l2_iov_base, l2_iov_len, l3_iov_base,


