Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F12C213903
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 13:01:20 +0200 (CEST)
Received: from localhost ([::1]:42102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrJRV-0007jV-HD
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 07:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrJQH-0006Sm-QC
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 07:00:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42665
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrJQF-0000nA-5q
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 07:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593773997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DhI+iINLmG9wbC98d4e3LOFv6CystaXx4ipnTUnpRHM=;
 b=b1gC6DGbLarpQB5V85OGvdxjPl2aQblEAc9hWWAXHTANDJmUjhtQiuButSEc1sjimj9u7e
 ZPfhiyHyQ8xV1J5j+UBS0yCGxjc4kTJ4oZHav6gwBfMDANPVwVQbm6FJZb9nsrbHFSSgEH
 SJuiSgMLsCeERJVkBXLh33nd66n97qA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-KHtJwnEbNvasOUsBRjlhSA-1; Fri, 03 Jul 2020 06:59:56 -0400
X-MC-Unique: KHtJwnEbNvasOUsBRjlhSA-1
Received: by mail-wr1-f69.google.com with SMTP id b8so17187124wro.19
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 03:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DhI+iINLmG9wbC98d4e3LOFv6CystaXx4ipnTUnpRHM=;
 b=ECp+Fgwd904cQJuVvEiJmbbSlOPQjCb5yKF1k6BvPRmOi6KKSKuejxfNfU+kTYQVz5
 MJTtUVhAOMlW7kztzta5MnbekXYwYfLAmZ2SD5COxuqTE84EGqHsZEkkuAhfuqGVXuCS
 loNqgo6MYZKw/d9360wKQH56vG6RkY9qPLsm5JqnVc2d1X2bDI394tOLhP3Ecx+oERlm
 qOdxh8CGTgTXDXX3FeHiq/Vbjg58yL1zNNlYBK1/BzSFKLfMIoibUo5DkYSv10FdcqDf
 1dj9w+tnJob4R6IXYQ9dKqw3IvYzBHbjC/TZcaccpbjpalxCmFSMyJpLt0zlz1n0JjSd
 BdKQ==
X-Gm-Message-State: AOAM533Q3RvE1z5cg6sg+mJStZ/PgB/+e96CvKmiTEihRY/8YXAKgeIL
 A9lFFkS3vj/RV2U+z4AYTJi8uY1byBrRfT8l4jXWQakC7jkD2q5m77VFy7OVqwYDPeQ8mDWhNd/
 mZxMuRQqLZE2LhQM=
X-Received: by 2002:adf:c44d:: with SMTP id a13mr37130970wrg.205.1593773995158; 
 Fri, 03 Jul 2020 03:59:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2ESSz1aF2vm64sV3V5cvm2OAnNyY0UDCpDmAxrn05yfJR4wF8e9eiKYLZuSXKaoJf6A9JqQ==
X-Received: by 2002:adf:c44d:: with SMTP id a13mr37130946wrg.205.1593773994899; 
 Fri, 03 Jul 2020 03:59:54 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id g16sm15007199wrh.91.2020.07.03.03.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2020 03:59:54 -0700 (PDT)
Subject: Re: [PATCH v2 15/18] hw/block/nvme: reject invalid nsid values in
 active namespace id list
To: Klaus Jensen <its@irrelevant.dk>
References: <20200703063420.2241014-1-its@irrelevant.dk>
 <20200703063420.2241014-16-its@irrelevant.dk>
 <6a038075-13fd-2f60-23a2-ddc7081cff32@redhat.com>
 <20200703083701.sj4xlgyzp6xte4xi@apples.localdomain>
 <3d45ddb7-867e-3c40-c78b-cf5bc095e2e0@redhat.com>
 <20200703092213.27qhr5ow4kksunrw@apples.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <ba990b8f-35fb-8d8c-e835-88c09ca1e42e@redhat.com>
Date: Fri, 3 Jul 2020 12:59:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200703092213.27qhr5ow4kksunrw@apples.localdomain>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 02:53:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/20 11:22 AM, Klaus Jensen wrote:
> On Jul  3 11:14, Philippe Mathieu-Daudé wrote:
>> On 7/3/20 10:37 AM, Klaus Jensen wrote:
>>> On Jul  3 10:20, Philippe Mathieu-Daudé wrote:
>>>> On 7/3/20 8:34 AM, Klaus Jensen wrote:
>>>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>>>
>>>>> Reject the nsid broadcast value (0xffffffff) and 0xfffffffe in the
>>>>> Active Namespace ID list.
>>>>
>>>> Can we have a definition instead of this 0xfffffffe magic value please?
>>>>
>>>
>>> Hmm, not really actually. It's not a magic value, its just because the
>>> logic in Active Namespace ID list would require that it should report
>>> any namespaces with ids *higher* than the one specified, so since
>>> 0xffffffff (NVME_NSID_BROADCAST) is invalid, NVME_NSID_BROADCAST - 1
>>> needs to be as well.
>>
>> OK.
>>
>>>
>>> What do you say I change it to `min_nsid >= NVME_NSID_BROADCAST - 1`?
>>> The original condition just reads well if you are sitting with the spec
>>> on the side.
>>
>> IMO this is clearer:
>>
>>   if (min_nsid + 1 >= NVME_NSID_BROADCAST) {
>>       return NVME_INVALID_NSID | NVME_DNR;
>>   }
>>
> 
> But since min_nsid is uint32_t that would not be wise ;)

Hmm indeed.

> 
> I'll go with the - 1 and add a comment!

Good, thanks.

> 
>> Whichever form you prefer you can amend to the respin patch:
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>>>
>>>>>
>>>>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>>>> ---
>>>>>  hw/block/nvme.c | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>>>>> index 65c2fa3ac1f4..0dac7a41ddae 100644
>>>>> --- a/hw/block/nvme.c
>>>>> +++ b/hw/block/nvme.c
>>>>> @@ -956,6 +956,10 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeIdentify *c)
>>>>>  
>>>>>      trace_pci_nvme_identify_nslist(min_nsid);
>>>>>  
>>>>> +    if (min_nsid == 0xfffffffe || min_nsid == NVME_NSID_BROADCAST) {
>>>>> +        return NVME_INVALID_NSID | NVME_DNR;
>>>>> +    }
>>>>> +
>>>>>      list = g_malloc0(data_len);
>>>>>      for (i = 0; i < n->num_namespaces; i++) {
>>>>>          if (i < min_nsid) {
>>>>>
>>>>
>>>
>>
> 


