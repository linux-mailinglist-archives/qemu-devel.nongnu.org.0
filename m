Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD9B332F4D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:49:45 +0100 (CET)
Received: from localhost ([::1]:36146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiMS-0000iA-HW
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJgmK-000374-8S
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:08:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJgmE-0001q9-Px
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:08:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615313292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/E9P1MSKt4lPcq//AxB+MmPUC3tfQLhU7NE8uegizU=;
 b=G4AHQzpUjWFQpPTswH4BTp4IDUkD2/cFzDuEcwFMDYYIfESVR4KkulV0g8nhIZJKPEALoy
 bBIgrAIyJGvIYLhwC2ij8stGQHhUEnf7TTWTVaE9qN7zjgjdD7YyVsGmuGh8Fbr00ZwRHi
 U7Z78PAOl4GhWmlRniHeblKLSFbpKBk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-Z3TOsBmXMmWFQ0ghbHg7SA-1; Tue, 09 Mar 2021 13:08:08 -0500
X-MC-Unique: Z3TOsBmXMmWFQ0ghbHg7SA-1
Received: by mail-ej1-f72.google.com with SMTP id v19so6043713ejc.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 10:08:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m/E9P1MSKt4lPcq//AxB+MmPUC3tfQLhU7NE8uegizU=;
 b=URWns/RkjuB4DY45q0p5O42OQUveE/X/dGBdhwomUkzS6OLiaHLgVFByu//Fzy6hdV
 od512PVT2f7+haGxo7ylz8Ouf2sITXIjIe2R7sD2ub1OVH34pqfRaepNj0nEuCCv5AbV
 iRnmrYCoBePup0tloLlczaoge3PCTR+aPOrF096YlHbV6vG4HRNS6EJ63Bp8lz8DgS0y
 NENBLfAP1zUALu5uHsfW2S5Nym+WOzleLpirSieuuxdCrRVf54jicV3huCfYCjetjWhM
 lrMTLPnZSi3JJgEUAheAnf/dIJQkWhMLHXwnqen8UZfBJddcSxOOB0MQwqhUhKC5VLrW
 tXqw==
X-Gm-Message-State: AOAM531eROYvsfUMfgMHmZ29V40Hc0cbLmGUknplsPOwiLY+AP1/GNy5
 vFl5+SIGwmJKPBq/b/CtjUlHcwzFdkzifviorvy1yUni/F/SBL4sWiCx7NKDvFAJepIPVOhJvUc
 /ivv9lbJZSNglCdU=
X-Received: by 2002:aa7:d54a:: with SMTP id u10mr5689016edr.316.1615313287384; 
 Tue, 09 Mar 2021 10:08:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxO2DkO3rP2pH2CfbceTX3VzYI9xjO/PfM2cdT2n48YKJWB5cdeXoMUdxDI9gA/Sr7AuyiiDg==
X-Received: by 2002:aa7:d54a:: with SMTP id u10mr5688977edr.316.1615313287117; 
 Tue, 09 Mar 2021 10:08:07 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 14sm8752908ejy.11.2021.03.09.10.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 10:08:06 -0800 (PST)
Subject: Re: [PATCH v3 2/2] net/eth: Fix stack-buffer-overflow in
 _eth_get_rss_ex_dst_addr()
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20210126111847.3142636-1-philmd@redhat.com>
 <20210126111847.3142636-3-philmd@redhat.com>
 <20210126143501.fy2teh465ngjrelk@steredhat>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e23a7ea8-7362-b0fa-8660-13e162ea3378@redhat.com>
Date: Tue, 9 Mar 2021 19:08:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210126143501.fy2teh465ngjrelk@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 3:35 PM, Stefano Garzarella wrote:
> On Tue, Jan 26, 2021 at 12:18:47PM +0100, Philippe Mathieu-Daudé wrote:
>> QEMU fuzzer reported a buffer overflow in _eth_get_rss_ex_dst_addr()
>> reproducible as:
>>
>>  $ cat << EOF | ./qemu-system-i386 -M pc-q35-5.0 \
>>    -accel qtest -monitor none \
>>    -serial none -nographic -qtest stdio
>>  outl 0xcf8 0x80001010
>>  outl 0xcfc 0xe1020000
>>  outl 0xcf8 0x80001004
>>  outw 0xcfc 0x7
>>  write 0x25 0x1 0x86
>>  write 0x26 0x1 0xdd
>>  write 0x4f 0x1 0x2b
>>  write 0xe1020030 0x4 0x190002e1
>>  write 0xe102003a 0x2 0x0807
>>  write 0xe1020048 0x4 0x12077cdd
>>  write 0xe1020400 0x4 0xba077cdd
>>  write 0xe1020420 0x4 0x190002e1
>>  write 0xe1020428 0x4 0x3509d807
>>  write 0xe1020438 0x1 0xe2
>>  EOF
>>  =================================================================
>>  ==2859770==ERROR: AddressSanitizer: stack-buffer-overflow on address
>> 0x7ffdef904902 at pc 0x561ceefa78de bp 0x7ffdef904820 sp 0x7ffdef904818
>>  READ of size 1 at 0x7ffdef904902 thread T0
>>      #0 0x561ceefa78dd in _eth_get_rss_ex_dst_addr net/eth.c:410:17
>>      #1 0x561ceefa41fb in eth_parse_ipv6_hdr net/eth.c:532:17
>>      #2 0x561cef7de639 in net_tx_pkt_parse_headers
>> hw/net/net_tx_pkt.c:228:14
>>      #3 0x561cef7dbef4 in net_tx_pkt_parse hw/net/net_tx_pkt.c:273:9
>>      #4 0x561ceec29f22 in e1000e_process_tx_desc
>> hw/net/e1000e_core.c:730:29
>>      #5 0x561ceec28eac in e1000e_start_xmit hw/net/e1000e_core.c:927:9
>>      #6 0x561ceec1baab in e1000e_set_tdt hw/net/e1000e_core.c:2444:9
>>      #7 0x561ceebf300e in e1000e_core_write hw/net/e1000e_core.c:3256:9
>>      #8 0x561cef3cd4cd in e1000e_mmio_write hw/net/e1000e.c:110:5
>>
>>  Address 0x7ffdef904902 is located in stack of thread T0 at offset 34
>> in frame
>>      #0 0x561ceefa320f in eth_parse_ipv6_hdr net/eth.c:486
>>
>>    This frame has 1 object(s):
>>      [32, 34) 'ext_hdr' (line 487) <== Memory access at offset 34
>> overflows this variable
>>  HINT: this may be a false positive if your program uses some custom
>> stack unwind mechanism, swapcontext or vfork
>>        (longjmp and C++ exceptions *are* supported)
>>  SUMMARY: AddressSanitizer: stack-buffer-overflow net/eth.c:410:17 in
>> _eth_get_rss_ex_dst_addr
>>  Shadow bytes around the buggy address:
>>    0x10003df188d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>    0x10003df188e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>    0x10003df188f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>    0x10003df18900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>    0x10003df18910: 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1 f1 f1
>>  =>0x10003df18920:[02]f3 f3 f3 00 00 00 00 00 00 00 00 00 00 00 00
>>    0x10003df18930: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>    0x10003df18940: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>    0x10003df18950: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>    0x10003df18960: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>    0x10003df18970: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>  Shadow byte legend (one shadow byte represents 8 application bytes):
>>    Addressable:           00
>>    Partially addressable: 01 02 03 04 05 06 07
>>    Stack left redzone:      f1
>>    Stack right redzone:     f3
>>  ==2859770==ABORTING
>>
>> Similarly GCC 11 reports:
>>
>>  net/eth.c: In function 'eth_parse_ipv6_hdr':
>>  net/eth.c:410:15: error: array subscript 'struct
>> ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct
>> ip6_ext_hdr[1]' [-Werror=array-bounds]
>>    410 |     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>>        |          ~~~~~^~~~~~~
>>  net/eth.c:485:24: note: while referencing 'ext_hdr'
>>    485 |     struct ip6_ext_hdr ext_hdr;
>>        |                        ^~~~~~~
>>  net/eth.c:410:38: error: array subscript 'struct
>> ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct
>> ip6_ext_hdr[1]' [-Werror=array-bounds]
>>    410 |     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>>        |                                 ~~~~~^~~~~~~~~
>>  net/eth.c:485:24: note: while referencing 'ext_hdr'
>>    485 |     struct ip6_ext_hdr ext_hdr;
>>        |                        ^~~~~~~
>>
>> In eth_parse_ipv6_hdr() we called iov_to_buf() to fill the 2 bytes of
>> the 'ext_hdr' buffer, then _eth_get_rss_ex_dst_addr() tries to access
>> beside the 2 filled bytes.
>>
>> Fix by reworking the function, filling the full rt_hdr buffer on the
>> stack calling iov_to_buf() again.
>>
>> Add the corresponding qtest case with the fuzzer reproducer.
>>
>> Cc: qemu-stable@nongnu.org
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1879531
>> Reported-by: Alexander Bulekov <alxndr@bu.edu>
>> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
>> Fixes: eb700029c78 ("net_pkt: Extend packet abstraction as required by
>> e1000e functionality")
>> Reviewed-by: Miroslav Rezanina <mrezanin@redhat.com>
>> Acked-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> net/eth.c                      | 25 +++++++---------
>> tests/qtest/fuzz-e1000e-test.c | 53 ++++++++++++++++++++++++++++++++++
>> MAINTAINERS                    |  1 +
>> tests/qtest/meson.build        |  1 +
>> 4 files changed, 66 insertions(+), 14 deletions(-)
>> create mode 100644 tests/qtest/fuzz-e1000e-test.c
>>
>> diff --git a/net/eth.c b/net/eth.c
>> index 7d4dd48c1ff..ae4db37888e 100644
>> --- a/net/eth.c
>> +++ b/net/eth.c
>> @@ -401,26 +401,23 @@ eth_is_ip6_extension_header_type(uint8_t hdr_type)
>>
>> static bool
>> _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
>> -                        size_t rthdr_offset,
>> +                        size_t ext_hdr_offset,
>>                         struct ip6_ext_hdr *ext_hdr,
>>                         struct in6_address *dst_addr)
>> {
>> -    struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing
>> *) ext_hdr;
>> +    struct ip6_ext_hdr_routing rt_hdr;
>> +    size_t input_size = iov_size(pkt, pkt_frags);
>> +    size_t bytes_read;
>>
>> -    if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>> +    if (input_size < ext_hdr_offset + sizeof(rt_hdr)) {
>> +        return false;
>> +    }
>>
>> -        size_t input_size = iov_size(pkt, pkt_frags);
>> -        size_t bytes_read;
>> +    bytes_read = iov_to_buf(pkt, pkt_frags, ext_hdr_offset,
>> +                            &rt_hdr, sizeof(rt_hdr));
>>
>> -        if (input_size < rthdr_offset + sizeof(*ext_hdr)) {
>> -            return false;
>> -        }
>> -
>> -        bytes_read = iov_to_buf(pkt, pkt_frags,
>> -                                rthdr_offset + sizeof(*ext_hdr),
>> -                                dst_addr, sizeof(*dst_addr));
>> -
>> -        return bytes_read == sizeof(*dst_addr);
>> +    if ((rt_hdr.rtype == 2) && (rt_hdr.segleft == 1)) {
>> +        return bytes_read == sizeof(*ext_hdr) + sizeof(*dst_addr);
> 
> Maybe I missed something but bytes_read can be at most 8,
> sizeof(*ext_hdr) should be 2 and sizeof(*dst_addr) should be 16, so IIUC
> this check is always false.
> 
> Also, before this patch, the function filled dst_addr, now we don't, is
> that right?

Well I'll split in multiple trivial changes and KISS.

Thanks for the review!

Phil.


