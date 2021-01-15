Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA5F2F7597
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 10:38:29 +0100 (CET)
Received: from localhost ([::1]:58690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0LYq-0003Df-MS
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 04:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0LXe-0002Fw-9C
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:37:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0LXc-0002dy-Ns
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610703432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c8903HQ8b9SbuNy3jA5zuWD48QUTqIduLSu5ByO1+7A=;
 b=Nbh6VdaEZb8ylq3HyOxjtRFMEkGkJcSUh1gV2yr8KVBc7uTlcGQjpCmHLRwwsmzyqr1zqe
 Mt/h6zN3Xlp8deUHdLAdJK+EzhqtJ28FbBbtgS+A8NzelUuo7pLwNK9zQIb17J85JzryTQ
 Be0syZy4bw4nuEckKGUEn3z3yjYKb90=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-S-y-o-i4N0-2BDi8YBxXLw-1; Fri, 15 Jan 2021 04:37:08 -0500
X-MC-Unique: S-y-o-i4N0-2BDi8YBxXLw-1
Received: by mail-ej1-f70.google.com with SMTP id d19so3387593ejo.18
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 01:37:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c8903HQ8b9SbuNy3jA5zuWD48QUTqIduLSu5ByO1+7A=;
 b=V2Xeu7UzF8IGsw28zPr54NT5k6PVvPc7TmPrbq/5w5V1aKpEHloGZ6U/kd91v+McrR
 YPspPNiSTWlOBqcfDiWe6SbtppFrrqheiuui7cFmhFgaTbW7cIyazOWM8RzEUHTUC1+V
 3yr/8qvztjrtksZjVFCO656I1wjveEJ/Qn0RbjHT+AcqWEFgY5cbA2r54iWixOxsz/3M
 mPyBbsdube567DeZAv+j9eAKgGTlYbYQn7TUUOBwcke7JK+kjzC6tDfRHhkU1/PsYUS9
 Lujl264y/4AuGcE7c1oNmkxacpRDcSQo03aUZDTo8se1dJU5pU/XuLwBDD9YdusyNr6H
 pNhw==
X-Gm-Message-State: AOAM530GJWZB8z88P47FuWmBZu1aHU7gD7yERVqKgT+LPnzZHme8MI92
 hYjaxJC132FSixj4bT+kQ1jc5Dn6sjCjzkvevCX75VNdJZ7ZTbOfBWvXBDPorB3dS68HqrjCLj/
 T2Kiz24zxVpGj8u8=
X-Received: by 2002:a17:906:174f:: with SMTP id
 d15mr8211932eje.52.1610703427076; 
 Fri, 15 Jan 2021 01:37:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4Fh94Y9SKB0hgng+177bBjQ5rfr9oLgu+WvZu0kZyCxhw8ktKnm1RtkGO9JTot9fLfqB/EA==
X-Received: by 2002:a17:906:174f:: with SMTP id
 d15mr8211916eje.52.1610703426857; 
 Fri, 15 Jan 2021 01:37:06 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id bm25sm3279075edb.73.2021.01.15.01.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 01:37:06 -0800 (PST)
Subject: Re: [PATCH] hw/block/nvme: fix for non-msix machines
To: Klaus Jensen <its@irrelevant.dk>
References: <20210112124714.220657-1-its@irrelevant.dk>
 <0d5fc44d-14cf-5fd9-e8e3-2aae48ebfa4a@redhat.com>
 <YAE/J08kcQ1WfjOQ@apples.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5bcdfa4a-218d-a1f4-0ece-654e76403ee6@redhat.com>
Date: Fri, 15 Jan 2021 10:37:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YAE/J08kcQ1WfjOQ@apples.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 8:07 AM, Klaus Jensen wrote:
> On Jan 12 14:20, Philippe Mathieu-Daudé wrote:
>> On 1/12/21 1:47 PM, Klaus Jensen wrote:
>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>
>>> Commit 1c0c2163aa08 ("hw/block/nvme: verify msix_init_exclusive_bar()
>>> return value") had the unintended effect of breaking support on
>>> several platforms not supporting MSI-X.
>>>
>>> Still check for errors, but only report that MSI-X is unsupported
>>> instead of bailing out.
>>>

BTW maybe worth adding:

Cc: qemu-stable@nongnu.org

So this patch get backported in the next stable release based on 5.2.

>>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>>> Fixes: 1c0c2163aa08 ("hw/block/nvme: verify msix_init_exclusive_bar() return value")
>>> Fixes: fbf2e5375e33 ("hw/block/nvme: Verify msix_vector_use() returned value")
>>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>> ---
>>>  hw/block/nvme.c | 31 ++++++++++++++++++++++---------
>>>  1 file changed, 22 insertions(+), 9 deletions(-)
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
> 
> Thanks! Applied to nvme-next.
> 


