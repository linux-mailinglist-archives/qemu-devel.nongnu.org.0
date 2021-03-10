Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4F33346AC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:27:41 +0100 (CET)
Received: from localhost ([::1]:50162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3Ya-00040B-JP
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:27:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK3XQ-0002DL-9o
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:26:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK3XN-0001NK-9x
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615400783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3CX6FEaDF/frgN5weaBQW7SY7MrxKP6zDFB3rFh7RI0=;
 b=EsoZitD8Xxi7V0OFQFOFreNeWuTR840AmHAyGUWj8c/hXu40kp502FPrCwdlIibZlfZMaq
 xYk/Y2lYvEcCOZcfs7+74oherfAxV96FDqm8RwDfUuVfH7EZpSZq8ecMb8d8Zd/eaMH0j0
 J0T1fopHM5/EUSsgimREEDhrKz/GMA8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-p7jQ6Oy-ONi2iu13v34lOA-1; Wed, 10 Mar 2021 13:26:22 -0500
X-MC-Unique: p7jQ6Oy-ONi2iu13v34lOA-1
Received: by mail-ej1-f72.google.com with SMTP id bg7so1563061ejb.12
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 10:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3CX6FEaDF/frgN5weaBQW7SY7MrxKP6zDFB3rFh7RI0=;
 b=ihWZ6POsFQzH50qoYHCMSaIkuExLEnUS9NO9EFS98x9M1TMqfT8aAEmaoDXRZbiebu
 PktHT8POAaToHbeIHEMxU9BPj+8b+rsblKoPBwwktX4a86wuyKyWAEsQARfybTFgcwBB
 nXwWC3rFh8JjLBbeRJtI+wzA/cb9ihHVTW0onaIHtxtNRVsucG6Rs6aFY7geIeWiefeu
 6sGqfx6Sd+yL2aAX+W23j0ird3wsF1C2xETsV5CRsWoiIvrgZeyoAwx8QHhC0ov+3Ua/
 9tPNRKgob2sK6Uijj3iSHtdxo5ZrbD1+ztEH9QrgcSkAujiS/PPX7bfcGTIl45V9/rKU
 2tuQ==
X-Gm-Message-State: AOAM5318UuPwin5UeYCNitpuDCA3n7Gl/bwxt2HmKQjjZ48FWohqm/Sp
 c0N6VmvIv7pWsPIjBGrDyOW/z7ZkWnahDeg2/K6Fcy3WWtQ9f7O63YiTIUjWo0n0vClsvyuZb8y
 r5qxP4yS7+Ss098A=
X-Received: by 2002:a17:906:f10c:: with SMTP id
 gv12mr5017606ejb.53.1615400780968; 
 Wed, 10 Mar 2021 10:26:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzle/KqTveQTQ7CP9mNAgSPkBjcP30Maiacegd0pvV6PS0O20fvOHO72LCdqVCGMoIlDFGdBg==
X-Received: by 2002:a17:906:f10c:: with SMTP id
 gv12mr5017590ejb.53.1615400780767; 
 Wed, 10 Mar 2021 10:26:20 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id e18sm122414eji.111.2021.03.10.10.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 10:26:20 -0800 (PST)
Subject: Re: [PATCH v5 5/7] net/eth: Check iovec has enough data earlier
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20210310160135.1148272-1-philmd@redhat.com>
 <20210310160135.1148272-6-philmd@redhat.com>
 <20210310165327.w27noda3nva2yfcg@steredhat>
 <0a62edf6-9842-13df-2093-cbf8926a1b17@redhat.com>
Message-ID: <823478a4-11cc-befb-e296-41a19821c959@redhat.com>
Date: Wed, 10 Mar 2021 19:26:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0a62edf6-9842-13df-2093-cbf8926a1b17@redhat.com>
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

On 3/10/21 6:57 PM, Philippe Mathieu-Daudé wrote:
> On 3/10/21 5:53 PM, Stefano Garzarella wrote:
>> On Wed, Mar 10, 2021 at 05:01:33PM +0100, Philippe Mathieu-Daudé wrote:
>>> We want to check fields from ip6_ext_hdr_routing structure
>>> and if correct read the full in6_address. Let's directly check
>>> if our iovec contains enough data for everything, else return
>>> early.
>>>
>>> Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>> net/eth.c | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/net/eth.c b/net/eth.c
>>> index e870d02b0df..28cdc843a69 100644
>>> --- a/net/eth.c
>>> +++ b/net/eth.c
>>> @@ -409,7 +409,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt,
>>> int pkt_frags,
>>>     size_t input_size = iov_size(pkt, pkt_frags);
>>>     size_t bytes_read;
>>>
>>> -    if (input_size < ext_hdr_offset + sizeof(*ext_hdr)) {
>>> +    if (input_size < ext_hdr_offset + sizeof(*rthdr) +
>>> sizeof(*dst_addr)) {
>>>         return false;
>>>     }
>>
>> If you have to respin, maybe we should also fix the offset in
>> iov_to_buf() in this patch and queue it for stable:
>>
>> @@ -415,7 +415,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt,
>> int pkt_frags,
>>  
>>      if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>>          bytes_read = iov_to_buf(pkt, pkt_frags,
>> -                                ext_hdr_offset + sizeof(*ext_hdr),
>> +                                ext_hdr_offset + sizeof(*rthdr),
>>                                  dst_addr, sizeof(*dst_addr));
> 
> Oh, so we always screwed the address by 4 bytes...
> 
> This code never worked correctly :(

Confirmed with commit 4555ca6816c ("net: fix incorrect
argument to iov_to_buf") when it then returns incorrect
value until b2caa3b82ed ("net/eth: fix incorrect check
of iov_to_buf() return value") one year later.


