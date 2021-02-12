Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F249D31A629
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:44:26 +0100 (CET)
Received: from localhost ([::1]:37990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAfIg-0002iz-10
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:44:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lAfGt-00025Q-To
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:42:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lAfGr-0006lM-2t
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:42:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613162551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eIsCC3i7aY5Mm6PTXLrKoI1Zpbjzp1DexiA1BS9To4s=;
 b=PwV9Qgpe9+5KiR4GytGTVZU5faGamQ8Icb72vmMiWcFmVZxwkBgfS8Q2jBbMpJJq0bV5Si
 AiGpFA5fc7s1fXbsd/KlTKjSxrWh7wGye+ZQckyfgyJ/vOMMm7GdK/xOt7fSHihe5dhWOh
 iei7An2PBO0KTg+6BBWmj7dacWFX49A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-q3wlYzTjPXm8ntex4kik6g-1; Fri, 12 Feb 2021 15:42:27 -0500
X-MC-Unique: q3wlYzTjPXm8ntex4kik6g-1
Received: by mail-wr1-f70.google.com with SMTP id s18so1263049wrf.0
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 12:42:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eIsCC3i7aY5Mm6PTXLrKoI1Zpbjzp1DexiA1BS9To4s=;
 b=Kl+aEfTJ3l/d2C2KlSaI+gz9Fo8gEMwZFLnGC+OdbS8JvD7n2puKRXrnR7vOPcG6yW
 3D5N0Oxm86MZKyxDLgLVGnBrI64XTJbnV0BKtNL2DOenpKLflk+fFuZvp9a2JeDiHcCf
 GLyQWsuzmiGklrljA7BpFTjHL9YADq4fndpUzegKTFg8ljHYPbLY6kqF2bbanHbzRwiv
 cFqSOGdbket3zh4zP4STLkr2YBAX3+C6hGqe+1UPZp9jJGRP5FOBkPpSd82NXwwKp4IT
 r/2COsP8YfLMxgNK4hnI/9d8U5ZPzk2N0Mt1AuIUlyiexMAMYroKFxs2VNFauuQYtmma
 gDAg==
X-Gm-Message-State: AOAM532NN3uie4qhrTq6f6w+HFnnl0Ev3si5chk5L2C1ZGx/b47rhHwZ
 EZ8X2y66yU5ydhqtEPxMmlF4xJsNwDf4HOgcnVjWCpd55l92ybJVC32gr1Yp4hV7BPrcnMfvr5J
 xHf7WVbWzs69OFNQ=
X-Received: by 2002:adf:aa98:: with SMTP id h24mr5430949wrc.75.1613162546628; 
 Fri, 12 Feb 2021 12:42:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKifEgri2nM20YYmZeu6XOyA79cTWASjRVqSy99qjW9iUpASnDErKYq7Z0nDcsT5jijQs2rg==
X-Received: by 2002:adf:aa98:: with SMTP id h24mr5430940wrc.75.1613162546434; 
 Fri, 12 Feb 2021 12:42:26 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y15sm12135790wrm.93.2021.02.12.12.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 12:42:25 -0800 (PST)
Subject: Re: [PATCH] virtiofs_submounts.py test: Note on vmlinuz param
To: Cleber Rosa <crosa@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20210212151649.252440-1-mreitz@redhat.com>
 <20210212185814.GA2653579@localhost.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <16a72cc1-1c92-287d-d4ad-043b425d3414@redhat.com>
Date: Fri, 12 Feb 2021 21:42:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210212185814.GA2653579@localhost.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber,

On 2/12/21 7:58 PM, Cleber Rosa wrote:
> On Fri, Feb 12, 2021 at 04:16:49PM +0100, Max Reitz wrote:
>> From the cancel message, it is not entirely clear why this parameter is
>> mandatory now, or that it will be optional in the future.  Add such a
>> more detailed explanation as a comment in the test source file.
>>
>> Suggested-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>> I’ve uploaded a build of Linux 5.10 here:
>>   https://xanclic.moe/linux-5.10
>>
>> But I’ve decided against mentioning it in this new comment or the cancel
>> message, because, well, it’s my private server and I have limited
>> bandwidth.
>> ---
>>  tests/acceptance/virtiofs_submounts.py | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
>> index 949ca87a83..9a69b6b17b 100644
>> --- a/tests/acceptance/virtiofs_submounts.py
>> +++ b/tests/acceptance/virtiofs_submounts.py
>> @@ -228,6 +228,18 @@ class VirtiofsSubmountsTest(BootLinux):
>>      def setUp(self):
>>          vmlinuz = self.params.get('vmlinuz')
>>          if vmlinuz is None:
>> +            """
>> +            The Linux kernel supports FUSE auto-submounts only as of 5.10.
>> +            boot_linux.py currently provides Fedora 31, whose kernel is too
>> +            old, so this test cannot pass with the on-image kernel (you are
>> +            welcome to try, hence the option to force such a test with
>> +            -p vmlinuz='').  Therefore, for now the user must provide a
>> +            sufficiently new custom kernel, or effectively explicitly
>> +            request failure with -p vmlinuz=''.
>> +            Once an image with a sufficiently new kernel is available
>> +            (probably Fedora 34), we can make -p vmlinuz='' the default, so
>> +            that this parameter no longer needs to be specified.
>> +            """
>>              self.cancel('vmlinuz parameter not set; you must point it to a '
>>                          'Linux kernel binary to test (to run this test with ' \
>>                          'the on-image kernel, set it to an empty string)')
>> -- 
>> 2.29.2
>>
> 
> Hi Max,
> 
> This looks good to me, and I've also tested your kernel build and
> works like a charm.
> 
> As further work on top of this, it may be beneficial to have test
> documentation in a predictable place.  The possibilities that come to
> my mind:
> 
>  * docs/devel/testing.rst
>  * tests/acceptance/$test_file.py/data/README
> 
> On a different topic, the "https://avocado-project.org/data/assets" has
> enough bandwidth and can be used to hold this type asset.

Can you define "this type asset" please?

> Alternatively,
> we can add a bit more automation to this test by letting people do something
> like:
> 
>  $ avocado assets register virtiofs-auto-submounts-vmlinuz /path/to/vmlinuz
> 
> And on the test:
> 
>  vmlinuz = self.fetch_asset('virtiofs-auto-submounts-vmlinuz')
> 
> And the test should cancel if that asset has not been previously registered.

Yay, great news!


