Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB7A3E5C89
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 16:08:14 +0200 (CEST)
Received: from localhost ([::1]:35298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSQP-0003Hv-77
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 10:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDSIe-0003Fr-Bh
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:00:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDSIa-00066n-68
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628604006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7xH6TSfVylHM+tA3C10yRwyK8KVPwPc9FMYgOv8lcKM=;
 b=dWpPz5fj4URFChNv6vetD8GseAAHWcTHjJNnmBaQ5NfFne5DDruY6DfjyGjr65DLr54Mn6
 A1QgLQLpPS0+8LfZUl9cI3b+DMQXZg7Y7d3804Xz8rwL4GYw2t+7XaWFZJZN/ZKLHLwk0m
 Bes4l/XCxBqZ5qaYOrEnQqYLIDtQgXc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-Fgd4QOiCMMaBF4nkvuQkow-1; Tue, 10 Aug 2021 10:00:05 -0400
X-MC-Unique: Fgd4QOiCMMaBF4nkvuQkow-1
Received: by mail-wm1-f71.google.com with SMTP id
 k4-20020a05600c1c84b0290210c73f067aso4907145wms.6
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 07:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7xH6TSfVylHM+tA3C10yRwyK8KVPwPc9FMYgOv8lcKM=;
 b=qbSCuCV4tdE4tlF23s1kZvplmnv6/lR0XdgTsXg+In8Y4ZgrQIMeREOubozMhPkOxV
 PurB7Yk88InAi8JTsO8gTUjR/VQrjlKbIVAevmMCOV8Rz0ZDqrKxLVzGQJa4AXOXPFOh
 vkmStQpwvEp9ex+1rZ5qGbnya8gh1WR4KkGias8uRX/xJ3bcbcD05Ln8xpMsx8JocBLs
 r6MXxVHKlhNHV+BSb1Zn6cX0VvzYe4uEslcyChYyHPEkg+fm7XwXRwwVjQjlTt6TXEnX
 H5n9wQoKemYmVlL9QxbXcd7jN13XKhvnTSSamHDvWIazbYcabFF/YDw0McF/dh+m2C1D
 bo+g==
X-Gm-Message-State: AOAM5306bm87jQMl1g4P6fEU5l8MBimd7x86TWQ0hd5AYXgGQVUoR4/M
 rMuCrPnpc4civBupn93rl2HoiSgjNp3FfwlE/YlyjICr8B0ZKXmMJr3CxqK/Wso1krjvIB3qVEC
 fvG/cqL+/2lgqeAU=
X-Received: by 2002:a5d:4290:: with SMTP id k16mr647083wrq.224.1628604004254; 
 Tue, 10 Aug 2021 07:00:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9iSIwi5GaQDhSAcuDuCSvpYm29KQoLQOx/nsT+Dhti4bZjv+OjaQ6KINFnHOrF2xUGygs/w==
X-Received: by 2002:a5d:4290:: with SMTP id k16mr647058wrq.224.1628604003966; 
 Tue, 10 Aug 2021 07:00:03 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 z1sm11729087wrv.22.2021.08.10.07.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 07:00:03 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Name and email address change
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210810095049.35602-1-hreitz@redhat.com>
 <0598232c-ee2a-cb82-264b-052fde8082ae@redhat.com>
 <98a4f877-2cbc-e285-3055-0a7b5a7ef901@redhat.com>
 <YRJxo0qC6XdOHZHU@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <0ad4bbfd-51ac-78b9-976a-159a52054671@redhat.com>
Date: Tue, 10 Aug 2021 16:00:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRJxo0qC6XdOHZHU@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.08.21 14:31, Daniel P. Berrangé wrote:
> On Tue, Aug 10, 2021 at 01:46:51PM +0200, Hanna Reitz wrote:
>> On 10.08.21 13:29, Philippe Mathieu-Daudé wrote:
>>> On 8/10/21 11:50 AM, Hanna Reitz wrote:
>>>> I have changed my name and email address.  Update the MAINTAINERS file
>>>> to match.
>>>>
>>>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>>>> ---
>>>>    MAINTAINERS | 8 ++++----
>>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>> I'd recommend you to also add an entry in .mailmap:
>>>
>>> -- >8 --
>>> diff --git a/.mailmap b/.mailmap
>>> index 082ff893ab3..504839c84d3 100644
>>> --- a/.mailmap
>>> +++ b/.mailmap
>>> @@ -53,6 +53,7 @@ Anthony Liguori <anthony@codemonkey.ws> Anthony
>>> Liguori <aliguori@us.ibm.com>
>>>    Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
>>>    Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
>>>    Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
>>> +Hanna Reitz <hreitz@redhat.com> <mreitz@redhat.com>
>>>    Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
>>>    Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
>>>    James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
>>> ---
>> Hu, I didn’t know there is such a thing.  Looks like I could even do
>>
>> Hanna Reitz <hreitz@redhat.com> Max Reitz <mreitz@redhat.com>
> With the line Philippe suggested, the rewrite will happen any time
> the original email is seen. With this line, the rewrite will only
> happen if both original name + email match. In practice this is
> functionally the same, unless someone had variations in the spelling
> of their real name over time, so either would work.

Ah, yes, I somehow believed that not specifying the old name would just 
replace the email address.  You’re right.

>> Feels a bit like cheating, though...?
> I wouldn't call it cheating. It is just an input for canonicalizing
> contributors' identities, where there were changes in name or email
> over time. It gives a more useful view to tools like 'git shortlog'
> and 'git-dm' stats reports, such that all work over time will be
> grouped together instead of split.

Alright.

Hanna


