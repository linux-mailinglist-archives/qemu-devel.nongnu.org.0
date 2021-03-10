Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C14334668
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:15:42 +0100 (CET)
Received: from localhost ([::1]:37328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3Mz-0004zu-O5
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:15:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK35J-0006Zg-4F
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:57:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK35H-0002eb-CH
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:57:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615399042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4SZ9tKfjNvaJJO9CrQdzpsTCzHFlOPcgBov8Ds+Auk=;
 b=CZYOc9/vKyMkax/byeCuHOoIUYu/fEBCaWuxkscliy+26xyoxCBS98aPRYhKG4+Xqpg9J0
 /xnbW/HtLBOcfXcAZ57EzBKF3b9emW7vKF4jxej+XVXmUtttqxNdWZ+5ryYg4ZJ0u++BTX
 XZ0LzSlVCFy0PIRR3u3fFvwawGFuHyI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-r7V_90H6NIe2cqXmd_6HMA-1; Wed, 10 Mar 2021 12:57:21 -0500
X-MC-Unique: r7V_90H6NIe2cqXmd_6HMA-1
Received: by mail-ed1-f70.google.com with SMTP id i6so8815200edq.12
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:57:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W4SZ9tKfjNvaJJO9CrQdzpsTCzHFlOPcgBov8Ds+Auk=;
 b=ELplkjYtzSLugmfLVFxw0zDNpJjRP+EJ0S5/Lo4+D3RGlEqH1fvnQzYJ6zuyXjLqLO
 YBLTeN1HaF0xmBR2RuAw+1WtcI934vA507Md8BV7UZ4kp8HI5MxqdQSje/9HX74mBXgz
 GPyKtGnCdXlxNZb365DPRUhXazAIIsis0RRSzF/NKdjnGYyLGOIAIBDpTMyZ/VnJHoYD
 7YuEJwe+0vwN1hlyM0wehSKeqNLPL38lQIbtDUnB7nvRT+6l8tNPWGRUaHRKG87M9tQ/
 XzAzkd6T8clxrgXpi+Evk5WT7EWg3nBEF121sl+p00GuyfyU21tjNp50S49+rpzTAsuu
 LqiA==
X-Gm-Message-State: AOAM530wKn1yBm/xyE0VPa8kl165cQaZHd8dGwixl74i/J+6AiNT2x+n
 q0LMorxw9b2ru9Q/9HCP2aOLbM4zC7O6y6Xin4t2LTUjg0VpZiRrkd4UQC7j+JVn7r5Ww5vv4eu
 PK+auwmLtmmVmb+M=
X-Received: by 2002:aa7:c9c8:: with SMTP id i8mr4579348edt.193.1615399040004; 
 Wed, 10 Mar 2021 09:57:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsz04Qul9T4werZrVhyYM0l2+wdtm8SZ6gx0yikm4S4fzliPILPO3B9zyeZ29MpPw9kTt60A==
X-Received: by 2002:aa7:c9c8:: with SMTP id i8mr4579333edt.193.1615399039814; 
 Wed, 10 Mar 2021 09:57:19 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d1sm119792eje.26.2021.03.10.09.57.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 09:57:19 -0800 (PST)
Subject: Re: [PATCH v5 5/7] net/eth: Check iovec has enough data earlier
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20210310160135.1148272-1-philmd@redhat.com>
 <20210310160135.1148272-6-philmd@redhat.com>
 <20210310165327.w27noda3nva2yfcg@steredhat>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0a62edf6-9842-13df-2093-cbf8926a1b17@redhat.com>
Date: Wed, 10 Mar 2021 18:57:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310165327.w27noda3nva2yfcg@steredhat>
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
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 5:53 PM, Stefano Garzarella wrote:
> On Wed, Mar 10, 2021 at 05:01:33PM +0100, Philippe Mathieu-Daudé wrote:
>> We want to check fields from ip6_ext_hdr_routing structure
>> and if correct read the full in6_address. Let's directly check
>> if our iovec contains enough data for everything, else return
>> early.
>>
>> Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> net/eth.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/net/eth.c b/net/eth.c
>> index e870d02b0df..28cdc843a69 100644
>> --- a/net/eth.c
>> +++ b/net/eth.c
>> @@ -409,7 +409,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt,
>> int pkt_frags,
>>     size_t input_size = iov_size(pkt, pkt_frags);
>>     size_t bytes_read;
>>
>> -    if (input_size < ext_hdr_offset + sizeof(*ext_hdr)) {
>> +    if (input_size < ext_hdr_offset + sizeof(*rthdr) +
>> sizeof(*dst_addr)) {
>>         return false;
>>     }
> 
> If you have to respin, maybe we should also fix the offset in
> iov_to_buf() in this patch and queue it for stable:
> 
> @@ -415,7 +415,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt,
> int pkt_frags,
>  
>      if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>          bytes_read = iov_to_buf(pkt, pkt_frags,
> -                                ext_hdr_offset + sizeof(*ext_hdr),
> +                                ext_hdr_offset + sizeof(*rthdr),
>                                  dst_addr, sizeof(*dst_addr));

Oh, so we always screwed the address by 4 bytes...

This code never worked correctly :(

>  
>          return bytes_read == sizeof(*dst_addr);
> 
> Otherwise:
> 
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> 


