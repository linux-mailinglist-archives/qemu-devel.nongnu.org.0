Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5781E4026
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 13:35:37 +0200 (CEST)
Received: from localhost ([::1]:37102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jduLQ-0006jO-JY
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 07:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jduKa-0006Bp-BM
 for qemu-devel@nongnu.org; Wed, 27 May 2020 07:34:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22399
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jduKZ-0005BR-FT
 for qemu-devel@nongnu.org; Wed, 27 May 2020 07:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590579282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=NLDHYmdXPdPDw6QaIa/XWJyHwtqfPEmMHHZZaI1yQp4=;
 b=Zj8ZV9m9XGgZYPc0eULEUlQlrMHL312FXE4sM+dnfUFEg/8uD8zgWm4CDtGcvHOHs81v+h
 mmdbFdxB3Vf0Uvgmr2UXxySw3W5IHwC7ISkadWRgwpFv65c3aXfaUv+M8/NcNJiz67qGTQ
 50SIBaIcKtX7TV1NoyrKnHjn9L3x6BE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-t7uHKS4fO4mdWTYsFa2PxA-1; Wed, 27 May 2020 07:34:40 -0400
X-MC-Unique: t7uHKS4fO4mdWTYsFa2PxA-1
Received: by mail-ed1-f71.google.com with SMTP id dk23so10014925edb.15
 for <qemu-devel@nongnu.org>; Wed, 27 May 2020 04:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NLDHYmdXPdPDw6QaIa/XWJyHwtqfPEmMHHZZaI1yQp4=;
 b=nd/727IsbHYaua3CiwQgiM+Wtsfv2qNSeCHclfnsv2GzBsVTlPAocLaYuVHynq310P
 TzfXGb1GJIDY4ezMgM+zVzrc1VRwWTnEYqydW5kUKAgGHuBxk/7EbsGjvqcRoBlFyUz2
 xmDV43+3me9umI+6AJ+jh9ufRjdkUTgRshlnxbOHAbLj2jR3pTxuMKYEmQTP5rxFKzLc
 8ilWeQWR6xaaL3mKhxcXVryYnDxh9BXpv0WtoHP24Q8UnhCSPBtOGldw5vwDbS26/doc
 P5cfQMmIGhRjvuSBWCafbsRGs70RWddhN+4Ak/SRyjcXLBQ8AJDynFrrr4juhwEW7r9k
 9DQA==
X-Gm-Message-State: AOAM530GSC3FiOP6CgRyoC/8TaMXiVV5eGsEvu4iDnM6JeGXNlwF2PW2
 AG8rL/K6g19EgoMjjvt8gCK+3Zs7Bm1cXargND4Vnhsm7HgxJrdbraLZDfwQGrnhNuDAYcw1Zct
 Hw4RjNgZH13XJ2JM=
X-Received: by 2002:a17:906:14d3:: with SMTP id
 y19mr5537560ejc.466.1590579279736; 
 Wed, 27 May 2020 04:34:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTbgNrW/ge/cmQSyr9TPas6ybPqQJ7Cbpfuamj4broKpM5qI0gmDKpIIatwp0itXg9UE74aQ==
X-Received: by 2002:a17:906:14d3:: with SMTP id
 y19mr5537540ejc.466.1590579279522; 
 Wed, 27 May 2020 04:34:39 -0700 (PDT)
Received: from [192.168.1.36] (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id da17sm1955230edb.11.2020.05.27.04.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2020 04:34:39 -0700 (PDT)
Subject: Re: [PATCH v6 0/5] fw_cfg: Add FW_CFG_DATA_GENERATOR; crypto: Add
 tls-cipher-suites
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20200519182024.14638-1-philmd@redhat.com>
 <5ed708d2-1af4-c8e8-58a0-3208550f05b8@redhat.com>
 <20200527113334.GK2665520@redhat.com>
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
Message-ID: <5b617613-1117-e09a-1345-253bf2695210@redhat.com>
Date: Wed, 27 May 2020 13:34:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200527113334.GK2665520@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 00:49:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/20 1:33 PM, Daniel P. Berrangé wrote:
> On Wed, May 27, 2020 at 01:29:20PM +0200, Philippe Mathieu-Daudé wrote:
>> Hi Daniel,
>>
>> On 5/19/20 8:20 PM, Philippe Mathieu-Daudé wrote:
>>> Hi,
>>>
>>> This series has two parts:
>>>
>>> - First we add the ability to QOM objects to produce data
>>>   consumable by the fw_cfg device,
>>>
>>> - Then we add the tls-cipher-suites object, and let it
>>>   implement the FW_CFG_DATA_GENERATOR interface.
>>
>> Can I have a quick feedback that you are not going to NAck this series
>> later before addressing all comments from Laszlo's reviews?
> 
> It looks reasonable.

Thanks for your quick answer!

Phil.


