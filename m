Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1E531432B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:48:26 +0100 (CET)
Received: from localhost ([::1]:59866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FKT-00045Y-F6
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:48:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l9Cf1-0003Sj-7c
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:57:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l9Cew-0002Ze-UK
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 14:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612814240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ckvs72m0dosNdLPiDWIrzBl1PqjclZCqYUKTmKYJkA4=;
 b=EoUBtWDWU063MOQX41+fz9Gxr/7z77Xl6xWKc8LaEZCK7nHRvRjnOE3wn95q1NF7GfPGZg
 DB5yeUKpTCqXHfUgmQOlaF+TILXQuYlWx9axe0xLRPVUHJ3AtYsXcJI/bUvLl0JpNZ4KF6
 JQBUq2xhnUbppmvKQvIjYGuc1Zwk7M8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-6UHFrgKVOi2HCNv-wPSBVg-1; Mon, 08 Feb 2021 14:57:18 -0500
X-MC-Unique: 6UHFrgKVOi2HCNv-wPSBVg-1
Received: by mail-qt1-f197.google.com with SMTP id k17so2602689qtm.13
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 11:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ckvs72m0dosNdLPiDWIrzBl1PqjclZCqYUKTmKYJkA4=;
 b=ApAxSl5w+KbMO7tURgHE03M/25p8tI2AdWfie0f5QvwFiqbDtRYD2HV9FCWWpmapsf
 8HOEDwtpub4yjlUa5Hn8FFSW/96fv7GUvAU6VEjetQTlv78np7USTRBq2PBTDL4UKAAO
 jINONc69OSK9sreHDG6h3UzQDUIY/14n5aWmyWCHHBTJRA3A1lSZPcxofMnguxDvIhoS
 7i6poTaszjsx/dZ1lvhOVxQH9th181WU+U1W7pQrx845ENYOIDWl+K0suw8WtJkOlHgT
 F3U4lHJaalrVi6rizGyjRzRdkr6tJSJ6b26XRUA6/n/xFS+rwWFWU1JUkj/xumDH0YXM
 dT4A==
X-Gm-Message-State: AOAM531ONACukHnNSjuDmx5WNfmrgyxKXyUdM16iY9gsxfIMgNEW+rbz
 Vb2yXocC1eEnYSkarcYtnRUhJFDpkKw5r+s4CFhi5QILQ2hef9/8WMv0mG8eNgdNuYKemYjIlVa
 AUAj0ePBZVWnHAPg=
X-Received: by 2002:aed:3926:: with SMTP id l35mr6732995qte.340.1612814238428; 
 Mon, 08 Feb 2021 11:57:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlOPAnuh6A6b393hg6YuB0HXa+tqd/8BnQ/BkWmtAI/ZflIvDyLTU7svUpmga89bmdzH+ACQ==
X-Received: by 2002:aed:3926:: with SMTP id l35mr6732979qte.340.1612814238203; 
 Mon, 08 Feb 2021 11:57:18 -0800 (PST)
Received: from [192.168.1.108] ([177.194.2.130])
 by smtp.gmail.com with ESMTPSA id m2sm14762421qtn.31.2021.02.08.11.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 11:57:17 -0800 (PST)
Subject: Re: [PATCH 1/3] tests/acceptance: Move the pseries test to a separate
 file
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210112164045.98565-1-thuth@redhat.com>
 <20210112164045.98565-2-thuth@redhat.com>
 <6cb6f7dd-2f9e-05c3-0efe-8f7f9f75fe84@redhat.com>
 <67dde2d9-1d87-35fa-9233-9264b0731e28@redhat.com>
 <23ca4afc-97a9-7438-0182-93cd49271d4e@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Message-ID: <2a335120-0d5a-663c-2645-15486b26f00d@redhat.com>
Date: Mon, 8 Feb 2021 16:57:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <23ca4afc-97a9-7438-0182-93cd49271d4e@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/4/21 5:52 AM, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 1/13/21 6:30 AM, Thomas Huth wrote:
>> On 12/01/2021 19.50, Wainer dos Santos Moschetta wrote:
>>> Hi,
>>>
>>> On 1/12/21 1:40 PM, Thomas Huth wrote:
>>>> Let's gather the POWER-related tests in a separate file.
>>>
>>>
>>> Did you consider having others ppc/ppc64 boot tests together too?
>>>
>>> Some candidates:
>>>
>>> tests/acceptance/boot_linux.py:BootLinuxPPC64.test_pseries_tcg
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc64_e500
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc_g3beige
>>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc_mac99
>>
>> The e500, g3beige and mac99 tests are depending on the
>> do_test_advcal_2018() function in that file, so I think they should
>> rather stay there.
>>
>>> tests/acceptance/ppc_prep_40p.py:IbmPrep40pMachine.test_factory_firmware_and_netbsd
>>> tests/acceptance/ppc_prep_40p.py:IbmPrep40pMachine.test_openbios_192m
>>> tests/acceptance/ppc_prep_40p.py:IbmPrep40pMachine.test_openbios_and_netbsd
>>>
>>
>> That's a good point, I did not notice that file when writing my patches.
>> Philippe, since you've created this ppc_prep_40p.py file, what do you
>> think, should it be merged with the other ppc tests, or shall we rather
>> keep this separate?
> 
> The choice was deliberate: the PReP machine has a different set of
> maintainers. If possible when we have a particular section in
> MAINTAINERS I'd like to use it as separation, to let the maintainers
> track changes in tests.
> 
> In this example, Hervé is interested to look for PReP related files,
> but doesn't have bandwidth to look at all PPC patches.
> 
> If this doesn't scale, I suggested (was it on the list or directly
> to Willian?) 

I remember we had this conversation some time ago, so, I'm sure you 
suggested to me, not sure if you mentioned that to the list.

> to add a Python script to map Avocado test tags to
> MAINTAINERS entry, so 1/ maintainers could run all tests linked to
> their subsystem by naming the subsystem, and 2/ when a test fails
> we know which maintainer to contact.

And I agree that is an interesting idea.

> 
> Regards,
> 
> Phil.
> 


