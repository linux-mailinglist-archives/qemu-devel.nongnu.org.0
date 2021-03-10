Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE47333CAF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 13:35:53 +0100 (CET)
Received: from localhost ([::1]:53586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJy48-0002Qh-FW
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 07:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJy2W-0001Ve-8I
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 07:34:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJy2T-0000Lk-Uy
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 07:34:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615379648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hckLKg+keVtMIUnFFwqVj6RDaCG7SmVnThbng8Qlbck=;
 b=Clnm66x91w8lI2HLw2lDf5RJEKVfAbtywpxU/+pPpbmoBqVH93OLRKdOPyyzi9cpQ2iJdg
 bHMmfCClVk/Siy++dQ128xDBwg3by1w5DMTdLsmx6B2SA2IA+cKCXolXUD2Dyd10FAzs3f
 7R/e0UNznAXUebZcPIInkHy0ckSVXws=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-0FS_xrpIPCWWyo1Eo1oqKQ-1; Wed, 10 Mar 2021 07:34:04 -0500
X-MC-Unique: 0FS_xrpIPCWWyo1Eo1oqKQ-1
Received: by mail-ed1-f71.google.com with SMTP id bi17so8248585edb.6
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 04:34:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hckLKg+keVtMIUnFFwqVj6RDaCG7SmVnThbng8Qlbck=;
 b=dZYD/GDUuU9VJIastt6h32dD3ZrJwIRzt7UFx7O98pvv+iVQxagmOCoaXB8BYjAYM+
 4vktMNLVLibRRqin6UoQBYD/lj+TTqzsCZmgr9rWnwKoWlUoh+/E8IJtNCFB//CTcQlI
 rDrZSs7Z8H2DiZY4lH/k6xci+Hf6QmJ4V1A+5DeRPxLlvMgFpkOd3ACO5UYRRdu6TkEf
 KtAEHkWGZf8IjV0kXl9fGvx/pZMomNCpKqR7KSgw9DvysMSg5leQSJ00NC0jUZm1f9i2
 KGm4CXqva0WkJ+xFwSBvez0RKGQ6JOFLQ4rNlAU6so1F2BcE2L3406aWYMQAIgGINYY4
 xuyw==
X-Gm-Message-State: AOAM533HLf6HW8+q9IJxFh1iUTFvIa92iJqh3MM9+lwCVCSecd0vgbi2
 zIwOTaXvAbijeYXesdND/gIyaSzifjXvS37OVkE6JjyHNQP9QkTHfaoD9LJDbmGjZgsDLRzWGpA
 TSPTrIBvvL0MpJDE=
X-Received: by 2002:a17:906:2795:: with SMTP id
 j21mr3380408ejc.283.1615379643686; 
 Wed, 10 Mar 2021 04:34:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0WLXRTzn4n82EnoEFKTBtvlJf4p0urC6BGkN+i3KM+qWnAXst8Y/HEg5k4pf0YoWt5w7qag==
X-Received: by 2002:a17:906:2795:: with SMTP id
 j21mr3380373ejc.283.1615379643381; 
 Wed, 10 Mar 2021 04:34:03 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v22sm9941370ejj.103.2021.03.10.04.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 04:34:02 -0800 (PST)
Subject: Re: [PATCH v4 4/6] net/eth: Check rt_hdr size before casting to
 ip6_ext_hdr
To: Miroslav Rezanina <mrezanin@redhat.com>
References: <20210309182709.810955-1-philmd@redhat.com>
 <20210309182709.810955-5-philmd@redhat.com>
 <1881013042.40005672.1615368966291.JavaMail.zimbra@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1b01c1c2-8b41-b9c7-fba2-ce09308bf954@redhat.com>
Date: Wed, 10 Mar 2021 13:34:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1881013042.40005672.1615368966291.JavaMail.zimbra@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 10:36 AM, Miroslav Rezanina wrote:
> ----- Original Message -----
>> From: "Philippe Mathieu-Daudé" <philmd@redhat.com>
>> To: qemu-devel@nongnu.org
>> Cc: "Laurent Vivier" <lvivier@redhat.com>, "Dmitry Fleytman" <dmitry.fleytman@gmail.com>, "Miroslav Rezanina"
>> <mrezanin@redhat.com>, "Li Qiang" <liq3ea@gmail.com>, "Paolo Bonzini" <pbonzini@redhat.com>, "Jason Wang"
>> <jasowang@redhat.com>, "Thomas Huth" <thuth@redhat.com>, "Alexander Bulekov" <alxndr@bu.edu>, "Stefano Garzarella"
>> <sgarzare@redhat.com>, "Philippe Mathieu-Daudé" <philmd@redhat.com>, qemu-stable@nongnu.org
>> Sent: Tuesday, March 9, 2021 7:27:07 PM
>> Subject: [PATCH v4 4/6] net/eth: Check rt_hdr size before casting to ip6_ext_hdr
>>
>> Do not cast our ip6_ext_hdr pointer to ip6_ext_hdr_routing if there
>> isn't enough data in the buffer for a such structure.
>>

>> FWIW GCC 11 similarly reported:
>>
>>   net/eth.c: In function 'eth_parse_ipv6_hdr':
>>   net/eth.c:410:15: error: array subscript 'struct ip6_ext_hdr_routing[0]' is
>>   partly outside array bounds of 'struct ip6_ext_hdr[1]'
>>   [-Werror=array-bounds]
>>     410 |     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>>         |          ~~~~~^~~~~~~
>>   net/eth.c:485:24: note: while referencing 'ext_hdr'
>>     485 |     struct ip6_ext_hdr ext_hdr;
>>         |                        ^~~~~~~
>>   net/eth.c:410:38: error: array subscript 'struct ip6_ext_hdr_routing[0]' is
>>   partly outside array bounds of 'struct ip6_ext_hdr[1]'
>>   [-Werror=array-bounds]
>>     410 |     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>>         |                                 ~~~~~^~~~~~~~~
>>   net/eth.c:485:24: note: while referencing 'ext_hdr'
>>     485 |     struct ip6_ext_hdr ext_hdr;
>>         |                        ^~~~~~~
>>
>> Cc: qemu-stable@nongnu.org
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1879531
>> Reported-by: Alexander Bulekov <alxndr@bu.edu>
>> Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
>> Fixes: eb700029c78 ("net_pkt: Extend packet abstraction as required by e1000e
>> functionality")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  net/eth.c                      |  7 ++++-
>>  tests/qtest/fuzz-e1000e-test.c | 53 ++++++++++++++++++++++++++++++++++
>>  MAINTAINERS                    |  1 +
>>  tests/qtest/meson.build        |  1 +
>>  4 files changed, 61 insertions(+), 1 deletion(-)
>>  create mode 100644 tests/qtest/fuzz-e1000e-test.c
>>
>> diff --git a/net/eth.c b/net/eth.c
>> index 77af2b673bb..f0c8dfe8df7 100644
>> --- a/net/eth.c
>> +++ b/net/eth.c
>> @@ -406,7 +406,12 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int
>> pkt_frags,
>>                          struct in6_address *dst_addr)
>>  {
>>      size_t input_size = iov_size(pkt, pkt_frags);
>> -    struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *)
>> ext_hdr;
>> +    struct ip6_ext_hdr_routing *rthdr;
>> +
>> +    if (input_size < ext_hdr_offset + sizeof(*rthdr)) {
>> +        return false;
>> +    }
>> +    rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
> 
> Hi Philippe,
> 
> you're introducing the problem you're trying to fix here. This line
> cause warning on GCC 11 and so the build fail with --enable-werror.

Oh, I thought we had switched to testing on Fedora rawhide, but this
never made it to mainstream [*], which is why my testing didn't notice
this was not fixing.

I'll keep working on this, thanks.

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg774720.html


