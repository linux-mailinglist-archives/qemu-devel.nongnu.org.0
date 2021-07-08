Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6943C15A7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:04:24 +0200 (CEST)
Received: from localhost ([::1]:58558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VZf-0001na-9i
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m1VYL-0000SM-Pd
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:03:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1m1VY7-0003Iw-P7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625756566;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ce6IgHjsQAO556iFGQADl158n0qgqEcIMB4Rd0AZE/M=;
 b=HCEbnQIgG92zRAOO5G6ipY7MWm5aCtPFNdU/OXxQPDzyZj7v6TyRo6l410T3AyFPJBYNnx
 0RBtTpcuXJWGDjVFAoZXluu2utAa71SnFd1VoU829tOpk6rdfmxpjMM9VCcWgYN1A2t0U9
 houHGr150IzrobpuM5zbm+kafx0y+fQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-HKKfo4rGO4eZ9_N3GAsERw-1; Thu, 08 Jul 2021 11:02:45 -0400
X-MC-Unique: HKKfo4rGO4eZ9_N3GAsERw-1
Received: by mail-wr1-f70.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so2077617wru.6
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Ce6IgHjsQAO556iFGQADl158n0qgqEcIMB4Rd0AZE/M=;
 b=KLSCdDpl17AeJzvQsLr7RrliTcLdhMFqJK4FVl5YD807ORz2fZTz6mZAPZMmabzXEa
 97pil0o6yOKx/48vUXahi8xn5Z1YOC6KEPNHpuiYYMl18EcubJWcq04KVk3+Ar9CVoxB
 9fRyzjmqGKsHDGsLpFd5ladUq6WpSg9j/buk3xpDkODcTMzUN+I3B2A7tYil+yE28GMj
 jyhuPIHve/pHoDweKO1kOhhGX7L3IeE/g+PJUwWYBSrByaokQlvx5rgYtcxUdABffygR
 /gFmnfgFtOuYkI9Dm1aVV6cHhzX8Qc7nIvaVTtT7hpMNR2NDJOEyGnptovejxnwivEY0
 YBUA==
X-Gm-Message-State: AOAM531usmYzgih3WnNcGBwogARdP+wTHPEpoW9XasVEJHi0WhgluA0n
 rnnSn0gdrfEhBmPdg+mMy7PdJNE5MpyrJFayvQYAGamj3HTD2Wyl3a5QUXY2VcEtEvqXJDbA3GQ
 pZoKNwzyORu4vf9o=
X-Received: by 2002:a7b:c191:: with SMTP id y17mr32687234wmi.25.1625756560989; 
 Thu, 08 Jul 2021 08:02:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcvsHFvf5YyebEVh9hBfbKXLgya+WHQnC5avuCd3i1Dddj0LmaVeAuj/fcjnjhtsz8cK3wcA==
X-Received: by 2002:a7b:c191:: with SMTP id y17mr32687197wmi.25.1625756560699; 
 Thu, 08 Jul 2021 08:02:40 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id c1sm2404818wrp.94.2021.07.08.08.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 08:02:40 -0700 (PDT)
Subject: Re: [PATCH 2/3] Acceptance Tests: move definition of distro checksums
 to the framework
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210414221457.1653745-1-crosa@redhat.com>
 <20210414221457.1653745-3-crosa@redhat.com>
 <c8ec5d7f-3ae7-49da-e10e-717789694793@redhat.com>
 <0383a140-5007-1257-5911-8eb94c1cb7aa@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <98af3252-6715-63f0-6746-da252be4c4de@redhat.com>
Date: Thu, 8 Jul 2021 17:02:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0383a140-5007-1257-5911-8eb94c1cb7aa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber,

On 7/8/21 4:47 PM, Cleber Rosa wrote:
>
> On 4/22/21 3:56 AM, Auger Eric wrote:
>> Hi Cleber,
>>
>> On 4/15/21 12:14 AM, Cleber Rosa wrote:
>>> Instead of having, by default, the checksum in the tests, and the
>>> definition of tests in the framework, let's keep them together.
>>>
>>> A central definition for distributions is available, and it should
>>> allow other known distros to be added more easily.
>>>
>>> No behavior change is expected here, and tests can still define
>>> a distro_checksum value if for some reason they want to override
>>> the known distribution information.
>>>
>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>   tests/acceptance/avocado_qemu/__init__.py | 34
>>> +++++++++++++++++++++--
>>>   tests/acceptance/boot_linux.py            |  8 ------
>>>   2 files changed, 32 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/tests/acceptance/avocado_qemu/__init__.py
>>> b/tests/acceptance/avocado_qemu/__init__.py
>>> index aae1e5bbc9..97093614d9 100644
>>> --- a/tests/acceptance/avocado_qemu/__init__.py
>>> +++ b/tests/acceptance/avocado_qemu/__init__.py
>>> @@ -299,6 +299,30 @@ def ssh_command(self, command):
>>>           return stdout_lines, stderr_lines
>>>     +#: A collection of known distros and their respective image
>>> checksum
>>> +KNOWN_DISTROS = {
>>> +    'fedora': {
>>> +        '31': {
>>> +            'x86_64':
>>> +            {'checksum':
>>> 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
>>> +            'aarch64':
>>> +            {'checksum':
>>> '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'},
>>> +            'ppc64':
>>> +            {'checksum':
>>> '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
>>> +            's390x':
>>> +            {'checksum':
>>> '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'},
>>> +            }
>>> +        }
>>> +    }
>> assuming we may put other data like kernel params and maybe pxeboot URL,
>> this may grow rapidly, Maybe we should put that in a different file?
>
>
> Hi Eric,
>
>
> Sorry for the monstrous delay here.  You and I are thinking alike, but
> I'm planning to handle this on the Avocado side.  I'm writing a
> BluePrint[1] for what would be a revision of the Avocado asset API. 
> In that new proposal, data files (some builtin, some external) would
> be used to contain information about known assets.
>
>
> So, for now, I think it's better to keep this AS IS.  Let me know if
> this works for you.

OK for me. This was just a suggestion anyway and the functionality is
more important atm.

Thanks

Eric
>
>
> Thanks,
>
> - Cleber.
>
>
> [1] - https://github.com/avocado-framework/avocado/issues/4458
>
>


