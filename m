Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018D0322999
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:42:27 +0100 (CET)
Received: from localhost ([::1]:47140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEW5C-0006lb-1b
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEW4P-0006KC-K8
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:41:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEW4N-0003BG-00
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:41:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614080493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRVTM1/6kPZdsN5ZBiPckICnE3wwL3AKImUE5yTaQY4=;
 b=cTQuLd0dJlbr6VP/JI5puVnnngKdBSgre5zQbI96CmA/44CZXAt6i+AbbxB/DPVLJfVpEU
 cLqdhTDaLH1cCr2Y/oACvVeo2uqkE4TIcvT6nZvNTI4J1XtBn7xWJBeAlR1yHSQgdm0GyG
 NOaIK+3WyYffCwr3QDTmEw209SMGJ+c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-fASkF7sjPuGpCpvNN9skrg-1; Tue, 23 Feb 2021 06:41:30 -0500
X-MC-Unique: fASkF7sjPuGpCpvNN9skrg-1
Received: by mail-wm1-f71.google.com with SMTP id t15so614354wmj.1
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 03:41:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iRVTM1/6kPZdsN5ZBiPckICnE3wwL3AKImUE5yTaQY4=;
 b=KFJMtvvsMPgEl5kSEkRayGTctmjGvO+FIlnsSozVevBrfTM8iEG3WeF6lxQLLr/L9b
 2zLnzkjQWC4Bazp4dNrJKv+AkL7j/YwK1bLjsnBEQW03lGq7ZrfTMyJEksqK7kWPPd+u
 EhJO6WLiGAZ1r6bxJJe9K/N6fB0bUSzCn6JeXkXugIUkSmy4sh7pJJnvSKvdPd8l/NvX
 OSMnfaJszvRCH3AXUgKBNfYUNA77282DYfWVvuOSVUK2OvNqQGZ9HzkZ9EGT7lk8c2lA
 bW7MX7zYGNry4xJYATQ22TGy3bKu8B4CrdneU0E6uUTUohQ5tHZUzDTUU5u72CFUBI9N
 frTQ==
X-Gm-Message-State: AOAM532ehTaKgUUmsdQsRNg1e60p5Zd1JqF/buWmMdEG2ktn86bBqBjY
 hGbfb2hpQXtXxM/m1mIjiNTgJamHJa8nCGlCcnqN/du06CKyfh11MgIZaybdaBbVM7aaEsu4sem
 WomiWYx/KTl76VYU=
X-Received: by 2002:a5d:42cf:: with SMTP id t15mr26070071wrr.82.1614080489172; 
 Tue, 23 Feb 2021 03:41:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKJBvwxmFln39xQKtLkHlcQGJ4ZtweEUxM1Z6W4g0aEQYB6ANhjMQlerq0X3b7y8VjnjvR0A==
X-Received: by 2002:a5d:42cf:: with SMTP id t15mr26070046wrr.82.1614080489008; 
 Tue, 23 Feb 2021 03:41:29 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w81sm2443500wmb.3.2021.02.23.03.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 03:41:28 -0800 (PST)
Subject: Re: QEMU hosting
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Fosshost <admin@fosshost.org>
References: <CAJSP0QVZuh8H-U1vtFMhasqSsSy3OA4jmRvwZrQEAx3=1dcb+w@mail.gmail.com>
 <LO2P123MB2605DA330913C7D2DA311EF1C8D10@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM>
 <b803bbce-ef10-229b-eccb-b26f0e589a43@redhat.com>
 <b19717c3-bf78-9369-e84a-b8f965d7150f@redhat.com>
 <e8513f65-a94f-7944-587c-6a7462a3f7a5@redhat.com>
Message-ID: <19ca4ff0-55b7-0bfd-624a-85962fee3bcc@redhat.com>
Date: Tue, 23 Feb 2021 12:41:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e8513f65-a94f-7944-587c-6a7462a3f7a5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Updating this thread for the list, I have been told that
Cleber is looking at all these options for mainstream CI,
and is already in contact with fosshost.org.

I'll let him follow these ideas.

Regards,

Phil.

On 2/22/21 5:11 PM, Philippe Mathieu-Daudé wrote:
> On 2/22/21 5:07 PM, Philippe Mathieu-Daudé wrote:
>> On 2/22/21 4:56 PM, Philippe Mathieu-Daudé wrote:
>>> Hi Thomas and Stefan,
>>>
>>> On 1/5/21 7:55 PM, Fosshost wrote:
>>>> Hi Stefan
>>>>
>>>> Thank you for your email.
>>>>
>>>>  1. We do not offer MacOS hosting
>>>>  2. We can provide virtual machines with full KVM virt on x86
>>>>     architecture and soon arm64 v8
> 
> And from https://fosshost.org/about:
> "We support most operating systems including CentOS, Debian, Ubuntu,
> ArchLinux and FreeBSD and custom OS."
> 
> Eventually we could add a pair of FreeBSD runners to our Gitlab CI?
> https://docs.gitlab.com/runner/install/freebsd.html
>
>>>>  3. We do not provide dedicated servers.
>>>
>>> Would it be possible to have a dedicated VM for a git LFS server [*]?
>>
>> Just noticed the Mirrors-as-a-Service option "(available for package
>> mirrors, operating systems, repositories, documentation, static assets,
>> etc)":
>>
>> https://docs.fosshost.org/en/home/getting-started#production-services
>> https://docs.fosshost.org/en/home/mirrors-as-a-service
>>
>>> If so, what storage is usable? Are there network traffic limits?
>>>
>>> Thanks,
>>>
>>> Phil.
>>>
>>> [*] https://docs.gitlab.com/ee/topics/git/lfs/
>>>
>>>> ------------------------------------------------------------------------
>>>> *From:* Stefan Hajnoczi <stefanha@gmail.com>
>>>> *Sent:* 05 January 2021 14:21
>>>> *To:* Fosshost <admin@fosshost.org>
>>>> *Cc:* qemu-devel <qemu-devel@nongnu.org>
>>>> *Subject:* QEMU hosting
>>>>  
>>>> Hi Thomas,
>>>> In November you emailed qemu-devel asking if the QEMU project was
>>>> interested in exploring hosting with Fosshost.org. I think my reply
>>>> may have gotten lost so I wanted to check if you have time to discuss
>>>> this again.
>>>>
>>>> The main hosting need that QEMU has is for continuous integration
>>>> system runners. We are particularly interested in non-x86/non-Linux
>>>> build machines and a dedicated server for reproducible performance
>>>> tests. Just today there was discussion on #qemu IRC about how to go
>>>> about adding a macOS build machine, for example.
>>>>
>>>> It would be great to find out more about Fosshost.org and whether we
>>>> can work together.
>>>>
>>>> Thanks,
>>>> Stefan
>>>
>>
> 


