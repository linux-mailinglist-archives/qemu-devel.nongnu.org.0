Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAC72D602B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 16:45:11 +0100 (CET)
Received: from localhost ([::1]:53352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knO7y-0001oy-8J
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 10:45:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knO69-0001By-Vn
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:43:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knO67-000832-NY
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607614994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2fQfncVPfAQ4hzV/jSyiEhD2YD+4+mgCn3ql6frBoKM=;
 b=gPNG0iOfiPAy4CnR0S2AO0Ds2RD/mXXl5FHEnUzly75DNc3rO8TFloksMcBkgSVdb6RU3k
 zdLjBNsTB9eJ5N3hpPDHgBy4nHUlC1MXcj3nQKCv17Nw46XkV5i2QEepHQy6uDh/HzdLrQ
 FcaFuyERrB7u2WigmTHfvy4iYyv6Mig=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-I54DYHa2O8mnszMprjJMJw-1; Thu, 10 Dec 2020 10:43:11 -0500
X-MC-Unique: I54DYHa2O8mnszMprjJMJw-1
Received: by mail-wr1-f70.google.com with SMTP id i4so2076342wrm.21
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 07:43:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2fQfncVPfAQ4hzV/jSyiEhD2YD+4+mgCn3ql6frBoKM=;
 b=DZMWzgt39qkAlqP6gqDvHE5CMgfIazT7tT+1zqzAO3oJZMgf9WZ+XGo1npM4faLur7
 awkhfzXs1yv3LL5NIXjI/uvvfMLEDDuc2Y6rPXe7YDoiPzrvryDS6aGM4nAvDhH+Ylpr
 5jHa1z2GhuaghfRBTGZw8ZPUHfCH5RfErAd8qVq4TVp2mOvrB9fM++DClzLE459gflLp
 onzu85XLngSjSCOnSzaWICGoJzt0ynNebYhLevUTzQewkuBVl79MzqiT/6Y48OoP0MlY
 gtLO7KrOk6cplU/RjB8hP2I+cP2SweS7L56nY00UVwuR0d0Va84BpFiwA52LnREcct4F
 zqEQ==
X-Gm-Message-State: AOAM532BNQBseCckLCq1i7I5PYO2LGEskkAKSFhghjdyJg5IqbFqzkRi
 aijKFgZp5zQpAQsy5p+MagM4+MRNQrU5Nr/BSd5hhBMYmHKXZHVjDa4v+XNvLhBRPd5SYXaXsMZ
 oEGB8By+yn1bvz0o=
X-Received: by 2002:adf:d085:: with SMTP id y5mr3345227wrh.41.1607614990818;
 Thu, 10 Dec 2020 07:43:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYUKF4uLQQSn5gT+Jj4kh4pXNYL5M6MvTaTWGeBPLKM+8kx7L0fDWCf6ZN+blpWEOG4jRNeA==
X-Received: by 2002:adf:d085:: with SMTP id y5mr3345201wrh.41.1607614990569;
 Thu, 10 Dec 2020 07:43:10 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b13sm3267227wrt.31.2020.12.10.07.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 07:43:09 -0800 (PST)
Subject: Re: [PATCH] block/nvme: Implement fake truncate() coroutine
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20201210125202.858656-1-philmd@redhat.com>
 <762c142d-9c90-d475-03b0-ac9fb388f454@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <86e193f3-0b42-3fd5-4edf-68fdc1a42d90@redhat.com>
Date: Thu, 10 Dec 2020 16:43:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <762c142d-9c90-d475-03b0-ac9fb388f454@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xueqiang Wei <xuwei@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 4:36 PM, Max Reitz wrote:
> On 10.12.20 13:52, Philippe Mathieu-Daudé wrote:
>> NVMe drive can not be shrunk.
> 
> *cannot
> 
>> Since commit c80d8b06cfa we can use the @exact parameter (set
>> to false) to return success if the block device is larger than
>> the requested offset (even if we can not be shrunk).
>>
>> Use this parameter to implement the NVMe truncate() coroutine,
>> similarly how it is done for the iscsi and file-posix drivers
>> (see commit 82325ae5f2f "Evaluate @exact in protocol drivers").
>>
>> Reported-by: Xueqiang Wei <xuwei@redhat.com>
>> Suggested-by: Max Reitz <mreitz@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   block/nvme.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
> Thanks!  (Fixed the typo and) applied to my block branch:
> 
> https://git.xanclic.moe/XanClic/qemu/commits/branch/block
> 

Thanks Max!


