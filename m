Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B382121B3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 13:04:48 +0200 (CEST)
Received: from localhost ([::1]:49474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqx1L-0002wl-IM
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 07:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jqx0S-0002XD-KY
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:03:52 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34059
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jqx0P-0000GM-EG
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:03:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593687828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fG6edNOK4L+bQabZ+/dnYXbKwIQ7/CnbZwx1xA3cDPY=;
 b=JJcGOJ7+AfXk2vMgeNh/o+vaXK06SzvP/SjKndQdDTPyA+7KfdNrLw3hItZfcKbCOd7W7z
 dYSUrHgqPjAUxPA1z46I0nprE/Rbbq0aydOb9bxgRdJzbxAY94Dqt0dLbzCuK3isS8c0f6
 LxTc7k8+kZoMnmOllrxyrD2LMz35UiE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-TlBakp-AMOqi5GHBCnxlLg-1; Thu, 02 Jul 2020 07:03:44 -0400
X-MC-Unique: TlBakp-AMOqi5GHBCnxlLg-1
Received: by mail-ed1-f69.google.com with SMTP id y66so19604065ede.19
 for <qemu-devel@nongnu.org>; Thu, 02 Jul 2020 04:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fG6edNOK4L+bQabZ+/dnYXbKwIQ7/CnbZwx1xA3cDPY=;
 b=jTrDD1aO5g9YZudovBGMBXZTJq4JnntUBHpLVgGNh2SqXZdps4R3SHjdpy8Zadh3/T
 QjqYnW8VDDzjavaJ0orakkpTSGss13GTDNYQaYfObQdIt4v0h58peUQTpcQoaHOZw+pq
 I4cCjW6zlQdAH+fmCcxbqz3t4g2tPNGeIeOrPrjOiZfXqKolLeE3sq7BnyoQ9e0jMLek
 TKprwDNHC7oUecAdBWFbr4ZyyOXTFvOMrbf/Zg6I8pAGb8OPrQ0gbeG3MlkCJr/wfGTf
 Y9Su888ZY2HjIgTS49QOGaTLMljS/I2B+ToSQT2Maj9LVEYL88qsaOePaPGQkEzaVEQO
 wGVA==
X-Gm-Message-State: AOAM530Fvbm85uQAW7UnmrNR7NT3axyiVsGS5IQ7IUK8UGnCRwV2uAwZ
 G8wRWFXBRUASY6OgbD7iQDLmGigTJ3ewDnzlGsleOrn+tFt12s6fI2E83efU9DwvqApjzZ2iqB8
 DYHd+dFQVaENOjKk=
X-Received: by 2002:a05:6402:ca1:: with SMTP id
 cn1mr22382682edb.223.1593687822617; 
 Thu, 02 Jul 2020 04:03:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6UIMOfQlIL3NjETf+sjbHPnpTcZghlCGJjW3651y8tuOBOIp1lEyHFyKKN8IhnTs8xgTIrA==
X-Received: by 2002:a05:6402:ca1:: with SMTP id
 cn1mr22382666edb.223.1593687822411; 
 Thu, 02 Jul 2020 04:03:42 -0700 (PDT)
Received: from [192.168.1.37] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id i10sm8635752edx.42.2020.07.02.04.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2020 04:03:41 -0700 (PDT)
Subject: Re: [PATCH v10 0/5] fw_cfg: Add FW_CFG_DATA_GENERATOR; crypto: Add
 tls-cipher-suites
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
References: <20200623172726.21040-1-philmd@redhat.com>
 <20200701103155.GE1427561@redhat.com>
 <b450f105-59a6-7502-93a0-fb9cf26e8ad2@redhat.com>
 <20200702110114.GH1888119@redhat.com>
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
Message-ID: <1b799338-5ebc-5861-572c-f685e459452d@redhat.com>
Date: Thu, 2 Jul 2020 13:03:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200702110114.GH1888119@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:42:59
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/20 1:01 PM, Daniel P. Berrangé wrote:
> On Thu, Jul 02, 2020 at 01:00:02PM +0200, Laszlo Ersek wrote:
>> On 07/01/20 12:31, Daniel P. Berrangé wrote:
>>> On Tue, Jun 23, 2020 at 07:27:21PM +0200, Philippe Mathieu-Daudé wrote:
>>>> Hi,
>>>>
>>>> This series has 3 parts:
>>>>
>>>> - First we add the tls-cipher-suites object
>>>>
>>>> - We add the ability to QOM objects to produce data
>>>>   consumable by the fw_cfg device,
>>>>
>>>> - Then we let the tls-cipher-suites object implement
>>>>   the FW_CFG_DATA_GENERATOR interface.
>>>>
>>>> This is required by EDK2 'HTTPS Boot' feature [*] to tell
>>>> the guest which TLS ciphers it can use.
>>>
>>> On my crypto side, the series is ready to merge.
>>>
>>> The code is split 50/50 between crypto subsystem and firmware
>>> subsystem, so the question is who wants to merge it ?
>>>
>>> If Laszlo wants to merge it, then consider the whole series
>>> to have   Acked-by: Daniel P. Berrangé <berrange@redhat.com>
>>>
>>> If Laszlo wants me to merge it, then I'll just wait for him
>>> to give his Ack.
>>>
>>> Soft-freeze is fast approaching in less than a week...
>>
>> We should let Phil send a pull request. :)
> 
> Fine by me.

OK will do, thank to both of you!


