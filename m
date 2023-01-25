Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3246C67AFA6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 11:26:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKcz7-0004ZI-MC; Wed, 25 Jan 2023 05:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKcz5-0004Z8-QD
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 05:26:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKcz4-0006nW-5n
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 05:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674642385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CToGZGoOarziJdDXGWR0AtbFWPZHF7qkaD8J/CoRiGE=;
 b=PSxtJZTkpp/z8+pAQTgoMNNDe/LYO3gPe1SC9uqDP96l7lkmkPKo/O7N5BQufeOLK9W9yM
 eDIZLXoLQ7QDc/BryZSs1yATMSXYAvdVnZJdqnD26vKoC4nVqO6tzjARo4HIYaXqOgea6c
 l3wSLNKFtVsIkFesJwcXk+camonXyUE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-UPA52SZ3N0SX88_n3C8Dmw-1; Wed, 25 Jan 2023 05:26:23 -0500
X-MC-Unique: UPA52SZ3N0SX88_n3C8Dmw-1
Received: by mail-qt1-f197.google.com with SMTP id
 k8-20020ac84788000000b003b631e8cc4dso7369345qtq.16
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 02:26:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CToGZGoOarziJdDXGWR0AtbFWPZHF7qkaD8J/CoRiGE=;
 b=y+SVjj0ahIBtLm3Y+pmbbwh/SYeEqq3KkYkYy4KBapIIexQSXJtKp7z6wVh+tYaZv9
 TN6caiplYxqpD5mOnBlVJk0gwZX7WL2/A/gjp+3SEm4BsT/EcuBeUJGf2UuIwwZ3zMnE
 RSHwK1V/MFGGViLJQzKxogq7A249Fmzw/wVove9MCO67BghBlfWVuwAK9/u/nToCNqkd
 8SvZtaCTfHFW4mnypQO+gu/h2XyJz5Ezik42NGg8QEWCQTqcEQeuPQnJdl7DK4H3kr2y
 ikYuZApfu5uGuJh8mIn8zyZ38o8HQDkcOLDPbzkDlbTIN3MuitlC7Nw15IoCAxGiJa6M
 uSTA==
X-Gm-Message-State: AFqh2kqClIzIkfzB+6XcCYC5mKeMbrzSM+U5l7AQz+99VLXKA8Wa+qtJ
 Yp2tKWcvymY3Kg8rzXiEG2S7w4EkzozhVaxykUsVKRdn9eqB02zJf6IpnzNx/U8zrZOzuopOE3z
 Ca5HqjHRh48OSmY8=
X-Received: by 2002:ac8:60d7:0:b0:3b1:2604:634b with SMTP id
 i23-20020ac860d7000000b003b12604634bmr46537712qtm.30.1674642383536; 
 Wed, 25 Jan 2023 02:26:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuBxhJbGkn5QthhB3oeYKDT0xFod01H+CQlFDaS+nZcXPuGRJ0WfSwpz5n4wBlOS9v1/lkcBA==
X-Received: by 2002:ac8:60d7:0:b0:3b1:2604:634b with SMTP id
 i23-20020ac860d7000000b003b12604634bmr46537700qtm.30.1674642383317; 
 Wed, 25 Jan 2023 02:26:23 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-209.web.vodafone.de.
 [109.43.178.209]) by smtp.gmail.com with ESMTPSA id
 c10-20020a05620a11aa00b006fca1691425sm3218213qkk.63.2023.01.25.02.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 02:26:22 -0800 (PST)
Message-ID: <bb2369d1-bb7a-5275-9616-53b7101de0e8@redhat.com>
Date: Wed, 25 Jan 2023 11:26:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: MinGW and libfdt (was: Re: MSYS2 and libfdt)
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 QEMU Developers <qemu-devel@nongnu.org>, Cole Robinson <crobinso@redhat.com>
References: <c2246b1a-51b3-2843-5164-c424c571874f@redhat.com>
 <CAJ+F1C+EC-tgDOyX5e56utKdUz-DXMMtwrtVyKXT2Jj4r43OCA@mail.gmail.com>
 <839268cb-b65c-68d6-1294-47548ed383b1@redhat.com>
 <CAJ+F1CJteJ665MLSUhWg-p9=tH6B7w-m=pop+o9ktGffxCiZaA@mail.gmail.com>
 <Y860hPT+o15BGQYq@redhat.com>
 <0c771cc2-4746-0e5b-e372-c2a7be830144@redhat.com>
 <Y8/0bBPM0cxnYnKy@redhat.com>
 <CAJ+F1CJvSiD9Hp4s24enRw06Er+XrCaOYmH61=zP9jCLYLoHLA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJ+F1CJvSiD9Hp4s24enRw06Er+XrCaOYmH61=zP9jCLYLoHLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/01/2023 20.10, Marc-André Lureau wrote:
> Hi
> 
> On Tue, Jan 24, 2023 at 7:08 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> On Tue, Jan 24, 2023 at 03:43:25PM +0100, Thomas Huth wrote:
>>> On 23/01/2023 17.23, Daniel P. Berrangé wrote:
>>>> On Fri, Jan 20, 2023 at 05:57:29PM +0400, Marc-André Lureau wrote:
>>> ...
>>>>>>> On Thu, Jan 19, 2023 at 12:31 PM Thomas Huth <thuth@redhat.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>      Hi all,
>>>>>>>>
>>>>>>>> in some spare minutes, I started playing with a patch to try to remove the
>>>>>>>> dtc submodule from the QEMU git repository - according to
>>>>>>>> https://repology.org/project/dtc/versions our supported build platforms
>>>>>>>> should now all provide the minimum required version.
>>> ...
>>>> So in theory we can try to drop the submodule for dtc now
>>>
>>> The dtc package is also still missing in the MinGW cross compiler suite in
>>> Fedora ... does anybody know what's the right way to request it there?
>>
>> Someone will need to write a specfile, and submit it for review. I can do
>> the submission, or the review, but not both (can't mark your own homework)
>>
> 
> It's already been in rawhide for a few months. We can probably merge
> and update f37.
> https://packages.fedoraproject.org/pkgs/dtc/dtc/

Ah, great, good to know that it is on its way already. Even if this only 
gets released in F38 this still should be fine ... F38 is not that far away 
anymore.

  Thomas


