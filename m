Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C979E321C9A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:17:56 +0100 (CET)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDuF-0007wT-6o
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEDoW-00030I-FK
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:12:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEDoU-0002Kl-ES
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614010314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0yA8MwGafqiDdmzfp09G7fB7AoX+Lobsvvpf6MIHK1k=;
 b=HgLjlW7XHdHQcjyFJfqz9P3Z43uj92GeXwXDJMycBTKoAzmjRmhZ1Ib7rseqEhzE/gDahv
 awGh8/cAnfO1951ICWyOmSe0faPMpH8f4dCeqp86dNAKxwMh8vM7VfNC9D88kt7CcwmT7G
 RbCBs2RQNoFin7IDSxdNb1ZANb43G+E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-VBOaBk54PbmVK24ihl8yfQ-1; Mon, 22 Feb 2021 11:11:51 -0500
X-MC-Unique: VBOaBk54PbmVK24ihl8yfQ-1
Received: by mail-ej1-f71.google.com with SMTP id er8so4178740ejc.13
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 08:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0yA8MwGafqiDdmzfp09G7fB7AoX+Lobsvvpf6MIHK1k=;
 b=ijByZBmM8tVwuaaYV2m9QprYd4zNICXY2+tTJItQuRnuH951vnz3GJn1vlqioqC3rR
 UGXCkZkWJEHGROnD6upRJJ0WOXXDfQwTBEu/OluPSr888rHhzZBseNKrYnnYHQDvHyg+
 b2t8PsgHlc+A/5KA+C87EPwVn0P/KXbLQ1/IovbW1ONUfKf0aClkJ/U7+8VOGK81M6pa
 ZAEojhsV5FP2I+BWFzl5CQ2hQaeTHjS8OaM5svNeR71Oq4FpI+4KsBLivVGAwZiVwZ2+
 lDOC7VvIJsj1ZkuNEJ7OTMEuMpQb9QP6kGE377Hjl/iqpdQpu9/xKBZoaxrMyN7+lk3q
 C0tQ==
X-Gm-Message-State: AOAM532II/vGxBQDnr46zRRHNE2sBcbDWTEvCeQ267o5/R0KAAF6GWJa
 lP4JoB1d5OkeRKx5NR6cIQQPxn13rnPgnCKZMiQwb7qLePkhw8Ooba3YasI6Uy6z6Sq/o+6hG01
 vw61Ad9LeDabCFVM=
X-Received: by 2002:a17:906:503:: with SMTP id
 j3mr21360465eja.172.1614010309575; 
 Mon, 22 Feb 2021 08:11:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPfYG5VWuo3B7me2XY8miSLs1wXlKvbUY+RNcXJv2061rKx7YxIyNt1HbxY64HCGa5c7gHIQ==
X-Received: by 2002:a17:906:503:: with SMTP id
 j3mr21360448eja.172.1614010309407; 
 Mon, 22 Feb 2021 08:11:49 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y13sm482993eju.75.2021.02.22.08.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 08:11:48 -0800 (PST)
Subject: Re: QEMU hosting
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <CAJSP0QVZuh8H-U1vtFMhasqSsSy3OA4jmRvwZrQEAx3=1dcb+w@mail.gmail.com>
 <LO2P123MB2605DA330913C7D2DA311EF1C8D10@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM>
 <b803bbce-ef10-229b-eccb-b26f0e589a43@redhat.com>
 <b19717c3-bf78-9369-e84a-b8f965d7150f@redhat.com>
Message-ID: <e8513f65-a94f-7944-587c-6a7462a3f7a5@redhat.com>
Date: Mon, 22 Feb 2021 17:11:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b19717c3-bf78-9369-e84a-b8f965d7150f@redhat.com>
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Fosshost <admin@fosshost.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 5:07 PM, Philippe Mathieu-Daudé wrote:
> On 2/22/21 4:56 PM, Philippe Mathieu-Daudé wrote:
>> Hi Thomas and Stefan,
>>
>> On 1/5/21 7:55 PM, Fosshost wrote:
>>> Hi Stefan
>>>
>>> Thank you for your email.
>>>
>>>  1. We do not offer MacOS hosting
>>>  2. We can provide virtual machines with full KVM virt on x86
>>>     architecture and soon arm64 v8

And from https://fosshost.org/about:
"We support most operating systems including CentOS, Debian, Ubuntu,
ArchLinux and FreeBSD and custom OS."

Eventually we could add a pair of FreeBSD runners to our Gitlab CI?
https://docs.gitlab.com/runner/install/freebsd.html

>>>  3. We do not provide dedicated servers.
>>
>> Would it be possible to have a dedicated VM for a git LFS server [*]?
> 
> Just noticed the Mirrors-as-a-Service option "(available for package
> mirrors, operating systems, repositories, documentation, static assets,
> etc)":
> 
> https://docs.fosshost.org/en/home/getting-started#production-services
> https://docs.fosshost.org/en/home/mirrors-as-a-service
> 
>> If so, what storage is usable? Are there network traffic limits?
>>
>> Thanks,
>>
>> Phil.
>>
>> [*] https://docs.gitlab.com/ee/topics/git/lfs/
>>
>>> ------------------------------------------------------------------------
>>> *From:* Stefan Hajnoczi <stefanha@gmail.com>
>>> *Sent:* 05 January 2021 14:21
>>> *To:* Fosshost <admin@fosshost.org>
>>> *Cc:* qemu-devel <qemu-devel@nongnu.org>
>>> *Subject:* QEMU hosting
>>>  
>>> Hi Thomas,
>>> In November you emailed qemu-devel asking if the QEMU project was
>>> interested in exploring hosting with Fosshost.org. I think my reply
>>> may have gotten lost so I wanted to check if you have time to discuss
>>> this again.
>>>
>>> The main hosting need that QEMU has is for continuous integration
>>> system runners. We are particularly interested in non-x86/non-Linux
>>> build machines and a dedicated server for reproducible performance
>>> tests. Just today there was discussion on #qemu IRC about how to go
>>> about adding a macOS build machine, for example.
>>>
>>> It would be great to find out more about Fosshost.org and whether we
>>> can work together.
>>>
>>> Thanks,
>>> Stefan
>>
> 


